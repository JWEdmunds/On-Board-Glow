/*GLOW_CONTROL.H
*
*John W Edmunds
*
*/

//Guard to prevent inclusion of same file twice
#ifndef GLOW_CONTROL_H
#define GLOW_CONTROL_H

#include "stm8l15x.h"

//Function Delcarations.
void Glow_Output_Emergency_OFF(void);
void Glow_Output_ReEnable(void);
void Glow_Current_Adjustment(void);
bool Stick_Position_Detect(void);
void Glow_Disable_State(void);
void Glow_PWM_Output(void);


#endif