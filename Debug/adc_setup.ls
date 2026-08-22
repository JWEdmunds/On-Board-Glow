   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _adc_debug:
  16  0000 0000          	dc.w	0
  49                     ; 15 void ADC_Setup(void){
  51                     	switch	.text
  52  0000               _ADC_Setup:
  56                     ; 17 ADC_DeInit(ADC1);
  58  0000 ae5340        	ldw	x,#21312
  59  0003 cd0000        	call	_ADC_DeInit
  61                     ; 19 ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_1);
  63  0006 4b00          	push	#0
  64  0008 4b00          	push	#0
  65  000a 4b04          	push	#4
  66  000c ae5340        	ldw	x,#21312
  67  000f cd0000        	call	_ADC_Init
  69  0012 5b03          	addw	sp,#3
  70                     ; 23 ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
  72  0014 4b01          	push	#1
  73  0016 ae0302        	ldw	x,#770
  74  0019 89            	pushw	x
  75  001a ae5340        	ldw	x,#21312
  76  001d cd0000        	call	_ADC_ChannelCmd
  78  0020 5b03          	addw	sp,#3
  79                     ; 25 ADC_Cmd(ADC1, DISABLE);
  81  0022 4b00          	push	#0
  82  0024 ae5340        	ldw	x,#21312
  83  0027 cd0000        	call	_ADC_Cmd
  85  002a 84            	pop	a
  86                     ; 26 }
  89  002b 81            	ret
 115                     ; 28 void ADC_Enable_Conversion(void){
 116                     	switch	.text
 117  002c               _ADC_Enable_Conversion:
 121                     ; 30   ADC_Cmd(ADC1, ENABLE);
 123  002c 4b01          	push	#1
 124  002e ae5340        	ldw	x,#21312
 125  0031 cd0000        	call	_ADC_Cmd
 127  0034 84            	pop	a
 128                     ; 32   ADC_SoftwareStartConv(ADC1);
 130  0035 ae5340        	ldw	x,#21312
 131  0038 cd0000        	call	_ADC_SoftwareStartConv
 133                     ; 35 }
 136  003b 81            	ret
 160                     ; 37 uint16_t ADC_Current_Calc(void){
 161                     	switch	.text
 162  003c               _ADC_Current_Calc:
 166                     ; 39   return ADC_Raw_Value;
 168  003c ce0000        	ldw	x,_ADC_Raw_Value
 171  003f 81            	ret
 196                     ; 43 uint16_t ADC_Get_Raw_Value(void)
 196                     ; 44 {
 197                     	switch	.text
 198  0040               _ADC_Get_Raw_Value:
 202                     ; 46   ADC_Raw_Value = ADC_GetConversionValue(ADC1);
 204  0040 ae5340        	ldw	x,#21312
 205  0043 cd0000        	call	_ADC_GetConversionValue
 207  0046 cf0000        	ldw	_ADC_Raw_Value,x
 208                     ; 48   return ADC_Raw_Value;
 210  0049 ce0000        	ldw	x,_ADC_Raw_Value
 213  004c 81            	ret
 237                     	xdef	_adc_debug
 238                     	xdef	_ADC_Get_Raw_Value
 239                     	xdef	_ADC_Enable_Conversion
 240                     	xdef	_ADC_Current_Calc
 241                     	xdef	_ADC_Setup
 242                     	xref	_ADC_Raw_Value
 243                     	xref	_ADC_GetConversionValue
 244                     	xref	_ADC_ChannelCmd
 245                     	xref	_ADC_SoftwareStartConv
 246                     	xref	_ADC_Cmd
 247                     	xref	_ADC_Init
 248                     	xref	_ADC_DeInit
 267                     	end
