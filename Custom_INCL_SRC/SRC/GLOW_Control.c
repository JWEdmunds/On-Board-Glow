/*GLOW_CONTROL.C
*
*John W Edmunds
*
*/

//Location for functions and variables that determine PWM output and by extension GLOW drive

//Includes
#include "stm8l15x_tim3.h"
#include "timer_setup.h"
#include "adc_setup.h"
#include "pwm_input.h"
#include "calibration.h"
#include "stm8l15x_gpio.h"
#include "glow_control.h"
#include "system_control.h"

//Defines
typedef enum
{
    GLOW_STATUS,
    CURRENT_ADJUST
} Glow_State_t;

typedef enum
{
    GLOW_MODE_OFF = 0,
    GLOW_MODE_STARTUP,
    GLOW_MODE_RUNNING
} Glow_Mode_t;

Glow_Mode_t Glow_Mode;

#define GLOW_PWM_MIN				((uint16_t)0)
#define GLOW_PWM_MAX				PWM_PERIOD_TIMER
#define GLOW_PWM_STEP				((uint16_t)1)
#define GLOW_CURRENT_TARGET_ADC		((uint16_t)1)

//This defines the absolute current limit. Tests with a 6R resistor with roughly a 1A pull, shows and ADC value at 1A of 620 Counts
#define ADC_MAX_ALLOWABLE_COUNTS	((uint16_t) 1800) 	//Just under 3A
#define ADC_STARTUP_COUNTS			((uint16_t) 500)	//Roughly 2.5A
#define ADC_RUNNING_COUNTS			((uint16_t) 350)	//Just under 1.5A

//Hysteresis used to determine if PWM should be adjusted caused by micro changes in the ADC output
#define ADC_CURRENT_HYSTERESIS      ((uint16_t)20)

//Variables
static Glow_State_t glow_state = GLOW_STATUS;
static bool disable_glow = TRUE;

//Timer counter in seconds to differentiate running mode from startup
//Essentially a 60 second counter.
static uint8_t running_mode_counter = 0;
static uint32_t running_mode_timer = 0;

//Primary output value for the PWM compare
static uint16_t PWM_Output_Value = 0;

//Functions


void Glow_Output_Emergency_OFF(void){
  //Simple kill switch. If the OBG has made it passed arming and this far, but loses signal
  //The base timer for the output switches off completly and the pin is pulled LOW.
  //Set PWM value to minimum (0)
  PWM_Output_Value = GLOW_PWM_MIN;
  //Set time compare to zero
  TIM3_SetCompare1(PWM_Output_Value);
  //Disable timer 3
  TIM3_Cmd(DISABLE);
  //Turn Pin LOW
  GPIO_ResetBits(GPIOB, GPIO_Pin_1);
  //Change glow case so that it is back to default
  glow_state = GLOW_STATUS;
}
  
void Glow_Output_ReEnable(void){
  //Once PWM is seen after a brownout, this will enable the glow routine again.
  //Enable timer
  TIM3_Cmd(ENABLE);
}

void Glow_Current_Adjustment(void){
  //Create new variables
  uint16_t target_current;
  uint16_t adc_snapshot;

  //Take one ADC reading for this control pass
  adc_snapshot = ADC_Get_Raw_Value();
  
  //Check which current target to use. Startup mode is only on for the first 2 minutes. Running mode is used thereafter. 
  if (Glow_Mode == GLOW_MODE_STARTUP){
	  target_current = ADC_STARTUP_COUNTS;
	}
	else if (Glow_Mode == GLOW_MODE_RUNNING){
	  target_current = ADC_RUNNING_COUNTS;
	}
	else{
	  PWM_Output_Value = GLOW_PWM_MIN;
	  TIM3_SetCompare1(PWM_Output_Value);
	return;
	}
  //Over current protection for Glow plug
  if (adc_snapshot >= ADC_MAX_ALLOWABLE_COUNTS){
	if (PWM_Output_Value >0){
	  PWM_Output_Value--;
	}
	TIM3_SetCompare1(PWM_Output_Value);
	return;
  }
  //Normal current regulation
  //If current below target - Increase PWM
  if (adc_snapshot < (target_current - ADC_CURRENT_HYSTERESIS)){
    //Current too low - increase PWM
    if (PWM_Output_Value < GLOW_PWM_MAX)
	  {
		  PWM_Output_Value += GLOW_PWM_STEP;
	  }
  }
  else if (adc_snapshot > (target_current + ADC_CURRENT_HYSTERESIS)){
    //Current too high - decrease PWM
	if (PWM_Output_Value > GLOW_PWM_MIN)
	  {
		  PWM_Output_Value -= GLOW_PWM_STEP;
	  }
  }
  else
	{
    //Current is within hysteresis band
    //Leave PWM_Output_Value unchanged
	}
  //Write PWM value to timer
  TIM3_SetCompare1(PWM_Output_Value);
}

