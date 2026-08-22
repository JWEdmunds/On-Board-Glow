   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  46                     ; 29 void PWM_Output_Timer(void){
  48                     	switch	.text
  49  0000               _PWM_Output_Timer:
  53                     ; 32   TIM3_DeInit();
  55  0000 cd0000        	call	_TIM3_DeInit
  57                     ; 34   TIM3_TimeBaseInit(TIM3_Prescaler_1, TIM3_CounterMode_Up, PWM_PERIOD_TIMER);
  59  0003 ae03e7        	ldw	x,#999
  60  0006 89            	pushw	x
  61  0007 5f            	clrw	x
  62  0008 cd0000        	call	_TIM3_TimeBaseInit
  64  000b 85            	popw	x
  65                     ; 40   TIM3_ARRPreloadConfig(ENABLE);
  67  000c a601          	ld	a,#1
  68  000e cd0000        	call	_TIM3_ARRPreloadConfig
  70                     ; 42   TIM3_Cmd(ENABLE);
  72  0011 a601          	ld	a,#1
  73  0013 cd0000        	call	_TIM3_Cmd
  75                     ; 43 }
  78  0016 81            	ret
 103                     ; 45 void PWM_Output_Control(void){
 104                     	switch	.text
 105  0017               _PWM_Output_Control:
 109                     ; 47   TIM3_OC1Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Reset);
 111  0017 4b00          	push	#0
 112  0019 4b00          	push	#0
 113  001b 5f            	clrw	x
 114  001c 89            	pushw	x
 115  001d ae6001        	ldw	x,#24577
 116  0020 cd0000        	call	_TIM3_OC1Init
 118  0023 5b04          	addw	sp,#4
 119                     ; 49   TIM3_CtrlPWMOutputs(ENABLE);
 121  0025 a601          	ld	a,#1
 122  0027 cd0000        	call	_TIM3_CtrlPWMOutputs
 124                     ; 50 }
 127  002a 81            	ret
 155                     ; 53 void SYSCTRL_Timer(){
 156                     	switch	.text
 157  002b               _SYSCTRL_Timer:
 161                     ; 57   TIM2_DeInit();
 163  002b cd0000        	call	_TIM2_DeInit
 165                     ; 59   TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, SYSTEM_PERIOD_TIMER);
 167  002e ae03e7        	ldw	x,#999
 168  0031 89            	pushw	x
 169  0032 5f            	clrw	x
 170  0033 cd0000        	call	_TIM2_TimeBaseInit
 172  0036 85            	popw	x
 173                     ; 61   TIM2_ClearITPendingBit(TIM2_IT_Update);
 175  0037 a601          	ld	a,#1
 176  0039 cd0000        	call	_TIM2_ClearITPendingBit
 178                     ; 63   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 180  003c ae0101        	ldw	x,#257
 181  003f cd0000        	call	_TIM2_ITConfig
 183                     ; 65   TIM2_Cmd(ENABLE);
 185  0042 a601          	ld	a,#1
 186  0044 cd0000        	call	_TIM2_Cmd
 188                     ; 66 }
 191  0047 81            	ret
 227                     ; 68 void SYS_Delay_NOP(volatile uint32_t count){
 228                     	switch	.text
 229  0048               _SYS_Delay_NOP:
 231       00000000      OFST:	set	0
 234  0048 200a          	jra	L16
 235  004a               L75:
 236                     ; 72         __asm("nop");
 239  004a 9d            nop
 241                     ; 73         count--;
 243  004b 96            	ldw	x,sp
 244  004c 1c0003        	addw	x,#OFST+3
 245  004f a601          	ld	a,#1
 246  0051 cd0000        	call	c_lgsbc
 248  0054               L16:
 249                     ; 70     while (count > 0)
 251  0054 96            	ldw	x,sp
 252  0055 1c0003        	addw	x,#OFST+3
 253  0058 cd0000        	call	c_lzmp
 255  005b 26ed          	jrne	L75
 256                     ; 75 }
 259  005d 81            	ret
 272                     	xdef	_PWM_Output_Control
 273                     	xdef	_SYS_Delay_NOP
 274                     	xdef	_SYSCTRL_Timer
 275                     	xdef	_PWM_Output_Timer
 276                     	xref	_TIM2_ClearITPendingBit
 277                     	xref	_TIM2_ITConfig
 278                     	xref	_TIM2_Cmd
 279                     	xref	_TIM2_TimeBaseInit
 280                     	xref	_TIM2_DeInit
 281                     	xref	_TIM3_CtrlPWMOutputs
 282                     	xref	_TIM3_OC1Init
 283                     	xref	_TIM3_Cmd
 284                     	xref	_TIM3_ARRPreloadConfig
 285                     	xref	_TIM3_TimeBaseInit
 286                     	xref	_TIM3_DeInit
 305                     	xref	c_lzmp
 306                     	xref	c_lgsbc
 307                     	end
