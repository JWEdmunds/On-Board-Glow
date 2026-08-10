/*TIMER_SETUP.C
*
*John W Edmunds
*
*/

//Includes
#include "stm8l15x_tim2.h"
#include "stm8l15x_tim3.h"

//Defines

//Just in case the compiler does not like a specific version of ASSY
#define NOP() __asm__("nop")

//System control timer
#define SYSTEM_PERIOD_TIMER ((uint16_t)999)
#define PWM_PERIOD_TIMER ((uint16_t)999)

/*
Timers on this PCB exist to capture PWM input and generate a corresponding PWM output to control the glow plug
A general purpose timer is used for system control
Timer 1 = PWM Input on PIN E4 (PD2)
Timer 2 = General Purpose timer for system control. Not routed out.
Timer 3 = PWM Output on PIN G1 (PB1)
*/

void PWM_Output_Timer(){
/*Used to control the low-side gate driver for the OBG MOSFET. Works in conjunction with current readings to make sure that the OBG delivers consistant 3A @ 1.5V (Adjustable).*/
  //De-Init the timer registers
  TIM3_DeInit();
  //Setup Timer defaults. Keep pre-scalar at 1
  TIM3_TimeBaseInit(TIM3_Prescaler_1, TIM3_CounterMode_Up, PWM_PERIOD_TIMER);
  //Place-holder functions for the interrupt. Not required at this point.
  //TIM3_ClearITPendingBit(TIM3_IT_Update);
  //More placeholder
  //TIM3_ITConfig(TIM3_IT_Update, ENABLE);
  //Pre-load enabled. Not really gonna use, but it is there :)
  TIM3_ARRPreloadConfig(ENABLE);
  //ENABLE TIMER
  TIM3_Cmd(ENABLE);
}

void PWM_Output_Control(){
  //Set the PWM output pin. This should be enabled with an output of 0 to prevent it driving the MOSFET at random :)
  TIM3_OC1Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Reset);
}


void SYSCTRL_Timer(){
/*General purpose system timer for multiple uses. Will be altered by other functions as needed
 Timer counts from 0 - 999 in 1us increments. 1 timer count = 1ms */
  //De-init timer to defualts
  TIM2_DeInit();
  //Setup Timers default values
  TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, SYSTEM_PERIOD_TIMER);
  //Clear any set interrupt bits for Timer 2
  TIM2_ClearITPendingBit(TIM2_IT_Update);
  //Setup Interrupt for Timer 2
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  //Enable Timer
  TIM2_Cmd(ENABLE);
}

void SYS_Delay_NOP(volatile uint32_t count){
/*System delay implemented with the use of NOPs.. Good old ASSY. If not used, Remove from build to save space*/
    while (count > 0)
    {
        __asm("nop");
        count--;
    }
}