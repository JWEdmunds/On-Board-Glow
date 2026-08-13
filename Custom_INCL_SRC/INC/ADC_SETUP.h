/*ADC_SETUP.H
*
*John W Edmunds
*
*/

//Guard to prevent inclusion of same file twice
#ifndef ADC_SETUP_H
#define ADC_SETUP_H

//External variables
extern volatile uint16_t ADC_Raw_Value;

//Function Delcarations.
void ADC_Setup(void);
uint16_t ADC_Current_Calc(void);
void ADC_Enable_Conversion(void);

#endif