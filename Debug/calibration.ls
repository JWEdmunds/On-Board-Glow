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
  71                     ; 68 void EEPROM_Setup(void){
  73                     	switch	.text
  74  0000               _EEPROM_Setup:
  78                     ; 70   FLASH_DeInit();
  80  0000 cd0000        	call	_FLASH_DeInit
  82                     ; 72   FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
  84  0003 4f            	clr	a
  85  0004 cd0000        	call	_FLASH_SetProgrammingTime
  87                     ; 73 }
  90  0007 81            	ret
 193                     ; 75 static bool EEPROM_Write_U8(uint32_t address, uint8_t value){
 194                     	switch	.text
 195  0008               L74_EEPROM_Write_U8:
 197  0008 88            	push	a
 198       00000001      OFST:	set	1
 201                     ; 80   FLASH_ProgramByte(address, value);
 203  0009 7b08          	ld	a,(OFST+7,sp)
 204  000b 88            	push	a
 205  000c 1e07          	ldw	x,(OFST+6,sp)
 206  000e 89            	pushw	x
 207  000f 1e07          	ldw	x,(OFST+6,sp)
 208  0011 89            	pushw	x
 209  0012 cd0000        	call	_FLASH_ProgramByte
 211  0015 5b05          	addw	sp,#5
 212                     ; 82   status = FLASH_WaitForLastOperation(FLASH_MemType_Data);
 214  0017 a6f7          	ld	a,#247
 215  0019 cd0000        	call	_FLASH_WaitForLastOperation
 217  001c 6b01          	ld	(OFST+0,sp),a
 219                     ; 86       if ((uint8_t)status != (uint8_t)FLASH_FLAG_HVOFF)
 221  001e 7b01          	ld	a,(OFST+0,sp)
 222  0020 a140          	cp	a,#64
 223  0022 2704          	jreq	L511
 224                     ; 88         return FALSE;
 226  0024 4f            	clr	a
 229  0025 5b01          	addw	sp,#1
 230  0027 81            	ret
 231  0028               L511:
 232                     ; 91     if (FLASH_ReadByte(address) != value)
 234  0028 1e06          	ldw	x,(OFST+5,sp)
 235  002a 89            	pushw	x
 236  002b 1e06          	ldw	x,(OFST+5,sp)
 237  002d 89            	pushw	x
 238  002e cd0000        	call	_FLASH_ReadByte
 240  0031 5b04          	addw	sp,#4
 241  0033 1108          	cp	a,(OFST+7,sp)
 242  0035 2704          	jreq	L711
 243                     ; 93         return FALSE;
 245  0037 4f            	clr	a
 248  0038 5b01          	addw	sp,#1
 249  003a 81            	ret
 250  003b               L711:
 251                     ; 96     return TRUE;
 253  003b a601          	ld	a,#1
 256  003d 5b01          	addw	sp,#1
 257  003f 81            	ret
 312                     ; 99 bool EEPROM_Write_U16(uint32_t address, uint16_t value){
 313                     	switch	.text
 314  0040               _EEPROM_Write_U16:
 316  0040 89            	pushw	x
 317       00000002      OFST:	set	2
 320                     ; 105   low_byte = (uint8_t)(value & 0x00FFU);
 322  0041 7b0a          	ld	a,(OFST+8,sp)
 323  0043 a4ff          	and	a,#255
 324  0045 6b01          	ld	(OFST-1,sp),a
 326                     ; 106   high_byte = (uint8_t)((value >> 8) & 0x00FFU);
 328  0047 7b09          	ld	a,(OFST+7,sp)
 329  0049 6b02          	ld	(OFST+0,sp),a
 331                     ; 108   if (!EEPROM_Write_U8(address, low_byte)){
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
 344                     ; 109 	return FALSE;
 346  005b 4f            	clr	a
 348  005c 201d          	jra	L21
 349  005e               L341:
 350                     ; 111   if (!EEPROM_Write_U8(address + 1U, high_byte)){
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
 370                     ; 112 	return FALSE;
 372  007a 4f            	clr	a
 374  007b               L21:
 376  007b 85            	popw	x
 377  007c 81            	ret
 378  007d               L541:
 379                     ; 114   return TRUE;
 381  007d a601          	ld	a,#1
 383  007f 20fa          	jra	L21
 432                     ; 117 bool Calibration_Write_EEPROM(void){
 433                     	switch	.text
 434  0081               _Calibration_Write_EEPROM:
 436  0081 88            	push	a
 437       00000001      OFST:	set	1
 440                     ; 119     bool result = TRUE;
 442  0082 a601          	ld	a,#1
 443  0084 6b01          	ld	(OFST+0,sp),a
 445                     ; 121 	  FLASH_Unlock(FLASH_MemType_Data);
 447  0086 a6f7          	ld	a,#247
 448  0088 cd0000        	call	_FLASH_Unlock
 450                     ; 125     if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U))
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
 463                     ; 127         result = FALSE;
 465  009c 0f01          	clr	(OFST+0,sp)
 468  009e ac470147      	jpf	L761
 469  00a2               L561:
 470                     ; 130     else if (!EEPROM_Write_U16(EEPROM_STICK_HIGH_ADDRESS, stick_high_position))
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
 483                     ; 132 		  result = FALSE;
 485  00b5 0f01          	clr	(OFST+0,sp)
 488  00b7 cc0147        	jra	L761
 489  00ba               L171:
 490                     ; 134     else if (!EEPROM_Write_U16(EEPROM_STICK_LOW_ADDRESS, stick_low_position))
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
 503                     ; 136 		  result = FALSE;
 505  00ce 0f01          	clr	(OFST+0,sp)
 508  00d0 2075          	jra	L761
 509  00d2               L571:
 510                     ; 138     else if (!EEPROM_Write_U16(EEPROM_PWM_UPPER_ADDRESS, pwm_upper_limit))
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
 523                     ; 140 		  result = FALSE;
 525  00e6 0f01          	clr	(OFST+0,sp)
 528  00e8 205d          	jra	L761
 529  00ea               L102:
 530                     ; 142     else if (!EEPROM_Write_U16(EEPROM_PWM_LOWER_ADDRESS, pwm_lower_limit))
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
 543                     ; 144 		  result = FALSE;
 545  00fe 0f01          	clr	(OFST+0,sp)
 548  0100 2045          	jra	L761
 549  0102               L502:
 550                     ; 146     else if (!EEPROM_Write_U16(EEPROM_GLOW_ON_ADDRESS, glow_on))
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
 563                     ; 148 		  result = FALSE;
 565  0116 0f01          	clr	(OFST+0,sp)
 568  0118 202d          	jra	L761
 569  011a               L112:
 570                     ; 150     else if (!EEPROM_Write_U16(EEPROM_GLOW_OFF_ADDRESS, glow_off))
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
 583                     ; 152 		  result = FALSE;
 585  012e 0f01          	clr	(OFST+0,sp)
 588  0130 2015          	jra	L761
 589  0132               L512:
 590                     ; 154     else if (!EEPROM_Write_U8(EEPROM_INVERTED_ADDRESS, throttle_inverted))
 592  0132 3b000e        	push	_throttle_inverted
 593  0135 ae100e        	ldw	x,#4110
 594  0138 89            	pushw	x
 595  0139 ae0000        	ldw	x,#0
 596  013c 89            	pushw	x
 597  013d cd0008        	call	L74_EEPROM_Write_U8
 599  0140 5b05          	addw	sp,#5
 600  0142 4d            	tnz	a
 601  0143 2602          	jrne	L761
 602                     ; 156 		  result = FALSE;
 604  0145 0f01          	clr	(OFST+0,sp)
 606  0147               L761:
 607                     ; 159     if (result == TRUE)
 609  0147 7b01          	ld	a,(OFST+0,sp)
 610  0149 a101          	cp	a,#1
 611  014b 261e          	jrne	L322
 612                     ; 161         if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, CALIBRATION_MAGIC_VALUE)){
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
 625                     ; 162 		  result = FALSE;
 627  0161 0f01          	clr	(OFST+0,sp)
 630  0163 2006          	jra	L322
 631  0165               L522:
 632                     ; 165 		  magic = CALIBRATION_MAGIC_VALUE;
 634  0165 aeb00b        	ldw	x,#45067
 635  0168 cf0000        	ldw	_magic,x
 636  016b               L322:
 637                     ; 170     FLASH_Lock(FLASH_MemType_Data);
 639  016b a6f7          	ld	a,#247
 640  016d cd0000        	call	_FLASH_Lock
 642                     ; 172     return result;
 644  0170 7b01          	ld	a,(OFST+0,sp)
 647  0172 5b01          	addw	sp,#1
 648  0174 81            	ret
 695                     ; 175 static uint16_t EEPROM_Read_U16(uint32_t address){
 696                     	switch	.text
 697  0175               L5_EEPROM_Read_U16:
 699  0175 5204          	subw	sp,#4
 700       00000004      OFST:	set	4
 703                     ; 181   low_byte = (uint16_t)FLASH_ReadByte(address);
 705  0177 1e09          	ldw	x,(OFST+5,sp)
 706  0179 89            	pushw	x
 707  017a 1e09          	ldw	x,(OFST+5,sp)
 708  017c 89            	pushw	x
 709  017d cd0000        	call	_FLASH_ReadByte
 711  0180 5b04          	addw	sp,#4
 712  0182 5f            	clrw	x
 713  0183 97            	ld	xl,a
 714  0184 1f01          	ldw	(OFST-3,sp),x
 716                     ; 182   high_byte = (uint16_t)FLASH_ReadByte(address + 1u);
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
 736                     ; 184   return (uint16_t)(low_byte | (high_byte << 8));
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
 783                     ; 187 void Calibration_Read_EEPROM(void){
 784                     	switch	.text
 785  01af               _Calibration_Read_EEPROM:
 789                     ; 191   magic = EEPROM_Read_U16(EEPROM_MAGIC_ADDRESS);
 791  01af ae1000        	ldw	x,#4096
 792  01b2 89            	pushw	x
 793  01b3 ae0000        	ldw	x,#0
 794  01b6 89            	pushw	x
 795  01b7 adbc          	call	L5_EEPROM_Read_U16
 797  01b9 5b04          	addw	sp,#4
 798  01bb cf0000        	ldw	_magic,x
 799                     ; 193   stick_high_position = EEPROM_Read_U16(EEPROM_STICK_HIGH_ADDRESS);
 801  01be ae1002        	ldw	x,#4098
 802  01c1 89            	pushw	x
 803  01c2 ae0000        	ldw	x,#0
 804  01c5 89            	pushw	x
 805  01c6 adad          	call	L5_EEPROM_Read_U16
 807  01c8 5b04          	addw	sp,#4
 808  01ca cf0002        	ldw	_stick_high_position,x
 809                     ; 195   stick_low_position = EEPROM_Read_U16(EEPROM_STICK_LOW_ADDRESS);
 811  01cd ae1004        	ldw	x,#4100
 812  01d0 89            	pushw	x
 813  01d1 ae0000        	ldw	x,#0
 814  01d4 89            	pushw	x
 815  01d5 ad9e          	call	L5_EEPROM_Read_U16
 817  01d7 5b04          	addw	sp,#4
 818  01d9 cf0004        	ldw	_stick_low_position,x
 819                     ; 197   pwm_upper_limit = EEPROM_Read_U16(EEPROM_PWM_UPPER_ADDRESS);
 821  01dc ae1006        	ldw	x,#4102
 822  01df 89            	pushw	x
 823  01e0 ae0000        	ldw	x,#0
 824  01e3 89            	pushw	x
 825  01e4 ad8f          	call	L5_EEPROM_Read_U16
 827  01e6 5b04          	addw	sp,#4
 828  01e8 cf0006        	ldw	_pwm_upper_limit,x
 829                     ; 199   pwm_lower_limit = EEPROM_Read_U16(EEPROM_PWM_LOWER_ADDRESS);  
 831  01eb ae1008        	ldw	x,#4104
 832  01ee 89            	pushw	x
 833  01ef ae0000        	ldw	x,#0
 834  01f2 89            	pushw	x
 835  01f3 ad80          	call	L5_EEPROM_Read_U16
 837  01f5 5b04          	addw	sp,#4
 838  01f7 cf0008        	ldw	_pwm_lower_limit,x
 839                     ; 201   glow_on = EEPROM_Read_U16(EEPROM_GLOW_ON_ADDRESS);
 841  01fa ae100a        	ldw	x,#4106
 842  01fd 89            	pushw	x
 843  01fe ae0000        	ldw	x,#0
 844  0201 89            	pushw	x
 845  0202 cd0175        	call	L5_EEPROM_Read_U16
 847  0205 5b04          	addw	sp,#4
 848  0207 cf000a        	ldw	_glow_on,x
 849                     ; 203   glow_off = EEPROM_Read_U16(EEPROM_GLOW_OFF_ADDRESS);
 851  020a ae100c        	ldw	x,#4108
 852  020d 89            	pushw	x
 853  020e ae0000        	ldw	x,#0
 854  0211 89            	pushw	x
 855  0212 cd0175        	call	L5_EEPROM_Read_U16
 857  0215 5b04          	addw	sp,#4
 858  0217 cf000c        	ldw	_glow_off,x
 859                     ; 205   throttle_inverted = FLASH_ReadByte(EEPROM_INVERTED_ADDRESS);
 861  021a ae100e        	ldw	x,#4110
 862  021d 89            	pushw	x
 863  021e ae0000        	ldw	x,#0
 864  0221 89            	pushw	x
 865  0222 cd0000        	call	_FLASH_ReadByte
 867  0225 5b04          	addw	sp,#4
 868  0227 c7000e        	ld	_throttle_inverted,a
 869                     ; 206 }
 872  022a 81            	ret
 911                     .const:	section	.text
 912  0000               L42:
 913  0000 00000064      	dc.l	100
 914                     ; 208 void Calibration_Averaging(void){
 915                     	switch	.text
 916  022b               _Calibration_Averaging:
 918  022b 5206          	subw	sp,#6
 919       00000006      OFST:	set	6
 922                     ; 211   int l = 0;
 924                     ; 213   sample_sum = 0;
 926  022d ae0000        	ldw	x,#0
 927  0230 cf0011        	ldw	L71_sample_sum+2,x
 928  0233 ae0000        	ldw	x,#0
 929  0236 cf000f        	ldw	L71_sample_sum,x
 930                     ; 214   valid_sum = 0;
 932  0239 ae0000        	ldw	x,#0
 933  023c cf0015        	ldw	L12_valid_sum+2,x
 934  023f ae0000        	ldw	x,#0
 935  0242 cf0013        	ldw	L12_valid_sum,x
 936                     ; 215   sample_average = 0;
 938  0245 5f            	clrw	x
 939  0246 cf0017        	ldw	L32_sample_average,x
 940                     ; 216   calibrated_position = 0;
 942  0249 5f            	clrw	x
 943  024a cf0019        	ldw	L52_calibrated_position,x
 944                     ; 217   valid_sample_count = 0;
 946  024d 725f001b      	clr	L72_valid_sample_count
 947                     ; 219   for (l = 0; l < 100; ++l){
 949  0251 5f            	clrw	x
 950  0252 1f05          	ldw	(OFST-1,sp),x
 952  0254               L572:
 953                     ; 221 	sample_sum += samples[l];
 955  0254 1e05          	ldw	x,(OFST-1,sp)
 956  0256 58            	sllw	x
 957  0257 de0007        	ldw	x,(L3_samples,x)
 958  025a cd0000        	call	c_uitolx
 960  025d ae000f        	ldw	x,#L71_sample_sum
 961  0260 cd0000        	call	c_lgadd
 963                     ; 219   for (l = 0; l < 100; ++l){
 965  0263 1e05          	ldw	x,(OFST-1,sp)
 966  0265 1c0001        	addw	x,#1
 967  0268 1f05          	ldw	(OFST-1,sp),x
 971  026a 9c            	rvf
 972  026b 1e05          	ldw	x,(OFST-1,sp)
 973  026d a30064        	cpw	x,#100
 974  0270 2fe2          	jrslt	L572
 975                     ; 224   sample_average = sample_sum / 100U;
 977  0272 ae000f        	ldw	x,#L71_sample_sum
 978  0275 cd0000        	call	c_ltor
 980  0278 ae0000        	ldw	x,#L42
 981  027b cd0000        	call	c_ludv
 983  027e be02          	ldw	x,c_lreg+2
 984  0280 cf0017        	ldw	L32_sample_average,x
 985                     ; 226   for (l = 0; l < 100; ++l){
 987  0283 5f            	clrw	x
 988  0284 1f05          	ldw	(OFST-1,sp),x
 990  0286               L303:
 991                     ; 228 	if ((samples[l] >= (sample_average - 20U)) && (samples[l] <= (sample_average + 20U))){
 993  0286 1e05          	ldw	x,(OFST-1,sp)
 994  0288 58            	sllw	x
 995  0289 90ce0017      	ldw	y,L32_sample_average
 996  028d 72a20014      	subw	y,#20
 997  0291 90bf00        	ldw	c_y,y
 998  0294 9093          	ldw	y,x
 999  0296 90de0007      	ldw	y,(L3_samples,y)
1000  029a 90b300        	cpw	y,c_y
1001  029d 252c          	jrult	L113
1003  029f 1e05          	ldw	x,(OFST-1,sp)
1004  02a1 58            	sllw	x
1005  02a2 90ce0017      	ldw	y,L32_sample_average
1006  02a6 72a90014      	addw	y,#20
1007  02aa 90bf00        	ldw	c_y,y
1008  02ad 9093          	ldw	y,x
1009  02af 90de0007      	ldw	y,(L3_samples,y)
1010  02b3 90b300        	cpw	y,c_y
1011  02b6 2213          	jrugt	L113
1012                     ; 230 	valid_sum += samples[l];
1014  02b8 1e05          	ldw	x,(OFST-1,sp)
1015  02ba 58            	sllw	x
1016  02bb de0007        	ldw	x,(L3_samples,x)
1017  02be cd0000        	call	c_uitolx
1019  02c1 ae0013        	ldw	x,#L12_valid_sum
1020  02c4 cd0000        	call	c_lgadd
1022                     ; 232 	++valid_sample_count;
1024  02c7 725c001b      	inc	L72_valid_sample_count
1025  02cb               L113:
1026                     ; 226   for (l = 0; l < 100; ++l){
1028  02cb 1e05          	ldw	x,(OFST-1,sp)
1029  02cd 1c0001        	addw	x,#1
1030  02d0 1f05          	ldw	(OFST-1,sp),x
1034  02d2 9c            	rvf
1035  02d3 1e05          	ldw	x,(OFST-1,sp)
1036  02d5 a30064        	cpw	x,#100
1037  02d8 2fac          	jrslt	L303
1038                     ; 235 	if (valid_sample_count > 0U){
1040  02da 725d001b      	tnz	L72_valid_sample_count
1041  02de 2724          	jreq	L513
1042                     ; 236 	  calibrated_position = (uint16_t)(valid_sum / valid_sample_count);
1044  02e0 c6001b        	ld	a,L72_valid_sample_count
1045  02e3 b703          	ld	c_lreg+3,a
1046  02e5 3f02          	clr	c_lreg+2
1047  02e7 3f01          	clr	c_lreg+1
1048  02e9 3f00          	clr	c_lreg
1049  02eb 96            	ldw	x,sp
1050  02ec 1c0001        	addw	x,#OFST-5
1051  02ef cd0000        	call	c_rtol
1054  02f2 ae0013        	ldw	x,#L12_valid_sum
1055  02f5 cd0000        	call	c_ltor
1057  02f8 96            	ldw	x,sp
1058  02f9 1c0001        	addw	x,#OFST-5
1059  02fc cd0000        	call	c_ludv
1061  02ff be02          	ldw	x,c_lreg+2
1062  0301 cf0019        	ldw	L52_calibrated_position,x
1064  0304               L513:
1065                     ; 243 }
1068  0304 5b06          	addw	sp,#6
1069  0306 81            	ret
1111                     ; 245 uint16_t Calibrate_Stick_Position(void){
1112                     	switch	.text
1113  0307               _Calibrate_Stick_Position:
1115  0307 89            	pushw	x
1116       00000002      OFST:	set	2
1119                     ; 246   int k = 0;
1121                     ; 248   stable_count = 0;
1123  0308 725f0000      	clr	L51_stable_count
1124                     ; 249   pwm_difference = 0;
1126  030c 5f            	clrw	x
1127  030d cf0005        	ldw	L7_pwm_difference,x
1128                     ; 250   previous_pwm = pwm_width_us;
1130  0310 ce0000        	ldw	x,_pwm_width_us
1131  0313 cf0003        	ldw	L11_previous_pwm,x
1132                     ; 251   current_pwm = pwm_width_us;
1134  0316 ce0000        	ldw	x,_pwm_width_us
1135  0319 cf0001        	ldw	L31_current_pwm,x
1137  031c 2042          	jra	L733
1138  031e               L333:
1139                     ; 255 	Delay_ms(20);
1141  031e ae0014        	ldw	x,#20
1142  0321 cd0000        	call	_Delay_ms
1144                     ; 257 	current_pwm = pwm_width_us;
1146  0324 ce0000        	ldw	x,_pwm_width_us
1147  0327 cf0001        	ldw	L31_current_pwm,x
1148                     ; 259 	  if (current_pwm > previous_pwm){
1150  032a ce0001        	ldw	x,L31_current_pwm
1151  032d c30003        	cpw	x,L11_previous_pwm
1152  0330 230c          	jrule	L343
1153                     ; 261 		pwm_difference = current_pwm - previous_pwm;
1155  0332 ce0001        	ldw	x,L31_current_pwm
1156  0335 72b00003      	subw	x,L11_previous_pwm
1157  0339 cf0005        	ldw	L7_pwm_difference,x
1159  033c 200a          	jra	L543
1160  033e               L343:
1161                     ; 265 		pwm_difference = previous_pwm - current_pwm;
1163  033e ce0003        	ldw	x,L11_previous_pwm
1164  0341 72b00001      	subw	x,L31_current_pwm
1165  0345 cf0005        	ldw	L7_pwm_difference,x
1166  0348               L543:
1167                     ; 268 	  if (pwm_difference <= 5u){
1169  0348 ce0005        	ldw	x,L7_pwm_difference
1170  034b a30006        	cpw	x,#6
1171  034e 2406          	jruge	L743
1172                     ; 269 		++stable_count;
1174  0350 725c0000      	inc	L51_stable_count
1176  0354 2004          	jra	L153
1177  0356               L743:
1178                     ; 273 		stable_count = 0;
1180  0356 725f0000      	clr	L51_stable_count
1181  035a               L153:
1182                     ; 275 	previous_pwm = current_pwm;
1184  035a ce0001        	ldw	x,L31_current_pwm
1185  035d cf0003        	ldw	L11_previous_pwm,x
1186  0360               L733:
1187                     ; 253   while (stable_count < 20u){
1189  0360 c60000        	ld	a,L51_stable_count
1190  0363 a114          	cp	a,#20
1191  0365 25b7          	jrult	L333
1192                     ; 278 	for (k = 0; k < 100; ++k){
1194  0367 5f            	clrw	x
1195  0368 1f01          	ldw	(OFST-1,sp),x
1197  036a               L353:
1198                     ; 280 	  samples[k] = pwm_width_us;
1200  036a 1e01          	ldw	x,(OFST-1,sp)
1201  036c 58            	sllw	x
1202  036d 90ce0000      	ldw	y,_pwm_width_us
1203  0371 df0007        	ldw	(L3_samples,x),y
1204                     ; 282 	  Delay_ms(50);
1206  0374 ae0032        	ldw	x,#50
1207  0377 cd0000        	call	_Delay_ms
1209                     ; 278 	for (k = 0; k < 100; ++k){
1211  037a 1e01          	ldw	x,(OFST-1,sp)
1212  037c 1c0001        	addw	x,#1
1213  037f 1f01          	ldw	(OFST-1,sp),x
1217  0381 9c            	rvf
1218  0382 1e01          	ldw	x,(OFST-1,sp)
1219  0384 a30064        	cpw	x,#100
1220  0387 2fe1          	jrslt	L353
1221                     ; 285   Calibration_Averaging();
1223  0389 cd022b        	call	_Calibration_Averaging
1225                     ; 287   return calibrated_position;
1227  038c ce0019        	ldw	x,L52_calibrated_position
1230  038f 5b02          	addw	sp,#2
1231  0391 81            	ret
1268                     ; 290 void Calibrate_Stick_Limits(void){
1269                     	switch	.text
1270  0392               _Calibrate_Stick_Limits:
1272  0392 89            	pushw	x
1273       00000002      OFST:	set	2
1276                     ; 291   int i = 0;
1278                     ; 293   stick_high_position = Calibrate_Stick_Position();
1280  0393 cd0307        	call	_Calibrate_Stick_Position
1282  0396 cf0002        	ldw	_stick_high_position,x
1283                     ; 295 	ledFlash(3, 500);
1285  0399 ae01f4        	ldw	x,#500
1286  039c 89            	pushw	x
1287  039d a603          	ld	a,#3
1288  039f cd0000        	call	_ledFlash
1290  03a2 85            	popw	x
1291                     ; 297 	  stick_low_position = Calibrate_Stick_Position();
1293  03a3 cd0307        	call	_Calibrate_Stick_Position
1295  03a6 cf0004        	ldw	_stick_low_position,x
1296                     ; 299 		ledFlash(4, 500);
1298  03a9 ae01f4        	ldw	x,#500
1299  03ac 89            	pushw	x
1300  03ad a604          	ld	a,#4
1301  03af cd0000        	call	_ledFlash
1303  03b2 85            	popw	x
1304                     ; 300 }
1307  03b3 85            	popw	x
1308  03b4 81            	ret
1345                     ; 302 void Calibrate_Glow_Limits(void){
1346                     	switch	.text
1347  03b5               _Calibrate_Glow_Limits:
1349  03b5 89            	pushw	x
1350       00000002      OFST:	set	2
1353                     ; 304   int i = 0;
1355                     ; 306   glow_off = Calibrate_Stick_Position();
1357  03b6 cd0307        	call	_Calibrate_Stick_Position
1359  03b9 cf000c        	ldw	_glow_off,x
1360                     ; 308 	ledFlash(5, 500);
1362  03bc ae01f4        	ldw	x,#500
1363  03bf 89            	pushw	x
1364  03c0 a605          	ld	a,#5
1365  03c2 cd0000        	call	_ledFlash
1367  03c5 85            	popw	x
1368                     ; 311 	  glow_on = Calibrate_Stick_Position();
1370  03c6 cd0307        	call	_Calibrate_Stick_Position
1372  03c9 cf000a        	ldw	_glow_on,x
1373                     ; 313 		ledFlash(6, 500);
1375  03cc ae01f4        	ldw	x,#500
1376  03cf 89            	pushw	x
1377  03d0 a606          	ld	a,#6
1378  03d2 cd0000        	call	_ledFlash
1380  03d5 85            	popw	x
1381                     ; 314 }
1384  03d6 85            	popw	x
1385  03d7 81            	ret
1413                     ; 316 bool Calibration_Data_VALID(void)
1413                     ; 317 {
1414                     	switch	.text
1415  03d8               _Calibration_Data_VALID:
1419                     ; 318     if (magic != CALIBRATION_MAGIC_VALUE)
1421  03d8 ce0000        	ldw	x,_magic
1422  03db a3b00b        	cpw	x,#45067
1423  03de 2702          	jreq	L124
1424                     ; 320         return FALSE;
1426  03e0 4f            	clr	a
1429  03e1 81            	ret
1430  03e2               L124:
1431                     ; 323     if (pwm_lower_limit >= pwm_upper_limit)
1433  03e2 ce0008        	ldw	x,_pwm_lower_limit
1434  03e5 c30006        	cpw	x,_pwm_upper_limit
1435  03e8 2502          	jrult	L324
1436                     ; 325         return FALSE;
1438  03ea 4f            	clr	a
1441  03eb 81            	ret
1442  03ec               L324:
1443                     ; 328     return TRUE;
1445  03ec a601          	ld	a,#1
1448  03ee 81            	ret
1490                     ; 331 void Calibration_Sequence_Main(void){
1491                     	switch	.text
1492  03ef               _Calibration_Sequence_Main:
1494  03ef 89            	pushw	x
1495       00000002      OFST:	set	2
1498                     ; 338   int i = 0;
1500                     ; 340   ledFlash(10, 500);
1502  03f0 ae01f4        	ldw	x,#500
1503  03f3 89            	pushw	x
1504  03f4 a60a          	ld	a,#10
1505  03f6 cd0000        	call	_ledFlash
1507  03f9 85            	popw	x
1508                     ; 342   Calibrate_Stick_Limits();
1510  03fa ad96          	call	_Calibrate_Stick_Limits
1512                     ; 344   Calibrate_Glow_Limits();
1514  03fc adb7          	call	_Calibrate_Glow_Limits
1516                     ; 346   if (stick_high_position > stick_low_position){
1518  03fe ce0002        	ldw	x,_stick_high_position
1519  0401 c30004        	cpw	x,_stick_low_position
1520  0404 2312          	jrule	L144
1521                     ; 347 		pwm_upper_limit = stick_high_position;
1523  0406 ce0002        	ldw	x,_stick_high_position
1524  0409 cf0006        	ldw	_pwm_upper_limit,x
1525                     ; 348 		pwm_lower_limit = stick_low_position;
1527  040c ce0004        	ldw	x,_stick_low_position
1528  040f cf0008        	ldw	_pwm_lower_limit,x
1529                     ; 349 		throttle_inverted = FALSE;
1531  0412 725f000e      	clr	_throttle_inverted
1533  0416 2010          	jra	L344
1534  0418               L144:
1535                     ; 352 		pwm_upper_limit = stick_low_position;
1537  0418 ce0004        	ldw	x,_stick_low_position
1538  041b cf0006        	ldw	_pwm_upper_limit,x
1539                     ; 353 		pwm_lower_limit = stick_high_position;
1541  041e ce0002        	ldw	x,_stick_high_position
1542  0421 cf0008        	ldw	_pwm_lower_limit,x
1543                     ; 354 		throttle_inverted = TRUE;
1545  0424 3501000e      	mov	_throttle_inverted,#1
1546  0428               L344:
1547                     ; 357   Calibration_Write_EEPROM();
1549  0428 cd0081        	call	_Calibration_Write_EEPROM
1551                     ; 359   ledFlash(10, 500);
1553  042b ae01f4        	ldw	x,#500
1554  042e 89            	pushw	x
1555  042f a60a          	ld	a,#10
1556  0431 cd0000        	call	_ledFlash
1558  0434 85            	popw	x
1559                     ; 360 }
1562  0435 85            	popw	x
1563  0436 81            	ret
1725                     	switch	.bss
1726  0000               L51_stable_count:
1727  0000 00            	ds.b	1
1728  0001               L31_current_pwm:
1729  0001 0000          	ds.b	2
1730  0003               L11_previous_pwm:
1731  0003 0000          	ds.b	2
1732  0005               L7_pwm_difference:
1733  0005 0000          	ds.b	2
1734  0007               L3_samples:
1735  0007 000000000000  	ds.b	200
1736                     	xref	_pwm_width_us
1737                     	xref	_ledFlash
1738                     	xref	_Delay_ms
1739                     	xdef	_EEPROM_Write_U16
1740                     	xdef	_Calibrate_Stick_Position
1741                     	xdef	_Calibrate_Glow_Limits
1742                     	xdef	_Calibrate_Stick_Limits
1743                     	xdef	_Calibration_Averaging
1744                     	xdef	_Calibration_Sequence_Main
1745                     	xdef	_Calibration_Data_VALID
1746                     	xdef	_Calibration_Write_EEPROM
1747                     	xdef	_Calibration_Read_EEPROM
1748                     	xdef	_EEPROM_Setup
1749                     	xdef	_throttle_inverted
1750                     	xdef	_magic
1751                     	xdef	_glow_off
1752                     	xdef	_glow_on
1753                     	xdef	_pwm_lower_limit
1754                     	xdef	_pwm_upper_limit
1755                     	xdef	_stick_low_position
1756                     	xdef	_stick_high_position
1757                     	xref	_FLASH_WaitForLastOperation
1758                     	xref	_FLASH_ReadByte
1759                     	xref	_FLASH_ProgramByte
1760                     	xref	_FLASH_Lock
1761                     	xref	_FLASH_Unlock
1762                     	xref	_FLASH_DeInit
1763                     	xref	_FLASH_SetProgrammingTime
1764                     	xref.b	c_lreg
1765                     	xref.b	c_x
1766                     	xref.b	c_y
1786                     	xref	c_rtol
1787                     	xref	c_ludv
1788                     	xref	c_lgadd
1789                     	xref	c_uitolx
1790                     	xref	c_ladc
1791                     	xref	c_ltor
1792                     	end
