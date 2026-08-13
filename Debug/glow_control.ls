   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               L3_glow_state:
  16  0000 00            	dc.b	0
  17  0001               L5_disable_glow:
  18  0001 01            	dc.b	1
  19  0002               L7_PWM_Output_Value:
  20  0002 0000          	dc.w	0
  55                     ; 38 void Glow_Output_Emergency_OFF(void){
  57                     	switch	.text
  58  0000               _Glow_Output_Emergency_OFF:
  62                     ; 42   PWM_Output_Value = GLOW_PWM_MIN;
  64  0000 5f            	clrw	x
  65  0001 cf0002        	ldw	L7_PWM_Output_Value,x
  66                     ; 44   TIM3_SetCompare1(PWM_Output_Value);
  68  0004 5f            	clrw	x
  69  0005 cd0000        	call	_TIM3_SetCompare1
  71                     ; 46   TIM3_Cmd(DISABLE);
  73  0008 4f            	clr	a
  74  0009 cd0000        	call	_TIM3_Cmd
  76                     ; 48   GPIO_ResetBits(GPIOB, GPIO_Pin_1);
  78  000c 4b02          	push	#2
  79  000e ae5005        	ldw	x,#20485
  80  0011 cd0000        	call	_GPIO_ResetBits
  82  0014 84            	pop	a
  83                     ; 50   glow_state = GLOW_STATUS;
  85  0015 725f0000      	clr	L3_glow_state
  86                     ; 51 }
  89  0019 81            	ret
 114                     ; 53 void Glow_Output_ReEnable(void){
 115                     	switch	.text
 116  001a               _Glow_Output_ReEnable:
 120                     ; 56   TIM3_Cmd(ENABLE);
 122  001a a601          	ld	a,#1
 123  001c cd0000        	call	_TIM3_Cmd
 125                     ; 57 }
 128  001f 81            	ret
 164                     ; 61 void Glow_Current_Adjustment(void){
 165                     	switch	.text
 166  0020               _Glow_Current_Adjustment:
 168  0020 89            	pushw	x
 169       00000002      OFST:	set	2
 172                     ; 65     current_adc = ADC_Current_Calc();
 174  0021 cd0000        	call	_ADC_Current_Calc
 176  0024 1f01          	ldw	(OFST-1,sp),x
 178                     ; 67     if (current_adc < GLOW_CURRENT_TARGET_ADC)
 180  0026 1e01          	ldw	x,(OFST-1,sp)
 181  0028 2613          	jrne	L35
 182                     ; 69         if (PWM_Output_Value < GLOW_PWM_MAX)
 184  002a ce0002        	ldw	x,L7_PWM_Output_Value
 185  002d a303e7        	cpw	x,#999
 186  0030 2420          	jruge	L75
 187                     ; 71             PWM_Output_Value += GLOW_PWM_STEP;
 189  0032 ce0002        	ldw	x,L7_PWM_Output_Value
 190  0035 1c0001        	addw	x,#1
 191  0038 cf0002        	ldw	L7_PWM_Output_Value,x
 192  003b 2015          	jra	L75
 193  003d               L35:
 194                     ; 74     else if (current_adc > GLOW_CURRENT_TARGET_ADC)
 196  003d 1e01          	ldw	x,(OFST-1,sp)
 197  003f a30002        	cpw	x,#2
 198  0042 250e          	jrult	L75
 199                     ; 76         if (PWM_Output_Value > GLOW_PWM_MIN)
 201  0044 ce0002        	ldw	x,L7_PWM_Output_Value
 202  0047 2709          	jreq	L75
 203                     ; 78             PWM_Output_Value -= GLOW_PWM_STEP;
 205  0049 ce0002        	ldw	x,L7_PWM_Output_Value
 206  004c 1d0001        	subw	x,#1
 207  004f cf0002        	ldw	L7_PWM_Output_Value,x
 208  0052               L75:
 209                     ; 82     TIM3_SetCompare1(PWM_Output_Value);
 211  0052 ce0002        	ldw	x,L7_PWM_Output_Value
 212  0055 cd0000        	call	_TIM3_SetCompare1
 214                     ; 83 }
 217  0058 85            	popw	x
 218  0059 81            	ret
 266                     ; 85 bool Stick_Position_Detect(){
 267                     	switch	.text
 268  005a               _Stick_Position_Detect:
 272                     ; 88   if ((throttle_inverted == FALSE) && (pwm_width_us >= glow_off)){
 274  005a 725d0000      	tnz	_throttle_inverted
 275  005e 260b          	jrne	L501
 277  0060 ce0000        	ldw	x,_pwm_width_us
 278  0063 c30000        	cpw	x,_glow_off
 279  0066 2503          	jrult	L501
 280                     ; 89 	return TRUE;
 282  0068 a601          	ld	a,#1
 285  006a 81            	ret
 286  006b               L501:
 287                     ; 91   else if ((throttle_inverted == TRUE) && (pwm_width_us <= glow_off)){
 289  006b c60000        	ld	a,_throttle_inverted
 290  006e a101          	cp	a,#1
 291  0070 260b          	jrne	L701
 293  0072 ce0000        	ldw	x,_pwm_width_us
 294  0075 c30000        	cpw	x,_glow_off
 295  0078 2203          	jrugt	L701
 296                     ; 92 	return TRUE;
 298  007a a601          	ld	a,#1
 301  007c 81            	ret
 302  007d               L701:
 303                     ; 95   return FALSE;
 305  007d 4f            	clr	a
 308  007e 81            	ret
 333                     ; 98 void Glow_Disable_State(void){
 334                     	switch	.text
 335  007f               _Glow_Disable_State:
 339                     ; 100   disable_glow = Stick_Position_Detect();
 341  007f add9          	call	_Stick_Position_Detect
 343  0081 c70001        	ld	L5_disable_glow,a
 344                     ; 101 }
 347  0084 81            	ret
 377                     ; 105 void Glow_PWM_Output(){
 378                     	switch	.text
 379  0085               _Glow_PWM_Output:
 383  0085               L731:
 384                     ; 111 	if (PWM_Input_IsValid() == FALSE){
 386  0085 cd0000        	call	_PWM_Input_IsValid
 388  0088 4d            	tnz	a
 389  0089 2605          	jrne	L341
 390                     ; 113 	  Glow_Output_Emergency_OFF();
 392  008b cd0000        	call	_Glow_Output_Emergency_OFF
 394                     ; 115 	  continue;
 396  008e 20f5          	jra	L731
 397  0090               L341:
 398                     ; 117 	  switch (glow_state){
 400  0090 c60000        	ld	a,L3_glow_state
 402                     ; 134 		break;
 403  0093 4d            	tnz	a
 404  0094 2705          	jreq	L321
 405  0096 4a            	dec	a
 406  0097 2713          	jreq	L521
 407  0099 20ea          	jra	L731
 408  009b               L321:
 409                     ; 119 		case GLOW_STATUS:
 409                     ; 120 		//Checks the position of the stick.
 409                     ; 121 		  Glow_Disable_State();
 411  009b ade2          	call	_Glow_Disable_State
 413                     ; 123 		  if (disable_glow == FALSE)
 415  009d 725d0001      	tnz	L5_disable_glow
 416  00a1 26e2          	jrne	L731
 417                     ; 126 			  Glow_Output_ReEnable();
 419  00a3 cd001a        	call	_Glow_Output_ReEnable
 421                     ; 127 			  glow_state = CURRENT_ADJUST;
 423  00a6 35010000      	mov	L3_glow_state,#1
 424  00aa 20d9          	jra	L731
 425  00ac               L521:
 426                     ; 131 		case CURRENT_ADJUST:
 426                     ; 132 		  //Adjust PWM to suit current limits
 426                     ; 133 		  Glow_Current_Adjustment();
 428  00ac cd0020        	call	_Glow_Current_Adjustment
 430                     ; 134 		break;
 432  00af 20d4          	jra	L731
 433  00b1               L741:
 435  00b1 20d2          	jra	L731
 497                     	xdef	_Glow_PWM_Output
 498                     	xdef	_Glow_Disable_State
 499                     	xdef	_Stick_Position_Detect
 500                     	xdef	_Glow_Current_Adjustment
 501                     	xdef	_Glow_Output_ReEnable
 502                     	xdef	_Glow_Output_Emergency_OFF
 503                     	xref	_throttle_inverted
 504                     	xref	_glow_off
 505                     	xref	_PWM_Input_IsValid
 506                     	xref	_pwm_width_us
 507                     	xref	_ADC_Current_Calc
 508                     	xref	_TIM3_SetCompare1
 509                     	xref	_TIM3_Cmd
 510                     	xref	_GPIO_ResetBits
 529                     	end
