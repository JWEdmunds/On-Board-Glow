   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  77                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  77                     ; 175 {
  79                     	switch	.text
  80  0000               _FLASH_SetProgrammingTime:
  84                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  86                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  88  0000 72115050      	bres	20560,#0
  89                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  91  0004 ca5050        	or	a,20560
  92  0007 c75050        	ld	20560,a
  93                     ; 181 }
  96  000a 81            	ret
 121                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 121                     ; 189 {
 122                     	switch	.text
 123  000b               _FLASH_GetProgrammingTime:
 127                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 129  000b c65050        	ld	a,20560
 130  000e a401          	and	a,#1
 133  0010 81            	ret
 189                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 189                     ; 204 {
 190                     	switch	.text
 191  0011               _FLASH_PowerWaitModeConfig:
 195                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 197                     ; 209   if(FLASH_Power != FLASH_Power_On)
 199  0011 a101          	cp	a,#1
 200  0013 2706          	jreq	L57
 201                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 203  0015 72145050      	bset	20560,#2
 205  0019 2004          	jra	L77
 206  001b               L57:
 207                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 209  001b 72155050      	bres	20560,#2
 210  001f               L77:
 211                     ; 218 }
 214  001f 81            	ret
 237                     ; 259 void FLASH_DeInit(void)
 237                     ; 260 {
 238                     	switch	.text
 239  0020               _FLASH_DeInit:
 243                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 245  0020 725f5050      	clr	20560
 246                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 248  0024 725f5051      	clr	20561
 249                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 251  0028 35405054      	mov	20564,#64
 252                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 254  002c c65054        	ld	a,20564
 255                     ; 265 }
 258  002f 81            	ret
 314                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 314                     ; 276 {
 315                     	switch	.text
 316  0030               _FLASH_Unlock:
 318  0030 88            	push	a
 319       00000000      OFST:	set	0
 322                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 324                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 326  0031 a1fd          	cp	a,#253
 327  0033 2608          	jrne	L731
 328                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 330  0035 35565052      	mov	20562,#86
 331                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 333  0039 35ae5052      	mov	20562,#174
 334  003d               L731:
 335                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 337  003d 7b01          	ld	a,(OFST+1,sp)
 338  003f a1f7          	cp	a,#247
 339  0041 2608          	jrne	L141
 340                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 342  0043 35ae5053      	mov	20563,#174
 343                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 345  0047 35565053      	mov	20563,#86
 346  004b               L141:
 347                     ; 293 }
 350  004b 84            	pop	a
 351  004c 81            	ret
 386                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 386                     ; 304 {
 387                     	switch	.text
 388  004d               _FLASH_Lock:
 392                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 394                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 396  004d c45054        	and	a,20564
 397  0050 c75054        	ld	20564,a
 398                     ; 310 }
 401  0053 81            	ret
 440                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 440                     ; 319 {
 441                     	switch	.text
 442  0054               _FLASH_ProgramByte:
 444       00000000      OFST:	set	0
 447                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 449                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 451  0054 7b07          	ld	a,(OFST+7,sp)
 452  0056 88            	push	a
 453  0057 7b05          	ld	a,(OFST+5,sp)
 454  0059 b700          	ld	c_x,a
 455  005b 1e06          	ldw	x,(OFST+6,sp)
 456  005d 84            	pop	a
 457  005e bf01          	ldw	c_x+1,x
 458  0060 92bd0000      	ldf	[c_x.e],a
 459                     ; 324 }
 462  0064 81            	ret
 494                     ; 331 void FLASH_EraseByte(uint32_t Address)
 494                     ; 332 {
 495                     	switch	.text
 496  0065               _FLASH_EraseByte:
 498       00000000      OFST:	set	0
 501                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 503                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 505  0065 7b04          	ld	a,(OFST+4,sp)
 506  0067 b700          	ld	c_x,a
 507  0069 1e05          	ldw	x,(OFST+5,sp)
 508  006b bf01          	ldw	c_x+1,x
 509  006d 4f            	clr	a
 510  006e 92bd0000      	ldf	[c_x.e],a
 511                     ; 337 }
 514  0072 81            	ret
 553                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 553                     ; 346 {
 554                     	switch	.text
 555  0073               _FLASH_ProgramWord:
 557       00000000      OFST:	set	0
 560                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 562                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 564  0073 721c5051      	bset	20561,#6
 565                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 567  0077 7b07          	ld	a,(OFST+7,sp)
 568  0079 88            	push	a
 569  007a 7b05          	ld	a,(OFST+5,sp)
 570  007c b700          	ld	c_x,a
 571  007e 1e06          	ldw	x,(OFST+6,sp)
 572  0080 84            	pop	a
 573  0081 bf01          	ldw	c_x+1,x
 574  0083 92bd0000      	ldf	[c_x.e],a
 575                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 577  0087 7b08          	ld	a,(OFST+8,sp)
 578  0089 88            	push	a
 579  008a 7b05          	ld	a,(OFST+5,sp)
 580  008c b700          	ld	c_x,a
 581  008e 1e06          	ldw	x,(OFST+6,sp)
 582  0090 84            	pop	a
 583  0091 90ae0001      	ldw	y,#1
 584  0095 bf01          	ldw	c_x+1,x
 585  0097 93            	ldw	x,y
 586  0098 92a70000      	ldf	([c_x.e],x),a
 587                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 589  009c 7b09          	ld	a,(OFST+9,sp)
 590  009e 88            	push	a
 591  009f 7b05          	ld	a,(OFST+5,sp)
 592  00a1 b700          	ld	c_x,a
 593  00a3 1e06          	ldw	x,(OFST+6,sp)
 594  00a5 84            	pop	a
 595  00a6 90ae0002      	ldw	y,#2
 596  00aa bf01          	ldw	c_x+1,x
 597  00ac 93            	ldw	x,y
 598  00ad 92a70000      	ldf	([c_x.e],x),a
 599                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 601  00b1 7b0a          	ld	a,(OFST+10,sp)
 602  00b3 88            	push	a
 603  00b4 7b05          	ld	a,(OFST+5,sp)
 604  00b6 b700          	ld	c_x,a
 605  00b8 1e06          	ldw	x,(OFST+6,sp)
 606  00ba 84            	pop	a
 607  00bb 90ae0003      	ldw	y,#3
 608  00bf bf01          	ldw	c_x+1,x
 609  00c1 93            	ldw	x,y
 610  00c2 92a70000      	ldf	([c_x.e],x),a
 611                     ; 360 }
 614  00c6 81            	ret
 646                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 646                     ; 368 {
 647                     	switch	.text
 648  00c7               _FLASH_ReadByte:
 650       00000000      OFST:	set	0
 653                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 655  00c7 7b04          	ld	a,(OFST+4,sp)
 656  00c9 b700          	ld	c_x,a
 657  00cb 1e05          	ldw	x,(OFST+5,sp)
 658  00cd bf01          	ldw	c_x+1,x
 659  00cf 92bc0000      	ldf	a,[c_x.e]
 662  00d3 81            	ret
 703                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 703                     ; 418 {
 704                     	switch	.text
 705  00d4               _FLASH_ProgramOptionByte:
 707  00d4 89            	pushw	x
 708       00000000      OFST:	set	0
 711                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 713                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 715  00d5 721e5051      	bset	20561,#7
 716                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 718  00d9 3f00          	clr	c_x
 719  00db 7b05          	ld	a,(OFST+5,sp)
 720  00dd bf01          	ldw	c_x+1,x
 721  00df 92bd0000      	ldf	[c_x.e],a
 722                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 724  00e3 a6fd          	ld	a,#253
 725  00e5 cd0272        	call	_FLASH_WaitForLastOperation
 727                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 729  00e8 721f5051      	bres	20561,#7
 730                     ; 432 }
 733  00ec 85            	popw	x
 734  00ed 81            	ret
 768                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 768                     ; 440 {
 769                     	switch	.text
 770  00ee               _FLASH_EraseOptionByte:
 774                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 776                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 778  00ee 721e5051      	bset	20561,#7
 779                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 781  00f2 3f00          	clr	c_x
 782  00f4 bf01          	ldw	c_x+1,x
 783  00f6 4f            	clr	a
 784  00f7 92bd0000      	ldf	[c_x.e],a
 785                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 787  00fb a6fd          	ld	a,#253
 788  00fd cd0272        	call	_FLASH_WaitForLastOperation
 790                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 792  0100 721f5051      	bres	20561,#7
 793                     ; 454 }
 796  0104 81            	ret
 853                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 853                     ; 463 {
 854                     	switch	.text
 855  0105               _FLASH_GetReadOutProtectionStatus:
 857  0105 88            	push	a
 858       00000001      OFST:	set	1
 861                     ; 464   FunctionalState state = DISABLE;
 863                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 865  0106 c64800        	ld	a,18432
 866  0109 a1aa          	cp	a,#170
 867  010b 2606          	jrne	L523
 868                     ; 469     state =  ENABLE;
 870  010d a601          	ld	a,#1
 871  010f 6b01          	ld	(OFST+0,sp),a
 874  0111 2002          	jra	L723
 875  0113               L523:
 876                     ; 474     state =  DISABLE;
 878  0113 0f01          	clr	(OFST+0,sp)
 880  0115               L723:
 881                     ; 477   return state;
 883  0115 7b01          	ld	a,(OFST+0,sp)
 886  0117 5b01          	addw	sp,#1
 887  0119 81            	ret
 919                     ; 485 uint16_t FLASH_GetBootSize(void)
 919                     ; 486 {
 920                     	switch	.text
 921  011a               _FLASH_GetBootSize:
 923  011a 89            	pushw	x
 924       00000002      OFST:	set	2
 927                     ; 487   uint16_t temp = 0;
 929                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 931  011b c64802        	ld	a,18434
 932  011e 5f            	clrw	x
 933  011f 97            	ld	xl,a
 934  0120 4f            	clr	a
 935  0121 02            	rlwa	x,a
 936  0122 44            	srl	a
 937  0123 56            	rrcw	x
 938  0124 1f01          	ldw	(OFST-1,sp),x
 940                     ; 493   if(OPT->UBC > 0x7F)
 942  0126 c64802        	ld	a,18434
 943  0129 a180          	cp	a,#128
 944  012b 2505          	jrult	L543
 945                     ; 495     temp = 8192;
 947  012d ae2000        	ldw	x,#8192
 948  0130 1f01          	ldw	(OFST-1,sp),x
 950  0132               L543:
 951                     ; 499   return(temp);
 953  0132 1e01          	ldw	x,(OFST-1,sp)
 956  0134 5b02          	addw	sp,#2
 957  0136 81            	ret
 989                     ; 508 uint16_t FLASH_GetCodeSize(void)
 989                     ; 509 {
 990                     	switch	.text
 991  0137               _FLASH_GetCodeSize:
 993  0137 89            	pushw	x
 994       00000002      OFST:	set	2
 997                     ; 510   uint16_t temp = 0;
 999                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
1001  0138 c64807        	ld	a,18439
1002  013b 5f            	clrw	x
1003  013c 97            	ld	xl,a
1004  013d 4f            	clr	a
1005  013e 02            	rlwa	x,a
1006  013f 44            	srl	a
1007  0140 56            	rrcw	x
1008  0141 1f01          	ldw	(OFST-1,sp),x
1010                     ; 516   if(OPT->PCODESIZE > 0x7F)
1012  0143 c64807        	ld	a,18439
1013  0146 a180          	cp	a,#128
1014  0148 2505          	jrult	L363
1015                     ; 518     temp = 8192;
1017  014a ae2000        	ldw	x,#8192
1018  014d 1f01          	ldw	(OFST-1,sp),x
1020  014f               L363:
1021                     ; 522   return(temp);
1023  014f 1e01          	ldw	x,(OFST-1,sp)
1026  0151 5b02          	addw	sp,#2
1027  0153 81            	ret
1062                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1062                     ; 548 {
1063                     	switch	.text
1064  0154               _FLASH_ITConfig:
1068                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 552   if(NewState != DISABLE)
1072  0154 4d            	tnz	a
1073  0155 2706          	jreq	L304
1074                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1076  0157 72125050      	bset	20560,#1
1078  015b 2004          	jra	L504
1079  015d               L304:
1080                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1082  015d 72135050      	bres	20560,#1
1083  0161               L504:
1084                     ; 562 }
1087  0161 81            	ret
1196                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1196                     ; 577 {
1197                     	switch	.text
1198  0162               _FLASH_GetFlagStatus:
1200  0162 88            	push	a
1201       00000001      OFST:	set	1
1204                     ; 578   FlagStatus status = RESET;
1206                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1208                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1210  0163 c45054        	and	a,20564
1211  0166 2706          	jreq	L754
1212                     ; 584     status = SET; /* Flash_FLAG is set*/
1214  0168 a601          	ld	a,#1
1215  016a 6b01          	ld	(OFST+0,sp),a
1218  016c 2002          	jra	L164
1219  016e               L754:
1220                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1222  016e 0f01          	clr	(OFST+0,sp)
1224  0170               L164:
1225                     ; 592   return status;
1227  0170 7b01          	ld	a,(OFST+0,sp)
1230  0172 5b01          	addw	sp,#1
1231  0174 81            	ret
1267                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1267                     ; 720 {
1268                     	switch	.text
1269  0175               _FLASH_PowerRunModeConfig:
1273                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1275                     ; 724   if(FLASH_Power != FLASH_Power_On)
1277  0175 a101          	cp	a,#1
1278  0177 2706          	jreq	L105
1279                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1281  0179 72165050      	bset	20560,#3
1283  017d 2004          	jra	L305
1284  017f               L105:
1285                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1287  017f 72175050      	bres	20560,#3
1288  0183               L305:
1289                     ; 732 }
1292  0183 81            	ret
1356                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1356                     ; 746 {
1357                     	switch	.text
1358  0184               _FLASH_GetPowerStatus:
1362                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1364  0184 c65050        	ld	a,20560
1365  0187 a40c          	and	a,#12
1368  0189 81            	ret
1466                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1466                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1466                     ; 767 {
1467                     	switch	.text
1468  018a               _FLASH_ProgramBlock:
1470  018a 89            	pushw	x
1471  018b 5206          	subw	sp,#6
1472       00000006      OFST:	set	6
1475                     ; 768   uint16_t Count = 0;
1477                     ; 769   uint32_t startaddress = 0;
1479                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1481                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1483                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1485  018d 7b0b          	ld	a,(OFST+5,sp)
1486  018f a1fd          	cp	a,#253
1487  0191 260c          	jrne	L575
1488                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1490                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1492  0193 ae8000        	ldw	x,#32768
1493  0196 1f03          	ldw	(OFST-3,sp),x
1494  0198 ae0000        	ldw	x,#0
1495  019b 1f01          	ldw	(OFST-5,sp),x
1498  019d 200a          	jra	L775
1499  019f               L575:
1500                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1502                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1504  019f ae1000        	ldw	x,#4096
1505  01a2 1f03          	ldw	(OFST-3,sp),x
1506  01a4 ae0000        	ldw	x,#0
1507  01a7 1f01          	ldw	(OFST-5,sp),x
1509  01a9               L775:
1510                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1512  01a9 1e07          	ldw	x,(OFST+1,sp)
1513  01ab a680          	ld	a,#128
1514  01ad cd0000        	call	c_cmulx
1516  01b0 96            	ldw	x,sp
1517  01b1 1c0001        	addw	x,#OFST-5
1518  01b4 cd0000        	call	c_lgadd
1521                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1523  01b7 0d0c          	tnz	(OFST+6,sp)
1524  01b9 2606          	jrne	L106
1525                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1527  01bb 72105051      	bset	20561,#0
1529  01bf 2004          	jra	L306
1530  01c1               L106:
1531                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1533  01c1 72185051      	bset	20561,#4
1534  01c5               L306:
1535                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1537  01c5 5f            	clrw	x
1538  01c6 1f05          	ldw	(OFST-1,sp),x
1540  01c8               L506:
1541                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1543  01c8 1e0d          	ldw	x,(OFST+7,sp)
1544  01ca 72fb05        	addw	x,(OFST-1,sp)
1545  01cd f6            	ld	a,(x)
1546  01ce 88            	push	a
1547  01cf 7b03          	ld	a,(OFST-3,sp)
1548  01d1 b700          	ld	c_x,a
1549  01d3 1e04          	ldw	x,(OFST-2,sp)
1550  01d5 84            	pop	a
1551  01d6 1605          	ldw	y,(OFST-1,sp)
1552  01d8 bf01          	ldw	c_x+1,x
1553  01da 93            	ldw	x,y
1554  01db 92a70000      	ldf	([c_x.e],x),a
1555                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1557  01df 1e05          	ldw	x,(OFST-1,sp)
1558  01e1 1c0001        	addw	x,#1
1559  01e4 1f05          	ldw	(OFST-1,sp),x
1563  01e6 1e05          	ldw	x,(OFST-1,sp)
1564  01e8 a30080        	cpw	x,#128
1565  01eb 25db          	jrult	L506
1566                     ; 805 }
1569  01ed 5b08          	addw	sp,#8
1570  01ef 81            	ret
1629                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1629                     ; 818 {
1630                     	switch	.text
1631  01f0               _FLASH_EraseBlock:
1633  01f0 89            	pushw	x
1634  01f1 5207          	subw	sp,#7
1635       00000007      OFST:	set	7
1638                     ; 819   uint32_t startaddress = 0;
1640                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1642                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1644  01f3 7b0c          	ld	a,(OFST+5,sp)
1645  01f5 a1fd          	cp	a,#253
1646  01f7 260c          	jrne	L146
1647                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1649                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1651  01f9 ae8000        	ldw	x,#32768
1652  01fc 1f03          	ldw	(OFST-4,sp),x
1653  01fe ae0000        	ldw	x,#0
1654  0201 1f01          	ldw	(OFST-6,sp),x
1657  0203 200a          	jra	L346
1658  0205               L146:
1659                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1661                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1663  0205 ae1000        	ldw	x,#4096
1664  0208 1f03          	ldw	(OFST-4,sp),x
1665  020a ae0000        	ldw	x,#0
1666  020d 1f01          	ldw	(OFST-6,sp),x
1668  020f               L346:
1669                     ; 847   pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1671  020f 1e08          	ldw	x,(OFST+1,sp)
1672  0211 a680          	ld	a,#128
1673  0213 cd0000        	call	c_cmulx
1675  0216 96            	ldw	x,sp
1676  0217 1c0001        	addw	x,#OFST-6
1677  021a cd0000        	call	c_ladd
1679  021d 450100        	mov	c_x,c_lreg+1
1680  0220 be02          	ldw	x,c_lreg+2
1681  0222 b600          	ld	a,c_x
1682  0224 6b05          	ld	(OFST-2,sp),a
1683  0226 1f06          	ldw	(OFST-1,sp),x
1685                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1687  0228 721a5051      	bset	20561,#5
1688                     ; 858   *pwFlash = (uint8_t)0;
1690  022c 7b05          	ld	a,(OFST-2,sp)
1691  022e b700          	ld	c_x,a
1692  0230 1e06          	ldw	x,(OFST-1,sp)
1693  0232 bf01          	ldw	c_x+1,x
1694  0234 4f            	clr	a
1695  0235 92bd0000      	ldf	[c_x.e],a
1696                     ; 859   *(pwFlash + 1) = (uint8_t)0;
1698  0239 7b05          	ld	a,(OFST-2,sp)
1699  023b b700          	ld	c_x,a
1700  023d 1e06          	ldw	x,(OFST-1,sp)
1701  023f 90ae0001      	ldw	y,#1
1702  0243 bf01          	ldw	c_x+1,x
1703  0245 93            	ldw	x,y
1704  0246 4f            	clr	a
1705  0247 92a70000      	ldf	([c_x.e],x),a
1706                     ; 860   *(pwFlash + 2) = (uint8_t)0;
1708  024b 7b05          	ld	a,(OFST-2,sp)
1709  024d b700          	ld	c_x,a
1710  024f 1e06          	ldw	x,(OFST-1,sp)
1711  0251 90ae0002      	ldw	y,#2
1712  0255 bf01          	ldw	c_x+1,x
1713  0257 93            	ldw	x,y
1714  0258 4f            	clr	a
1715  0259 92a70000      	ldf	([c_x.e],x),a
1716                     ; 861   *(pwFlash + 3) = (uint8_t)0;
1718  025d 7b05          	ld	a,(OFST-2,sp)
1719  025f b700          	ld	c_x,a
1720  0261 1e06          	ldw	x,(OFST-1,sp)
1721  0263 90ae0003      	ldw	y,#3
1722  0267 bf01          	ldw	c_x+1,x
1723  0269 93            	ldw	x,y
1724  026a 4f            	clr	a
1725  026b 92a70000      	ldf	([c_x.e],x),a
1726                     ; 863 }
1729  026f 5b09          	addw	sp,#9
1730  0271 81            	ret
1811                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1811                     ; 876 {
1812                     	switch	.text
1813  0272               _FLASH_WaitForLastOperation:
1815  0272 5203          	subw	sp,#3
1816       00000003      OFST:	set	3
1819                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1821  0274 aeffff        	ldw	x,#65535
1822  0277 1f01          	ldw	(OFST-2,sp),x
1824                     ; 878   uint8_t flagstatus = 0x00;
1826  0279 0f03          	clr	(OFST+0,sp)
1828                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1830  027b a1fd          	cp	a,#253
1831  027d 2628          	jrne	L717
1833  027f 200e          	jra	L507
1834  0281               L307:
1835                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1835                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1837  0281 c65054        	ld	a,20564
1838  0284 a405          	and	a,#5
1839  0286 6b03          	ld	(OFST+0,sp),a
1841                     ; 887       timeout--;
1843  0288 1e01          	ldw	x,(OFST-2,sp)
1844  028a 1d0001        	subw	x,#1
1845  028d 1f01          	ldw	(OFST-2,sp),x
1847  028f               L507:
1848                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1850  028f 0d03          	tnz	(OFST+0,sp)
1851  0291 261c          	jrne	L317
1853  0293 1e01          	ldw	x,(OFST-2,sp)
1854  0295 26ea          	jrne	L307
1855  0297 2016          	jra	L317
1856  0299               L517:
1857                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1857                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1859  0299 c65054        	ld	a,20564
1860  029c a441          	and	a,#65
1861  029e 6b03          	ld	(OFST+0,sp),a
1863                     ; 896       timeout--;
1865  02a0 1e01          	ldw	x,(OFST-2,sp)
1866  02a2 1d0001        	subw	x,#1
1867  02a5 1f01          	ldw	(OFST-2,sp),x
1869  02a7               L717:
1870                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1872  02a7 0d03          	tnz	(OFST+0,sp)
1873  02a9 2604          	jrne	L317
1875  02ab 1e01          	ldw	x,(OFST-2,sp)
1876  02ad 26ea          	jrne	L517
1877  02af               L317:
1878                     ; 900   if(timeout == 0x00)
1880  02af 1e01          	ldw	x,(OFST-2,sp)
1881  02b1 2604          	jrne	L527
1882                     ; 902     flagstatus = FLASH_Status_TimeOut;
1884  02b3 a602          	ld	a,#2
1885  02b5 6b03          	ld	(OFST+0,sp),a
1887  02b7               L527:
1888                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1890  02b7 7b03          	ld	a,(OFST+0,sp)
1893  02b9 5b03          	addw	sp,#3
1894  02bb 81            	ret
1907                     	xdef	_FLASH_WaitForLastOperation
1908                     	xdef	_FLASH_EraseBlock
1909                     	xdef	_FLASH_ProgramBlock
1910                     	xdef	_FLASH_GetPowerStatus
1911                     	xdef	_FLASH_PowerRunModeConfig
1912                     	xdef	_FLASH_GetFlagStatus
1913                     	xdef	_FLASH_ITConfig
1914                     	xdef	_FLASH_EraseOptionByte
1915                     	xdef	_FLASH_ProgramOptionByte
1916                     	xdef	_FLASH_GetReadOutProtectionStatus
1917                     	xdef	_FLASH_GetCodeSize
1918                     	xdef	_FLASH_GetBootSize
1919                     	xdef	_FLASH_ReadByte
1920                     	xdef	_FLASH_ProgramWord
1921                     	xdef	_FLASH_EraseByte
1922                     	xdef	_FLASH_ProgramByte
1923                     	xdef	_FLASH_Lock
1924                     	xdef	_FLASH_Unlock
1925                     	xdef	_FLASH_DeInit
1926                     	xdef	_FLASH_PowerWaitModeConfig
1927                     	xdef	_FLASH_SetProgrammingTime
1928                     	xdef	_FLASH_GetProgrammingTime
1929                     	xref.b	c_lreg
1930                     	xref.b	c_x
1949                     	xref	c_ladd
1950                     	xref	c_lgadd
1951                     	xref	c_cmulx
1952                     	end
