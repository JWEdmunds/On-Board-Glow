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
 143                     ; 62 uint16_t PWM_Input_GetWidth(void){
 144                     	switch	.text
 145  0033               _PWM_Input_GetWidth:
 147  0033 89            	pushw	x
 148       00000002      OFST:	set	2
 151                     ; 66   disableInterrupts();
 154  0034 9b            sim
 156                     ; 68   pwm_snapshot = pwm_width_us;
 159  0035 ce0000        	ldw	x,_pwm_width_us
 160  0038 1f01          	ldw	(OFST-1,sp),x
 162                     ; 70   enableInterrupts();
 165  003a 9a            rim
 167                     ; 72   return pwm_snapshot;
 170  003b 1e01          	ldw	x,(OFST-1,sp)
 173  003d 5b02          	addw	sp,#2
 174  003f 81            	ret
 199                     ; 75 void PWM_Input_VALID(void){
 200                     	switch	.text
 201  0040               _PWM_Input_VALID:
 205                     ; 82   if ((pwm_width_us >= PWM_LOWER_LIMIT_DEFAULT) && (pwm_width_us <= PWM_UPPER_LIMIT_DEFAULT)){
 207  0040 ce0000        	ldw	x,_pwm_width_us
 208  0043 a301f4        	cpw	x,#500
 209  0046 250e          	jrult	L74
 211  0048 ce0000        	ldw	x,_pwm_width_us
 212  004b a309c5        	cpw	x,#2501
 213  004e 2406          	jruge	L74
 214                     ; 83 		PWM_Valid = TRUE;
 216  0050 35010002      	mov	L3_PWM_Valid,#1
 218  0054 2004          	jra	L15
 219  0056               L74:
 220                     ; 87 	  PWM_Valid = FALSE;
 222  0056 725f0002      	clr	L3_PWM_Valid
 223  005a               L15:
 224                     ; 90 }
 227  005a 81            	ret
 253                     ; 92 void PWM_Received_Flag(void){
 254                     	switch	.text
 255  005b               _PWM_Received_Flag:
 259                     ; 94   if (pwm_sample_received != FALSE){
 261  005b 725d0003      	tnz	_pwm_sample_received
 262  005f 2704          	jreq	L36
 263                     ; 96 	PWM_Input_VALID();
 265  0061 addd          	call	_PWM_Input_VALID
 268  0063 2004          	jra	L56
 269  0065               L36:
 270                     ; 100 	PWM_Valid = FALSE;
 272  0065 725f0002      	clr	L3_PWM_Valid
 273  0069               L56:
 274                     ; 102 }
 277  0069 81            	ret
 322                     ; 104 bool PWM_Input_IsValid(void){
 323                     	switch	.text
 324  006a               _PWM_Input_IsValid:
 328                     ; 106   return PWM_Valid;
 330  006a c60002        	ld	a,L3_PWM_Valid
 333  006d 81            	ret
 392                     	switch	.bss
 393  0000               _pwm_capture_lo:
 394  0000 0000          	ds.b	2
 395                     	xdef	_pwm_capture_lo
 396  0002               _pwm_capture_hi:
 397  0002 0000          	ds.b	2
 398                     	xdef	_pwm_capture_hi
 399                     	xdef	_PWM_Input_IsValid
 400                     	xdef	_PWM_Received_Flag
 401                     	xdef	_PWM_Input_VALID
 402                     	xdef	_PWM_Input_GetWidth
 403                     	xdef	_PWM_Input
 404                     	xdef	_pwm_sample_received
 405                     	xdef	_pwm_width_us
 406                     	xref	_TIM1_ClearITPendingBit
 407                     	xref	_TIM1_ITConfig
 408                     	xref	_TIM1_PWMIConfig
 409                     	xref	_TIM1_Cmd
 410                     	xref	_TIM1_TimeBaseInit
 411                     	xref	_TIM1_DeInit
 431                     	end