bool Stick_Position_Detect(void){
  //Check stick position against calibrated values and either switch off glow out or leave it as is.
  //True means disable glow
  //Code re-written with help of AI to improve pwm lookup
  uint16_t pwm_snapshot;
  //Look at PWM input
  pwm_snapshot = PWM_Input_GetWidth();
	//Normal Throttle stick direction
	if ((throttle_inverted == FALSE) && (pwm_snapshot >= glow_off)){
	  return TRUE;
	}
	//Inverted Throttle stick direction
	else if ((throttle_inverted == TRUE) && (pwm_snapshot <= glow_off)){
	  return TRUE;
	}
	
  return FALSE;
}

void Glow_Disable_State(void){
  //Check
  disable_glow = Stick_Position_Detect();
}

void Glow_Mode_Update(void)
{
    //Only count while in startup mode
    if (Glow_Mode == GLOW_MODE_STARTUP)
    {
        //Has one second passed?
        if ((uint32_t)(System_Time_Get() - running_mode_timer) >= 1000)
        {
            //Store time for next one-second interval
            running_mode_timer = System_Time_Get();

            //Increment startup counter
            running_mode_counter++;

            //After 120 seconds, change to normal running mode
            if (running_mode_counter >= 120)
            {
                Glow_Mode = GLOW_MODE_RUNNING;
            }
        }
    }
}
/// --------------- Primary Glow output function

void Glow_PWM_Output(){
  
  //Start glow system in startup mode
  Glow_Mode = GLOW_MODE_STARTUP;

  //Reset startup timer
  running_mode_counter = 0;
  running_mode_timer = system_time_ms;
  
  //Glow running loop
  while(1){
	//Check which mode the glow driver is set in
	Glow_Mode_Update();
	//Check PWM state as well incase of RX brownout
	if (PWM_Input_IsValid() == FALSE){
	  //DISABLE GLOW OUTPUT COMPLETELY.. For safety of course.
	  Glow_Output_Emergency_OFF();
	  //Sits waiting for the PWM to come back
	  continue;
	}
	  switch (glow_state){
		//1st case, check status of stick in case PWM is gone or stick in off position.
		case GLOW_STATUS:
		//Checks the position of the stick.
		  Glow_Disable_State();
			//Sits watching the above and either stays put or jumps to the next state
		  if (disable_glow == FALSE)
			//Set to the next state and re-enable timer system
			{
			  Glow_Output_ReEnable();
			  glow_state = CURRENT_ADJUST;
			}
		break;
		//Next case, current adjust.----------------
		case CURRENT_ADJUST:
		  //Check positionj whilst glow is running.
		  Glow_Disable_State();
		  //Kill switch for glow output even in this part of the routine.
		    if (disable_glow == TRUE)
				{
				  //Turn glow output off
				  PWM_Output_Value = GLOW_PWM_MIN;
				  TIM3_SetCompare1(PWM_Output_Value);
				  //Return to waiting state
				  glow_state = GLOW_STATUS;
				}
				else
				{
					//Glow still requested - regulate current
					Glow_Current_Adjustment();
				}
		break;
	}			
  }
}