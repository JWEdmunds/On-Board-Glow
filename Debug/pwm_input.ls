   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _pwm_width_us:
  16  0000 0000          	dc.w	0
  17  0002               L3_PWM_Valid:
  18  0002 00            	dc.b	0
  19  0003               _pwm_sample_received:
  20  0003 00            	dc.b	0
  55                     ; 38 void PWM_Input(){
  57                     	switch	.text
  58  0000               _PWM_Input:
  62                     ; 48   TIM1_DeInit();
  64  0000 cd0000        	call	_TIM1_DeInit
  66                     ; 50   TIM1_TimeBaseInit(PWM_TIM1_PRESCALER, TIM1_CounterMode_Up, PWM_TIM1_PERIOD, PWM_TIM1_REPETITION_COUNTER);
  68  0003 4b00          	push	#0
  69  0005 aeffff        	ldw	x,#65535
  70  0008 89            	pushw	x
  71  0009 4b00          	push	#0
  72  000b 5f            	clrw	x
  73  000c cd0000        	call	_TIM1_TimeBaseInit
  75  000f 5b04          	addw	sp,#4
  76                     ; 52   TIM1_PWMIConfig(TIM1_Channel_1, TIM1_ICPolarity_Rising, TIM1_ICSelection_DirectTI, TIM1_ICPSC_DIV1, PWM_INPUT_FILTER);
  78  0011 4b03          	push	#3
  79  0013 4b00          	push	#0
  80  0015 4b01          	push	#1
  81  0017 5f            	clrw	x
  82  0018 cd0000        	call	_TIM1_PWMIConfig
  84  001b 5b03          	addw	sp,#3
  85                     ; 54   TIM1_ClearITPendingBit(TIM1_IT_CC1);
  87  001d a602          	ld	a,#2
  88  001f cd0000        	call	_TIM1_ClearITPendingBit
  90                     ; 55   TIM1_ClearITPendingBit(TIM1_IT_CC2);  
  92  0022 a604          	ld	a,#4
  93  0024 cd0000        	call	_TIM1_ClearITPendingBit
  95                     ; 57   TIM1_ITConfig(TIM1_IT_CC2, ENABLE);  
  97  0027 ae0401        	ldw	x,#1025
  98  002a cd0000        	call	_TIM1_ITConfig
 100                     ; 59   TIM1_Cmd(ENABLE);
 102  002d a601          	ld	a,#1
 103  002f cd0000        	call	_TIM1_Cmd
 105                     ; 60 }
 108  0032 81            	ret
 133                     ; 62 void PWM_Input_VALID(void){
 134                     	switch	.text
 135  0033               _PWM_Input_VALID:
 139                     ; 69   if ((pwm_width_us >= PWM_LOWER_LIMIT_DEFAULT) && (pwm_width_us <= PWM_UPPER_LIMIT_DEFAULT)){
 141  0033 ce0000        	ldw	x,_pwm_width_us
 142  0036 a301f4        	cpw	x,#500
 143  0039 250e          	jrult	L33
 145  003b ce0000        	ldw	x,_pwm_width_us
 146  003e a309c5        	cpw	x,#2501
 147  0041 2406          	jruge	L33
 148                     ; 70 		PWM_Valid = TRUE;
 150  0043 35010002      	mov	L3_PWM_Valid,#1
 152  0047 2004          	jra	L53
 153  0049               L33:
 154                     ; 74 	  PWM_Valid = FALSE;
 156  0049 725f0002      	clr	L3_PWM_Valid
 157  004d               L53:
 158                     ; 77 }
 161  004d 81            	ret
 187                     ; 79 void PWM_Received_Flag(void){
 188                     	switch	.text
 189  004e               _PWM_Received_Flag:
 193                     ; 81   if (pwm_sample_received != FALSE){
 195  004e 725d0003      	tnz	_pwm_sample_received
 196  0052 2704          	jreq	L74
 197                     ; 83 	PWM_Input_VALID();
 199  0054 addd          	call	_PWM_Input_VALID
 202  0056 2004          	jra	L15
 203  0058               L74:
 204                     ; 87 	PWM_Valid = FALSE;
 206  0058 725f0002      	clr	L3_PWM_Valid
 207  005c               L15:
 208                     ; 89 }
 211  005c 81            	ret
 256                     ; 91 bool PWM_Input_IsValid(void){
 257                     	switch	.text
 258  005d               _PWM_Input_IsValid:
 262                     ; 93   return PWM_Valid;
 264  005d c60002        	ld	a,L3_PWM_Valid
 267  0060 81            	ret
 326                     	switch	.bss
 327  0000               _pwm_capture_lo:
 328  0000 0000          	ds.b	2
 329                     	xdef	_pwm_capture_lo
 330  0002               _pwm_capture_hi:
 331  0002 0000          	ds.b	2
 332                     	xdef	_pwm_capture_hi
 333                     	xdef	_PWM_Input_IsValid
 334                     	xdef	_PWM_Received_Flag
 335                     	xdef	_PWM_Input_VALID
 336                     	xdef	_PWM_Input
 337                     	xdef	_pwm_sample_received
 338                     	xdef	_pwm_width_us
 339                     	xref	_TIM1_ClearITPendingBit
 340                     	xref	_TIM1_ITConfig
 341                     	xref	_TIM1_PWMIConfig
 342                     	xref	_TIM1_Cmd
 343                     	xref	_TIM1_TimeBaseInit
 344                     	xref	_TIM1_DeInit
 364                     	end
