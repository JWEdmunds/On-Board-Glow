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
//Setup ADC Interrupt. Removed as it spent its whole time in the ISR
//ADC_ITConfig(ADC1, ADC_IT_EOC, ENABLE); 
//Enable specific ADC channel
ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
//Enable ADC
ADC_Cmd(ADC1, DISABLE);
}

void ADC_Enable_Conversion(void){
  //Enable continuous conversion of ADC. Not active until system armed
  ADC_Cmd(ADC1, ENABLE);
  //Start conversion
  ADC_SoftwareStartConv(ADC1);
  //Check flag
  //ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC);
}

uint16_t ADC_Current_Calc(void){
  //Return the ADC value from the ISR
  return ADC_Raw_Value;

}

uint16_t ADC_Get_Raw_Value(void)
{
  //Get the conversion value
  ADC_Raw_Value = ADC_GetConversionValue(ADC1);
  //Return the value
  return ADC_Raw_Value;
}