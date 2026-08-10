/*SYSTEM_CONTROL.C
*
*John W Edmunds
*
*/

//Primary control functions for the system overall including LLED flashing, time delays and system control

//Includes
#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "system_control.h"
#include "calibration.h"
#include "timer_setup.h"
#include "pwm_input.h"
//Defines
#define ARM_COUNT_REQUIRED    ((uint8_t)5)
#define ARM_PWM_TOLERANCE    ((uint16_t)5)

//Variables
volatile uint32_t system_time_ms = 0UL;
System_State_t system_state = STATE_CALIBRATION;

//Functions

void Delay_ms(uint16_t delay_ms){
  
    uint32_t start_time = system_time_ms;

    while ((uint32_t)(system_time_ms - start_time) < delay_ms)
    {
        /* Wait */
    }
}

void ledFlash(uint8_t flash_count, uint16_t delay_ms)
{
    uint8_t flash_number;

    for (flash_number = 0;
         flash_number < flash_count;
         ++flash_number)
    {
        /* LED is active LOW: switch it on */
        GPIO_ResetBits(GPIOB, GPIO_Pin_7);

        Delay_ms(delay_ms);

        /* Switch LED off */
        GPIO_SetBits(GPIOB, GPIO_Pin_7);

        Delay_ms(delay_ms);
    }
}

bool systemArming(void){
    static uint8_t arm_count = 0;
    static bool stick_high = FALSE;

    uint16_t arm_lower_limit;
    uint16_t arm_upper_limit;

    // Allow a small tolerance from calibrated stick limits
    arm_lower_limit = pwm_lower_limit + ARM_PWM_TOLERANCE;
    arm_upper_limit = pwm_upper_limit - ARM_PWM_TOLERANCE;

    // Detect stick reaching upper position
    if ((pwm_width_us >= arm_upper_limit) && (stick_high == FALSE))
    {
        stick_high = TRUE;
    }

    // Detect stick returning to lower position
    if ((pwm_width_us <= arm_lower_limit) && (stick_high == TRUE))
    {
        stick_high = FALSE;
        arm_count++;
    }

    // Check for completed arming sequence
    if (arm_count >= ARM_COUNT_REQUIRED)
    {
        arm_count = 0;
        return TRUE;
    }

    return FALSE;
}
void System_StateMachine(void){
//Quick check of the calibration files. Depending on results it will change states.
//If no calibration, go to calibration routine
  static bool startup_state_selected = FALSE;

    if (startup_state_selected == FALSE)
    {
        if (Calibration_Data_VALID() == FALSE)
        {
            system_state = STATE_CALIBRATION;
        }
        else
        {
            system_state = STATE_RECALIBRATION;
        }

        startup_state_selected = TRUE;
    }
  //----------------------------------
  //---------------------------------- De-lineated as this is a bit messy
  while(1){
	switch (system_state){
	  //Declare a couple of variables
	  int Re_Calibration_Samples;
	  uint16_t pwm_diff_recal;
	  int i;
	  //1st case. Run calibration
	  case STATE_CALIBRATION:
		  //Checks to see if any existing calibration is in the eeprom, if not it runs through the calibration routine
		  if(Calibration_Data_VALID()==FALSE){
			//CALIBRATION BEGIN
			Calibration_Sequence_Main();
		  }
		  //Jump to the arming routine.
		  system_state = STATE_ARMING;
		//End this case
		break;
	  //Recalibration Case
	  case STATE_RECALIBRATION:
		//Set variable to 0
		Re_Calibration_Samples = 0;
	  
		for (i = 0; i < 100; ++i){
  
			/* Calculate difference without signed arithmetic */
			if (pwm_width_us >= stick_high_position)
			{
				pwm_diff_recal = pwm_width_us - stick_high_position;
			}
			else
			{
				pwm_diff_recal = stick_high_position - pwm_width_us;
			}
	
			/* Accept readings within 20 us of calibrated stick high */
			if (pwm_diff_recal <= 20U)
			{
				++Re_Calibration_Samples;
			}
			else
			{
				/* Require the stick to remain continuously high */
				Re_Calibration_Samples = 0;
			}
	
			if (Re_Calibration_Samples >= 50)
			{
				break;
			}
	
			/* Always wait for another receiver frame */
			Delay_ms(20);
			}
		if (Re_Calibration_Samples >= 50)
		{
			FLASH_Unlock(FLASH_MemType_Data);
	
			if (EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U) == TRUE)
			{
				FLASH_Lock(FLASH_MemType_Data);
	
				magic = 0x0000U;
				Calibration_Sequence_Main();
			}
			else
			{
				FLASH_Lock(FLASH_MemType_Data);
	
				/* EEPROM failure indication could go here */
			}
		}
		//Go to next case
		system_state = STATE_ARMING;
		break;
	  case STATE_ARMING:
		  //Break into Main loop arfter arming and flashy McFlashing the LED
		  while (systemArming() == FALSE){
		  //Keep checking
		  }
		  //Flash the LED..Like our noble lord and hero.. Flashman
		  ledFlash(5, 1000);
		return; //Drop back into main.c
		
		default:
		system_state = STATE_ARMING;
		break;
		}
	  
	}
}