/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

//Includes
#include "stm8l15x.h"
#include "adc_setup.h"
#include "interrupt_functions.h"
#include "mcu_setup.h"
#include "pwm_input.h"
#include "timer_setup.h"
#include "calibration.h"
#include "system_control.h"
#include "stdio.h"
#include "string.h"
#include "stdbool.h"
#include "main.h"

main(void){
//Basic setup before going into main loop
//Setup system clocks
clk_setup();

//Setup GPIO defaults
gpio_setup();

//Setup PWM INPUT defaults
PWM_Input();

//Setup SYSCTRL_Timer defaults
SYSCTRL_Timer();

//Setup ADC for PWM capture
ADC_Setup();

//Enable Interrupts
enableInterrupts();

//Configure EEPROM Default
EEPROM_Setup();

//Read Calibration file, if not values in structure, use defaults
Calibration_Read_EEPROM();

//Brief delay to allow PWM values to stabilise
Delay_ms(500);

//Sit in a loop waiting to receive valid PWM
do{
	PWM_Received_Flag();
  }
  while (PWM_Input_IsValid() == FALSE);
  
//Call the system startup state machine
System_StateMachine();

//main running routine in this loop
while (1)
  {
	ADC_current_Calc();
  //Three functions sit in the main loop. PWM input is measured to find the throttle position.
  //If Throttle position is within calibrated parameters, glow output is switched on.
  //PWM is output to the low side MOSFET to enable glow ignition
  //Current is measured and PWM output value adjusted.
  //PWM Measure
  //Current Measure
  //PWM OUTPUT
  }
  ; //Main Loop
} //Closes main
