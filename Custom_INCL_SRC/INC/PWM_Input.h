/*PWM_INPUT.H
*
*John W Edmunds
*
*/

//Guard to prevent inclusion of same file twice
#ifndef PWM_INPUT_H
#define PWM_INPUT_H

//Variable Declarations.
extern volatile uint16_t pwm_width_us;
extern volatile bool pwm_sample_received;
//extern uint16_t magic;
//extern uint16_t stick_high_position;
//extern uint16_t stick_low_position;
//extern uint16_t pwm_upper_limit;
//extern uint16_t pwm_lower_limit;

//Function Declarations.
void PWM_Input(void);
uint16_t PWM_Input_GetWidth(void);
void PWM_Input_GetCapture(void);
void PWM_Boundary_Default(void);
void PWM_Boundary_Calibrated(void);
void PWM_Input_VALID(void);
void PWM_Received_Flag(void);
bool PWM_Input_IsValid(void);
//bool Calibration_Data_VALID(void);


#endif