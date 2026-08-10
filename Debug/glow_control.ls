   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               L3_glow_state:
  16  0000 00            	dc.b	0
  17  0001               L5_disable_glow:
  18  0001 01            	dc.b	1
  19  0002               L7_PWM_Value:
  20  0002 0000          	dc.w	0
  55                     ; 37 void Glow_Output_Emergency_OFF(void){
  57                     	switch	.text
  58  0000               _Glow_Output_Emergency_OFF:
  62                     ; 41   PWM_Value = GLOW_PWM_MIN;
  64  0000 5f            	clrw	x
  65  0001 cf0002        	ldw	L7_PWM_Value,x
  66                     ; 43   TIM3_SetCompare1(PWM_Value);
  68  0004 5f            	clrw	x
  69  0005 cd0000        	call	_TIM3_SetCompare1
  71                     ; 45   TIM3_Cmd(DISABLE);
  73  0008 4f            	clr	a
  74  0009 cd0000        	call	_TIM3_Cmd
  76                     ; 47   GPIO_ResetBits(GPIOB, GPIO_Pin_1);
  78  000c 4b02          	push	#2
  79  000e ae5005        	ldw	x,#20485
  80  0011 cd0000        	call	_GPIO_ResetBits
  82  0014 84            	pop	a
  83                     ; 49   glow_state = GLOW_STATUS;
  85  0015 725f0000      	clr	L3_glow_state
  86                     ; 50 }
  89  0019 81            	ret
 114                     ; 52 void Glow_Output_ReEnable(void){
 115                     	switch	.text
 116  001a               _Glow_Output_ReEnable:
 120                     ; 55   TIM3_Cmd(ENABLE);
 122  001a a601          	ld	a,#1
 123  001c cd0000        	call	_TIM3_Cmd
 125                     ; 56 }
 128  001f 81            	ret
 152                     ; 60 void Glow_Current_Adjustment(){
 153                     	switch	.text
 154  0020               _Glow_Current_Adjustment:
 158                     ; 62 }
 161  0020 81            	ret
 209                     ; 64 bool Stick_Position_Detect(){
 210                     	switch	.text
 211  0021               _Stick_Position_Detect:
 215                     ; 67   if ((throttle_inverted == FALSE) && (pwm_width_us >= glow_off)){
 217  0021 725d0000      	tnz	_throttle_inverted
 218  0025 260b          	jrne	L76
 220  0027 ce0000        	ldw	x,_pwm_width_us
 221  002a c30000        	cpw	x,_glow_off
 222  002d 2503          	jrult	L76
 223                     ; 68 	return TRUE;
 225  002f a601          	ld	a,#1
 228  0031 81            	ret
 229  0032               L76:
 230                     ; 70   else if ((throttle_inverted == TRUE) && (pwm_width_us <= glow_off)){
 232  0032 c60000        	ld	a,_throttle_inverted
 233  0035 a101          	cp	a,#1
 234  0037 260b          	jrne	L17
 236  0039 ce0000        	ldw	x,_pwm_width_us
 237  003c c30000        	cpw	x,_glow_off
 238  003f 2203          	jrugt	L17
 239                     ; 71 	return TRUE;
 241  0041 a601          	ld	a,#1
 244  0043 81            	ret
 245  0044               L17:
 246                     ; 74   return FALSE;
 248  0044 4f            	clr	a
 251  0045 81            	ret
 276                     ; 77 void Glow_Disable_State(void){
 277                     	switch	.text
 278  0046               _Glow_Disable_State:
 282                     ; 79   disable_glow = Stick_Position_Detect();
 284  0046 add9          	call	_Stick_Position_Detect
 286  0048 c70001        	ld	L5_disable_glow,a
 287                     ; 80 }
 290  004b 81            	ret
 320                     ; 84 void Glow_PWM_Output(){
 321                     	switch	.text
 322  004c               _Glow_PWM_Output:
 326  004c               L121:
 327                     ; 90 	if (PWM_Input_IsValid() == FALSE){
 329  004c cd0000        	call	_PWM_Input_IsValid
 331  004f 4d            	tnz	a
 332  0050 2604          	jrne	L521
 333                     ; 92 	  Glow_Output_Emergency_OFF();
 335  0052 adac          	call	_Glow_Output_Emergency_OFF
 337                     ; 94 	  continue;
 339  0054 20f6          	jra	L121
 340  0056               L521:
 341                     ; 96 	  switch (glow_state){
 343  0056 c60000        	ld	a,L3_glow_state
 345                     ; 113 		break;
 346  0059 4d            	tnz	a
 347  005a 2705          	jreq	L501
 348  005c 4a            	dec	a
 349  005d 2712          	jreq	L701
 350  005f 20eb          	jra	L121
 351  0061               L501:
 352                     ; 98 		case GLOW_STATUS:
 352                     ; 99 		//Checks the position of the stick.
 352                     ; 100 		  Glow_Disable_State();
 354  0061 ade3          	call	_Glow_Disable_State
 356                     ; 102 		  if (disable_glow == FALSE)
 358  0063 725d0001      	tnz	L5_disable_glow
 359  0067 26e3          	jrne	L121
 360                     ; 105 			  Glow_Output_ReEnable();
 362  0069 adaf          	call	_Glow_Output_ReEnable
 364                     ; 106 			  glow_state = CURRENT_ADJUST;
 366  006b 35010000      	mov	L3_glow_state,#1
 367  006f 20db          	jra	L121
 368  0071               L701:
 369                     ; 110 		case CURRENT_ADJUST:
 369                     ; 111 		  //Adjust PWM to suit current limits
 369                     ; 112 		  Glow_Current_Adjustment();
 371  0071 adad          	call	_Glow_Current_Adjustment
 373                     ; 113 		break;
 375  0073 20d7          	jra	L121
 376  0075               L131:
 378  0075 20d5          	jra	L121
 440                     	xdef	_Glow_PWM_Output
 441                     	xdef	_Glow_Disable_State
 442                     	xdef	_Stick_Position_Detect
 443                     	xdef	_Glow_Current_Adjustment
 444                     	xdef	_Glow_Output_ReEnable
 445                     	xdef	_Glow_Output_Emergency_OFF
 446                     	xref	_throttle_inverted
 447                     	xref	_glow_off
 448                     	xref	_PWM_Input_IsValid
 449                     	xref	_pwm_width_us
 450                     	xref	_TIM3_SetCompare1
 451                     	xref	_TIM3_Cmd
 452                     	xref	_GPIO_ResetBits
 471                     	end
