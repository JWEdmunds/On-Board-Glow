   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               L3_glow_state:
  16  0000 00            	dc.b	0
  17  0001               L5_disable_glow:
  18  0001 01            	dc.b	1
  19  0002               L7_running_mode_counter:
  20  0002 00            	dc.b	0
  21  0003               L11_running_mode_timer:
  22  0003 00000000      	dc.l	0
  23  0007               L31_PWM_Output_Value:
  24  0007 0000          	dc.w	0
  59                     ; 63 void Glow_Output_Emergency_OFF(void){
  61                     	switch	.text
  62  0000               _Glow_Output_Emergency_OFF:
  66                     ; 67   PWM_Output_Value = GLOW_PWM_MIN;
  68  0000 5f            	clrw	x
  69  0001 cf0007        	ldw	L31_PWM_Output_Value,x
  70                     ; 69   TIM3_SetCompare1(PWM_Output_Value);
  72  0004 5f            	clrw	x
  73  0005 cd0000        	call	_TIM3_SetCompare1
  75                     ; 71   TIM3_Cmd(DISABLE);
  77  0008 4f            	clr	a
  78  0009 cd0000        	call	_TIM3_Cmd
  80                     ; 73   GPIO_ResetBits(GPIOB, GPIO_Pin_1);
  82  000c 4b02          	push	#2
  83  000e ae5005        	ldw	x,#20485
  84  0011 cd0000        	call	_GPIO_ResetBits
  86  0014 84            	pop	a
  87                     ; 75   glow_state = GLOW_STATUS;
  89  0015 725f0000      	clr	L3_glow_state
  90                     ; 76 }
  93  0019 81            	ret
 118                     ; 78 void Glow_Output_ReEnable(void){
 119                     	switch	.text
 120  001a               _Glow_Output_ReEnable:
 124                     ; 81   TIM3_Cmd(ENABLE);
 126  001a a601          	ld	a,#1
 127  001c cd0000        	call	_TIM3_Cmd
 129                     ; 82 }
 132  001f 81            	ret
 176                     ; 84 void Glow_Current_Adjustment(void){
 177                     	switch	.text
 178  0020               _Glow_Current_Adjustment:
 180  0020 5204          	subw	sp,#4
 181       00000004      OFST:	set	4
 184                     ; 90   adc_snapshot = ADC_Get_Raw_Value();
 186  0022 cd0000        	call	_ADC_Get_Raw_Value
 188  0025 1f03          	ldw	(OFST-1,sp),x
 190                     ; 93   if (Glow_Mode == GLOW_MODE_STARTUP){
 192  0027 c60000        	ld	a,_Glow_Mode
 193  002a a101          	cp	a,#1
 194  002c 2607          	jrne	L16
 195                     ; 94 	  target_current = ADC_STARTUP_COUNTS;
 197  002e ae01f4        	ldw	x,#500
 198  0031 1f01          	ldw	(OFST-3,sp),x
 201  0033 200c          	jra	L36
 202  0035               L16:
 203                     ; 96 	else if (Glow_Mode == GLOW_MODE_RUNNING){
 205  0035 c60000        	ld	a,_Glow_Mode
 206  0038 a102          	cp	a,#2
 207  003a 261c          	jrne	L56
 208                     ; 97 	  target_current = ADC_RUNNING_COUNTS;
 210  003c ae015e        	ldw	x,#350
 211  003f 1f01          	ldw	(OFST-3,sp),x
 214  0041               L36:
 215                     ; 105   if (adc_snapshot >= ADC_MAX_ALLOWABLE_COUNTS){
 217  0041 1e03          	ldw	x,(OFST-1,sp)
 218  0043 a30708        	cpw	x,#1800
 219  0046 2523          	jrult	L17
 220                     ; 106 	if (PWM_Output_Value >0){
 222  0048 ce0007        	ldw	x,L31_PWM_Output_Value
 223  004b 2715          	jreq	L37
 224                     ; 107 	  PWM_Output_Value--;
 226  004d ce0007        	ldw	x,L31_PWM_Output_Value
 227  0050 1d0001        	subw	x,#1
 228  0053 cf0007        	ldw	L31_PWM_Output_Value,x
 229  0056 200a          	jra	L37
 230  0058               L56:
 231                     ; 100 	  PWM_Output_Value = GLOW_PWM_MIN;
 233  0058 5f            	clrw	x
 234  0059 cf0007        	ldw	L31_PWM_Output_Value,x
 235                     ; 101 	  TIM3_SetCompare1(PWM_Output_Value);
 237  005c 5f            	clrw	x
 238  005d cd0000        	call	_TIM3_SetCompare1
 240                     ; 102 	return;
 242  0060 2006          	jra	L21
 243  0062               L37:
 244                     ; 109 	TIM3_SetCompare1(PWM_Output_Value);
 246  0062 ce0007        	ldw	x,L31_PWM_Output_Value
 247  0065 cd0000        	call	_TIM3_SetCompare1
 249                     ; 110 	return;
 250  0068               L21:
 253  0068 5b04          	addw	sp,#4
 254  006a 81            	ret
 255  006b               L17:
 256                     ; 114   if (adc_snapshot < (target_current - ADC_CURRENT_HYSTERESIS)){
 258  006b 1e01          	ldw	x,(OFST-3,sp)
 259  006d 1d0014        	subw	x,#20
 260  0070 1303          	cpw	x,(OFST-1,sp)
 261  0072 2313          	jrule	L57
 262                     ; 116     if (PWM_Output_Value < GLOW_PWM_MAX)
 264  0074 ce0007        	ldw	x,L31_PWM_Output_Value
 265  0077 a303e7        	cpw	x,#999
 266  007a 2422          	jruge	L101
 267                     ; 118 		  PWM_Output_Value += GLOW_PWM_STEP;
 269  007c ce0007        	ldw	x,L31_PWM_Output_Value
 270  007f 1c0001        	addw	x,#1
 271  0082 cf0007        	ldw	L31_PWM_Output_Value,x
 272  0085 2017          	jra	L101
 273  0087               L57:
 274                     ; 121   else if (adc_snapshot > (target_current + ADC_CURRENT_HYSTERESIS)){
 276  0087 1e01          	ldw	x,(OFST-3,sp)
 277  0089 1c0014        	addw	x,#20
 278  008c 1303          	cpw	x,(OFST-1,sp)
 279  008e 240e          	jruge	L101
 280                     ; 123 	if (PWM_Output_Value > GLOW_PWM_MIN)
 282  0090 ce0007        	ldw	x,L31_PWM_Output_Value
 283  0093 2709          	jreq	L101
 284                     ; 125 		  PWM_Output_Value -= GLOW_PWM_STEP;
 286  0095 ce0007        	ldw	x,L31_PWM_Output_Value
 287  0098 1d0001        	subw	x,#1
 288  009b cf0007        	ldw	L31_PWM_Output_Value,x
 289  009e               L101:
 290                     ; 134   TIM3_SetCompare1(PWM_Output_Value);
 292  009e ce0007        	ldw	x,L31_PWM_Output_Value
 293  00a1 cd0000        	call	_TIM3_SetCompare1
 295                     ; 135 }
 297  00a4 20c2          	jra	L21
 354                     ; 137 bool Stick_Position_Detect(void){
 355                     	switch	.text
 356  00a6               _Stick_Position_Detect:
 358  00a6 89            	pushw	x
 359       00000002      OFST:	set	2
 362                     ; 143   pwm_snapshot = PWM_Input_GetWidth();
 364  00a7 cd0000        	call	_PWM_Input_GetWidth
 366  00aa 1f01          	ldw	(OFST-1,sp),x
 368                     ; 145 	if ((throttle_inverted == FALSE) && (pwm_snapshot >= glow_off)){
 370  00ac 725d0000      	tnz	_throttle_inverted
 371  00b0 260b          	jrne	L531
 373  00b2 1e01          	ldw	x,(OFST-1,sp)
 374  00b4 c30000        	cpw	x,_glow_off
 375  00b7 2504          	jrult	L531
 376                     ; 146 	  return TRUE;
 378  00b9 a601          	ld	a,#1
 380  00bb 2010          	jra	L61
 381  00bd               L531:
 382                     ; 149 	else if ((throttle_inverted == TRUE) && (pwm_snapshot <= glow_off)){
 384  00bd c60000        	ld	a,_throttle_inverted
 385  00c0 a101          	cp	a,#1
 386  00c2 260b          	jrne	L731
 388  00c4 1e01          	ldw	x,(OFST-1,sp)
 389  00c6 c30000        	cpw	x,_glow_off
 390  00c9 2204          	jrugt	L731
 391                     ; 150 	  return TRUE;
 393  00cb a601          	ld	a,#1
 395  00cd               L61:
 397  00cd 85            	popw	x
 398  00ce 81            	ret
 399  00cf               L731:
 400                     ; 153   return FALSE;
 402  00cf 4f            	clr	a
 404  00d0 20fb          	jra	L61
 429                     ; 156 void Glow_Disable_State(void){
 430                     	switch	.text
 431  00d2               _Glow_Disable_State:
 435                     ; 158   disable_glow = Stick_Position_Detect();
 437  00d2 add2          	call	_Stick_Position_Detect
 439  00d4 c70001        	ld	L5_disable_glow,a
 440                     ; 159 }
 443  00d7 81            	ret
 470                     .const:	section	.text
 471  0000               L42:
 472  0000 000003e8      	dc.l	1000
 473                     ; 161 void Glow_Mode_Update(void)
 473                     ; 162 {
 474                     	switch	.text
 475  00d8               _Glow_Mode_Update:
 479                     ; 164     if (Glow_Mode == GLOW_MODE_STARTUP)
 481  00d8 c60000        	ld	a,_Glow_Mode
 482  00db a101          	cp	a,#1
 483  00dd 2629          	jrne	L361
 484                     ; 167         if ((uint32_t)(System_Time_Get() - running_mode_timer) >= 1000)
 486  00df cd0000        	call	_System_Time_Get
 488  00e2 ae0003        	ldw	x,#L11_running_mode_timer
 489  00e5 cd0000        	call	c_lsub
 491  00e8 ae0000        	ldw	x,#L42
 492  00eb cd0000        	call	c_lcmp
 494  00ee 2518          	jrult	L361
 495                     ; 170             running_mode_timer = System_Time_Get();
 497  00f0 cd0000        	call	_System_Time_Get
 499  00f3 ae0003        	ldw	x,#L11_running_mode_timer
 500  00f6 cd0000        	call	c_rtol
 502                     ; 173             running_mode_counter++;
 504  00f9 725c0002      	inc	L7_running_mode_counter
 505                     ; 176             if (running_mode_counter >= 120)
 507  00fd c60002        	ld	a,L7_running_mode_counter
 508  0100 a178          	cp	a,#120
 509  0102 2504          	jrult	L361
 510                     ; 178                 Glow_Mode = GLOW_MODE_RUNNING;
 512  0104 35020000      	mov	_Glow_Mode,#2
 513  0108               L361:
 514                     ; 182 }
 517  0108 81            	ret
 554                     ; 185 void Glow_PWM_Output(){
 555                     	switch	.text
 556  0109               _Glow_PWM_Output:
 560                     ; 188   Glow_Mode = GLOW_MODE_STARTUP;
 562  0109 35010000      	mov	_Glow_Mode,#1
 563                     ; 191   running_mode_counter = 0;
 565  010d 725f0002      	clr	L7_running_mode_counter
 566                     ; 192   running_mode_timer = system_time_ms;
 568  0111 ce0002        	ldw	x,_system_time_ms+2
 569  0114 cf0005        	ldw	L11_running_mode_timer+2,x
 570  0117 ce0000        	ldw	x,_system_time_ms
 571  011a cf0003        	ldw	L11_running_mode_timer,x
 572  011d               L502:
 573                     ; 197 	Glow_Mode_Update();
 575  011d adb9          	call	_Glow_Mode_Update
 577                     ; 199 	if (PWM_Input_IsValid() == FALSE){
 579  011f cd0000        	call	_PWM_Input_IsValid
 581  0122 4d            	tnz	a
 582  0123 2605          	jrne	L112
 583                     ; 201 	  Glow_Output_Emergency_OFF();
 585  0125 cd0000        	call	_Glow_Output_Emergency_OFF
 587                     ; 203 	  continue;
 589  0128 20f3          	jra	L502
 590  012a               L112:
 591                     ; 205 	  switch (glow_state){
 593  012a c60000        	ld	a,L3_glow_state
 595                     ; 236 		break;
 596  012d 4d            	tnz	a
 597  012e 2705          	jreq	L171
 598  0130 4a            	dec	a
 599  0131 2713          	jreq	L371
 600  0133 20e8          	jra	L502
 601  0135               L171:
 602                     ; 207 		case GLOW_STATUS:
 602                     ; 208 		//Checks the position of the stick.
 602                     ; 209 		  Glow_Disable_State();
 604  0135 ad9b          	call	_Glow_Disable_State
 606                     ; 211 		  if (disable_glow == FALSE)
 608  0137 725d0001      	tnz	L5_disable_glow
 609  013b 26e0          	jrne	L502
 610                     ; 214 			  Glow_Output_ReEnable();
 612  013d cd001a        	call	_Glow_Output_ReEnable
 614                     ; 215 			  glow_state = CURRENT_ADJUST;
 616  0140 35010000      	mov	L3_glow_state,#1
 617  0144 20d7          	jra	L502
 618  0146               L371:
 619                     ; 219 		case CURRENT_ADJUST:
 619                     ; 220 		  //Check positionj whilst glow is running.
 619                     ; 221 		  Glow_Disable_State();
 621  0146 ad8a          	call	_Glow_Disable_State
 623                     ; 223 		    if (disable_glow == TRUE)
 625  0148 c60001        	ld	a,L5_disable_glow
 626  014b a101          	cp	a,#1
 627  014d 260e          	jrne	L122
 628                     ; 226 				  PWM_Output_Value = GLOW_PWM_MIN;
 630  014f 5f            	clrw	x
 631  0150 cf0007        	ldw	L31_PWM_Output_Value,x
 632                     ; 227 				  TIM3_SetCompare1(PWM_Output_Value);
 634  0153 5f            	clrw	x
 635  0154 cd0000        	call	_TIM3_SetCompare1
 637                     ; 229 				  glow_state = GLOW_STATUS;
 639  0157 725f0000      	clr	L3_glow_state
 641  015b 20c0          	jra	L502
 642  015d               L122:
 643                     ; 234 					Glow_Current_Adjustment();
 645  015d cd0020        	call	_Glow_Current_Adjustment
 647  0160 20bb          	jra	L502
 648  0162               L512:
 649                     ; 236 		break;
 650  0162 20b9          	jra	L502
 764                     	switch	.bss
 765  0000               _Glow_Mode:
 766  0000 00            	ds.b	1
 767                     	xdef	_Glow_Mode
 768                     	xref	_System_Time_Get
 769                     	xref	_system_time_ms
 770                     	xdef	_Glow_PWM_Output
 771                     	xdef	_Glow_Mode_Update
 772                     	xdef	_Glow_Disable_State
 773                     	xdef	_Stick_Position_Detect
 774                     	xdef	_Glow_Current_Adjustment
 775                     	xdef	_Glow_Output_ReEnable
 776                     	xdef	_Glow_Output_Emergency_OFF
 777                     	xref	_throttle_inverted
 778                     	xref	_glow_off
 779                     	xref	_PWM_Input_IsValid
 780                     	xref	_PWM_Input_GetWidth
 781                     	xref	_ADC_Get_Raw_Value
 782                     	xref	_TIM3_SetCompare1
 783                     	xref	_TIM3_Cmd
 784                     	xref	_GPIO_ResetBits
 804                     	xref	c_rtol
 805                     	xref	c_lcmp
 806                     	xref	c_lsub
 807                     	end
