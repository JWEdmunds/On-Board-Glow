   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _adc_debug:
  16  0000 0000          	dc.w	0
  50                     ; 15 void ADC_Setup(void){
  52                     	switch	.text
  53  0000               _ADC_Setup:
  57                     ; 17 ADC_DeInit(ADC1);
  59  0000 ae5340        	ldw	x,#21312
  60  0003 cd0000        	call	_ADC_DeInit
  62                     ; 19 ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_1);
  64  0006 4b00          	push	#0
  65  0008 4b00          	push	#0
  66  000a 4b04          	push	#4
  67  000c ae5340        	ldw	x,#21312
  68  000f cd0000        	call	_ADC_Init
  70  0012 5b03          	addw	sp,#3
  71                     ; 21 ADC_ITConfig(ADC1, ADC_IT_EOC, ENABLE);
  73  0014 4b01          	push	#1
  74  0016 4b08          	push	#8
  75  0018 ae5340        	ldw	x,#21312
  76  001b cd0000        	call	_ADC_ITConfig
  78  001e 85            	popw	x
  79                     ; 23 ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
  81  001f 4b01          	push	#1
  82  0021 ae0302        	ldw	x,#770
  83  0024 89            	pushw	x
  84  0025 ae5340        	ldw	x,#21312
  85  0028 cd0000        	call	_ADC_ChannelCmd
  87  002b 5b03          	addw	sp,#3
  88                     ; 25 ADC_Cmd(ADC1, DISABLE);
  90  002d 4b00          	push	#0
  91  002f ae5340        	ldw	x,#21312
  92  0032 cd0000        	call	_ADC_Cmd
  94  0035 84            	pop	a
  95                     ; 26 }
  98  0036 81            	ret
 123                     ; 28 void ADC_Enable_Conversion(void){
 124                     	switch	.text
 125  0037               _ADC_Enable_Conversion:
 129                     ; 30   ADC_Cmd(ADC1, ENABLE);
 131  0037 4b01          	push	#1
 132  0039 ae5340        	ldw	x,#21312
 133  003c cd0000        	call	_ADC_Cmd
 135  003f 84            	pop	a
 136                     ; 31 }
 139  0040 81            	ret
 163                     ; 33 uint16_t ADC_Current_Calc(void){
 164                     	switch	.text
 165  0041               _ADC_Current_Calc:
 169                     ; 35   return ADC_Raw_Value;
 171  0041 ce0000        	ldw	x,_ADC_Raw_Value
 174  0044 81            	ret
 198                     	xdef	_adc_debug
 199                     	xdef	_ADC_Enable_Conversion
 200                     	xdef	_ADC_Current_Calc
 201                     	xdef	_ADC_Setup
 202                     	xref	_ADC_Raw_Value
 203                     	xref	_ADC_ITConfig
 204                     	xref	_ADC_ChannelCmd
 205                     	xref	_ADC_Cmd
 206                     	xref	_ADC_Init
 207                     	xref	_ADC_DeInit
 226                     	end
