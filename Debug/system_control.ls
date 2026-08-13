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
  74                     ; 30     uint32_t start_time = system_time_ms;
  76  0003 ce0002        	ldw	x,_system_time_ms+2
  77  0006 1f07          	ldw	(OFST-1,sp),x
  78  0008 ce0000        	ldw	x,_system_time_ms
  79  000b 1f05          	ldw	(OFST-3,sp),x
  82  000d               L33:
  83                     ; 32     while ((uint32_t)(system_time_ms - start_time) < delay_ms)
  85  000d ae0000        	ldw	x,#_system_time_ms
  86  0010 cd0000        	call	c_ltor
  88  0013 96            	ldw	x,sp
  89  0014 1c0005        	addw	x,#OFST-3
  90  0017 cd0000        	call	c_lsub
  92  001a 96            	ldw	x,sp
  93  001b 1c0001        	addw	x,#OFST-7
  94  001e cd0000        	call	c_rtol
  97  0021 1e09          	ldw	x,(OFST+1,sp)
  98  0023 cd0000        	call	c_uitolx
 100  0026 96            	ldw	x,sp
 101  0027 1c0001        	addw	x,#OFST-7
 102  002a cd0000        	call	c_lcmp
 104  002d 22de          	jrugt	L33
 105                     ; 36 }
 108  002f 5b0a          	addw	sp,#10
 109  0031 81            	ret
 158                     ; 38 void ledFlash(uint8_t flash_count, uint16_t delay_ms)
 158                     ; 39 {
 159                     	switch	.text
 160  0032               _ledFlash:
 162  0032 88            	push	a
 163  0033 88            	push	a
 164       00000001      OFST:	set	1
 167                     ; 42     for (flash_number = 0;
 169  0034 0f01          	clr	(OFST+0,sp)
 172  0036 201c          	jra	L36
 173  0038               L75:
 174                     ; 47         GPIO_ResetBits(GPIOB, GPIO_Pin_7);
 176  0038 4b80          	push	#128
 177  003a ae5005        	ldw	x,#20485
 178  003d cd0000        	call	_GPIO_ResetBits
 180  0040 84            	pop	a
 181                     ; 49         Delay_ms(delay_ms);
 183  0041 1e05          	ldw	x,(OFST+4,sp)
 184  0043 adbb          	call	_Delay_ms
 186                     ; 52         GPIO_SetBits(GPIOB, GPIO_Pin_7);
 188  0045 4b80          	push	#128
 189  0047 ae5005        	ldw	x,#20485
 190  004a cd0000        	call	_GPIO_SetBits
 192  004d 84            	pop	a
 193                     ; 54         Delay_ms(delay_ms);
 195  004e 1e05          	ldw	x,(OFST+4,sp)
 196  0050 adae          	call	_Delay_ms
 198                     ; 43          flash_number < flash_count;
 198                     ; 44          ++flash_number)
 200  0052 0c01          	inc	(OFST+0,sp)
 202  0054               L36:
 203                     ; 42     for (flash_number = 0;
 203                     ; 43          flash_number < flash_count;
 205  0054 7b01          	ld	a,(OFST+0,sp)
 206  0056 1102          	cp	a,(OFST+1,sp)
 207  0058 25de          	jrult	L75
 208                     ; 56 }
 211  005a 85            	popw	x
 212  005b 81            	ret
 215                     	switch	.data
 216  0005               L76_arm_count:
 217  0005 00            	dc.b	0
 218  0006               L17_stick_high:
 219  0006 00            	dc.b	0
 297                     ; 58 bool systemArming(void){
 298                     	switch	.text
 299  005c               _systemArming:
 301  005c 5204          	subw	sp,#4
 302       00000004      OFST:	set	4
 305                     ; 66     arm_lower_limit = pwm_lower_limit + ARM_PWM_TOLERANCE;
 307  005e ce0000        	ldw	x,_pwm_lower_limit
 308  0061 1c0005        	addw	x,#5
 309  0064 1f01          	ldw	(OFST-3,sp),x
 311                     ; 67     arm_upper_limit = pwm_upper_limit - ARM_PWM_TOLERANCE;
 313  0066 ce0000        	ldw	x,_pwm_upper_limit
 314  0069 1d0005        	subw	x,#5
 315  006c 1f03          	ldw	(OFST-1,sp),x
 317                     ; 70     if ((pwm_width_us >= arm_upper_limit) && (stick_high == FALSE))
 319  006e ce0000        	ldw	x,_pwm_width_us
 320  0071 1303          	cpw	x,(OFST-1,sp)
 321  0073 250a          	jrult	L721
 323  0075 725d0006      	tnz	L17_stick_high
 324  0079 2604          	jrne	L721
 325                     ; 72         stick_high = TRUE;
 327  007b 35010006      	mov	L17_stick_high,#1
 328  007f               L721:
 329                     ; 76     if ((pwm_width_us <= arm_lower_limit) && (stick_high == TRUE))
 331  007f ce0000        	ldw	x,_pwm_width_us
 332  0082 1301          	cpw	x,(OFST-3,sp)
 333  0084 220f          	jrugt	L131
 335  0086 c60006        	ld	a,L17_stick_high
 336  0089 a101          	cp	a,#1
 337  008b 2608          	jrne	L131
 338                     ; 78         stick_high = FALSE;
 340  008d 725f0006      	clr	L17_stick_high
 341                     ; 79         arm_count++;
 343  0091 725c0005      	inc	L76_arm_count
 344  0095               L131:
 345                     ; 83     if (arm_count >= ARM_COUNT_REQUIRED)
 347  0095 c60005        	ld	a,L76_arm_count
 348  0098 a105          	cp	a,#5
 349  009a 2508          	jrult	L331
 350                     ; 85         arm_count = 0;
 352  009c 725f0005      	clr	L76_arm_count
 353                     ; 86         return TRUE;
 355  00a0 a601          	ld	a,#1
 357  00a2 2001          	jra	L21
 358  00a4               L331:
 359                     ; 89     return FALSE;
 361  00a4 4f            	clr	a
 363  00a5               L21:
 365  00a5 5b04          	addw	sp,#4
 366  00a7 81            	ret
 369                     	switch	.data
 370  0007               L531_startup_state_selected:
 371  0007 00            	dc.b	0
 441                     ; 91 void System_StateMachine(void){
 442                     	switch	.text
 443  00a8               _System_StateMachine:
 445  00a8 5206          	subw	sp,#6
 446       00000006      OFST:	set	6
 449                     ; 96     if (startup_state_selected == FALSE)
 451  00aa 725d0007      	tnz	L531_startup_state_selected
 452  00ae 2614          	jrne	L102
 453                     ; 98         if (Calibration_Data_VALID() == FALSE)
 455  00b0 cd0000        	call	_Calibration_Data_VALID
 457  00b3 4d            	tnz	a
 458  00b4 2606          	jrne	L571
 459                     ; 100             system_state = STATE_CALIBRATION;
 461  00b6 725f0004      	clr	_system_state
 463  00ba 2004          	jra	L771
 464  00bc               L571:
 465                     ; 104             system_state = STATE_RECALIBRATION;
 467  00bc 35010004      	mov	_system_state,#1
 468  00c0               L771:
 469                     ; 107         startup_state_selected = TRUE;
 471  00c0 35010007      	mov	L531_startup_state_selected,#1
 472  00c4               L102:
 473                     ; 112 	switch (system_state){
 475  00c4 c60004        	ld	a,_system_state
 477                     ; 198 		break;
 478  00c7 4d            	tnz	a
 479  00c8 270f          	jreq	L731
 480  00ca 4a            	dec	a
 481  00cb 271b          	jreq	L141
 482  00cd 4a            	dec	a
 483  00ce 2603          	jrne	L61
 484  00d0 cc0175        	jp	L342
 485  00d3               L61:
 486  00d3               L541:
 487                     ; 196 		default:
 487                     ; 197 		system_state = STATE_ARMING;
 489  00d3 35020004      	mov	_system_state,#2
 490                     ; 198 		break;
 492  00d7 20eb          	jra	L102
 493  00d9               L731:
 494                     ; 118 	  case STATE_CALIBRATION:
 494                     ; 119 		  //Checks to see if any existing calibration is in the eeprom, if not it runs through the calibration routine
 494                     ; 120 		  if(Calibration_Data_VALID()==FALSE){
 496  00d9 cd0000        	call	_Calibration_Data_VALID
 498  00dc 4d            	tnz	a
 499  00dd 2603          	jrne	L112
 500                     ; 122 			Calibration_Sequence_Main();
 502  00df cd0000        	call	_Calibration_Sequence_Main
 504  00e2               L112:
 505                     ; 125 		  system_state = STATE_ARMING;
 507  00e2 35020004      	mov	_system_state,#2
 508                     ; 127 		break;
 510  00e6 20dc          	jra	L102
 511  00e8               L141:
 512                     ; 129 	  case STATE_RECALIBRATION:
 512                     ; 130 		//Set variable to 0
 512                     ; 131 		Re_Calibration_Samples = 0;
 514  00e8 5f            	clrw	x
 515  00e9 1f05          	ldw	(OFST-1,sp),x
 517                     ; 133 		for (i = 0; i < 100; ++i){
 519  00eb 5f            	clrw	x
 520  00ec 1f01          	ldw	(OFST-5,sp),x
 522  00ee               L312:
 523                     ; 136 			if (pwm_width_us >= stick_high_position)
 525  00ee ce0000        	ldw	x,_pwm_width_us
 526  00f1 c30000        	cpw	x,_stick_high_position
 527  00f4 250b          	jrult	L122
 528                     ; 138 				pwm_diff_recal = pwm_width_us - stick_high_position;
 530  00f6 ce0000        	ldw	x,_pwm_width_us
 531  00f9 72b00000      	subw	x,_stick_high_position
 532  00fd 1f03          	ldw	(OFST-3,sp),x
 535  00ff 2009          	jra	L322
 536  0101               L122:
 537                     ; 142 				pwm_diff_recal = stick_high_position - pwm_width_us;
 539  0101 ce0000        	ldw	x,_stick_high_position
 540  0104 72b00000      	subw	x,_pwm_width_us
 541  0108 1f03          	ldw	(OFST-3,sp),x
 543  010a               L322:
 544                     ; 146 			if (pwm_diff_recal <= 20U)
 546  010a 1e03          	ldw	x,(OFST-3,sp)
 547  010c a30015        	cpw	x,#21
 548  010f 2409          	jruge	L522
 549                     ; 148 				++Re_Calibration_Samples;
 551  0111 1e05          	ldw	x,(OFST-1,sp)
 552  0113 1c0001        	addw	x,#1
 553  0116 1f05          	ldw	(OFST-1,sp),x
 556  0118 2003          	jra	L722
 557  011a               L522:
 558                     ; 153 				Re_Calibration_Samples = 0;
 560  011a 5f            	clrw	x
 561  011b 1f05          	ldw	(OFST-1,sp),x
 563  011d               L722:
 564                     ; 156 			if (Re_Calibration_Samples >= 50)
 566  011d 9c            	rvf
 567  011e 1e05          	ldw	x,(OFST-1,sp)
 568  0120 a30032        	cpw	x,#50
 569  0123 2e15          	jrsge	L712
 570                     ; 158 				break;
 572                     ; 162 			Delay_ms(20);
 574  0125 ae0014        	ldw	x,#20
 575  0128 cd0000        	call	_Delay_ms
 577                     ; 133 		for (i = 0; i < 100; ++i){
 579  012b 1e01          	ldw	x,(OFST-5,sp)
 580  012d 1c0001        	addw	x,#1
 581  0130 1f01          	ldw	(OFST-5,sp),x
 585  0132 9c            	rvf
 586  0133 1e01          	ldw	x,(OFST-5,sp)
 587  0135 a30064        	cpw	x,#100
 588  0138 2fb4          	jrslt	L312
 589  013a               L712:
 590                     ; 164 		if (Re_Calibration_Samples >= 50)
 592  013a 9c            	rvf
 593  013b 1e05          	ldw	x,(OFST-1,sp)
 594  013d a30032        	cpw	x,#50
 595  0140 2f2b          	jrslt	L332
 596                     ; 166 			FLASH_Unlock(FLASH_MemType_Data);
 598  0142 a6f7          	ld	a,#247
 599  0144 cd0000        	call	_FLASH_Unlock
 601                     ; 168 			if (EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U) == TRUE)
 603  0147 5f            	clrw	x
 604  0148 89            	pushw	x
 605  0149 ae1000        	ldw	x,#4096
 606  014c 89            	pushw	x
 607  014d ae0000        	ldw	x,#0
 608  0150 89            	pushw	x
 609  0151 cd0000        	call	_EEPROM_Write_U16
 611  0154 5b06          	addw	sp,#6
 612  0156 a101          	cp	a,#1
 613  0158 260e          	jrne	L532
 614                     ; 170 				FLASH_Lock(FLASH_MemType_Data);
 616  015a a6f7          	ld	a,#247
 617  015c cd0000        	call	_FLASH_Lock
 619                     ; 172 				magic = 0x0000U;
 621  015f 5f            	clrw	x
 622  0160 cf0000        	ldw	_magic,x
 623                     ; 173 				Calibration_Sequence_Main();
 625  0163 cd0000        	call	_Calibration_Sequence_Main
 628  0166 2005          	jra	L332
 629  0168               L532:
 630                     ; 177 				FLASH_Lock(FLASH_MemType_Data);
 632  0168 a6f7          	ld	a,#247
 633  016a cd0000        	call	_FLASH_Lock
 635  016d               L332:
 636                     ; 183 		system_state = STATE_ARMING;
 638  016d 35020004      	mov	_system_state,#2
 639                     ; 184 		break;
 641  0171 acc400c4      	jpf	L102
 642  0175               L342:
 643                     ; 185 	  case STATE_ARMING:
 643                     ; 186 		  //Break into Main loop arfter arming and flashy McFlashing the LED
 643                     ; 187 		  while (systemArming() == FALSE){
 645  0175 cd005c        	call	_systemArming
 647  0178 4d            	tnz	a
 648  0179 27fa          	jreq	L342
 649                     ; 191 		  ledFlash(5, 1000);
 651  017b ae03e8        	ldw	x,#1000
 652  017e 89            	pushw	x
 653  017f a605          	ld	a,#5
 654  0181 cd0032        	call	_ledFlash
 656  0184 85            	popw	x
 657                     ; 193 		  ADC_Enable_Conversion();
 659  0185 cd0000        	call	_ADC_Enable_Conversion
 661                     ; 194 		return; //Drop back into main.c
 664  0188 5b06          	addw	sp,#6
 665  018a 81            	ret
 666  018b               L702:
 667                     ; 198 		break;
 668  018b acc400c4      	jpf	L102
 730                     	xref	_ADC_Enable_Conversion
 731                     	xref	_pwm_width_us
 732                     	xref	_EEPROM_Write_U16
 733                     	xref	_Calibration_Sequence_Main
 734                     	xref	_Calibration_Data_VALID
 735                     	xref	_magic
 736                     	xref	_pwm_lower_limit
 737                     	xref	_pwm_upper_limit
 738                     	xref	_stick_high_position
 739                     	xdef	_System_StateMachine
 740                     	xdef	_systemArming
 741                     	xdef	_ledFlash
 742                     	xdef	_Delay_ms
 743                     	xdef	_system_state
 744                     	xdef	_system_time_ms
 745                     	xref	_GPIO_ResetBits
 746                     	xref	_GPIO_SetBits
 747                     	xref	_FLASH_Lock
 748                     	xref	_FLASH_Unlock
 767                     	xref	c_lcmp
 768                     	xref	c_rtol
 769                     	xref	c_lsub
 770                     	xref	c_ltor
 771                     	xref	c_uitolx
 772                     	end
