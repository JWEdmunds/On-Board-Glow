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
  71                     ; 73 void EEPROM_Setup(void){
  73                     	switch	.text
  74  0000               _EEPROM_Setup:
  78                     ; 75   FLASH_DeInit();
  80  0000 cd0000        	call	_FLASH_DeInit
  82                     ; 77   FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
  84  0003 4f            	clr	a
  85  0004 cd0000        	call	_FLASH_SetProgrammingTime
  87                     ; 78 }
  90  0007 81            	ret
 193                     ; 81 static bool EEPROM_Write_U8(uint32_t address, uint8_t value){
 194                     	switch	.text
 195  0008               L74_EEPROM_Write_U8:
 197  0008 88            	push	a
 198       00000001      OFST:	set	1
 201                     ; 86   FLASH_ProgramByte(address, value);
 203  0009 7b08          	ld	a,(OFST+7,sp)
 204  000b 88            	push	a
 205  000c 1e07          	ldw	x,(OFST+6,sp)
 206  000e 89            	pushw	x
 207  000f 1e07          	ldw	x,(OFST+6,sp)
 208  0011 89            	pushw	x
 209  0012 cd0000        	call	_FLASH_ProgramByte
 211  0015 5b05          	addw	sp,#5
 212                     ; 88   status = FLASH_WaitForLastOperation(FLASH_MemType_Data);
 214  0017 a6f7          	ld	a,#247
 215  0019 cd0000        	call	_FLASH_WaitForLastOperation
 217  001c 6b01          	ld	(OFST+0,sp),a
 219                     ; 92 	if ((uint8_t)status != (uint8_t)FLASH_FLAG_HVOFF)
 221  001e 7b01          	ld	a,(OFST+0,sp)
 222  0020 a140          	cp	a,#64
 223  0022 2704          	jreq	L511
 224                     ; 94 		return FALSE;
 226  0024 4f            	clr	a
 229  0025 5b01          	addw	sp,#1
 230  0027 81            	ret
 231  0028               L511:
 232                     ; 97     if (FLASH_ReadByte(address) != value)
 234  0028 1e06          	ldw	x,(OFST+5,sp)
 235  002a 89            	pushw	x
 236  002b 1e06          	ldw	x,(OFST+5,sp)
 237  002d 89            	pushw	x
 238  002e cd0000        	call	_FLASH_ReadByte
 240  0031 5b04          	addw	sp,#4
 241  0033 1108          	cp	a,(OFST+7,sp)
 242  0035 2704          	jreq	L711
 243                     ; 99         return FALSE;
 245  0037 4f            	clr	a
 248  0038 5b01          	addw	sp,#1
 249  003a 81            	ret
 250  003b               L711:
 251                     ; 102     return TRUE;
 253  003b a601          	ld	a,#1
 256  003d 5b01          	addw	sp,#1
 257  003f 81            	ret
 312                     ; 105 bool EEPROM_Write_U16(uint32_t address, uint16_t value){
 313                     	switch	.text
 314  0040               _EEPROM_Write_U16:
 316  0040 89            	pushw	x
 317       00000002      OFST:	set	2
 320                     ; 111   low_byte = (uint8_t)(value & 0x00FFU);
 322  0041 7b0a          	ld	a,(OFST+8,sp)
 323  0043 a4ff          	and	a,#255
 324  0045 6b01          	ld	(OFST-1,sp),a
 326                     ; 112   high_byte = (uint8_t)((value >> 8) & 0x00FFU);
 328  0047 7b09          	ld	a,(OFST+7,sp)
 329  0049 6b02          	ld	(OFST+0,sp),a
 331                     ; 114   if (!EEPROM_Write_U8(address, low_byte)){
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
 344                     ; 115 	return FALSE;
 346  005b 4f            	clr	a
 348  005c 201d          	jra	L21
 349  005e               L341:
 350                     ; 117   if (!EEPROM_Write_U8(address + 1U, high_byte)){
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
 370                     ; 118 	return FALSE;
 372  007a 4f            	clr	a
 374  007b               L21:
 376  007b 85            	popw	x
 377  007c 81            	ret
 378  007d               L541:
 379                     ; 120   return TRUE;
 381  007d a601          	ld	a,#1
 383  007f 20fa          	jra	L21
 432                     ; 124 bool Calibration_Write_EEPROM(void){
 433                     	switch	.text
 434  0081               _Calibration_Write_EEPROM:
 436  0081 88            	push	a
 437       00000001      OFST:	set	1
 440                     ; 126     bool result = TRUE;
 442  0082 a601          	ld	a,#1
 443  0084 6b01          	ld	(OFST+0,sp),a
 445                     ; 129 	  FLASH_Unlock(FLASH_MemType_Data);
 447  0086 a6f7          	ld	a,#247
 448  0088 cd0000        	call	_FLASH_Unlock
 450                     ; 133     if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U))
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
 463                     ; 135         result = FALSE;
 465  009c 0f01          	clr	(OFST+0,sp)
 468  009e ac470147      	jpf	L761
 469  00a2               L561:
 470                     ; 138     else if (!EEPROM_Write_U16(EEPROM_STICK_HIGH_ADDRESS, stick_high_position))
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
 483                     ; 140 		  result = FALSE;
 485  00b5 0f01          	clr	(OFST+0,sp)
 488  00b7 cc0147        	jra	L761
 489  00ba               L171:
 490                     ; 142     else if (!EEPROM_Write_U16(EEPROM_STICK_LOW_ADDRESS, stick_low_position))
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
 503                     ; 144 		  result = FALSE;
 505  00ce 0f01          	clr	(OFST+0,sp)
 508  00d0 2075          	jra	L761
 509  00d2               L571:
 510                     ; 146     else if (!EEPROM_Write_U16(EEPROM_PWM_UPPER_ADDRESS, pwm_upper_limit))
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
 523                     ; 148 		  result = FALSE;
 525  00e6 0f01          	clr	(OFST+0,sp)
 528  00e8 205d          	jra	L761
 529  00ea               L102:
 530                     ; 150     else if (!EEPROM_Write_U16(EEPROM_PWM_LOWER_ADDRESS, pwm_lower_limit))
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
 543                     ; 152 		  result = FALSE;
 545  00fe 0f01          	clr	(OFST+0,sp)
 548  0100 2045          	jra	L761
 549  0102               L502:
 550                     ; 154     else if (!EEPROM_Write_U16(EEPROM_GLOW_ON_ADDRESS, glow_on))
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
 563                     ; 156 		  result = FALSE;
 565  0116 0f01          	clr	(OFST+0,sp)
 568  0118 202d          	jra	L761
 569  011a               L112:
 570                     ; 158     else if (!EEPROM_Write_U16(EEPROM_GLOW_OFF_ADDRESS, glow_off))
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
 583                     ; 160 		  result = FALSE;
 585  012e 0f01          	clr	(OFST+0,sp)
 588  0130 2015          	jra	L761
 589  0132               L512:
 590                     ; 162     else if (!EEPROM_Write_U8(EEPROM_INVERTED_ADDRESS, throttle_inverted))
 592  0132 3b000e        	push	_throttle_inverted
 593  0135 ae100e        	ldw	x,#4110
 594  0138 89            	pushw	x
 595  0139 ae0000        	ldw	x,#0
 596  013c 89            	pushw	x
 597  013d cd0008        	call	L74_EEPROM_Write_U8
 599  0140 5b05          	addw	sp,#5
 600  0142 4d            	tnz	a
 601  0143 2602          	jrne	L761
 602                     ; 164 		  result = FALSE;
 604  0145 0f01          	clr	(OFST+0,sp)
 606  0147               L761:
 607                     ; 167     if (result == TRUE)
 609  0147 7b01          	ld	a,(OFST+0,sp)
 610  0149 a101          	cp	a,#1
 611  014b 261e          	jrne	L322
 612                     ; 169         if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, CALIBRATION_MAGIC_VALUE)){
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
 625                     ; 170 		  result = FALSE;
 627  0161 0f01          	clr	(OFST+0,sp)
 630  0163 2006          	jra	L322
 631  0165               L522:
 632                     ; 173 		  magic = CALIBRATION_MAGIC_VALUE;
 634  0165 aeb00b        	ldw	x,#45067
 635  0168 cf0000        	ldw	_magic,x
 636  016b               L322:
 637                     ; 178     FLASH_Lock(FLASH_MemType_Data);
 639  016b a6f7          	ld	a,#247
 640  016d cd0000        	call	_FLASH_Lock
 642                     ; 180     return result;
 644  0170 7b01          	ld	a,(OFST+0,sp)
 647  0172 5b01          	addw	sp,#1
 648  0174 81            	ret
 695                     ; 184 static uint16_t EEPROM_Read_U16(uint32_t address){
 696                     	switch	.text
 697  0175               L5_EEPROM_Read_U16:
 699  0175 5204          	subw	sp,#4
 700       00000004      OFST:	set	4
 703                     ; 190   low_byte = (uint16_t)FLASH_ReadByte(address);
 705  0177 1e09          	ldw	x,(OFST+5,sp)
 706  0179 89            	pushw	x
 707  017a 1e09          	ldw	x,(OFST+5,sp)
 708  017c 89            	pushw	x
 709  017d cd0000        	call	_FLASH_ReadByte
 711  0180 5b04          	addw	sp,#4
 712  0182 5f            	clrw	x
 713  0183 97            	ld	xl,a
 714  0184 1f01          	ldw	(OFST-3,sp),x
 716                     ; 191   high_byte = (uint16_t)FLASH_ReadByte(address + 1u);
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
 736                     ; 193   return (uint16_t)(low_byte | (high_byte << 8));
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
 785                     ; 197 bool Calibration_Values_Valid(void)
 785                     ; 198 {
 786                     	switch	.text
 787  01af               _Calibration_Values_Valid:
 789  01af 89            	pushw	x
 790       00000002      OFST:	set	2
 793                     ; 202     if ((stick_high_position < PWM_LOWER_LIMIT_DEFAULT) ||
 793                     ; 203         (stick_high_position > PWM_UPPER_LIMIT_DEFAULT))
 795  01b0 ce0002        	ldw	x,_stick_high_position
 796  01b3 a303b6        	cpw	x,#950
 797  01b6 2508          	jrult	L762
 799  01b8 ce0002        	ldw	x,_stick_high_position
 800  01bb a30835        	cpw	x,#2101
 801  01be 2503          	jrult	L562
 802  01c0               L762:
 803                     ; 205         return FALSE;
 805  01c0 4f            	clr	a
 807  01c1 2011          	jra	L22
 808  01c3               L562:
 809                     ; 209     if ((stick_low_position < PWM_LOWER_LIMIT_DEFAULT) ||
 809                     ; 210         (stick_low_position > PWM_UPPER_LIMIT_DEFAULT))
 811  01c3 ce0004        	ldw	x,_stick_low_position
 812  01c6 a303b6        	cpw	x,#950
 813  01c9 2508          	jrult	L372
 815  01cb ce0004        	ldw	x,_stick_low_position
 816  01ce a30835        	cpw	x,#2101
 817  01d1 2503          	jrult	L172
 818  01d3               L372:
 819                     ; 212         return FALSE;
 821  01d3 4f            	clr	a
 823  01d4               L22:
 825  01d4 85            	popw	x
 826  01d5 81            	ret
 827  01d6               L172:
 828                     ; 216     if (stick_high_position >= stick_low_position)
 830  01d6 ce0002        	ldw	x,_stick_high_position
 831  01d9 c30004        	cpw	x,_stick_low_position
 832  01dc 250b          	jrult	L572
 833                     ; 218         calibration_span = stick_high_position - stick_low_position;
 835  01de ce0002        	ldw	x,_stick_high_position
 836  01e1 72b00004      	subw	x,_stick_low_position
 837  01e5 1f01          	ldw	(OFST-1,sp),x
 840  01e7 2009          	jra	L772
 841  01e9               L572:
 842                     ; 222         calibration_span = stick_low_position - stick_high_position;
 844  01e9 ce0004        	ldw	x,_stick_low_position
 845  01ec 72b00002      	subw	x,_stick_high_position
 846  01f0 1f01          	ldw	(OFST-1,sp),x
 848  01f2               L772:
 849                     ; 226     if (calibration_span < CALIBRATION_MIN_STICK_SPAN)
 851  01f2 1e01          	ldw	x,(OFST-1,sp)
 852  01f4 a3012c        	cpw	x,#300
 853  01f7 2403          	jruge	L103
 854                     ; 228         return FALSE;
 856  01f9 4f            	clr	a
 858  01fa 20d8          	jra	L22
 859  01fc               L103:
 860                     ; 231     return TRUE;
 862  01fc a601          	ld	a,#1
 864  01fe 20d4          	jra	L22
 898                     ; 235 void Calibration_Read_EEPROM(void){
 899                     	switch	.text
 900  0200               _Calibration_Read_EEPROM:
 904                     ; 239   magic = EEPROM_Read_U16(EEPROM_MAGIC_ADDRESS);
 906  0200 ae1000        	ldw	x,#4096
 907  0203 89            	pushw	x
 908  0204 ae0000        	ldw	x,#0
 909  0207 89            	pushw	x
 910  0208 cd0175        	call	L5_EEPROM_Read_U16
 912  020b 5b04          	addw	sp,#4
 913  020d cf0000        	ldw	_magic,x
 914                     ; 241   stick_high_position = EEPROM_Read_U16(EEPROM_STICK_HIGH_ADDRESS);
 916  0210 ae1002        	ldw	x,#4098
 917  0213 89            	pushw	x
 918  0214 ae0000        	ldw	x,#0
 919  0217 89            	pushw	x
 920  0218 cd0175        	call	L5_EEPROM_Read_U16
 922  021b 5b04          	addw	sp,#4
 923  021d cf0002        	ldw	_stick_high_position,x
 924                     ; 243   stick_low_position = EEPROM_Read_U16(EEPROM_STICK_LOW_ADDRESS);
 926  0220 ae1004        	ldw	x,#4100
 927  0223 89            	pushw	x
 928  0224 ae0000        	ldw	x,#0
 929  0227 89            	pushw	x
 930  0228 cd0175        	call	L5_EEPROM_Read_U16
 932  022b 5b04          	addw	sp,#4
 933  022d cf0004        	ldw	_stick_low_position,x
 934                     ; 245   pwm_upper_limit = EEPROM_Read_U16(EEPROM_PWM_UPPER_ADDRESS);
 936  0230 ae1006        	ldw	x,#4102
 937  0233 89            	pushw	x
 938  0234 ae0000        	ldw	x,#0
 939  0237 89            	pushw	x
 940  0238 cd0175        	call	L5_EEPROM_Read_U16
 942  023b 5b04          	addw	sp,#4
 943  023d cf0006        	ldw	_pwm_upper_limit,x
 944                     ; 247   pwm_lower_limit = EEPROM_Read_U16(EEPROM_PWM_LOWER_ADDRESS);  
 946  0240 ae1008        	ldw	x,#4104
 947  0243 89            	pushw	x
 948  0244 ae0000        	ldw	x,#0
 949  0247 89            	pushw	x
 950  0248 cd0175        	call	L5_EEPROM_Read_U16
 952  024b 5b04          	addw	sp,#4
 953  024d cf0008        	ldw	_pwm_lower_limit,x
 954                     ; 249   glow_on = EEPROM_Read_U16(EEPROM_GLOW_ON_ADDRESS);
 956  0250 ae100a        	ldw	x,#4106
 957  0253 89            	pushw	x
 958  0254 ae0000        	ldw	x,#0
 959  0257 89            	pushw	x
 960  0258 cd0175        	call	L5_EEPROM_Read_U16
 962  025b 5b04          	addw	sp,#4
 963  025d cf000a        	ldw	_glow_on,x
 964                     ; 251   glow_off = EEPROM_Read_U16(EEPROM_GLOW_OFF_ADDRESS);
 966  0260 ae100c        	ldw	x,#4108
 967  0263 89            	pushw	x
 968  0264 ae0000        	ldw	x,#0
 969  0267 89            	pushw	x
 970  0268 cd0175        	call	L5_EEPROM_Read_U16
 972  026b 5b04          	addw	sp,#4
 973  026d cf000c        	ldw	_glow_off,x
 974                     ; 253   throttle_inverted = FLASH_ReadByte(EEPROM_INVERTED_ADDRESS);
 976  0270 ae100e        	ldw	x,#4110
 977  0273 89            	pushw	x
 978  0274 ae0000        	ldw	x,#0
 979  0277 89            	pushw	x
 980  0278 cd0000        	call	_FLASH_ReadByte
 982  027b 5b04          	addw	sp,#4
 983  027d c7000e        	ld	_throttle_inverted,a
 984                     ; 254 }
 987  0280 81            	ret
1026                     .const:	section	.text
1027  0000               L03:
1028  0000 00000064      	dc.l	100
1029                     ; 256 void Calibration_Averaging(void){
1030                     	switch	.text
1031  0281               _Calibration_Averaging:
1033  0281 5206          	subw	sp,#6
1034       00000006      OFST:	set	6
1037                     ; 259   int l = 0;
1039                     ; 261   sample_sum = 0;
1041  0283 ae0000        	ldw	x,#0
1042  0286 cf0011        	ldw	L71_sample_sum+2,x
1043  0289 ae0000        	ldw	x,#0
1044  028c cf000f        	ldw	L71_sample_sum,x
1045                     ; 262   valid_sum = 0;
1047  028f ae0000        	ldw	x,#0
1048  0292 cf0015        	ldw	L12_valid_sum+2,x
1049  0295 ae0000        	ldw	x,#0
1050  0298 cf0013        	ldw	L12_valid_sum,x
1051                     ; 263   sample_average = 0;
1053  029b 5f            	clrw	x
1054  029c cf0017        	ldw	L32_sample_average,x
1055                     ; 264   calibrated_position = 0;
1057  029f 5f            	clrw	x
1058  02a0 cf0019        	ldw	L52_calibrated_position,x
1059                     ; 265   valid_sample_count = 0;
1061  02a3 725f001b      	clr	L72_valid_sample_count
1062                     ; 267   for (l = 0; l < 100; ++l){
1064  02a7 5f            	clrw	x
1065  02a8 1f05          	ldw	(OFST-1,sp),x
1067  02aa               L723:
1068                     ; 269 	sample_sum += samples[l];
1070  02aa 1e05          	ldw	x,(OFST-1,sp)
1071  02ac 58            	sllw	x
1072  02ad de0007        	ldw	x,(L3_samples,x)
1073  02b0 cd0000        	call	c_uitolx
1075  02b3 ae000f        	ldw	x,#L71_sample_sum
1076  02b6 cd0000        	call	c_lgadd
1078                     ; 267   for (l = 0; l < 100; ++l){
1080  02b9 1e05          	ldw	x,(OFST-1,sp)
1081  02bb 1c0001        	addw	x,#1
1082  02be 1f05          	ldw	(OFST-1,sp),x
1086  02c0 9c            	rvf
1087  02c1 1e05          	ldw	x,(OFST-1,sp)
1088  02c3 a30064        	cpw	x,#100
1089  02c6 2fe2          	jrslt	L723
1090                     ; 272   sample_average = sample_sum / 100U;
1092  02c8 ae000f        	ldw	x,#L71_sample_sum
1093  02cb cd0000        	call	c_ltor
1095  02ce ae0000        	ldw	x,#L03
1096  02d1 cd0000        	call	c_ludv
1098  02d4 be02          	ldw	x,c_lreg+2
1099  02d6 cf0017        	ldw	L32_sample_average,x
1100                     ; 274   for (l = 0; l < 100; ++l){
1102  02d9 5f            	clrw	x
1103  02da 1f05          	ldw	(OFST-1,sp),x
1105  02dc               L533:
1106                     ; 276 	if ((samples[l] >= (sample_average - 20U)) && (samples[l] <= (sample_average + 20U))){
1108  02dc 1e05          	ldw	x,(OFST-1,sp)
1109  02de 58            	sllw	x
1110  02df 90ce0017      	ldw	y,L32_sample_average
1111  02e3 72a20014      	subw	y,#20
1112  02e7 90bf00        	ldw	c_y,y
1113  02ea 9093          	ldw	y,x
1114  02ec 90de0007      	ldw	y,(L3_samples,y)
1115  02f0 90b300        	cpw	y,c_y
1116  02f3 252c          	jrult	L343
1118  02f5 1e05          	ldw	x,(OFST-1,sp)
1119  02f7 58            	sllw	x
1120  02f8 90ce0017      	ldw	y,L32_sample_average
1121  02fc 72a90014      	addw	y,#20
1122  0300 90bf00        	ldw	c_y,y
1123  0303 9093          	ldw	y,x
1124  0305 90de0007      	ldw	y,(L3_samples,y)
1125  0309 90b300        	cpw	y,c_y
1126  030c 2213          	jrugt	L343
1127                     ; 278 	valid_sum += samples[l];
1129  030e 1e05          	ldw	x,(OFST-1,sp)
1130  0310 58            	sllw	x
1131  0311 de0007        	ldw	x,(L3_samples,x)
1132  0314 cd0000        	call	c_uitolx
1134  0317 ae0013        	ldw	x,#L12_valid_sum
1135  031a cd0000        	call	c_lgadd
1137                     ; 280 	++valid_sample_count;
1139  031d 725c001b      	inc	L72_valid_sample_count
1140  0321               L343:
1141                     ; 274   for (l = 0; l < 100; ++l){
1143  0321 1e05          	ldw	x,(OFST-1,sp)
1144  0323 1c0001        	addw	x,#1
1145  0326 1f05          	ldw	(OFST-1,sp),x
1149  0328 9c            	rvf
1150  0329 1e05          	ldw	x,(OFST-1,sp)
1151  032b a30064        	cpw	x,#100
1152  032e 2fac          	jrslt	L533
1153                     ; 283 	if (valid_sample_count > 0U){
1155  0330 725d001b      	tnz	L72_valid_sample_count
1156  0334 2724          	jreq	L743
1157                     ; 284 	  calibrated_position = (uint16_t)(valid_sum / valid_sample_count);
1159  0336 c6001b        	ld	a,L72_valid_sample_count
1160  0339 b703          	ld	c_lreg+3,a
1161  033b 3f02          	clr	c_lreg+2
1162  033d 3f01          	clr	c_lreg+1
1163  033f 3f00          	clr	c_lreg
1164  0341 96            	ldw	x,sp
1165  0342 1c0001        	addw	x,#OFST-5
1166  0345 cd0000        	call	c_rtol
1169  0348 ae0013        	ldw	x,#L12_valid_sum
1170  034b cd0000        	call	c_ltor
1172  034e 96            	ldw	x,sp
1173  034f 1c0001        	addw	x,#OFST-5
1174  0352 cd0000        	call	c_ludv
1176  0355 be02          	ldw	x,c_lreg+2
1177  0357 cf0019        	ldw	L52_calibrated_position,x
1179  035a               L743:
1180                     ; 291 }
1183  035a 5b06          	addw	sp,#6
1184  035c 81            	ret
1226                     ; 293 uint16_t Calibrate_Stick_Position(void){
1227                     	switch	.text
1228  035d               _Calibrate_Stick_Position:
1230  035d 89            	pushw	x
1231       00000002      OFST:	set	2
1234                     ; 294   int k = 0;
1236                     ; 296   stable_count = 0;
1238  035e 725f0000      	clr	L51_stable_count
1239                     ; 297   pwm_difference = 0;
1241  0362 5f            	clrw	x
1242  0363 cf0005        	ldw	L7_pwm_difference,x
1243                     ; 298   previous_pwm = PWM_Input_GetWidth();
1245  0366 cd0000        	call	_PWM_Input_GetWidth
1247  0369 cf0003        	ldw	L11_previous_pwm,x
1248                     ; 299   current_pwm = PWM_Input_GetWidth();
1250  036c cd0000        	call	_PWM_Input_GetWidth
1252  036f cf0001        	ldw	L31_current_pwm,x
1254  0372 2042          	jra	L173
1255  0374               L563:
1256                     ; 303 	Delay_ms(20);
1258  0374 ae0014        	ldw	x,#20
1259  0377 cd0000        	call	_Delay_ms
1261                     ; 305 	current_pwm = PWM_Input_GetWidth();;
1263  037a cd0000        	call	_PWM_Input_GetWidth
1265  037d cf0001        	ldw	L31_current_pwm,x
1266                     ; 307 	  if (current_pwm > previous_pwm){
1269  0380 ce0001        	ldw	x,L31_current_pwm
1270  0383 c30003        	cpw	x,L11_previous_pwm
1271  0386 230c          	jrule	L573
1272                     ; 309 		pwm_difference = current_pwm - previous_pwm;
1274  0388 ce0001        	ldw	x,L31_current_pwm
1275  038b 72b00003      	subw	x,L11_previous_pwm
1276  038f cf0005        	ldw	L7_pwm_difference,x
1278  0392 200a          	jra	L773
1279  0394               L573:
1280                     ; 313 		pwm_difference = previous_pwm - current_pwm;
1282  0394 ce0003        	ldw	x,L11_previous_pwm
1283  0397 72b00001      	subw	x,L31_current_pwm
1284  039b cf0005        	ldw	L7_pwm_difference,x
1285  039e               L773:
1286                     ; 316 	  if (pwm_difference <= 5u){
1288  039e ce0005        	ldw	x,L7_pwm_difference
1289  03a1 a30006        	cpw	x,#6
1290  03a4 2406          	jruge	L104
1291                     ; 317 		++stable_count;
1293  03a6 725c0000      	inc	L51_stable_count
1295  03aa 2004          	jra	L304
1296  03ac               L104:
1297                     ; 321 		stable_count = 0;
1299  03ac 725f0000      	clr	L51_stable_count
1300  03b0               L304:
1301                     ; 323 	previous_pwm = current_pwm;
1303  03b0 ce0001        	ldw	x,L31_current_pwm
1304  03b3 cf0003        	ldw	L11_previous_pwm,x
1305  03b6               L173:
1306                     ; 301   while (stable_count < 20u){
1308  03b6 c60000        	ld	a,L51_stable_count
1309  03b9 a114          	cp	a,#20
1310  03bb 25b7          	jrult	L563
1311                     ; 326 	for (k = 0; k < 100; ++k){
1313  03bd 5f            	clrw	x
1314  03be 1f01          	ldw	(OFST-1,sp),x
1316  03c0               L504:
1317                     ; 328 	  samples[k] = PWM_Input_GetWidth();
1319  03c0 cd0000        	call	_PWM_Input_GetWidth
1321  03c3 1601          	ldw	y,(OFST-1,sp)
1322  03c5 9058          	sllw	y
1323  03c7 90df0007      	ldw	(L3_samples,y),x
1324                     ; 330 	  Delay_ms(50);
1326  03cb ae0032        	ldw	x,#50
1327  03ce cd0000        	call	_Delay_ms
1329                     ; 326 	for (k = 0; k < 100; ++k){
1331  03d1 1e01          	ldw	x,(OFST-1,sp)
1332  03d3 1c0001        	addw	x,#1
1333  03d6 1f01          	ldw	(OFST-1,sp),x
1337  03d8 9c            	rvf
1338  03d9 1e01          	ldw	x,(OFST-1,sp)
1339  03db a30064        	cpw	x,#100
1340  03de 2fe0          	jrslt	L504
1341                     ; 333   Calibration_Averaging();
1343  03e0 cd0281        	call	_Calibration_Averaging
1345                     ; 335   return calibrated_position;
1347  03e3 ce0019        	ldw	x,L52_calibrated_position
1350  03e6 5b02          	addw	sp,#2
1351  03e8 81            	ret
1389                     ; 338 void Calibrate_Stick_Limits(void){
1390                     	switch	.text
1391  03e9               _Calibrate_Stick_Limits:
1393  03e9 89            	pushw	x
1394       00000002      OFST:	set	2
1397                     ; 339   int i = 0;
1399                     ; 341   stick_high_position = Calibrate_Stick_Position();
1401  03ea cd035d        	call	_Calibrate_Stick_Position
1403  03ed cf0002        	ldw	_stick_high_position,x
1404                     ; 343 	ledFlash(3, 500);
1406  03f0 ae01f4        	ldw	x,#500
1407  03f3 89            	pushw	x
1408  03f4 a603          	ld	a,#3
1409  03f6 cd0000        	call	_ledFlash
1411  03f9 85            	popw	x
1412                     ; 345 	  Delay_ms(2000);
1414  03fa ae07d0        	ldw	x,#2000
1415  03fd cd0000        	call	_Delay_ms
1417                     ; 347 		stick_low_position = Calibrate_Stick_Position();
1419  0400 cd035d        	call	_Calibrate_Stick_Position
1421  0403 cf0004        	ldw	_stick_low_position,x
1422                     ; 349 		  ledFlash(4, 500);
1424  0406 ae01f4        	ldw	x,#500
1425  0409 89            	pushw	x
1426  040a a604          	ld	a,#4
1427  040c cd0000        	call	_ledFlash
1429  040f 85            	popw	x
1430                     ; 351 			Delay_ms(2000);
1432  0410 ae07d0        	ldw	x,#2000
1433  0413 cd0000        	call	_Delay_ms
1435                     ; 352 }
1438  0416 85            	popw	x
1439  0417 81            	ret
1477                     ; 354 void Calibrate_Glow_Limits(void){
1478                     	switch	.text
1479  0418               _Calibrate_Glow_Limits:
1481  0418 89            	pushw	x
1482       00000002      OFST:	set	2
1485                     ; 356   int i = 0;
1487                     ; 358   glow_off = Calibrate_Stick_Position();
1489  0419 cd035d        	call	_Calibrate_Stick_Position
1491  041c cf000c        	ldw	_glow_off,x
1492                     ; 360 	ledFlash(5, 500);
1494  041f ae01f4        	ldw	x,#500
1495  0422 89            	pushw	x
1496  0423 a605          	ld	a,#5
1497  0425 cd0000        	call	_ledFlash
1499  0428 85            	popw	x
1500                     ; 362 	  Delay_ms(2000);	
1502  0429 ae07d0        	ldw	x,#2000
1503  042c cd0000        	call	_Delay_ms
1505                     ; 365 		glow_on = Calibrate_Stick_Position();
1507  042f cd035d        	call	_Calibrate_Stick_Position
1509  0432 cf000a        	ldw	_glow_on,x
1510                     ; 367 		  ledFlash(6, 500);
1512  0435 ae01f4        	ldw	x,#500
1513  0438 89            	pushw	x
1514  0439 a606          	ld	a,#6
1515  043b cd0000        	call	_ledFlash
1517  043e 85            	popw	x
1518                     ; 368 }
1521  043f 85            	popw	x
1522  0440 81            	ret
1551                     ; 371 bool Calibration_Data_VALID(void)
1551                     ; 372 {
1552                     	switch	.text
1553  0441               _Calibration_Data_VALID:
1557                     ; 374     if (magic != CALIBRATION_MAGIC_VALUE)
1559  0441 ce0000        	ldw	x,_magic
1560  0444 a3b00b        	cpw	x,#45067
1561  0447 2702          	jreq	L354
1562                     ; 376         return FALSE;
1564  0449 4f            	clr	a
1567  044a 81            	ret
1568  044b               L354:
1569                     ; 379 	if (Calibration_Values_Valid() == FALSE)
1571  044b cd01af        	call	_Calibration_Values_Valid
1573  044e 4d            	tnz	a
1574  044f 2602          	jrne	L554
1575                     ; 381 		return FALSE;
1577  0451 4f            	clr	a
1580  0452 81            	ret
1581  0453               L554:
1582                     ; 384     if (pwm_lower_limit >= pwm_upper_limit)
1584  0453 ce0008        	ldw	x,_pwm_lower_limit
1585  0456 c30006        	cpw	x,_pwm_upper_limit
1586  0459 2502          	jrult	L754
1587                     ; 386         return FALSE;
1589  045b 4f            	clr	a
1592  045c 81            	ret
1593  045d               L754:
1594                     ; 389     return TRUE;
1596  045d a601          	ld	a,#1
1599  045f 81            	ret
1643                     ; 392 bool Recalibration_High_Position_Detect(void)
1643                     ; 393 {
1644                     	switch	.text
1645  0460               _Recalibration_High_Position_Detect:
1647  0460 5204          	subw	sp,#4
1648       00000004      OFST:	set	4
1651                     ; 397     if (stick_high_position >= stick_low_position)
1653  0462 ce0002        	ldw	x,_stick_high_position
1654  0465 c30004        	cpw	x,_stick_low_position
1655  0468 2526          	jrult	L774
1656                     ; 400         stick_span = stick_high_position - stick_low_position;
1658  046a ce0002        	ldw	x,_stick_high_position
1659  046d 72b00004      	subw	x,_stick_low_position
1660  0471 1f03          	ldw	(OFST-1,sp),x
1662                     ; 402         recal_threshold =
1662                     ; 403             stick_low_position + ((stick_span * 3U) / 4U);
1664  0473 1e03          	ldw	x,(OFST-1,sp)
1665  0475 a603          	ld	a,#3
1666  0477 cd0000        	call	c_bmulx
1668  047a 54            	srlw	x
1669  047b 54            	srlw	x
1670  047c 72bb0004      	addw	x,_stick_low_position
1671  0480 1f03          	ldw	(OFST-1,sp),x
1673                     ; 405         return (pwm_width_us >= recal_threshold);
1675  0482 ce0000        	ldw	x,_pwm_width_us
1676  0485 1303          	cpw	x,(OFST-1,sp)
1677  0487 2504          	jrult	L44
1678  0489 a601          	ld	a,#1
1679  048b 2001          	jra	L64
1680  048d               L44:
1681  048d 4f            	clr	a
1682  048e               L64:
1684  048e 2028          	jra	L45
1685  0490               L774:
1686                     ; 410         stick_span = stick_low_position - stick_high_position;
1688  0490 ce0004        	ldw	x,_stick_low_position
1689  0493 72b00002      	subw	x,_stick_high_position
1690  0497 1f03          	ldw	(OFST-1,sp),x
1692                     ; 412         recal_threshold =
1692                     ; 413             stick_low_position - ((stick_span * 3U) / 4U);
1694  0499 1e03          	ldw	x,(OFST-1,sp)
1695  049b a603          	ld	a,#3
1696  049d cd0000        	call	c_bmulx
1698  04a0 54            	srlw	x
1699  04a1 54            	srlw	x
1700  04a2 1f01          	ldw	(OFST-3,sp),x
1702  04a4 ce0004        	ldw	x,_stick_low_position
1703  04a7 72f001        	subw	x,(OFST-3,sp)
1704  04aa 1f03          	ldw	(OFST-1,sp),x
1706                     ; 415         return (pwm_width_us <= recal_threshold);
1708  04ac ce0000        	ldw	x,_pwm_width_us
1709  04af 1303          	cpw	x,(OFST-1,sp)
1710  04b1 2204          	jrugt	L05
1711  04b3 a601          	ld	a,#1
1712  04b5 2001          	jra	L25
1713  04b7               L05:
1714  04b7 4f            	clr	a
1715  04b8               L25:
1717  04b8               L45:
1719  04b8 5b04          	addw	sp,#4
1720  04ba 81            	ret
1764                     ; 426 void Calibration_Sequence_Main(void){
1765                     	switch	.text
1766  04bb               _Calibration_Sequence_Main:
1768  04bb 89            	pushw	x
1769       00000002      OFST:	set	2
1772                     ; 433   int i = 0;
1774  04bc               L715:
1775                     ; 437 	ledFlash(10, 500);
1777  04bc ae01f4        	ldw	x,#500
1778  04bf 89            	pushw	x
1779  04c0 a60a          	ld	a,#10
1780  04c2 cd0000        	call	_ledFlash
1782  04c5 85            	popw	x
1783                     ; 439 	Calibrate_Stick_Limits();
1785  04c6 cd03e9        	call	_Calibrate_Stick_Limits
1787                     ; 441 	Calibrate_Glow_Limits();
1789  04c9 cd0418        	call	_Calibrate_Glow_Limits
1791                     ; 443 	if (stick_high_position > stick_low_position){
1793  04cc ce0002        	ldw	x,_stick_high_position
1794  04cf c30004        	cpw	x,_stick_low_position
1795  04d2 2312          	jrule	L325
1796                     ; 444 		  pwm_upper_limit = stick_high_position;
1798  04d4 ce0002        	ldw	x,_stick_high_position
1799  04d7 cf0006        	ldw	_pwm_upper_limit,x
1800                     ; 445 		  pwm_lower_limit = stick_low_position;
1802  04da ce0004        	ldw	x,_stick_low_position
1803  04dd cf0008        	ldw	_pwm_lower_limit,x
1804                     ; 446 		  throttle_inverted = FALSE;
1806  04e0 725f000e      	clr	_throttle_inverted
1808  04e4 2010          	jra	L525
1809  04e6               L325:
1810                     ; 449 		  pwm_upper_limit = stick_low_position;
1812  04e6 ce0004        	ldw	x,_stick_low_position
1813  04e9 cf0006        	ldw	_pwm_upper_limit,x
1814                     ; 450 		  pwm_lower_limit = stick_high_position;
1816  04ec ce0002        	ldw	x,_stick_high_position
1817  04ef cf0008        	ldw	_pwm_lower_limit,x
1818                     ; 451 		  throttle_inverted = TRUE;
1820  04f2 3501000e      	mov	_throttle_inverted,#1
1821  04f6               L525:
1822                     ; 474 	if (Calibration_Values_Valid() == TRUE)
1824  04f6 cd01af        	call	_Calibration_Values_Valid
1826  04f9 a101          	cp	a,#1
1827  04fb 2625          	jrne	L725
1828                     ; 477 	  if (Calibration_Write_EEPROM() == TRUE)
1830  04fd cd0081        	call	_Calibration_Write_EEPROM
1832  0500 a101          	cp	a,#1
1833  0502 2612          	jrne	L135
1834                     ; 479 		  Delay_ms(1000);
1836  0504 ae03e8        	ldw	x,#1000
1837  0507 cd0000        	call	_Delay_ms
1839                     ; 480 		  ledFlash(10, 500);
1841  050a ae01f4        	ldw	x,#500
1842  050d 89            	pushw	x
1843  050e a60a          	ld	a,#10
1844  0510 cd0000        	call	_ledFlash
1846  0513 85            	popw	x
1847                     ; 483 		  break;
1848                     ; 504 }
1851  0514 85            	popw	x
1852  0515 81            	ret
1853  0516               L135:
1854                     ; 488         ledFlash(20, 50);
1856  0516 ae0032        	ldw	x,#50
1857  0519 89            	pushw	x
1858  051a a614          	ld	a,#20
1859  051c cd0000        	call	_ledFlash
1861  051f 85            	popw	x
1862                     ; 491         continue;
1864  0520 209a          	jra	L715
1865  0522               L725:
1866                     ; 497     ledFlash(20, 50);
1868  0522 ae0032        	ldw	x,#50
1869  0525 89            	pushw	x
1870  0526 a614          	ld	a,#20
1871  0528 cd0000        	call	_ledFlash
1873  052b 85            	popw	x
1874                     ; 500     continue;
1876  052c 208e          	jra	L715
2038                     	switch	.bss
2039  0000               L51_stable_count:
2040  0000 00            	ds.b	1
2041  0001               L31_current_pwm:
2042  0001 0000          	ds.b	2
2043  0003               L11_previous_pwm:
2044  0003 0000          	ds.b	2
2045  0005               L7_pwm_difference:
2046  0005 0000          	ds.b	2
2047  0007               L3_samples:
2048  0007 000000000000  	ds.b	200
2049                     	xref	_PWM_Input_GetWidth
2050                     	xref	_pwm_width_us
2051                     	xref	_ledFlash
2052                     	xref	_Delay_ms
2053                     	xdef	_Recalibration_High_Position_Detect
2054                     	xdef	_EEPROM_Write_U16
2055                     	xdef	_Calibration_Values_Valid
2056                     	xdef	_Calibrate_Stick_Position
2057                     	xdef	_Calibrate_Glow_Limits
2058                     	xdef	_Calibrate_Stick_Limits
2059                     	xdef	_Calibration_Averaging
2060                     	xdef	_Calibration_Sequence_Main
2061                     	xdef	_Calibration_Data_VALID
2062                     	xdef	_Calibration_Write_EEPROM
2063                     	xdef	_Calibration_Read_EEPROM
2064                     	xdef	_EEPROM_Setup
2065                     	xdef	_throttle_inverted
2066                     	xdef	_magic
2067                     	xdef	_glow_off
2068                     	xdef	_glow_on
2069                     	xdef	_pwm_lower_limit
2070                     	xdef	_pwm_upper_limit
2071                     	xdef	_stick_low_position
2072                     	xdef	_stick_high_position
2073                     	xref	_FLASH_WaitForLastOperation
2074                     	xref	_FLASH_ReadByte
2075                     	xref	_FLASH_ProgramByte
2076                     	xref	_FLASH_Lock
2077                     	xref	_FLASH_Unlock
2078                     	xref	_FLASH_DeInit
2079                     	xref	_FLASH_SetProgrammingTime
2080                     	xref.b	c_lreg
2081                     	xref.b	c_x
2082                     	xref.b	c_y
2102                     	xref	c_bmuly
2103                     	xref	c_bmulx
2104                     	xref	c_rtol
2105                     	xref	c_ludv
2106                     	xref	c_lgadd
2107                     	xref	c_uitolx
2108                     	xref	c_ladc
2109                     	xref	c_ltor
2110                     	end
