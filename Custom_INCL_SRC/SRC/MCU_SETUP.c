/*MCU_SETUP.C
*
*John W Edmunds
*
*/

//Setup for basic MCU functions
#include "stm8l15x_gpio.h"

//Includes

//Defines

void gpio_setup(void){
	GPIO_DeInit(GPIOA); //prepare Port A for working 
	GPIO_DeInit(GPIOB); //prepare Port B for working
	GPIO_DeInit(GPIOC); //prepare Port C for working 
	GPIO_DeInit(GPIOD); //prepare Port D for working
	GPIO_DeInit(GPIOE); //prepare Port E for working
//Set LED Output Pins to HI. This Pin is used as a SINK to turn on the LED
	GPIO_Init(GPIOB, GPIO_Pin_7, GPIO_Mode_Out_PP_High_Slow);
//Set ADC Input Pin to default values
	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_In_FL_No_IT);
//Set Timer Output Pin to default values
	GPIO_Init(GPIOB, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Slow);
//Set Timer Input Pin to default values
	GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_In_FL_No_IT);
	
//All unused pins as per Datasheet notes set to INPUT PUllUP, This includes pins used on QFN48 package.
//Port A
	GPIO_Init(GPIOA, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOA, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOA, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOA, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOA, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
//Port B
	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOB, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
//PortC
	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
//PortD
	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
//PortE
	GPIO_Init(GPIOE, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOE, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOE, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
	//GPIO_Init(GPIOE, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT); Set in USART
	//GPIO_Init(GPIOE, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT); Set in USART
	GPIO_Init(GPIOE, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
						
}

void clk_setup (void){
//-----
//Set-up the internal clock for the MCU
//Set indivdual peripherals to their respective clocks
//and prescalars.
//Enable the Peripheral clocks that are to be used.
//-----
//Disable the CLK, ready for setup
	CLK_DeInit();
//Set Hi-Speed Internal to on
	CLK_HSICmd(ENABLE);
//Wait for Ready flag
	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);
//Set Hi-Speed External to off
	CLK_HSEConfig(CLK_HSE_OFF);
//Enable clock switching, then select HSI as system clock
    CLK_SYSCLKSourceSwitchCmd(ENABLE);
//Set System Clock to Hi-Speed-internal
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
//Set System clock Divider to 16 to give 1 Mhz clock
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);
//Set configurable clock output to off
	CLK_CCOConfig(CLK_CCOSource_Off, CLK_CCODiv_1);
//Turn on UART clock
	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, ENABLE);
//Turn on ADC clock
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
//Turn on Timer 1 clock
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
//Turn on Timer 2 clock
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
//Turn on Timer 3 clock
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
//Turn on Timer 4 clock
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
//Disable unused peripheral clocks
	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_COMP, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
}
