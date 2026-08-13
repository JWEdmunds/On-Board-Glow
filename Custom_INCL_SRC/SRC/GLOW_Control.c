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

//Defines
typedef enum
{
    GLOW_STATUS,
    CURRENT_ADJUST
} Glow_State_t;

#define GLOW_PWM_MIN				((uint16_t)0)
#define GLOW_PWM_MAX				PWM_PERIOD_TIMER
#define GLOW_PWM_STEP				((uint16_t)1)
#define GLOW_CURRENT_TARGET_ADC		((uint16_t)1)

//This defines the absolute current limit. Tests with a 6R resistor with roughly a 1A pull, shows and ADC value at 1A of 620 Counts
#define ADC_MAX_ALLOWABLE_COUNTS	((unint16_t) 1800) 	//Just under 3A
#define ADC_RUNNING_COUNTS			((unint16_t) 900)	//Just under 1.5A

//Variables
static Glow_State_t glow_state = GLOW_STATUS;
static bool disable_glow = TRUE;
//Timer counter in seconds to differentiate running mode from startup
//Essentially a 60 second counter.
static uint8_t running_mode_counter = 0;

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
  //Create new variable
  uint16_t current_adc;
	//Read raw value from ADC
    current_adc = ADC_Current_Calc();
	
    if (current_adc < GLOW_CURRENT_TARGET_ADC)
    {
        if (PWM_Output_Value < GLOW_PWM_MAX)
        {
            PWM_Output_Value += GLOW_PWM_STEP;
        }
    }
    else if (current_adc > GLOW_CURRENT_TARGET_ADC)
    {
        if (PWM_Output_Value > GLOW_PWM_MIN)
        {
            PWM_Output_Value -= GLOW_PWM_STEP;
        }
    }

    TIM3_SetCompare1(PWM_Output_Value);
}

bool Stick_Position_Detect(){
  //Check stick position against calibrated values and either switch off glow out or leave it as is.
  //True means disable glow
  if ((throttle_inverted == FALSE) && (pwm_width_us >= glow_off)){
	return TRUE;
  }
  else if ((throttle_inverted == TRUE) && (pwm_width_us <= glow_off)){
	return TRUE;
  }
  
  return FALSE;
}

void Glow_Disable_State(void){
  //Check
  disable_glow = Stick_Position_Detect();
}

/// --------------- Primary Glow output function

void Glow_PWM_Output(){
  

  //Glow running loop
  while(1){
	//Check PWM state as well incase of RX brownout
	if (PWM_Input_IsValid() == FALSE){
	  //DISABLE GLOW OUTPUT COMPLETELY.. For safety of course.
	  Glow_Output_Emergency_OFF();
	  //Sits waiting for the PWM to come back
	  continue;
	}
	  switch (glow_state){
		//1st case
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
	  
		case CURRENT_ADJUST:
		  //Adjust PWM to suit current limits
		  Glow_Current_Adjustment();
		break;
	  }
	}
}