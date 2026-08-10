/*PWM_INPUT.C
*
*John W Edmunds
*
*/

//Location functions used to determine the PWM input from the RX

//Includes
#include "stm8l15x_tim1.h"
#include "stm8l15x.h"
#include "pwm_input.h"
#include "calibration.h"

//Defines
#define PWM_TIM1_PRESCALER          ((uint16_t)0)
#define PWM_TIM1_PERIOD             ((uint16_t)0xFFFF)
#define PWM_TIM1_REPETITION_COUNTER ((uint8_t)0)
#define PWM_INPUT_FILTER    		((uint8_t)0x03)
#define PWM_LOWER_LIMIT_DEFAULT		((uint16_t)0x01F4)
#define PWM_UPPER_LIMIT_DEFAULT		((uint16_t)0x09C4)


//Variables
//Unused variables Remove after build ready
uint16_t pwm_capture_hi;
uint16_t pwm_capture_lo;

//PWM declaration
volatile uint16_t pwm_width_us = 0u;

//Flags
static volatile bool PWM_Valid = FALSE;
volatile bool pwm_sample_received = FALSE;

//Functions

void PWM_Input(){
/*Used to Capture the PWM output of the reciever. This captured value will be used to set calculate the throttle position.
During Initial setup of the OBG the output signal can be selected to be inverted. This is to suit different engine TX/RX configurations.
---
If the throttle is below 20% the remote glow will be enabled. 

***THIS FUNCTION IS ACTIVE FROM POWER_ON***
---
*/
  //Reset Timer to default values
  TIM1_DeInit();
  //Set time base
  TIM1_TimeBaseInit(PWM_TIM1_PRESCALER, TIM1_CounterMode_Up, PWM_TIM1_PERIOD, PWM_TIM1_REPETITION_COUNTER);
  //Timer capture setup
  TIM1_PWMIConfig(TIM1_Channel_1, TIM1_ICPolarity_Rising, TIM1_ICSelection_DirectTI, TIM1_ICPSC_DIV1, PWM_INPUT_FILTER);
  //Clear both interrupt pending bits for this timer
  TIM1_ClearITPendingBit(TIM1_IT_CC1);
  TIM1_ClearITPendingBit(TIM1_IT_CC2);  
  //Enable interrupt channel for CC2
  TIM1_ITConfig(TIM1_IT_CC2, ENABLE);  
  //Start timer 1 counter
  TIM1_Cmd(ENABLE);
}

void PWM_Input_VALID(void){
//This function checks to see if there is a valid calibration for PWM boundaries stored in the EEPROM.
//If a valid calibration is found, It used those values; if not is uses pre-defined defaults.
//This is to prevent spurious PWM values causing issues during use. The MCU will not drop into either
//the setup routine nor the running mode without checking this first.
	  //Use default values to check that PWM is within limits

  if ((pwm_width_us >= PWM_LOWER_LIMIT_DEFAULT) && (pwm_width_us <= PWM_UPPER_LIMIT_DEFAULT)){
		PWM_Valid = TRUE;
	}
	else
	  {
	  PWM_Valid = FALSE;
	}
  
}

void PWM_Received_Flag(void){
  //Check to see if the PWM system has captured any valid signal
  if (pwm_sample_received != FALSE){
	//If a PWM signal has been received. Check to make sure it is valid before passing forward. 
	PWM_Input_VALID();
  }
  else{
	//If no valid PWM detected, do bugger all.
	PWM_Valid = FALSE;
  }
}

bool PWM_Input_IsValid(void){
  //Getter to protect PWM_valid from external manipulation
  return PWM_Valid;
}