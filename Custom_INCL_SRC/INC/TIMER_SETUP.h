/*TIMER_SETUP.H
*
*John W Edmunds
*
*/

//Guard to prevent inclusion of same file twice
#ifndef TIMER_SETUP_H
#define TIMER_SETUP_H


#define PWM_PERIOD_TIMER ((uint16_t)999)
//Function Delcarations.

void PWM_Output_Timer(void);
void SYSCTRL_Timer(void);
void SYS_Delay_NOP(volatile uint32_t count);
void PWM_Output_Control();


#endif