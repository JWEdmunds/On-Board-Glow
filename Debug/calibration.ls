   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _magic:
  16  0000 0000          	dc.w	0
  17  0002               _stick_high_position:
  18  0002 0000          	dc.w	0
  19  0004               _stick_low_position:
  20  0004 0000          	dc.w	0
  21  0006               _pwm_upper_limit:
  22  0006 0000          	dc.w	0
  23  0008               _pwm_lower_limit:
  24  0008 0000          	dc.w	0
  25  000a               _glow_on:
  26  000a 0000          	dc.w	0
  27  000c               _glow_off:
  28  000c 0000          	dc.w	0
  29  000e               _throttle_inverted:
  30  000e 00            	dc.b	0
  31  000f               L71_sample_sum:
  32  000f 00000000      	dc.l	0
  33  0013               L12_valid_sum:
  34  0013 00000000      	dc.l	0
  35  0017               L32_sample_average:
  36  0017 0000          	dc.w	0
  37  0019               L52_calibrated_position:
  38  0019 0000          	dc.w	0
  39  001b               L72_valid_sample_count:
  40  001b 00            	dc.b	0
  71                     ; 72 void EEPROM_Setup(void){
  73                     	switch	.text
  74  0000               _EEPROM_Setup:
  78                     ; 74   FLASH_DeInit();
  80  0000 cd0000        	call	_FLASH_DeInit
  82                     ; 76   FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
  84  0003 4f            	clr	a
  85  0004 cd0000        	call	_FLASH_SetProgrammingTime
  87                     ; 77 }
  90  0007 81            	ret
 193                     ; 80 static bool EEPROM_Write_U8(uint32_t address, uint8_t value){
 194                     	switch	.text
 195  0008               L74_EEPROM_Write_U8:
 197  0008 88            	push	a
 198       00000001      OFST:	set	1
 201                     ; 85   FLASH_ProgramByte(address, value);
 203  0009 7b08          	ld	a,(OFST+7,sp)
 204  000b 88            	push	a
 205  000c 1e07          	ldw	x,(OFST+6,sp)
 206  000e 89            	pushw	x
 207  000f 1e07          	ldw	x,(OFST+6,sp)
 208  0011 89            	pushw	x
 209  0012 cd0000        	call	_FLASH_ProgramByte
 211  0015 5b05          	addw	sp,#5
 212                     ; 87   status = FLASH_WaitForLastOperation(FLASH_MemType_Data);
 214  0017 a6f7          	ld	a,#247
 215  0019 cd0000        	call	_FLASH_WaitForLastOperation
 217  001c 6b01          	ld	(OFST+0,sp),a
 219                     ; 91 	if ((uint8_t)status != (uint8_t)FLASH_FLAG_HVOFF)
 221  001e 7b01          	ld	a,(OFST+0,sp)
 222  0020 a140          	cp	a,#64
 223  0022 2704          	jreq	L511
 224                     ; 93 		return FALSE;
 226  0024 4f            	clr	a
 229  0025 5b01          	addw	sp,#1
 230  0027 81            	ret
 231  0028               L511:
 232                     ; 96     if (FLASH_ReadByte(address) != value)
 234  0028 1e06          	ldw	x,(OFST+5,sp)
 235  002a 89            	pushw	x
 236  002b 1e06          	ldw	x,(OFST+5,sp)
 237  002d 89            	pushw	x
 238  002e cd0000        	call	_FLASH_ReadByte
 240  0031 5b04          	addw	sp,#4
 241  0033 1108          	cp	a,(OFST+7,sp)
 242  0035 2704          	jreq	L711
 243                     ; 98         return FALSE;
 245  0037 4f            	clr	a
 248  0038 5b01          	addw	sp,#1
 249  003a 81            	ret
 250  003b               L711:
 251                     ; 101     return TRUE;
 253  003b a601          	ld	a,#1
 256  003d 5b01          	addw	sp,#1
 257  003f 81            	ret
 312                     ; 104 bool EEPROM_Write_U16(uint32_t address, uint16_t value){
 313                     	switch	.text
 314  0040               _EEPROM_Write_U16:
 316  0040 89            	pushw	x
 317       00000002      OFST:	set	2
 320                     ; 110   low_byte = (uint8_t)(value & 0x00FFU);
 322  0041 7b0a          	ld	a,(OFST+8,sp)
 323  0043 a4ff          	and	a,#255
 324  0045 6b01          	ld	(OFST-1,sp),a
 326                     ; 111   high_byte = (uint8_t)((value >> 8) & 0x00FFU);
 328  0047 7b09          	ld	a,(OFST+7,sp)
 329  0049 6b02          	ld	(OFST+0,sp),a
 331                     ; 113   if (!EEPROM_Write_U8(address, low_byte)){
 333  004b 7b01          	ld	a,(OFST-1,sp)
 334  004d 88            	push	a
 335  004e 1e08          	ldw	x,(OFST+6,sp)
 336  0050 89            	pushw	x
 337  0051 1e08          	ldw	x,(OFST+6,sp)
 338  0053 89            	pushw	x
 339  0054 adb2          	call	L74_EEPROM_Write_U8
 341  0056 5b05          	addw	sp,#5
 342  0058 4d            	tnz	a
 343  0059 2603          	jrne	L341
 344                     ; 114 	return FALSE;
 346  005b 4f            	clr	a
 348  005c 201d          	jra	L21
 349  005e               L341:
 350                     ; 116   if (!EEPROM_Write_U8(address + 1U, high_byte)){
 352  005e 7b02          	ld	a,(OFST+0,sp)
 353  0060 88            	push	a
 354  0061 96            	ldw	x,sp
 355  0062 1c0006        	addw	x,#OFST+4
 356  0065 cd0000        	call	c_ltor
 358  0068 a601          	ld	a,#1
 359  006a cd0000        	call	c_ladc
 361  006d be02          	ldw	x,c_lreg+2
 362  006f 89            	pushw	x
 363  0070 be00          	ldw	x,c_lreg
 364  0072 89            	pushw	x
 365  0073 ad93          	call	L74_EEPROM_Write_U8
 367  0075 5b05          	addw	sp,#5
 368  0077 4d            	tnz	a
 369  0078 2603          	jrne	L541
 370                     ; 117 	return FALSE;
 372  007a 4f            	clr	a
 374  007b               L21:
 376  007b 85            	popw	x
 377  007c 81            	ret
 378  007d               L541:
 379                     ; 119   return TRUE;
 381  007d a601          	ld	a,#1
 383  007f 20fa          	jra	L21
 432                     ; 123 bool Calibration_Write_EEPROM(void){
 433                     	switch	.text
 434  0081               _Calibration_Write_EEPROM:
 436  0081 88            	push	a
 437       00000001      OFST:	set	1
 440                     ; 125     bool result = TRUE;
 442  0082 a601          	ld	a,#1
 443  0084 6b01          	ld	(OFST+0,sp),a
 445                     ; 128 	  FLASH_Unlock(FLASH_MemType_Data);
 447  0086 a6f7          	ld	a,#247
 448  0088 cd0000        	call	_FLASH_Unlock
 450                     ; 132     if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U))
 452  008b 5f            	clrw	x
 453  008c 89            	pushw	x
 454  008d ae1000        	ldw	x,#4096
 455  0090 89            	pushw	x
 456  0091 ae0000        	ldw	x,#0
 457  0094 89            	pushw	x
 458  0095 ada9          	call	_EEPROM_Write_U16
 460  0097 5b06          	addw	sp,#6
 461  0099 4d            	tnz	a
 462  009a 2606          	jrne	L561
 463                     ; 134         result = FALSE;
 465  009c 0f01          	clr	(OFST+0,sp)
 468  009e ac470147      	jpf	L761
 469  00a2               L561:
 470                     ; 137     else if (!EEPROM_Write_U16(EEPROM_STICK_HIGH_ADDRESS, stick_high_position))
 472  00a2 ce0002        	ldw	x,_stick_high_position
 473  00a5 89            	pushw	x
 474  00a6 ae1002        	ldw	x,#4098
 475  00a9 89            	pushw	x
 476  00aa ae0000        	ldw	x,#0
 477  00ad 89            	pushw	x
 478  00ae ad90          	call	_EEPROM_Write_U16
 480  00b0 5b06          	addw	sp,#6
 481  00b2 4d            	tnz	a
 482  00b3 2605          	jrne	L171
 483                     ; 139 		  result = FALSE;
 485  00b5 0f01          	clr	(OFST+0,sp)
 488  00b7 cc0147        	jra	L761
 489  00ba               L171:
 490                     ; 141     else if (!EEPROM_Write_U16(EEPROM_STICK_LOW_ADDRESS, stick_low_position))
 492  00ba ce0004        	ldw	x,_stick_low_position
 493  00bd 89            	pushw	x
 494  00be ae1004        	ldw	x,#4100
 495  00c1 89            	pushw	x
 496  00c2 ae0000        	ldw	x,#0
 497  00c5 89            	pushw	x
 498  00c6 cd0040        	call	_EEPROM_Write_U16
 500  00c9 5b06          	addw	sp,#6
 501  00cb 4d            	tnz	a
 502  00cc 2604          	jrne	L571
 503                     ; 143 		  result = FALSE;
 505  00ce 0f01          	clr	(OFST+0,sp)
 508  00d0 2075          	jra	L761
 509  00d2               L571:
 510                     ; 145     else if (!EEPROM_Write_U16(EEPROM_PWM_UPPER_ADDRESS, pwm_upper_limit))
 512  00d2 ce0006        	ldw	x,_pwm_upper_limit
 513  00d5 89            	pushw	x
 514  00d6 ae1006        	ldw	x,#4102
 515  00d9 89            	pushw	x
 516  00da ae0000        	ldw	x,#0
 517  00dd 89            	pushw	x
 518  00de cd0040        	call	_EEPROM_Write_U16
 520  00e1 5b06          	addw	sp,#6
 521  00e3 4d            	tnz	a
 522  00e4 2604          	jrne	L102
 523                     ; 147 		  result = FALSE;
 525  00e6 0f01          	clr	(OFST+0,sp)
 528  00e8 205d          	jra	L761
 529  00ea               L102:
 530                     ; 149     else if (!EEPROM_Write_U16(EEPROM_PWM_LOWER_ADDRESS, pwm_lower_limit))
 532  00ea ce0008        	ldw	x,_pwm_lower_limit
 533  00ed 89            	pushw	x
 534  00ee ae1008        	ldw	x,#4104
 535  00f1 89            	pushw	x
 536  00f2 ae0000        	ldw	x,#0
 537  00f5 89            	pushw	x
 538  00f6 cd0040        	call	_EEPROM_Write_U16
 540  00f9 5b06          	addw	sp,#6
 541  00fb 4d            	tnz	a
 542  00fc 2604          	jrne	L502
 543                     ; 151 		  result = FALSE;
 545  00fe 0f01          	clr	(OFST+0,sp)
 548  0100 2045          	jra	L761
 549  0102               L502:
 550                     ; 153     else if (!EEPROM_Write_U16(EEPROM_GLOW_ON_ADDRESS, glow_on))
 552  0102 ce000a        	ldw	x,_glow_on
 553  0105 89            	pushw	x
 554  0106 ae100a        	ldw	x,#4106
 555  0109 89            	pushw	x
 556  010a ae0000        	ldw	x,#0
 557  010d 89            	pushw	x
 558  010e cd0040        	call	_EEPROM_Write_U16
 560  0111 5b06          	addw	sp,#6
 561  0113 4d            	tnz	a
 562  0114 2604          	jrne	L112
 563                     ; 155 		  result = FALSE;
 565  0116 0f01          	clr	(OFST+0,sp)
 568  0118 202d          	jra	L761
 569  011a               L112:
 570                     ; 157     else if (!EEPROM_Write_U16(EEPROM_GLOW_OFF_ADDRESS, glow_off))
 572  011a ce000c        	ldw	x,_glow_off
 573  011d 89            	pushw	x
 574  011e ae100c        	ldw	x,#4108
 575  0121 89            	pushw	x
 576  0122 ae0000        	ldw	x,#0
 577  0125 89            	pushw	x
 578  0126 cd0040        	call	_EEPROM_Write_U16
 580  0129 5b06          	addw	sp,#6
 581  012b 4d            	tnz	a
 582  012c 2604          	jrne	L512
 583                     ; 159 		  result = FALSE;
 585  012e 0f01          	clr	(OFST+0,sp)
 588  0130 2015          	jra	L761
 589  0132               L512:
 590                     ; 161     else if (!EEPROM_Write_U8(EEPROM_INVERTED_ADDRESS, throttle_inverted))
 592  0132 3b000e        	push	_throttle_inverted
 593  0135 ae100e        	ldw	x,#4110
 594  0138 89            	pushw	x
 595  0139 ae0000        	ldw	x,#0
 596  013c 89            	pushw	x
 597  013d cd0008        	call	L74_EEPROM_Write_U8
 599  0140 5b05          	addw	sp,#5
 600  0142 4d            	tnz	a
 601  0143 2602          	jrne	L761
 602                     ; 163 		  result = FALSE;
 604  0145 0f01          	clr	(OFST+0,sp)
 606  0147               L761:
 607                     ; 166     if (result == TRUE)
 609  0147 7b01          	ld	a,(OFST+0,sp)
 610  0149 a101          	cp	a,#1
 611  014b 261e          	jrne	L322
 612                     ; 168         if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, CALIBRATION_MAGIC_VALUE)){
 614  014d aeb00b        	ldw	x,#45067
 615  0150 89            	pushw	x
 616  0151 ae1000        	ldw	x,#4096
 617  0154 89            	pushw	x
 618  0155 ae0000        	ldw	x,#0
 619  0158 89            	pushw	x
 620  0159 cd0040        	call	_EEPROM_Write_U16
 622  015c 5b06          	addw	sp,#6
 623  015e 4d            	tnz	a
 624  015f 2604          	jrne	L522
 625                     ; 169 		  result = FALSE;
 627  0161 0f01          	clr	(OFST+0,sp)
 630  0163 2006          	jra	L322
 631  0165               L522:
 632                     ; 172 		  magic = CALIBRATION_MAGIC_VALUE;
 634  0165 aeb00b        	ldw	x,#45067
 635  0168 cf0000        	ldw	_magic,x
 636  016b               L322:
 637                     ; 177     FLASH_Lock(FLASH_MemType_Data);
 639  016b a6f7          	ld	a,#247
 640  016d cd0000        	call	_FLASH_Lock
 642                     ; 179     return result;
 644  0170 7b01          	ld	a,(OFST+0,sp)
 647  0172 5b01          	addw	sp,#1
 648  0174 81            	ret
 695                     ; 183 static uint16_t EEPROM_Read_U16(uint32_t address){
 696                     	switch	.text
 697  0175               L5_EEPROM_Read_U16:
 699  0175 5204          	subw	sp,#4
 700       00000004      OFST:	set	4
 703                     ; 189   low_byte = (uint16_t)FLASH_ReadByte(address);
 705  0177 1e09          	ldw	x,(OFST+5,sp)
 706  0179 89            	pushw	x
 707  017a 1e09          	ldw	x,(OFST+5,sp)
 708  017c 89            	pushw	x
 709  017d cd0000        	call	_FLASH_ReadByte
 711  0180 5b04          	addw	sp,#4
 712  0182 5f            	clrw	x
 713  0183 97            	ld	xl,a
 714  0184 1f01          	ldw	(OFST-3,sp),x
 716                     ; 190   high_byte = (uint16_t)FLASH_ReadByte(address + 1u);
 718  0186 96            	ldw	x,sp
 719  0187 1c0007        	addw	x,#OFST+3
 720  018a cd0000        	call	c_ltor
 722  018d a601          	ld	a,#1
 723  018f cd0000        	call	c_ladc
 725  0192 be02          	ldw	x,c_lreg+2
 726  0194 89            	pushw	x
 727  0195 be00          	ldw	x,c_lreg
 728  0197 89            	pushw	x
 729  0198 cd0000        	call	_FLASH_ReadByte
 731  019b 5b04          	addw	sp,#4
 732  019d 5f            	clrw	x
 733  019e 97            	ld	xl,a
 734  019f 1f03          	ldw	(OFST-1,sp),x
 736                     ; 192   return (uint16_t)(low_byte | (high_byte << 8));
 738  01a1 1e03          	ldw	x,(OFST-1,sp)
 739  01a3 4f            	clr	a
 740  01a4 02            	rlwa	x,a
 741  01a5 01            	rrwa	x,a
 742  01a6 1a02          	or	a,(OFST-2,sp)
 743  01a8 01            	rrwa	x,a
 744  01a9 1a01          	or	a,(OFST-3,sp)
 745  01ab 01            	rrwa	x,a
 748  01ac 5b04          	addw	sp,#4
 749  01ae 81            	ret
 785                     ; 196 bool Calibration_Values_Valid(void)
 785                     ; 197 {
 786                     	switch	.text
 787  01af               _Calibration_Values_Valid:
 789  01af 89            	pushw	x
 790       00000002      OFST:	set	2
 793                     ; 201     if (stick_high_position >= stick_low_position)
 795  01b0 ce0002        	ldw	x,_stick_high_position
 796  01b3 c30004        	cpw	x,_stick_low_position
 797  01b6 250b          	jrult	L562
 798                     ; 203         calibration_span = stick_high_position - stick_low_position;
 800  01b8 ce0002        	ldw	x,_stick_high_position
 801  01bb 72b00004      	subw	x,_stick_low_position
 802  01bf 1f01          	ldw	(OFST-1,sp),x
 805  01c1 2009          	jra	L762
 806  01c3               L562:
 807                     ; 207         calibration_span = stick_low_position - stick_high_position;
 809  01c3 ce0004        	ldw	x,_stick_low_position
 810  01c6 72b00002      	subw	x,_stick_high_position
 811  01ca 1f01          	ldw	(OFST-1,sp),x
 813  01cc               L762:
 814                     ; 211     if (calibration_span < CALIBRATION_MIN_STICK_SPAN)
 816  01cc 1e01          	ldw	x,(OFST-1,sp)
 817  01ce a3012c        	cpw	x,#300
 818  01d1 2403          	jruge	L172
 819                     ; 213         return FALSE;
 821  01d3 4f            	clr	a
 823  01d4 2002          	jra	L22
 824  01d6               L172:
 825                     ; 216     return TRUE;
 827  01d6 a601          	ld	a,#1
 829  01d8               L22:
 831  01d8 85            	popw	x
 832  01d9 81            	ret
 866                     ; 220 void Calibration_Read_EEPROM(void){
 867                     	switch	.text
 868  01da               _Calibration_Read_EEPROM:
 872                     ; 224   magic = EEPROM_Read_U16(EEPROM_MAGIC_ADDRESS);
 874  01da ae1000        	ldw	x,#4096
 875  01dd 89            	pushw	x
 876  01de ae0000        	ldw	x,#0
 877  01e1 89            	pushw	x
 878  01e2 ad91          	call	L5_EEPROM_Read_U16
 880  01e4 5b04          	addw	sp,#4
 881  01e6 cf0000        	ldw	_magic,x
 882                     ; 226   stick_high_position = EEPROM_Read_U16(EEPROM_STICK_HIGH_ADDRESS);
 884  01e9 ae1002        	ldw	x,#4098
 885  01ec 89            	pushw	x
 886  01ed ae0000        	ldw	x,#0
 887  01f0 89            	pushw	x
 888  01f1 ad82          	call	L5_EEPROM_Read_U16
 890  01f3 5b04          	addw	sp,#4
 891  01f5 cf0002        	ldw	_stick_high_position,x
 892                     ; 228   stick_low_position = EEPROM_Read_U16(EEPROM_STICK_LOW_ADDRESS);
 894  01f8 ae1004        	ldw	x,#4100
 895  01fb 89            	pushw	x
 896  01fc ae0000        	ldw	x,#0
 897  01ff 89            	pushw	x
 898  0200 cd0175        	call	L5_EEPROM_Read_U16
 900  0203 5b04          	addw	sp,#4
 901  0205 cf0004        	ldw	_stick_low_position,x
 902                     ; 230   pwm_upper_limit = EEPROM_Read_U16(EEPROM_PWM_UPPER_ADDRESS);
 904  0208 ae1006        	ldw	x,#4102
 905  020b 89            	pushw	x
 906  020c ae0000        	ldw	x,#0
 907  020f 89            	pushw	x
 908  0210 cd0175        	call	L5_EEPROM_Read_U16
 910  0213 5b04          	addw	sp,#4
 911  0215 cf0006        	ldw	_pwm_upper_limit,x
 912                     ; 232   pwm_lower_limit = EEPROM_Read_U16(EEPROM_PWM_LOWER_ADDRESS);  
 914  0218 ae1008        	ldw	x,#4104
 915  021b 89            	pushw	x
 916  021c ae0000        	ldw	x,#0
 917  021f 89            	pushw	x
 918  0220 cd0175        	call	L5_EEPROM_Read_U16
 920  0223 5b04          	addw	sp,#4
 921  0225 cf0008        	ldw	_pwm_lower_limit,x
 922                     ; 234   glow_on = EEPROM_Read_U16(EEPROM_GLOW_ON_ADDRESS);
 924  0228 ae100a        	ldw	x,#4106
 925  022b 89            	pushw	x
 926  022c ae0000        	ldw	x,#0
 927  022f 89            	pushw	x
 928  0230 cd0175        	call	L5_EEPROM_Read_U16
 930  0233 5b04          	addw	sp,#4
 931  0235 cf000a        	ldw	_glow_on,x
 932                     ; 236   glow_off = EEPROM_Read_U16(EEPROM_GLOW_OFF_ADDRESS);
 934  0238 ae100c        	ldw	x,#4108
 935  023b 89            	pushw	x
 936  023c ae0000        	ldw	x,#0
 937  023f 89            	pushw	x
 938  0240 cd0175        	call	L5_EEPROM_Read_U16
 940  0243 5b04          	addw	sp,#4
 941  0245 cf000c        	ldw	_glow_off,x
 942                     ; 238   throttle_inverted = FLASH_ReadByte(EEPROM_INVERTED_ADDRESS);
 944  0248 ae100e        	ldw	x,#4110
 945  024b 89            	pushw	x
 946  024c ae0000        	ldw	x,#0
 947  024f 89            	pushw	x
 948  0250 cd0000        	call	_FLASH_ReadByte
 950  0253 5b04          	addw	sp,#4
 951  0255 c7000e        	ld	_throttle_inverted,a
 952                     ; 239 }
 955  0258 81            	ret
 994                     .const:	section	.text
 995  0000               L03:
 996  0000 00000064      	dc.l	100
 997                     ; 241 void Calibration_Averaging(void){
 998                     	switch	.text
 999  0259               _Calibration_Averaging:
1001  0259 5206          	subw	sp,#6
1002       00000006      OFST:	set	6
1005                     ; 244   int l = 0;
1007                     ; 246   sample_sum = 0;
1009  025b ae0000        	ldw	x,#0
1010  025e cf0011        	ldw	L71_sample_sum+2,x
1011  0261 ae0000        	ldw	x,#0
1012  0264 cf000f        	ldw	L71_sample_sum,x
1013                     ; 247   valid_sum = 0;
1015  0267 ae0000        	ldw	x,#0
1016  026a cf0015        	ldw	L12_valid_sum+2,x
1017  026d ae0000        	ldw	x,#0
1018  0270 cf0013        	ldw	L12_valid_sum,x
1019                     ; 248   sample_average = 0;
1021  0273 5f            	clrw	x
1022  0274 cf0017        	ldw	L32_sample_average,x
1023                     ; 249   calibrated_position = 0;
1025  0277 5f            	clrw	x
1026  0278 cf0019        	ldw	L52_calibrated_position,x
1027                     ; 250   valid_sample_count = 0;
1029  027b 725f001b      	clr	L72_valid_sample_count
1030                     ; 252   for (l = 0; l < 100; ++l){
1032  027f 5f            	clrw	x
1033  0280 1f05          	ldw	(OFST-1,sp),x
1035  0282               L713:
1036                     ; 254 	sample_sum += samples[l];
1038  0282 1e05          	ldw	x,(OFST-1,sp)
1039  0284 58            	sllw	x
1040  0285 de0007        	ldw	x,(L3_samples,x)
1041  0288 cd0000        	call	c_uitolx
1043  028b ae000f        	ldw	x,#L71_sample_sum
1044  028e cd0000        	call	c_lgadd
1046                     ; 252   for (l = 0; l < 100; ++l){
1048  0291 1e05          	ldw	x,(OFST-1,sp)
1049  0293 1c0001        	addw	x,#1
1050  0296 1f05          	ldw	(OFST-1,sp),x
1054  0298 9c            	rvf
1055  0299 1e05          	ldw	x,(OFST-1,sp)
1056  029b a30064        	cpw	x,#100
1057  029e 2fe2          	jrslt	L713
1058                     ; 257   sample_average = sample_sum / 100U;
1060  02a0 ae000f        	ldw	x,#L71_sample_sum
1061  02a3 cd0000        	call	c_ltor
1063  02a6 ae0000        	ldw	x,#L03
1064  02a9 cd0000        	call	c_ludv
1066  02ac be02          	ldw	x,c_lreg+2
1067  02ae cf0017        	ldw	L32_sample_average,x
1068                     ; 259   for (l = 0; l < 100; ++l){
1070  02b1 5f            	clrw	x
1071  02b2 1f05          	ldw	(OFST-1,sp),x
1073  02b4               L523:
1074                     ; 261 	if ((samples[l] >= (sample_average - 20U)) && (samples[l] <= (sample_average + 20U))){
1076  02b4 1e05          	ldw	x,(OFST-1,sp)
1077  02b6 58            	sllw	x
1078  02b7 90ce0017      	ldw	y,L32_sample_average
1079  02bb 72a20014      	subw	y,#20
1080  02bf 90bf00        	ldw	c_y,y
1081  02c2 9093          	ldw	y,x
1082  02c4 90de0007      	ldw	y,(L3_samples,y)
1083  02c8 90b300        	cpw	y,c_y
1084  02cb 252c          	jrult	L333
1086  02cd 1e05          	ldw	x,(OFST-1,sp)
1087  02cf 58            	sllw	x
1088  02d0 90ce0017      	ldw	y,L32_sample_average
1089  02d4 72a90014      	addw	y,#20
1090  02d8 90bf00        	ldw	c_y,y
1091  02db 9093          	ldw	y,x
1092  02dd 90de0007      	ldw	y,(L3_samples,y)
1093  02e1 90b300        	cpw	y,c_y
1094  02e4 2213          	jrugt	L333
1095                     ; 263 	valid_sum += samples[l];
1097  02e6 1e05          	ldw	x,(OFST-1,sp)
1098  02e8 58            	sllw	x
1099  02e9 de0007        	ldw	x,(L3_samples,x)
1100  02ec cd0000        	call	c_uitolx
1102  02ef ae0013        	ldw	x,#L12_valid_sum
1103  02f2 cd0000        	call	c_lgadd
1105                     ; 265 	++valid_sample_count;
1107  02f5 725c001b      	inc	L72_valid_sample_count
1108  02f9               L333:
1109                     ; 259   for (l = 0; l < 100; ++l){
1111  02f9 1e05          	ldw	x,(OFST-1,sp)
1112  02fb 1c0001        	addw	x,#1
1113  02fe 1f05          	ldw	(OFST-1,sp),x
1117  0300 9c            	rvf
1118  0301 1e05          	ldw	x,(OFST-1,sp)
1119  0303 a30064        	cpw	x,#100
1120  0306 2fac          	jrslt	L523
1121                     ; 268 	if (valid_sample_count > 0U){
1123  0308 725d001b      	tnz	L72_valid_sample_count
1124  030c 2724          	jreq	L733
1125                     ; 269 	  calibrated_position = (uint16_t)(valid_sum / valid_sample_count);
1127  030e c6001b        	ld	a,L72_valid_sample_count
1128  0311 b703          	ld	c_lreg+3,a
1129  0313 3f02          	clr	c_lreg+2
1130  0315 3f01          	clr	c_lreg+1
1131  0317 3f00          	clr	c_lreg
1132  0319 96            	ldw	x,sp
1133  031a 1c0001        	addw	x,#OFST-5
1134  031d cd0000        	call	c_rtol
1137  0320 ae0013        	ldw	x,#L12_valid_sum
1138  0323 cd0000        	call	c_ltor
1140  0326 96            	ldw	x,sp
1141  0327 1c0001        	addw	x,#OFST-5
1142  032a cd0000        	call	c_ludv
1144  032d be02          	ldw	x,c_lreg+2
1145  032f cf0019        	ldw	L52_calibrated_position,x
1147  0332               L733:
1148                     ; 276 }
1151  0332 5b06          	addw	sp,#6
1152  0334 81            	ret
1194                     ; 278 uint16_t Calibrate_Stick_Position(void){
1195                     	switch	.text
1196  0335               _Calibrate_Stick_Position:
1198  0335 89            	pushw	x
1199       00000002      OFST:	set	2
1202                     ; 279   int k = 0;
1204                     ; 281   stable_count = 0;
1206  0336 725f0000      	clr	L51_stable_count
1207                     ; 282   pwm_difference = 0;
1209  033a 5f            	clrw	x
1210  033b cf0005        	ldw	L7_pwm_difference,x
1211                     ; 283   previous_pwm = PWM_Input_GetWidth();
1213  033e cd0000        	call	_PWM_Input_GetWidth
1215  0341 cf0003        	ldw	L11_previous_pwm,x
1216                     ; 284   current_pwm = PWM_Input_GetWidth();
1218  0344 cd0000        	call	_PWM_Input_GetWidth
1220  0347 cf0001        	ldw	L31_current_pwm,x
1222  034a 2042          	jra	L163
1223  034c               L553:
1224                     ; 288 	Delay_ms(20);
1226  034c ae0014        	ldw	x,#20
1227  034f cd0000        	call	_Delay_ms
1229                     ; 290 	current_pwm = PWM_Input_GetWidth();;
1231  0352 cd0000        	call	_PWM_Input_GetWidth
1233  0355 cf0001        	ldw	L31_current_pwm,x
1234                     ; 292 	  if (current_pwm > previous_pwm){
1237  0358 ce0001        	ldw	x,L31_current_pwm
1238  035b c30003        	cpw	x,L11_previous_pwm
1239  035e 230c          	jrule	L563
1240                     ; 294 		pwm_difference = current_pwm - previous_pwm;
1242  0360 ce0001        	ldw	x,L31_current_pwm
1243  0363 72b00003      	subw	x,L11_previous_pwm
1244  0367 cf0005        	ldw	L7_pwm_difference,x
1246  036a 200a          	jra	L763
1247  036c               L563:
1248                     ; 298 		pwm_difference = previous_pwm - current_pwm;
1250  036c ce0003        	ldw	x,L11_previous_pwm
1251  036f 72b00001      	subw	x,L31_current_pwm
1252  0373 cf0005        	ldw	L7_pwm_difference,x
1253  0376               L763:
1254                     ; 301 	  if (pwm_difference <= 5u){
1256  0376 ce0005        	ldw	x,L7_pwm_difference
1257  0379 a30006        	cpw	x,#6
1258  037c 2406          	jruge	L173
1259                     ; 302 		++stable_count;
1261  037e 725c0000      	inc	L51_stable_count
1263  0382 2004          	jra	L373
1264  0384               L173:
1265                     ; 306 		stable_count = 0;
1267  0384 725f0000      	clr	L51_stable_count
1268  0388               L373:
1269                     ; 308 	previous_pwm = current_pwm;
1271  0388 ce0001        	ldw	x,L31_current_pwm
1272  038b cf0003        	ldw	L11_previous_pwm,x
1273  038e               L163:
1274                     ; 286   while (stable_count < 20u){
1276  038e c60000        	ld	a,L51_stable_count
1277  0391 a114          	cp	a,#20
1278  0393 25b7          	jrult	L553
1279                     ; 311 	for (k = 0; k < 100; ++k){
1281  0395 5f            	clrw	x
1282  0396 1f01          	ldw	(OFST-1,sp),x
1284  0398               L573:
1285                     ; 313 	  samples[k] = PWM_Input_GetWidth();
1287  0398 cd0000        	call	_PWM_Input_GetWidth
1289  039b 1601          	ldw	y,(OFST-1,sp)
1290  039d 9058          	sllw	y
1291  039f 90df0007      	ldw	(L3_samples,y),x
1292                     ; 315 	  Delay_ms(50);
1294  03a3 ae0032        	ldw	x,#50
1295  03a6 cd0000        	call	_Delay_ms
1297                     ; 311 	for (k = 0; k < 100; ++k){
1299  03a9 1e01          	ldw	x,(OFST-1,sp)
1300  03ab 1c0001        	addw	x,#1
1301  03ae 1f01          	ldw	(OFST-1,sp),x
1305  03b0 9c            	rvf
1306  03b1 1e01          	ldw	x,(OFST-1,sp)
1307  03b3 a30064        	cpw	x,#100
1308  03b6 2fe0          	jrslt	L573
1309                     ; 318   Calibration_Averaging();
1311  03b8 cd0259        	call	_Calibration_Averaging
1313                     ; 320   return calibrated_position;
1315  03bb ce0019        	ldw	x,L52_calibrated_position
1318  03be 5b02          	addw	sp,#2
1319  03c0 81            	ret
1357                     ; 323 void Calibrate_Stick_Limits(void){
1358                     	switch	.text
1359  03c1               _Calibrate_Stick_Limits:
1361  03c1 89            	pushw	x
1362       00000002      OFST:	set	2
1365                     ; 324   int i = 0;
1367                     ; 326   stick_high_position = Calibrate_Stick_Position();
1369  03c2 cd0335        	call	_Calibrate_Stick_Position
1371  03c5 cf0002        	ldw	_stick_high_position,x
1372                     ; 328 	ledFlash(3, 500);
1374  03c8 ae01f4        	ldw	x,#500
1375  03cb 89            	pushw	x
1376  03cc a603          	ld	a,#3
1377  03ce cd0000        	call	_ledFlash
1379  03d1 85            	popw	x
1380                     ; 330 	  Delay_ms(2000);
1382  03d2 ae07d0        	ldw	x,#2000
1383  03d5 cd0000        	call	_Delay_ms
1385                     ; 332 		stick_low_position = Calibrate_Stick_Position();
1387  03d8 cd0335        	call	_Calibrate_Stick_Position
1389  03db cf0004        	ldw	_stick_low_position,x
1390                     ; 334 		  ledFlash(4, 500);
1392  03de ae01f4        	ldw	x,#500
1393  03e1 89            	pushw	x
1394  03e2 a604          	ld	a,#4
1395  03e4 cd0000        	call	_ledFlash
1397  03e7 85            	popw	x
1398                     ; 336 			Delay_ms(2000);
1400  03e8 ae07d0        	ldw	x,#2000
1401  03eb cd0000        	call	_Delay_ms
1403                     ; 337 }
1406  03ee 85            	popw	x
1407  03ef 81            	ret
1445                     ; 339 void Calibrate_Glow_Limits(void){
1446                     	switch	.text
1447  03f0               _Calibrate_Glow_Limits:
1449  03f0 89            	pushw	x
1450       00000002      OFST:	set	2
1453                     ; 341   int i = 0;
1455                     ; 343   glow_off = Calibrate_Stick_Position();
1457  03f1 cd0335        	call	_Calibrate_Stick_Position
1459  03f4 cf000c        	ldw	_glow_off,x
1460                     ; 345 	ledFlash(5, 500);
1462  03f7 ae01f4        	ldw	x,#500
1463  03fa 89            	pushw	x
1464  03fb a605          	ld	a,#5
1465  03fd cd0000        	call	_ledFlash
1467  0400 85            	popw	x
1468                     ; 347 	  Delay_ms(2000);	
1470  0401 ae07d0        	ldw	x,#2000
1471  0404 cd0000        	call	_Delay_ms
1473                     ; 350 		glow_on = Calibrate_Stick_Position();
1475  0407 cd0335        	call	_Calibrate_Stick_Position
1477  040a cf000a        	ldw	_glow_on,x
1478                     ; 352 		  ledFlash(6, 500);
1480  040d ae01f4        	ldw	x,#500
1481  0410 89            	pushw	x
1482  0411 a606          	ld	a,#6
1483  0413 cd0000        	call	_ledFlash
1485  0416 85            	popw	x
1486                     ; 353 }
1489  0417 85            	popw	x
1490  0418 81            	ret
1519                     ; 356 bool Calibration_Data_VALID(void)
1519                     ; 357 {
1520                     	switch	.text
1521  0419               _Calibration_Data_VALID:
1525                     ; 359     if (magic != CALIBRATION_MAGIC_VALUE)
1527  0419 ce0000        	ldw	x,_magic
1528  041c a3b00b        	cpw	x,#45067
1529  041f 2702          	jreq	L344
1530                     ; 361         return FALSE;
1532  0421 4f            	clr	a
1535  0422 81            	ret
1536  0423               L344:
1537                     ; 364 	if (Calibration_Values_Valid() == FALSE)
1539  0423 cd01af        	call	_Calibration_Values_Valid
1541  0426 4d            	tnz	a
1542  0427 2602          	jrne	L544
1543                     ; 366 		return FALSE;
1545  0429 4f            	clr	a
1548  042a 81            	ret
1549  042b               L544:
1550                     ; 369     if (pwm_lower_limit >= pwm_upper_limit)
1552  042b ce0008        	ldw	x,_pwm_lower_limit
1553  042e c30006        	cpw	x,_pwm_upper_limit
1554  0431 2502          	jrult	L744
1555                     ; 371         return FALSE;
1557  0433 4f            	clr	a
1560  0434 81            	ret
1561  0435               L744:
1562                     ; 374     return TRUE;
1564  0435 a601          	ld	a,#1
1567  0437 81            	ret
1611                     ; 377 bool Recalibration_High_Position_Detect(void)
1611                     ; 378 {
1612                     	switch	.text
1613  0438               _Recalibration_High_Position_Detect:
1615  0438 5204          	subw	sp,#4
1616       00000004      OFST:	set	4
1619                     ; 382     if (stick_high_position >= stick_low_position)
1621  043a ce0002        	ldw	x,_stick_high_position
1622  043d c30004        	cpw	x,_stick_low_position
1623  0440 2526          	jrult	L764
1624                     ; 385         stick_span = stick_high_position - stick_low_position;
1626  0442 ce0002        	ldw	x,_stick_high_position
1627  0445 72b00004      	subw	x,_stick_low_position
1628  0449 1f03          	ldw	(OFST-1,sp),x
1630                     ; 387         recal_threshold =
1630                     ; 388             stick_low_position + ((stick_span * 3U) / 4U);
1632  044b 1e03          	ldw	x,(OFST-1,sp)
1633  044d a603          	ld	a,#3
1634  044f cd0000        	call	c_bmulx
1636  0452 54            	srlw	x
1637  0453 54            	srlw	x
1638  0454 72bb0004      	addw	x,_stick_low_position
1639  0458 1f03          	ldw	(OFST-1,sp),x
1641                     ; 390         return (pwm_width_us >= recal_threshold);
1643  045a ce0000        	ldw	x,_pwm_width_us
1644  045d 1303          	cpw	x,(OFST-1,sp)
1645  045f 2504          	jrult	L44
1646  0461 a601          	ld	a,#1
1647  0463 2001          	jra	L64
1648  0465               L44:
1649  0465 4f            	clr	a
1650  0466               L64:
1652  0466 2028          	jra	L45
1653  0468               L764:
1654                     ; 395         stick_span = stick_low_position - stick_high_position;
1656  0468 ce0004        	ldw	x,_stick_low_position
1657  046b 72b00002      	subw	x,_stick_high_position
1658  046f 1f03          	ldw	(OFST-1,sp),x
1660                     ; 397         recal_threshold =
1660                     ; 398             stick_low_position - ((stick_span * 3U) / 4U);
1662  0471 1e03          	ldw	x,(OFST-1,sp)
1663  0473 a603          	ld	a,#3
1664  0475 cd0000        	call	c_bmulx
1666  0478 54            	srlw	x
1667  0479 54            	srlw	x
1668  047a 1f01          	ldw	(OFST-3,sp),x
1670  047c ce0004        	ldw	x,_stick_low_position
1671  047f 72f001        	subw	x,(OFST-3,sp)
1672  0482 1f03          	ldw	(OFST-1,sp),x
1674                     ; 400         return (pwm_width_us <= recal_threshold);
1676  0484 ce0000        	ldw	x,_pwm_width_us
1677  0487 1303          	cpw	x,(OFST-1,sp)
1678  0489 2204          	jrugt	L05
1679  048b a601          	ld	a,#1
1680  048d 2001          	jra	L25
1681  048f               L05:
1682  048f 4f            	clr	a
1683  0490               L25:
1685  0490               L45:
1687  0490 5b04          	addw	sp,#4
1688  0492 81            	ret
1732                     ; 411 void Calibration_Sequence_Main(void){
1733                     	switch	.text
1734  0493               _Calibration_Sequence_Main:
1736  0493 89            	pushw	x
1737       00000002      OFST:	set	2
1740                     ; 418   int i = 0;
1742  0494               L705:
1743                     ; 422 	ledFlash(10, 500);
1745  0494 ae01f4        	ldw	x,#500
1746  0497 89            	pushw	x
1747  0498 a60a          	ld	a,#10
1748  049a cd0000        	call	_ledFlash
1750  049d 85            	popw	x
1751                     ; 424 	Calibrate_Stick_Limits();
1753  049e cd03c1        	call	_Calibrate_Stick_Limits
1755                     ; 426 	Calibrate_Glow_Limits();
1757  04a1 cd03f0        	call	_Calibrate_Glow_Limits
1759                     ; 428 	if (stick_high_position > stick_low_position){
1761  04a4 ce0002        	ldw	x,_stick_high_position
1762  04a7 c30004        	cpw	x,_stick_low_position
1763  04aa 2312          	jrule	L315
1764                     ; 429 		  pwm_upper_limit = stick_high_position;
1766  04ac ce0002        	ldw	x,_stick_high_position
1767  04af cf0006        	ldw	_pwm_upper_limit,x
1768                     ; 430 		  pwm_lower_limit = stick_low_position;
1770  04b2 ce0004        	ldw	x,_stick_low_position
1771  04b5 cf0008        	ldw	_pwm_lower_limit,x
1772                     ; 431 		  throttle_inverted = FALSE;
1774  04b8 725f000e      	clr	_throttle_inverted
1776  04bc 2010          	jra	L515
1777  04be               L315:
1778                     ; 434 		  pwm_upper_limit = stick_low_position;
1780  04be ce0004        	ldw	x,_stick_low_position
1781  04c1 cf0006        	ldw	_pwm_upper_limit,x
1782                     ; 435 		  pwm_lower_limit = stick_high_position;
1784  04c4 ce0002        	ldw	x,_stick_high_position
1785  04c7 cf0008        	ldw	_pwm_lower_limit,x
1786                     ; 436 		  throttle_inverted = TRUE;
1788  04ca 3501000e      	mov	_throttle_inverted,#1
1789  04ce               L515:
1790                     ; 459 	if (Calibration_Values_Valid() == TRUE)
1792  04ce cd01af        	call	_Calibration_Values_Valid
1794  04d1 a101          	cp	a,#1
1795  04d3 2625          	jrne	L715
1796                     ; 462 	  if (Calibration_Write_EEPROM() == TRUE)
1798  04d5 cd0081        	call	_Calibration_Write_EEPROM
1800  04d8 a101          	cp	a,#1
1801  04da 2612          	jrne	L125
1802                     ; 464 		  Delay_ms(1000);
1804  04dc ae03e8        	ldw	x,#1000
1805  04df cd0000        	call	_Delay_ms
1807                     ; 465 		  ledFlash(10, 500);
1809  04e2 ae01f4        	ldw	x,#500
1810  04e5 89            	pushw	x
1811  04e6 a60a          	ld	a,#10
1812  04e8 cd0000        	call	_ledFlash
1814  04eb 85            	popw	x
1815                     ; 468 		  break;
1816                     ; 489 }
1819  04ec 85            	popw	x
1820  04ed 81            	ret
1821  04ee               L125:
1822                     ; 473         ledFlash(20, 50);
1824  04ee ae0032        	ldw	x,#50
1825  04f1 89            	pushw	x
1826  04f2 a614          	ld	a,#20
1827  04f4 cd0000        	call	_ledFlash
1829  04f7 85            	popw	x
1830                     ; 476         continue;
1832  04f8 209a          	jra	L705
1833  04fa               L715:
1834                     ; 482     ledFlash(20, 50);
1836  04fa ae0032        	ldw	x,#50
1837  04fd 89            	pushw	x
1838  04fe a614          	ld	a,#20
1839  0500 cd0000        	call	_ledFlash
1841  0503 85            	popw	x
1842                     ; 485     continue;
1844  0504 208e          	jra	L705
2006                     	switch	.bss
2007  0000               L51_stable_count:
2008  0000 00            	ds.b	1
2009  0001               L31_current_pwm:
2010  0001 0000          	ds.b	2
2011  0003               L11_previous_pwm:
2012  0003 0000          	ds.b	2
2013  0005               L7_pwm_difference:
2014  0005 0000          	ds.b	2
2015  0007               L3_samples:
2016  0007 000000000000  	ds.b	200
2017                     	xref	_PWM_Input_GetWidth
2018                     	xref	_pwm_width_us
2019                     	xref	_ledFlash
2020                     	xref	_Delay_ms
2021                     	xdef	_Recalibration_High_Position_Detect
2022                     	xdef	_EEPROM_Write_U16
2023                     	xdef	_Calibration_Values_Valid
2024                     	xdef	_Calibrate_Stick_Position
2025                     	xdef	_Calibrate_Glow_Limits
2026                     	xdef	_Calibrate_Stick_Limits
2027                     	xdef	_Calibration_Averaging
2028                     	xdef	_Calibration_Sequence_Main
2029                     	xdef	_Calibration_Data_VALID
2030                     	xdef	_Calibration_Write_EEPROM
2031                     	xdef	_Calibration_Read_EEPROM
2032                     	xdef	_EEPROM_Setup
2033                     	xdef	_throttle_inverted
2034                     	xdef	_magic
2035                     	xdef	_glow_off
2036                     	xdef	_glow_on
2037                     	xdef	_pwm_lower_limit
2038                     	xdef	_pwm_upper_limit
2039                     	xdef	_stick_low_position
2040                     	xdef	_stick_high_position
2041                     	xref	_FLASH_WaitForLastOperation
2042                     	xref	_FLASH_ReadByte
2043                     	xref	_FLASH_ProgramByte
2044                     	xref	_FLASH_Lock
2045                     	xref	_FLASH_Unlock
2046                     	xref	_FLASH_DeInit
2047                     	xref	_FLASH_SetProgrammingTime
2048                     	xref.b	c_lreg
2049                     	xref.b	c_x
2050                     	xref.b	c_y
2070                     	xref	c_bmuly
2071                     	xref	c_bmulx
2072                     	xref	c_rtol
2073                     	xref	c_ludv
2074                     	xref	c_lgadd
2075                     	xref	c_uitolx
2076                     	xref	c_ladc
2077                     	xref	c_ltor
2078                     	end
