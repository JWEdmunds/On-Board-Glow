/*USART.H
*
*John W Edmunds
*
*/

//Guard to prevent inclusion of same file twice
#ifndef USART_H
#define USART_H

//Include
#include "stm8l15x.h"

//Function Delcarations.
#define DEBUG_ENABLED  0

#if DEBUG_ENABLED

//void Debug_Init(void);
void Debug_SendChar(char character);
void Debug_SendString(const char *text);
void Debug_Send_U16(uint16_t value);
//void Debug_Send_U32(uint32_t value);
void Debug_SendLine(const char *text);
void Debug_SendValue_U16(const char *label, uint16_t value);

#else

//#define Debug_Init()
#define Debug_SendChar(character)			((void)0)
#define Debug_SendString(text)				((void)0)
#define Debug_Send_U16(value)				((void)0)
//#define Debug_Send_U32(value)
#define Debug_SendLine(text)				((void)0)
#define Debug_SendValue_U16(label, value)	((void)0)

#endif

void USART_Setup(void);

#endif