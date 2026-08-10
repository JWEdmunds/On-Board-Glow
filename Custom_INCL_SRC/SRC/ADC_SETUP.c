/*ADC_SETUP.C
*
*John W Edmunds
*
*/

//Includes
#include "stm8l15x_adc.h"
#include "math.h"

//Variable


void ADC_Setup(void){
//De-Init the ADC registers to default
ADC_DeInit(ADC1);
//Setup stuff
ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_1);
//Enable specific ADC channel
ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
//Enable ADC
ADC_Cmd(ADC1, ENABLE);
}

void ADC_Raw_Value(){
  //Set ADC value to 0
  uint16_t adc_value = 0;
  //Start single ADC conversion
  ADC_SoftwareStartConv(ADC1);
  
  //Wait for conversion to complete
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET)
    {
        //Wait
    }
  //Pull the RAW ADC reading
  adc_value = ADC_GetConversionValue(ADC1);
  
}