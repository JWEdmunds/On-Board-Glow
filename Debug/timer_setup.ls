   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  46                     ; 28 void PWM_Output_Timer(){
  48                     	switch	.text
  49  0000               _PWM_Output_Timer:
  53                     ; 31   TIM3_DeInit();
  55  0000 cd0000        	call	_TIM3_DeInit
  57                     ; 33   TIM3_TimeBaseInit(TIM3_Prescaler_1, TIM3_CounterMode_Up, PWM_PERIOD_TIMER);
  59  0003 ae03e7        	ldw	x,#999
  60  0006 89            	pushw	x
  61  0007 5f            	clrw	x
  62  0008 cd0000        	call	_TIM3_TimeBaseInit
  64  000b 85            	popw	x
  65                     ; 39   TIM3_ARRPreloadConfig(ENABLE);
  67  000c a601          	ld	a,#1
  68  000e cd0000        	call	_TIM3_ARRPreloadConfig
  70                     ; 41   TIM3_Cmd(ENABLE);
  72  0011 a601          	ld	a,#1
  73  0013 cd0000        	call	_TIM3_Cmd
  75                     ; 42 }
  78  0016 81            	ret
 102                     ; 44 void PWM_Output_Control(){
 103                     	switch	.text
 104  0017               _PWM_Output_Control:
 108                     ; 46   TIM3_OC1Init(TIM3_OCMode_PWM1, TIM3_OutputState_Enable, 0, TIM3_OCPolarity_High, TIM3_OCIdleState_Reset);
 110  0017 4b00          	push	#0
 111  0019 4b00          	push	#0
 112  001b 5f            	clrw	x
 113  001c 89            	pushw	x
 114  001d ae6001        	ldw	x,#24577
 115  0020 cd0000        	call	_TIM3_OC1Init
 117  0023 5b04          	addw	sp,#4
 118                     ; 47 }
 121  0025 81            	ret
 149                     ; 50 void SYSCTRL_Timer(){
 150                     	switch	.text
 151  0026               _SYSCTRL_Timer:
 155                     ; 54   TIM2_DeInit();
 157  0026 cd0000        	call	_TIM2_DeInit
 159                     ; 56   TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, SYSTEM_PERIOD_TIMER);
 161  0029 ae03e7        	ldw	x,#999
 162  002c 89            	pushw	x
 163  002d 5f            	clrw	x
 164  002e cd0000        	call	_TIM2_TimeBaseInit
 166  0031 85            	popw	x
 167                     ; 58   TIM2_ClearITPendingBit(TIM2_IT_Update);
 169  0032 a601          	ld	a,#1
 170  0034 cd0000        	call	_TIM2_ClearITPendingBit
 172                     ; 60   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 174  0037 ae0101        	ldw	x,#257
 175  003a cd0000        	call	_TIM2_ITConfig
 177                     ; 62   TIM2_Cmd(ENABLE);
 179  003d a601          	ld	a,#1
 180  003f cd0000        	call	_TIM2_Cmd
 182                     ; 63 }
 185  0042 81            	ret
 221                     ; 65 void SYS_Delay_NOP(volatile uint32_t count){
 222                     	switch	.text
 223  0043               _SYS_Delay_NOP:
 225       00000000      OFST:	set	0
 228  0043 200a          	jra	L16
 229  0045               L75:
 230                     ; 69         __asm("nop");
 233  0045 9d            nop
 235                     ; 70         count--;
 237  0046 96            	ldw	x,sp
 238  0047 1c0003        	addw	x,#OFST+3
 239  004a a601          	ld	a,#1
 240  004c cd0000        	call	c_lgsbc
 242  004f               L16:
 243                     ; 67     while (count > 0)
 245  004f 96            	ldw	x,sp
 246  0050 1c0003        	addw	x,#OFST+3
 247  0053 cd0000        	call	c_lzmp
 249  0056 26ed          	jrne	L75
 250                     ; 72 }
 253  0058 81            	ret
 266                     	xdef	_SYS_Delay_NOP
 267                     	xdef	_SYSCTRL_Timer
 268                     	xdef	_PWM_Output_Control
 269                     	xdef	_PWM_Output_Timer
 270                     	xref	_TIM2_ClearITPendingBit
 271                     	xref	_TIM2_ITConfig
 272                     	xref	_TIM2_Cmd
 273                     	xref	_TIM2_TimeBaseInit
 274                     	xref	_TIM2_DeInit
 275                     	xref	_TIM3_OC1Init
 276                     	xref	_TIM3_Cmd
 277                     	xref	_TIM3_ARRPreloadConfig
 278                     	xref	_TIM3_TimeBaseInit
 279                     	xref	_TIM3_DeInit
 298                     	xref	c_lzmp
 299                     	xref	c_lgsbc
 300                     	end
