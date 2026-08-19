   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _system_time_ms:
  16  0000 00000000      	dc.l	0
  17  0004               _system_state:
  18  0004 00            	dc.b	0
  64                     ; 28 void Delay_ms(uint16_t delay_ms){
  66                     	switch	.text
  67  0000               _Delay_ms:
  69  0000 89            	pushw	x
  70  0001 5208          	subw	sp,#8
  71       00000008      OFST:	set	8
  74                     ; 32 	start_time = System_Time_Get();
  76  0003 ad52          	call	_System_Time_Get
  78  0005 96            	ldw	x,sp
  79  0006 1c0005        	addw	x,#OFST-3
  80  0009 cd0000        	call	c_rtol
  84  000c               L33:
  85                     ; 34     while ((uint32_t)(System_Time_Get() - start_time) < delay_ms)
  87  000c ad49          	call	_System_Time_Get
  89  000e 96            	ldw	x,sp
  90  000f 1c0005        	addw	x,#OFST-3
  91  0012 cd0000        	call	c_lsub
  93  0015 96            	ldw	x,sp
  94  0016 1c0001        	addw	x,#OFST-7
  95  0019 cd0000        	call	c_rtol
  98  001c 1e09          	ldw	x,(OFST+1,sp)
  99  001e cd0000        	call	c_uitolx
 101  0021 96            	ldw	x,sp
 102  0022 1c0001        	addw	x,#OFST-7
 103  0025 cd0000        	call	c_lcmp
 105  0028 22e2          	jrugt	L33
 106                     ; 38 }
 109  002a 5b0a          	addw	sp,#10
 110  002c 81            	ret
 159                     ; 40 void ledFlash(uint8_t flash_count, uint16_t delay_ms)
 159                     ; 41 {
 160                     	switch	.text
 161  002d               _ledFlash:
 163  002d 88            	push	a
 164  002e 88            	push	a
 165       00000001      OFST:	set	1
 168                     ; 44     for (flash_number = 0;
 170  002f 0f01          	clr	(OFST+0,sp)
 173  0031 201c          	jra	L36
 174  0033               L75:
 175                     ; 49         GPIO_ResetBits(GPIOB, GPIO_Pin_7);
 177  0033 4b80          	push	#128
 178  0035 ae5005        	ldw	x,#20485
 179  0038 cd0000        	call	_GPIO_ResetBits
 181  003b 84            	pop	a
 182                     ; 51         Delay_ms(delay_ms);
 184  003c 1e05          	ldw	x,(OFST+4,sp)
 185  003e adc0          	call	_Delay_ms
 187                     ; 54         GPIO_SetBits(GPIOB, GPIO_Pin_7);
 189  0040 4b80          	push	#128
 190  0042 ae5005        	ldw	x,#20485
 191  0045 cd0000        	call	_GPIO_SetBits
 193  0048 84            	pop	a
 194                     ; 56         Delay_ms(delay_ms);
 196  0049 1e05          	ldw	x,(OFST+4,sp)
 197  004b adb3          	call	_Delay_ms
 199                     ; 45          flash_number < flash_count;
 199                     ; 46          ++flash_number)
 201  004d 0c01          	inc	(OFST+0,sp)
 203  004f               L36:
 204                     ; 44     for (flash_number = 0;
 204                     ; 45          flash_number < flash_count;
 206  004f 7b01          	ld	a,(OFST+0,sp)
 207  0051 1102          	cp	a,(OFST+1,sp)
 208  0053 25de          	jrult	L75
 209                     ; 58 }
 212  0055 85            	popw	x
 213  0056 81            	ret
 248                     ; 61 uint32_t System_Time_Get(void)
 248                     ; 62 {
 249                     	switch	.text
 250  0057               _System_Time_Get:
 252  0057 5204          	subw	sp,#4
 253       00000004      OFST:	set	4
 256                     ; 65     disableInterrupts();
 259  0059 9b            sim
 261                     ; 67     time_snapshot = system_time_ms;
 264  005a ce0002        	ldw	x,_system_time_ms+2
 265  005d 1f03          	ldw	(OFST-1,sp),x
 266  005f ce0000        	ldw	x,_system_time_ms
 267  0062 1f01          	ldw	(OFST-3,sp),x
 269                     ; 69     enableInterrupts();
 272  0064 9a            rim
 274                     ; 71     return time_snapshot;
 277  0065 96            	ldw	x,sp
 278  0066 1c0001        	addw	x,#OFST-3
 279  0069 cd0000        	call	c_ltor
 283  006c 5b04          	addw	sp,#4
 284  006e 81            	ret
 287                     	switch	.data
 288  0005               L301_arm_count:
 289  0005 00            	dc.b	0
 290  0006               L501_stick_high:
 291  0006 00            	dc.b	0
 369                     ; 75 bool systemArming(void){
 370                     	switch	.text
 371  006f               _systemArming:
 373  006f 5204          	subw	sp,#4
 374       00000004      OFST:	set	4
 377                     ; 83     arm_lower_limit = pwm_lower_limit + ARM_PWM_TOLERANCE;
 379  0071 ce0000        	ldw	x,_pwm_lower_limit
 380  0074 1c0005        	addw	x,#5
 381  0077 1f01          	ldw	(OFST-3,sp),x
 383                     ; 84     arm_upper_limit = pwm_upper_limit - ARM_PWM_TOLERANCE;
 385  0079 ce0000        	ldw	x,_pwm_upper_limit
 386  007c 1d0005        	subw	x,#5
 387  007f 1f03          	ldw	(OFST-1,sp),x
 389                     ; 87     if ((pwm_width_us >= arm_upper_limit) && (stick_high == FALSE))
 391  0081 ce0000        	ldw	x,_pwm_width_us
 392  0084 1303          	cpw	x,(OFST-1,sp)
 393  0086 250a          	jrult	L341
 395  0088 725d0006      	tnz	L501_stick_high
 396  008c 2604          	jrne	L341
 397                     ; 89         stick_high = TRUE;
 399  008e 35010006      	mov	L501_stick_high,#1
 400  0092               L341:
 401                     ; 93     if ((pwm_width_us <= arm_lower_limit) && (stick_high == TRUE))
 403  0092 ce0000        	ldw	x,_pwm_width_us
 404  0095 1301          	cpw	x,(OFST-3,sp)
 405  0097 220f          	jrugt	L541
 407  0099 c60006        	ld	a,L501_stick_high
 408  009c a101          	cp	a,#1
 409  009e 2608          	jrne	L541
 410                     ; 95         stick_high = FALSE;
 412  00a0 725f0006      	clr	L501_stick_high
 413                     ; 96         arm_count++;
 415  00a4 725c0005      	inc	L301_arm_count
 416  00a8               L541:
 417                     ; 100     if (arm_count >= ARM_COUNT_REQUIRED)
 419  00a8 c60005        	ld	a,L301_arm_count
 420  00ab a105          	cp	a,#5
 421  00ad 2508          	jrult	L741
 422                     ; 102         arm_count = 0;
 424  00af 725f0005      	clr	L301_arm_count
 425                     ; 103         return TRUE;
 427  00b3 a601          	ld	a,#1
 429  00b5 2001          	jra	L41
 430  00b7               L741:
 431                     ; 106     return FALSE;
 433  00b7 4f            	clr	a
 435  00b8               L41:
 437  00b8 5b04          	addw	sp,#4
 438  00ba 81            	ret
 441                     	switch	.data
 442  0007               L151_startup_state_selected:
 443  0007 00            	dc.b	0
 505                     ; 108 void System_StateMachine(void){
 506                     	switch	.text
 507  00bb               _System_StateMachine:
 509  00bb 5204          	subw	sp,#4
 510       00000004      OFST:	set	4
 513                     ; 113     if (startup_state_selected == FALSE)
 515  00bd 725d0007      	tnz	L151_startup_state_selected
 516  00c1 2614          	jrne	L312
 517                     ; 115         if (Calibration_Data_VALID() == FALSE)
 519  00c3 cd0000        	call	_Calibration_Data_VALID
 521  00c6 4d            	tnz	a
 522  00c7 2606          	jrne	L702
 523                     ; 117             system_state = STATE_CALIBRATION;
 525  00c9 725f0004      	clr	_system_state
 527  00cd 2004          	jra	L112
 528  00cf               L702:
 529                     ; 121             system_state = STATE_RECALIBRATION;
 531  00cf 35010004      	mov	_system_state,#1
 532  00d3               L112:
 533                     ; 124         startup_state_selected = TRUE;
 535  00d3 35010007      	mov	L151_startup_state_selected,#1
 536  00d7               L312:
 537                     ; 129 	switch (system_state){
 539  00d7 c60004        	ld	a,_system_state
 541                     ; 203 		break;
 542  00da 4d            	tnz	a
 543  00db 270f          	jreq	L351
 544  00dd 4a            	dec	a
 545  00de 271b          	jreq	L551
 546  00e0 4a            	dec	a
 547  00e1 2603cc016c    	jreq	L152
 548  00e6               L161:
 549                     ; 201 		default:
 549                     ; 202 		system_state = STATE_ARMING;
 551  00e6 35020004      	mov	_system_state,#2
 552                     ; 203 		break;
 554  00ea 20eb          	jra	L312
 555  00ec               L351:
 556                     ; 135 	  case STATE_CALIBRATION:
 556                     ; 136 		  //Checks to see if any existing calibration is in the eeprom, if not it runs through the calibration routine
 556                     ; 137 		  if(Calibration_Data_VALID()==FALSE){
 558  00ec cd0000        	call	_Calibration_Data_VALID
 560  00ef 4d            	tnz	a
 561  00f0 2603          	jrne	L322
 562                     ; 139 			Calibration_Sequence_Main();
 564  00f2 cd0000        	call	_Calibration_Sequence_Main
 566  00f5               L322:
 567                     ; 142 		  system_state = STATE_ARMING;
 569  00f5 35020004      	mov	_system_state,#2
 570                     ; 144 		break;
 572  00f9 20dc          	jra	L312
 573  00fb               L551:
 574                     ; 146 	  case STATE_RECALIBRATION:
 574                     ; 147 		//Set variable to 0
 574                     ; 148 		Re_Calibration_Samples = 0;
 576  00fb 5f            	clrw	x
 577  00fc 1f03          	ldw	(OFST-1,sp),x
 579                     ; 150 		for (i = 0; i < 100; ++i){
 581  00fe 5f            	clrw	x
 582  00ff 1f01          	ldw	(OFST-3,sp),x
 584  0101               L522:
 585                     ; 152 			if (Recalibration_High_Position_Detect() == TRUE)
 587  0101 cd0000        	call	_Recalibration_High_Position_Detect
 589  0104 a101          	cp	a,#1
 590  0106 2609          	jrne	L332
 591                     ; 154 				++Re_Calibration_Samples;
 593  0108 1e03          	ldw	x,(OFST-1,sp)
 594  010a 1c0001        	addw	x,#1
 595  010d 1f03          	ldw	(OFST-1,sp),x
 598  010f 2003          	jra	L532
 599  0111               L332:
 600                     ; 158 				Re_Calibration_Samples = 0;
 602  0111 5f            	clrw	x
 603  0112 1f03          	ldw	(OFST-1,sp),x
 605  0114               L532:
 606                     ; 161 			if (Re_Calibration_Samples >= 50)
 608  0114 9c            	rvf
 609  0115 1e03          	ldw	x,(OFST-1,sp)
 610  0117 a30032        	cpw	x,#50
 611  011a 2e15          	jrsge	L132
 612                     ; 163 				break;
 614                     ; 166 			Delay_ms(20);
 616  011c ae0014        	ldw	x,#20
 617  011f cd0000        	call	_Delay_ms
 619                     ; 150 		for (i = 0; i < 100; ++i){
 621  0122 1e01          	ldw	x,(OFST-3,sp)
 622  0124 1c0001        	addw	x,#1
 623  0127 1f01          	ldw	(OFST-3,sp),x
 627  0129 9c            	rvf
 628  012a 1e01          	ldw	x,(OFST-3,sp)
 629  012c a30064        	cpw	x,#100
 630  012f 2fd0          	jrslt	L522
 631  0131               L132:
 632                     ; 169 			if (Re_Calibration_Samples >= 50)
 634  0131 9c            	rvf
 635  0132 1e03          	ldw	x,(OFST-1,sp)
 636  0134 a30032        	cpw	x,#50
 637  0137 2f2b          	jrslt	L142
 638                     ; 171 				FLASH_Unlock(FLASH_MemType_Data);
 640  0139 a6f7          	ld	a,#247
 641  013b cd0000        	call	_FLASH_Unlock
 643                     ; 173 				if (EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U) == TRUE)
 645  013e 5f            	clrw	x
 646  013f 89            	pushw	x
 647  0140 ae1000        	ldw	x,#4096
 648  0143 89            	pushw	x
 649  0144 ae0000        	ldw	x,#0
 650  0147 89            	pushw	x
 651  0148 cd0000        	call	_EEPROM_Write_U16
 653  014b 5b06          	addw	sp,#6
 654  014d a101          	cp	a,#1
 655  014f 260e          	jrne	L342
 656                     ; 175 					FLASH_Lock(FLASH_MemType_Data);
 658  0151 a6f7          	ld	a,#247
 659  0153 cd0000        	call	_FLASH_Lock
 661                     ; 177 					magic = 0x0000U;
 663  0156 5f            	clrw	x
 664  0157 cf0000        	ldw	_magic,x
 665                     ; 178 					Calibration_Sequence_Main();
 667  015a cd0000        	call	_Calibration_Sequence_Main
 670  015d 2005          	jra	L142
 671  015f               L342:
 672                     ; 182 					FLASH_Lock(FLASH_MemType_Data);
 674  015f a6f7          	ld	a,#247
 675  0161 cd0000        	call	_FLASH_Lock
 677  0164               L142:
 678                     ; 188 		system_state = STATE_ARMING;
 680  0164 35020004      	mov	_system_state,#2
 681                     ; 189 		break;
 683  0168 acd700d7      	jpf	L312
 684  016c               L152:
 685                     ; 190 	  case STATE_ARMING:
 685                     ; 191 		  //Break into Main loop arfter arming and flashy McFlashing the LED
 685                     ; 192 		  while (systemArming() == FALSE){
 687  016c cd006f        	call	_systemArming
 689  016f 4d            	tnz	a
 690  0170 27fa          	jreq	L152
 691                     ; 196 		  ledFlash(5, 1000);
 693  0172 ae03e8        	ldw	x,#1000
 694  0175 89            	pushw	x
 695  0176 a605          	ld	a,#5
 696  0178 cd002d        	call	_ledFlash
 698  017b 85            	popw	x
 699                     ; 198 		  ADC_Enable_Conversion();
 701  017c cd0000        	call	_ADC_Enable_Conversion
 703                     ; 199 		return; //Drop back into main.c
 706  017f 5b04          	addw	sp,#4
 707  0181 81            	ret
 708  0182               L122:
 709                     ; 203 		break;
 710  0182 acd700d7      	jpf	L312
 772                     	xref	_ADC_Enable_Conversion
 773                     	xref	_pwm_width_us
 774                     	xref	_Recalibration_High_Position_Detect
 775                     	xref	_EEPROM_Write_U16
 776                     	xref	_Calibration_Sequence_Main
 777                     	xref	_Calibration_Data_VALID
 778                     	xref	_magic
 779                     	xref	_pwm_lower_limit
 780                     	xref	_pwm_upper_limit
 781                     	xdef	_System_StateMachine
 782                     	xdef	_systemArming
 783                     	xdef	_ledFlash
 784                     	xdef	_Delay_ms
 785                     	xdef	_System_Time_Get
 786                     	xdef	_system_state
 787                     	xdef	_system_time_ms
 788                     	xref	_GPIO_ResetBits
 789                     	xref	_GPIO_SetBits
 790                     	xref	_FLASH_Lock
 791                     	xref	_FLASH_Unlock
 810                     	xref	c_ltor
 811                     	xref	c_lcmp
 812                     	xref	c_lsub
 813                     	xref	c_uitolx
 814                     	xref	c_rtol
 815                     	end
