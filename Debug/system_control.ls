   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _system_time_ms:
  16  0000 00000000      	dc.l	0
  17  0004               _system_state:
  18  0004 00            	dc.b	0
  64                     ; 26 void Delay_ms(uint16_t delay_ms){
  66                     	switch	.text
  67  0000               _Delay_ms:
  69  0000 89            	pushw	x
  70  0001 5208          	subw	sp,#8
  71       00000008      OFST:	set	8
  74                     ; 28     uint32_t start_time = system_time_ms;
  76  0003 ce0002        	ldw	x,_system_time_ms+2
  77  0006 1f07          	ldw	(OFST-1,sp),x
  78  0008 ce0000        	ldw	x,_system_time_ms
  79  000b 1f05          	ldw	(OFST-3,sp),x
  82  000d               L33:
  83                     ; 30     while ((uint32_t)(system_time_ms - start_time) < delay_ms)
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
 105                     ; 34 }
 108  002f 5b0a          	addw	sp,#10
 109  0031 81            	ret
 158                     ; 36 void ledFlash(uint8_t flash_count, uint16_t delay_ms)
 158                     ; 37 {
 159                     	switch	.text
 160  0032               _ledFlash:
 162  0032 88            	push	a
 163  0033 88            	push	a
 164       00000001      OFST:	set	1
 167                     ; 40     for (flash_number = 0;
 169  0034 0f01          	clr	(OFST+0,sp)
 172  0036 201c          	jra	L36
 173  0038               L75:
 174                     ; 45         GPIO_ResetBits(GPIOB, GPIO_Pin_7);
 176  0038 4b80          	push	#128
 177  003a ae5005        	ldw	x,#20485
 178  003d cd0000        	call	_GPIO_ResetBits
 180  0040 84            	pop	a
 181                     ; 47         Delay_ms(delay_ms);
 183  0041 1e05          	ldw	x,(OFST+4,sp)
 184  0043 adbb          	call	_Delay_ms
 186                     ; 50         GPIO_SetBits(GPIOB, GPIO_Pin_7);
 188  0045 4b80          	push	#128
 189  0047 ae5005        	ldw	x,#20485
 190  004a cd0000        	call	_GPIO_SetBits
 192  004d 84            	pop	a
 193                     ; 52         Delay_ms(delay_ms);
 195  004e 1e05          	ldw	x,(OFST+4,sp)
 196  0050 adae          	call	_Delay_ms
 198                     ; 41          flash_number < flash_count;
 198                     ; 42          ++flash_number)
 200  0052 0c01          	inc	(OFST+0,sp)
 202  0054               L36:
 203                     ; 40     for (flash_number = 0;
 203                     ; 41          flash_number < flash_count;
 205  0054 7b01          	ld	a,(OFST+0,sp)
 206  0056 1102          	cp	a,(OFST+1,sp)
 207  0058 25de          	jrult	L75
 208                     ; 54 }
 211  005a 85            	popw	x
 212  005b 81            	ret
 215                     	switch	.data
 216  0005               L76_arm_count:
 217  0005 00            	dc.b	0
 218  0006               L17_stick_high:
 219  0006 00            	dc.b	0
 297                     ; 56 bool systemArming(void){
 298                     	switch	.text
 299  005c               _systemArming:
 301  005c 5204          	subw	sp,#4
 302       00000004      OFST:	set	4
 305                     ; 64     arm_lower_limit = pwm_lower_limit + ARM_PWM_TOLERANCE;
 307  005e ce0000        	ldw	x,_pwm_lower_limit
 308  0061 1c0005        	addw	x,#5
 309  0064 1f01          	ldw	(OFST-3,sp),x
 311                     ; 65     arm_upper_limit = pwm_upper_limit - ARM_PWM_TOLERANCE;
 313  0066 ce0000        	ldw	x,_pwm_upper_limit
 314  0069 1d0005        	subw	x,#5
 315  006c 1f03          	ldw	(OFST-1,sp),x
 317                     ; 68     if ((pwm_width_us >= arm_upper_limit) && (stick_high == FALSE))
 319  006e ce0000        	ldw	x,_pwm_width_us
 320  0071 1303          	cpw	x,(OFST-1,sp)
 321  0073 250a          	jrult	L721
 323  0075 725d0006      	tnz	L17_stick_high
 324  0079 2604          	jrne	L721
 325                     ; 70         stick_high = TRUE;
 327  007b 35010006      	mov	L17_stick_high,#1
 328  007f               L721:
 329                     ; 74     if ((pwm_width_us <= arm_lower_limit) && (stick_high == TRUE))
 331  007f ce0000        	ldw	x,_pwm_width_us
 332  0082 1301          	cpw	x,(OFST-3,sp)
 333  0084 220f          	jrugt	L131
 335  0086 c60006        	ld	a,L17_stick_high
 336  0089 a101          	cp	a,#1
 337  008b 2608          	jrne	L131
 338                     ; 76         stick_high = FALSE;
 340  008d 725f0006      	clr	L17_stick_high
 341                     ; 77         arm_count++;
 343  0091 725c0005      	inc	L76_arm_count
 344  0095               L131:
 345                     ; 81     if (arm_count >= ARM_COUNT_REQUIRED)
 347  0095 c60005        	ld	a,L76_arm_count
 348  0098 a105          	cp	a,#5
 349  009a 2508          	jrult	L331
 350                     ; 83         arm_count = 0;
 352  009c 725f0005      	clr	L76_arm_count
 353                     ; 84         return TRUE;
 355  00a0 a601          	ld	a,#1
 357  00a2 2001          	jra	L21
 358  00a4               L331:
 359                     ; 87     return FALSE;
 361  00a4 4f            	clr	a
 363  00a5               L21:
 365  00a5 5b04          	addw	sp,#4
 366  00a7 81            	ret
 369                     	switch	.data
 370  0007               L531_startup_state_selected:
 371  0007 00            	dc.b	0
 440                     ; 89 void System_StateMachine(void){
 441                     	switch	.text
 442  00a8               _System_StateMachine:
 444  00a8 5206          	subw	sp,#6
 445       00000006      OFST:	set	6
 448                     ; 94     if (startup_state_selected == FALSE)
 450  00aa 725d0007      	tnz	L531_startup_state_selected
 451  00ae 2614          	jrne	L102
 452                     ; 96         if (Calibration_Data_VALID() == FALSE)
 454  00b0 cd0000        	call	_Calibration_Data_VALID
 456  00b3 4d            	tnz	a
 457  00b4 2606          	jrne	L571
 458                     ; 98             system_state = STATE_CALIBRATION;
 460  00b6 725f0004      	clr	_system_state
 462  00ba 2004          	jra	L771
 463  00bc               L571:
 464                     ; 102             system_state = STATE_RECALIBRATION;
 466  00bc 35010004      	mov	_system_state,#1
 467  00c0               L771:
 468                     ; 105         startup_state_selected = TRUE;
 470  00c0 35010007      	mov	L531_startup_state_selected,#1
 471  00c4               L102:
 472                     ; 110 	switch (system_state){
 474  00c4 c60004        	ld	a,_system_state
 476                     ; 194 		break;
 477  00c7 4d            	tnz	a
 478  00c8 270f          	jreq	L731
 479  00ca 4a            	dec	a
 480  00cb 271b          	jreq	L141
 481  00cd 4a            	dec	a
 482  00ce 2603          	jrne	L61
 483  00d0 cc0175        	jp	L342
 484  00d3               L61:
 485  00d3               L541:
 486                     ; 192 		default:
 486                     ; 193 		system_state = STATE_ARMING;
 488  00d3 35020004      	mov	_system_state,#2
 489                     ; 194 		break;
 491  00d7 20eb          	jra	L102
 492  00d9               L731:
 493                     ; 116 	  case STATE_CALIBRATION:
 493                     ; 117 		  //Checks to see if any existing calibration is in the eeprom, if not it runs through the calibration routine
 493                     ; 118 		  if(Calibration_Data_VALID()==FALSE){
 495  00d9 cd0000        	call	_Calibration_Data_VALID
 497  00dc 4d            	tnz	a
 498  00dd 2603          	jrne	L112
 499                     ; 120 			Calibration_Sequence_Main();
 501  00df cd0000        	call	_Calibration_Sequence_Main
 503  00e2               L112:
 504                     ; 123 		  system_state = STATE_ARMING;
 506  00e2 35020004      	mov	_system_state,#2
 507                     ; 125 		break;
 509  00e6 20dc          	jra	L102
 510  00e8               L141:
 511                     ; 127 	  case STATE_RECALIBRATION:
 511                     ; 128 		//Set variable to 0
 511                     ; 129 		Re_Calibration_Samples = 0;
 513  00e8 5f            	clrw	x
 514  00e9 1f05          	ldw	(OFST-1,sp),x
 516                     ; 131 		for (i = 0; i < 100; ++i){
 518  00eb 5f            	clrw	x
 519  00ec 1f01          	ldw	(OFST-5,sp),x
 521  00ee               L312:
 522                     ; 134 			if (pwm_width_us >= stick_high_position)
 524  00ee ce0000        	ldw	x,_pwm_width_us
 525  00f1 c30000        	cpw	x,_stick_high_position
 526  00f4 250b          	jrult	L122
 527                     ; 136 				pwm_diff_recal = pwm_width_us - stick_high_position;
 529  00f6 ce0000        	ldw	x,_pwm_width_us
 530  00f9 72b00000      	subw	x,_stick_high_position
 531  00fd 1f03          	ldw	(OFST-3,sp),x
 534  00ff 2009          	jra	L322
 535  0101               L122:
 536                     ; 140 				pwm_diff_recal = stick_high_position - pwm_width_us;
 538  0101 ce0000        	ldw	x,_stick_high_position
 539  0104 72b00000      	subw	x,_pwm_width_us
 540  0108 1f03          	ldw	(OFST-3,sp),x
 542  010a               L322:
 543                     ; 144 			if (pwm_diff_recal <= 20U)
 545  010a 1e03          	ldw	x,(OFST-3,sp)
 546  010c a30015        	cpw	x,#21
 547  010f 2409          	jruge	L522
 548                     ; 146 				++Re_Calibration_Samples;
 550  0111 1e05          	ldw	x,(OFST-1,sp)
 551  0113 1c0001        	addw	x,#1
 552  0116 1f05          	ldw	(OFST-1,sp),x
 555  0118 2003          	jra	L722
 556  011a               L522:
 557                     ; 151 				Re_Calibration_Samples = 0;
 559  011a 5f            	clrw	x
 560  011b 1f05          	ldw	(OFST-1,sp),x
 562  011d               L722:
 563                     ; 154 			if (Re_Calibration_Samples >= 50)
 565  011d 9c            	rvf
 566  011e 1e05          	ldw	x,(OFST-1,sp)
 567  0120 a30032        	cpw	x,#50
 568  0123 2e15          	jrsge	L712
 569                     ; 156 				break;
 571                     ; 160 			Delay_ms(20);
 573  0125 ae0014        	ldw	x,#20
 574  0128 cd0000        	call	_Delay_ms
 576                     ; 131 		for (i = 0; i < 100; ++i){
 578  012b 1e01          	ldw	x,(OFST-5,sp)
 579  012d 1c0001        	addw	x,#1
 580  0130 1f01          	ldw	(OFST-5,sp),x
 584  0132 9c            	rvf
 585  0133 1e01          	ldw	x,(OFST-5,sp)
 586  0135 a30064        	cpw	x,#100
 587  0138 2fb4          	jrslt	L312
 588  013a               L712:
 589                     ; 162 		if (Re_Calibration_Samples >= 50)
 591  013a 9c            	rvf
 592  013b 1e05          	ldw	x,(OFST-1,sp)
 593  013d a30032        	cpw	x,#50
 594  0140 2f2b          	jrslt	L332
 595                     ; 164 			FLASH_Unlock(FLASH_MemType_Data);
 597  0142 a6f7          	ld	a,#247
 598  0144 cd0000        	call	_FLASH_Unlock
 600                     ; 166 			if (EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U) == TRUE)
 602  0147 5f            	clrw	x
 603  0148 89            	pushw	x
 604  0149 ae1000        	ldw	x,#4096
 605  014c 89            	pushw	x
 606  014d ae0000        	ldw	x,#0
 607  0150 89            	pushw	x
 608  0151 cd0000        	call	_EEPROM_Write_U16
 610  0154 5b06          	addw	sp,#6
 611  0156 a101          	cp	a,#1
 612  0158 260e          	jrne	L532
 613                     ; 168 				FLASH_Lock(FLASH_MemType_Data);
 615  015a a6f7          	ld	a,#247
 616  015c cd0000        	call	_FLASH_Lock
 618                     ; 170 				magic = 0x0000U;
 620  015f 5f            	clrw	x
 621  0160 cf0000        	ldw	_magic,x
 622                     ; 171 				Calibration_Sequence_Main();
 624  0163 cd0000        	call	_Calibration_Sequence_Main
 627  0166 2005          	jra	L332
 628  0168               L532:
 629                     ; 175 				FLASH_Lock(FLASH_MemType_Data);
 631  0168 a6f7          	ld	a,#247
 632  016a cd0000        	call	_FLASH_Lock
 634  016d               L332:
 635                     ; 181 		system_state = STATE_ARMING;
 637  016d 35020004      	mov	_system_state,#2
 638                     ; 182 		break;
 640  0171 acc400c4      	jpf	L102
 641  0175               L342:
 642                     ; 183 	  case STATE_ARMING:
 642                     ; 184 		  //Break into Main loop arfter arming and flashy McFlashing the LED
 642                     ; 185 		  while (systemArming() == FALSE){
 644  0175 cd005c        	call	_systemArming
 646  0178 4d            	tnz	a
 647  0179 27fa          	jreq	L342
 648                     ; 189 		  ledFlash(5, 1000);
 650  017b ae03e8        	ldw	x,#1000
 651  017e 89            	pushw	x
 652  017f a605          	ld	a,#5
 653  0181 cd0032        	call	_ledFlash
 655  0184 85            	popw	x
 656                     ; 190 		return; //Drop back into main.c
 659  0185 5b06          	addw	sp,#6
 660  0187 81            	ret
 661  0188               L702:
 662                     ; 194 		break;
 663  0188 acc400c4      	jpf	L102
 725                     	xref	_pwm_width_us
 726                     	xref	_EEPROM_Write_U16
 727                     	xref	_Calibration_Sequence_Main
 728                     	xref	_Calibration_Data_VALID
 729                     	xref	_magic
 730                     	xref	_pwm_lower_limit
 731                     	xref	_pwm_upper_limit
 732                     	xref	_stick_high_position
 733                     	xdef	_System_StateMachine
 734                     	xdef	_systemArming
 735                     	xdef	_ledFlash
 736                     	xdef	_Delay_ms
 737                     	xdef	_system_state
 738                     	xdef	_system_time_ms
 739                     	xref	_GPIO_ResetBits
 740                     	xref	_GPIO_SetBits
 741                     	xref	_FLASH_Lock
 742                     	xref	_FLASH_Unlock
 761                     	xref	c_lcmp
 762                     	xref	c_rtol
 763                     	xref	c_lsub
 764                     	xref	c_ltor
 765                     	xref	c_uitolx
 766                     	end
