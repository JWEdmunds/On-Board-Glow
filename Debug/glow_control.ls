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
 169                     ; 84 void Glow_Current_Adjustment(void){
 170                     	switch	.text
 171  0020               _Glow_Current_Adjustment:
 173  0020 89            	pushw	x
 174       00000002      OFST:	set	2
 177                     ; 88   if (Glow_Mode == GLOW_MODE_STARTUP){
 179  0021 c60000        	ld	a,_Glow_Mode
 180  0024 a101          	cp	a,#1
 181  0026 2607          	jrne	L75
 182                     ; 89 	  target_current = ADC_STARTUP_COUNTS;
 184  0028 ae05dc        	ldw	x,#1500
 185  002b 1f01          	ldw	(OFST-1,sp),x
 188  002d 200c          	jra	L16
 189  002f               L75:
 190                     ; 91 	else if (Glow_Mode == GLOW_MODE_RUNNING){
 192  002f c60000        	ld	a,_Glow_Mode
 193  0032 a102          	cp	a,#2
 194  0034 261d          	jrne	L36
 195                     ; 92 	  target_current = ADC_RUNNING_COUNTS;
 197  0036 ae0384        	ldw	x,#900
 198  0039 1f01          	ldw	(OFST-1,sp),x
 201  003b               L16:
 202                     ; 99   if (ADC_Raw_Value >= ADC_MAX_ALLOWABLE_COUNTS){
 204  003b ce0000        	ldw	x,_ADC_Raw_Value
 205  003e a30708        	cpw	x,#1800
 206  0041 2516          	jrult	L76
 207                     ; 100 	if (PWM_Output_Value >0){
 209  0043 ce0007        	ldw	x,L31_PWM_Output_Value
 210  0046 270f          	jreq	L17
 211                     ; 101 	  PWM_Output_Value--;
 213  0048 ce0007        	ldw	x,L31_PWM_Output_Value
 214  004b 1d0001        	subw	x,#1
 215  004e cf0007        	ldw	L31_PWM_Output_Value,x
 216  0051 2004          	jra	L17
 217  0053               L36:
 218                     ; 95 	  PWM_Output_Value = 0;
 220  0053 5f            	clrw	x
 221  0054 cf0007        	ldw	L31_PWM_Output_Value,x
 222                     ; 96 	  return;
 224  0057               L17:
 225                     ; 103 	return;
 226  0057               L21:
 229  0057 85            	popw	x
 230  0058 81            	ret
 231  0059               L76:
 232                     ; 107   if (ADC_Raw_Value < (target_current - ADC_CURRENT_HYSTERESIS)){
 234  0059 1e01          	ldw	x,(OFST-1,sp)
 235  005b 1d0014        	subw	x,#20
 236  005e c30000        	cpw	x,_ADC_Raw_Value
 237  0061 2313          	jrule	L37
 238                     ; 109     if (PWM_Output_Value < GLOW_PWM_MAX)
 240  0063 ce0007        	ldw	x,L31_PWM_Output_Value
 241  0066 a303e7        	cpw	x,#999
 242  0069 2423          	jruge	L77
 243                     ; 111 		  PWM_Output_Value += GLOW_PWM_STEP;
 245  006b ce0007        	ldw	x,L31_PWM_Output_Value
 246  006e 1c0001        	addw	x,#1
 247  0071 cf0007        	ldw	L31_PWM_Output_Value,x
 248  0074 2018          	jra	L77
 249  0076               L37:
 250                     ; 114   else if (ADC_Raw_Value > (target_current + ADC_CURRENT_HYSTERESIS)){
 252  0076 1e01          	ldw	x,(OFST-1,sp)
 253  0078 1c0014        	addw	x,#20
 254  007b c30000        	cpw	x,_ADC_Raw_Value
 255  007e 240e          	jruge	L77
 256                     ; 116 	if (PWM_Output_Value > GLOW_PWM_MIN)
 258  0080 ce0007        	ldw	x,L31_PWM_Output_Value
 259  0083 2709          	jreq	L77
 260                     ; 118 		  PWM_Output_Value -= GLOW_PWM_STEP;
 262  0085 ce0007        	ldw	x,L31_PWM_Output_Value
 263  0088 1d0001        	subw	x,#1
 264  008b cf0007        	ldw	L31_PWM_Output_Value,x
 265  008e               L77:
 266                     ; 127   TIM3_SetCompare1(PWM_Output_Value);
 268  008e ce0007        	ldw	x,L31_PWM_Output_Value
 269  0091 cd0000        	call	_TIM3_SetCompare1
 271                     ; 128 }
 273  0094 20c1          	jra	L21
 321                     ; 130 bool Stick_Position_Detect(){
 322                     	switch	.text
 323  0096               _Stick_Position_Detect:
 327                     ; 133   if ((throttle_inverted == FALSE) && (pwm_width_us >= glow_off)){
 329  0096 725d0000      	tnz	_throttle_inverted
 330  009a 260b          	jrne	L721
 332  009c ce0000        	ldw	x,_pwm_width_us
 333  009f c30000        	cpw	x,_glow_off
 334  00a2 2503          	jrult	L721
 335                     ; 134 	return TRUE;
 337  00a4 a601          	ld	a,#1
 340  00a6 81            	ret
 341  00a7               L721:
 342                     ; 136   else if ((throttle_inverted == TRUE) && (pwm_width_us <= glow_off)){
 344  00a7 c60000        	ld	a,_throttle_inverted
 345  00aa a101          	cp	a,#1
 346  00ac 260b          	jrne	L131
 348  00ae ce0000        	ldw	x,_pwm_width_us
 349  00b1 c30000        	cpw	x,_glow_off
 350  00b4 2203          	jrugt	L131
 351                     ; 137 	return TRUE;
 353  00b6 a601          	ld	a,#1
 356  00b8 81            	ret
 357  00b9               L131:
 358                     ; 140   return FALSE;
 360  00b9 4f            	clr	a
 363  00ba 81            	ret
 388                     ; 143 void Glow_Disable_State(void){
 389                     	switch	.text
 390  00bb               _Glow_Disable_State:
 394                     ; 145   disable_glow = Stick_Position_Detect();
 396  00bb add9          	call	_Stick_Position_Detect
 398  00bd c70001        	ld	L5_disable_glow,a
 399                     ; 146 }
 402  00c0 81            	ret
 429                     .const:	section	.text
 430  0000               L22:
 431  0000 000003e8      	dc.l	1000
 432                     ; 148 void Glow_Mode_Update(void)
 432                     ; 149 {
 433                     	switch	.text
 434  00c1               _Glow_Mode_Update:
 438                     ; 151     if (Glow_Mode == GLOW_MODE_STARTUP)
 440  00c1 c60000        	ld	a,_Glow_Mode
 441  00c4 a101          	cp	a,#1
 442  00c6 262f          	jrne	L551
 443                     ; 154         if ((uint32_t)(system_time_ms - running_mode_timer) >= 1000)
 445  00c8 ae0000        	ldw	x,#_system_time_ms
 446  00cb cd0000        	call	c_ltor
 448  00ce ae0003        	ldw	x,#L11_running_mode_timer
 449  00d1 cd0000        	call	c_lsub
 451  00d4 ae0000        	ldw	x,#L22
 452  00d7 cd0000        	call	c_lcmp
 454  00da 251b          	jrult	L551
 455                     ; 157             running_mode_timer = system_time_ms;
 457  00dc ce0002        	ldw	x,_system_time_ms+2
 458  00df cf0005        	ldw	L11_running_mode_timer+2,x
 459  00e2 ce0000        	ldw	x,_system_time_ms
 460  00e5 cf0003        	ldw	L11_running_mode_timer,x
 461                     ; 160             running_mode_counter++;
 463  00e8 725c0002      	inc	L7_running_mode_counter
 464                     ; 163             if (running_mode_counter >= 120)
 466  00ec c60002        	ld	a,L7_running_mode_counter
 467  00ef a178          	cp	a,#120
 468  00f1 2504          	jrult	L551
 469                     ; 165                 Glow_Mode = GLOW_MODE_RUNNING;
 471  00f3 35020000      	mov	_Glow_Mode,#2
 472  00f7               L551:
 473                     ; 169 }
 476  00f7 81            	ret
 513                     ; 172 void Glow_PWM_Output(){
 514                     	switch	.text
 515  00f8               _Glow_PWM_Output:
 519                     ; 175   Glow_Mode = GLOW_MODE_STARTUP;
 521  00f8 35010000      	mov	_Glow_Mode,#1
 522                     ; 178   running_mode_counter = 0;
 524  00fc 725f0002      	clr	L7_running_mode_counter
 525                     ; 179   running_mode_timer = system_time_ms;
 527  0100 ce0002        	ldw	x,_system_time_ms+2
 528  0103 cf0005        	ldw	L11_running_mode_timer+2,x
 529  0106 ce0000        	ldw	x,_system_time_ms
 530  0109 cf0003        	ldw	L11_running_mode_timer,x
 531  010c               L771:
 532                     ; 184 	Glow_Mode_Update();
 534  010c adb3          	call	_Glow_Mode_Update
 536                     ; 186 	if (PWM_Input_IsValid() == FALSE){
 538  010e cd0000        	call	_PWM_Input_IsValid
 540  0111 4d            	tnz	a
 541  0112 2605          	jrne	L302
 542                     ; 188 	  Glow_Output_Emergency_OFF();
 544  0114 cd0000        	call	_Glow_Output_Emergency_OFF
 546                     ; 190 	  continue;
 548  0117 20f3          	jra	L771
 549  0119               L302:
 550                     ; 192 	  switch (glow_state){
 552  0119 c60000        	ld	a,L3_glow_state
 554                     ; 222 					break;
 555  011c 4d            	tnz	a
 556  011d 2705          	jreq	L361
 557  011f 4a            	dec	a
 558  0120 2713          	jreq	L561
 559  0122 20e8          	jra	L771
 560  0124               L361:
 561                     ; 194 		case GLOW_STATUS:
 561                     ; 195 		//Checks the position of the stick.
 561                     ; 196 		  Glow_Disable_State();
 563  0124 ad95          	call	_Glow_Disable_State
 565                     ; 198 		  if (disable_glow == FALSE)
 567  0126 725d0001      	tnz	L5_disable_glow
 568  012a 26e0          	jrne	L771
 569                     ; 201 			  Glow_Output_ReEnable();
 571  012c cd001a        	call	_Glow_Output_ReEnable
 573                     ; 202 			  glow_state = CURRENT_ADJUST;
 575  012f 35010000      	mov	L3_glow_state,#1
 576  0133 20d7          	jra	L771
 577  0135               L561:
 578                     ; 206 		case CURRENT_ADJUST:
 578                     ; 207 		  //Adjust PWM to suit current limits
 578                     ; 208 		  Glow_Current_Adjustment();
 580  0135 cd0020        	call	_Glow_Current_Adjustment
 582                     ; 209 		      if (disable_glow == TRUE)
 584  0138 c60001        	ld	a,L5_disable_glow
 585  013b a101          	cp	a,#1
 586  013d 260e          	jrne	L312
 587                     ; 212 					PWM_Output_Value = GLOW_PWM_MIN;
 589  013f 5f            	clrw	x
 590  0140 cf0007        	ldw	L31_PWM_Output_Value,x
 591                     ; 213 					TIM3_SetCompare1(PWM_Output_Value);
 593  0143 5f            	clrw	x
 594  0144 cd0000        	call	_TIM3_SetCompare1
 596                     ; 216 					glow_state = GLOW_STATUS;
 598  0147 725f0000      	clr	L3_glow_state
 600  014b 20bf          	jra	L771
 601  014d               L312:
 602                     ; 221 					Glow_Current_Adjustment();
 604  014d cd0020        	call	_Glow_Current_Adjustment
 606                     ; 222 					break;
 608  0150 20ba          	jra	L771
 609  0152               L702:
 611  0152 20b8          	jra	L771
 725                     	switch	.bss
 726  0000               _Glow_Mode:
 727  0000 00            	ds.b	1
 728                     	xdef	_Glow_Mode
 729                     	xref	_system_time_ms
 730                     	xdef	_Glow_PWM_Output
 731                     	xdef	_Glow_Mode_Update
 732                     	xdef	_Glow_Disable_State
 733                     	xdef	_Stick_Position_Detect
 734                     	xdef	_Glow_Current_Adjustment
 735                     	xdef	_Glow_Output_ReEnable
 736                     	xdef	_Glow_Output_Emergency_OFF
 737                     	xref	_throttle_inverted
 738                     	xref	_glow_off
 739                     	xref	_PWM_Input_IsValid
 740                     	xref	_pwm_width_us
 741                     	xref	_ADC_Raw_Value
 742                     	xref	_TIM3_SetCompare1
 743                     	xref	_TIM3_Cmd
 744                     	xref	_GPIO_ResetBits
 764                     	xref	c_lcmp
 765                     	xref	c_lsub
 766                     	xref	c_ltor
 767                     	end
