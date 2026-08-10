/*USART.C
*
*John W Edmunds
*
*/

//Setup for the USART

//Includes
#include "stm8l15x_usart.h"
#include "stm8l15x_gpio.h"
#include "usart.h"

//Defines

//Variables

//Functions
void USART_Setup(void){
	//Setup the USART to enable input/output of characters to a terminal
	//Set USART to default values
	//GPIO_DeInit(GPIOE); //Un-Needed
	//Set GPIO for UART TX
	GPIO_Init(GPIOE, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Fast);
	//Set GPIO for UART RX 
	GPIO_Init(GPIOE, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
	//Configure UART 
	USART_Init(USART2, 115200, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx|USART_Mode_Rx);
	//Set Interrupt priority
	ITC_SetSoftwarePriority(TIM2_CC_USART2_RX_IRQn,ITC_PriorityLevel_3);
	//USART Interrupt setup. ENABLE ONCE SYSTEM WORKING :)
	USART_ITConfig(USART2, USART_IT_RXNE, DISABLE);
	//Enable UART
	USART_Cmd(USART2, ENABLE);

}



//-------------------------AI FUNCTIONS ------------------------

#if DEBUG_ENABLED

void Debug_Send_U16(uint16_t value)
{
    char buffer[6];
    uint8_t index = 0;

    if (value == 0U)
    {
        Debug_SendChar('0');
        return;
    }

    while (value > 0U)
    {
        buffer[index] = (char)('0' + (value % 10U));
        value /= 10U;
        index++;
    }

    while (index > 0U)
    {
        index--;
        Debug_SendChar(buffer[index]);
    }
}

void Debug_SendLine(const char *text)
{  
    Debug_SendString(text);
    Debug_SendString("\r\n");
}

void Debug_SendValue_U16(const char *label, uint16_t value)
{
    Debug_SendString(label);
    Debug_Send_U16(value);
    Debug_SendString("\r\n");
}

void Debug_SendString(const char *text)
{
    while (*text != '\0')
    {
        Debug_SendChar(*text);
        text++;
    }
}

void Debug_SendChar(char character){
  //USART debug functions
  while (USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET){
  //WAIT
  }
  //Send USART data macro
  USART_SendData8(USART2, (uint8_t) character);
}

//End of AI Jazz
#endif