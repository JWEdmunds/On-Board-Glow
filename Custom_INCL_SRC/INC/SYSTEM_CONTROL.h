//SYSTEM_CONTROL.H
//*
//*John W Edmunds
//*


//Guard to prevent inclusion of same file twice
#ifndef SYSTEM_CONTROL_H
#define SYSTEM_CONTROL_H


//Variable Declarations
extern volatile uint32_t system_time_ms;

typedef enum
{
    STATE_CALIBRATION,
    STATE_RECALIBRATION,
    STATE_ARMING

} System_State_t;

extern System_State_t system_state;

//Function Delcarations.
uint32_t System_Time_Get(void);
void Delay_ms(uint16_t delay_ms);
void ledFlash(uint8_t flash_count, uint16_t delay_ms);
bool systemArming(void);
void System_StateMachine(void);

#endif