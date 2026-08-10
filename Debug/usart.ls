   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  47                     ; 19 void USART_Setup(void){
  49                     	switch	.text
  50  0000               _USART_Setup:
  54                     ; 24 	GPIO_Init(GPIOE, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Fast);
  56  0000 4bf0          	push	#240
  57  0002 4b10          	push	#16
  58  0004 ae5014        	ldw	x,#20500
  59  0007 cd0000        	call	_GPIO_Init
  61  000a 85            	popw	x
  62                     ; 26 	GPIO_Init(GPIOE, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
  64  000b 4b00          	push	#0
  65  000d 4b08          	push	#8
  66  000f ae5014        	ldw	x,#20500
  67  0012 cd0000        	call	_GPIO_Init
  69  0015 85            	popw	x
  70                     ; 28 	USART_Init(USART2, 115200, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx|USART_Mode_Rx);
  72  0016 4b0c          	push	#12
  73  0018 4b00          	push	#0
  74  001a 4b00          	push	#0
  75  001c 4b00          	push	#0
  76  001e aec200        	ldw	x,#49664
  77  0021 89            	pushw	x
  78  0022 ae0001        	ldw	x,#1
  79  0025 89            	pushw	x
  80  0026 ae53e0        	ldw	x,#21472
  81  0029 cd0000        	call	_USART_Init
  83  002c 5b08          	addw	sp,#8
  84                     ; 30 	ITC_SetSoftwarePriority(TIM2_CC_USART2_RX_IRQn,ITC_PriorityLevel_3);
  86  002e ae1403        	ldw	x,#5123
  87  0031 cd0000        	call	_ITC_SetSoftwarePriority
  89                     ; 32 	USART_ITConfig(USART2, USART_IT_RXNE, DISABLE);
  91  0034 4b00          	push	#0
  92  0036 ae0255        	ldw	x,#597
  93  0039 89            	pushw	x
  94  003a ae53e0        	ldw	x,#21472
  95  003d cd0000        	call	_USART_ITConfig
  97  0040 5b03          	addw	sp,#3
  98                     ; 34 	USART_Cmd(USART2, ENABLE);
 100  0042 4b01          	push	#1
 101  0044 ae53e0        	ldw	x,#21472
 102  0047 cd0000        	call	_USART_Cmd
 104  004a 84            	pop	a
 105                     ; 36 }
 108  004b 81            	ret
 121                     	xdef	_USART_Setup
 122                     	xref	_USART_ITConfig
 123                     	xref	_USART_Cmd
 124                     	xref	_USART_Init
 125                     	xref	_ITC_SetSoftwarePriority
 126                     	xref	_GPIO_Init
 145                     	end
