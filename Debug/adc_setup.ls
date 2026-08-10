   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  46                     ; 14 void ADC_Setup(void){
  48                     	switch	.text
  49  0000               _ADC_Setup:
  53                     ; 16 ADC_DeInit(ADC1);
  55  0000 ae5340        	ldw	x,#21312
  56  0003 cd0000        	call	_ADC_DeInit
  58                     ; 18 ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_1);
  60  0006 4b00          	push	#0
  61  0008 4b00          	push	#0
  62  000a 4b00          	push	#0
  63  000c ae5340        	ldw	x,#21312
  64  000f cd0000        	call	_ADC_Init
  66  0012 5b03          	addw	sp,#3
  67                     ; 20 ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
  69  0014 4b01          	push	#1
  70  0016 ae0302        	ldw	x,#770
  71  0019 89            	pushw	x
  72  001a ae5340        	ldw	x,#21312
  73  001d cd0000        	call	_ADC_ChannelCmd
  75  0020 5b03          	addw	sp,#3
  76                     ; 22 ADC_Cmd(ADC1, ENABLE);
  78  0022 4b01          	push	#1
  79  0024 ae5340        	ldw	x,#21312
  80  0027 cd0000        	call	_ADC_Cmd
  82  002a 84            	pop	a
  83                     ; 23 }
  86  002b 81            	ret
  89                     	switch	.bss
  90  0000               L12_i:
  91  0000 0000          	ds.b	2
 124                     ; 25 void ADC_current_Calc(){
 125                     	switch	.text
 126  002c               _ADC_current_Calc:
 130                     ; 29   i = 0;
 132  002c 5f            	clrw	x
 133  002d cf0000        	ldw	L12_i,x
 134                     ; 31   ADC_SoftwareStartConv(ADC1);
 136  0030 ae5340        	ldw	x,#21312
 137  0033 cd0000        	call	_ADC_SoftwareStartConv
 140  0036               L14:
 141                     ; 34     while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET)
 143  0036 4b01          	push	#1
 144  0038 ae5340        	ldw	x,#21312
 145  003b cd0000        	call	_ADC_GetFlagStatus
 147  003e 5b01          	addw	sp,#1
 148  0040 4d            	tnz	a
 149  0041 27f3          	jreq	L14
 150                     ; 39   i = ADC_GetConversionValue(ADC1);
 152  0043 ae5340        	ldw	x,#21312
 153  0046 cd0000        	call	_ADC_GetConversionValue
 155  0049 cf0000        	ldw	L12_i,x
 156                     ; 41 }
 159  004c 81            	ret
 172                     	xdef	_ADC_current_Calc
 173                     	xdef	_ADC_Setup
 174                     	xref	_ADC_GetFlagStatus
 175                     	xref	_ADC_GetConversionValue
 176                     	xref	_ADC_ChannelCmd
 177                     	xref	_ADC_SoftwareStartConv
 178                     	xref	_ADC_Cmd
 179                     	xref	_ADC_Init
 180                     	xref	_ADC_DeInit
 199                     	end
