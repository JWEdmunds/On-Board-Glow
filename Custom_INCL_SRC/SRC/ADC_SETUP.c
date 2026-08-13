/*ADC_SETUP.C
*
*John W Edmunds
*
*/

//Includes
#include "stm8l15x_adc.h"
#include "math.h"
#include "adc_setup.h"

//Variable
volatile uint16_t adc_debug = 0;

void ADC_Setup(void){
//De-Init the ADC registers to default
ADC_DeInit(ADC1);
//Setup stuff
ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_1);
//Setup ADC Interrupt
ADC_ITConfig(ADC1, ADC_IT_EOC, ENABLE);
//Enable specific ADC channel
ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
//Enable ADC
ADC_Cmd(ADC1, DISABLE);
}

void ADC_Enable_Conversion(void){
  //Enable continuous conversion of ADC. Not active until system armed
  ADC_Cmd(ADC1, ENABLE);
}

uint16_t ADC_Current_Calc(void){
  //Return the ADC value from the ISR
  return ADC_Raw_Value;

}