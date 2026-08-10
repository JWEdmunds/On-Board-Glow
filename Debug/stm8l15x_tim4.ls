   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  42                     ; 130 void TIM4_DeInit(void)
  42                     ; 131 {
  44                     	switch	.text
  45  0000               _TIM4_DeInit:
  49                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  51  0000 725f52e0      	clr	21216
  52                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  54  0004 725f52e1      	clr	21217
  55                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  57  0008 725f52e2      	clr	21218
  58                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  60  000c 725f52e4      	clr	21220
  61                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  63  0010 725f52e7      	clr	21223
  64                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  66  0014 725f52e8      	clr	21224
  67                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  69  0018 35ff52e9      	mov	21225,#255
  70                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  72  001c 725f52e5      	clr	21221
  73                     ; 140 }
  76  0020 81            	ret
 242                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 242                     ; 166                        uint8_t TIM4_Period)
 242                     ; 167 {
 243                     	switch	.text
 244  0021               _TIM4_TimeBaseInit:
 248                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 250                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 252  0021 9f            	ld	a,xl
 253  0022 c752e9        	ld	21225,a
 254                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 256  0025 9e            	ld	a,xh
 257  0026 c752e8        	ld	21224,a
 258                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 260  0029 350152e6      	mov	21222,#1
 261                     ; 177 }
 264  002d 81            	ret
 332                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 332                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 332                     ; 207 {
 333                     	switch	.text
 334  002e               _TIM4_PrescalerConfig:
 338                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 340                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 342                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 344  002e 9e            	ld	a,xh
 345  002f c752e8        	ld	21224,a
 346                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 348  0032 9f            	ld	a,xl
 349  0033 a101          	cp	a,#1
 350  0035 2606          	jrne	L731
 351                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 353  0037 721052e6      	bset	21222,#0
 355  003b 2004          	jra	L141
 356  003d               L731:
 357                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 359  003d 721152e6      	bres	21222,#0
 360  0041               L141:
 361                     ; 224 }
 364  0041 81            	ret
 396                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 396                     ; 233 {
 397                     	switch	.text
 398  0042               _TIM4_SetCounter:
 402                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 404  0042 c752e7        	ld	21223,a
 405                     ; 236 }
 408  0045 81            	ret
 440                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 440                     ; 245 {
 441                     	switch	.text
 442  0046               _TIM4_SetAutoreload:
 446                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 448  0046 c752e9        	ld	21225,a
 449                     ; 248 }
 452  0049 81            	ret
 484                     ; 255 uint8_t TIM4_GetCounter(void)
 484                     ; 256 {
 485                     	switch	.text
 486  004a               _TIM4_GetCounter:
 488  004a 88            	push	a
 489       00000001      OFST:	set	1
 492                     ; 257   uint8_t tmpcntr = 0;
 494                     ; 258   tmpcntr = TIM4->CNTR;
 496  004b c652e7        	ld	a,21223
 497  004e 6b01          	ld	(OFST+0,sp),a
 499                     ; 260   return ((uint8_t)tmpcntr);
 501  0050 7b01          	ld	a,(OFST+0,sp)
 504  0052 5b01          	addw	sp,#1
 505  0054 81            	ret
 529                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 529                     ; 285 {
 530                     	switch	.text
 531  0055               _TIM4_GetPrescaler:
 535                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 537  0055 c652e8        	ld	a,21224
 540  0058 81            	ret
 596                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 596                     ; 297 {
 597                     	switch	.text
 598  0059               _TIM4_UpdateDisableConfig:
 602                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 604                     ; 302   if (NewState != DISABLE)
 606  0059 4d            	tnz	a
 607  005a 2706          	jreq	L542
 608                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 610  005c 721252e0      	bset	21216,#1
 612  0060 2004          	jra	L742
 613  0062               L542:
 614                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 616  0062 721352e0      	bres	21216,#1
 617  0066               L742:
 618                     ; 310 }
 621  0066 81            	ret
 679                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 679                     ; 321 {
 680                     	switch	.text
 681  0067               _TIM4_UpdateRequestConfig:
 685                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 687                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 689  0067 a101          	cp	a,#1
 690  0069 2606          	jrne	L772
 691                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 693  006b 721452e0      	bset	21216,#2
 695  006f 2004          	jra	L103
 696  0071               L772:
 697                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 699  0071 721552e0      	bres	21216,#2
 700  0075               L103:
 701                     ; 334 }
 704  0075 81            	ret
 740                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 740                     ; 343 {
 741                     	switch	.text
 742  0076               _TIM4_ARRPreloadConfig:
 746                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 748                     ; 348   if (NewState != DISABLE)
 750  0076 4d            	tnz	a
 751  0077 2706          	jreq	L123
 752                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 754  0079 721e52e0      	bset	21216,#7
 756  007d 2004          	jra	L323
 757  007f               L123:
 758                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 760  007f 721f52e0      	bres	21216,#7
 761  0083               L323:
 762                     ; 356 }
 765  0083 81            	ret
 822                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 822                     ; 367 {
 823                     	switch	.text
 824  0084               _TIM4_SelectOnePulseMode:
 828                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 830                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 832  0084 a101          	cp	a,#1
 833  0086 2606          	jrne	L353
 834                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 836  0088 721652e0      	bset	21216,#3
 838  008c 2004          	jra	L553
 839  008e               L353:
 840                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 842  008e 721752e0      	bres	21216,#3
 843  0092               L553:
 844                     ; 380 }
 847  0092 81            	ret
 882                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 882                     ; 389 {
 883                     	switch	.text
 884  0093               _TIM4_Cmd:
 888                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 890                     ; 394   if (NewState != DISABLE)
 892  0093 4d            	tnz	a
 893  0094 2706          	jreq	L573
 894                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 896  0096 721052e0      	bset	21216,#0
 898  009a 2004          	jra	L773
 899  009c               L573:
 900                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 902  009c 721152e0      	bres	21216,#0
 903  00a0               L773:
 904                     ; 402 }
 907  00a0 81            	ret
 972                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 972                     ; 431 {
 973                     	switch	.text
 974  00a1               _TIM4_ITConfig:
 976  00a1 89            	pushw	x
 977       00000000      OFST:	set	0
 980                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 982                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 984                     ; 436   if (NewState != DISABLE)
 986  00a2 9f            	ld	a,xl
 987  00a3 4d            	tnz	a
 988  00a4 2709          	jreq	L334
 989                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 991  00a6 9e            	ld	a,xh
 992  00a7 ca52e4        	or	a,21220
 993  00aa c752e4        	ld	21220,a
 995  00ad 2009          	jra	L534
 996  00af               L334:
 997                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 999  00af 7b01          	ld	a,(OFST+1,sp)
1000  00b1 43            	cpl	a
1001  00b2 c452e4        	and	a,21220
1002  00b5 c752e4        	ld	21220,a
1003  00b8               L534:
1004                     ; 446 }
1007  00b8 85            	popw	x
1008  00b9 81            	ret
1065                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1065                     ; 457 {
1066                     	switch	.text
1067  00ba               _TIM4_GenerateEvent:
1071                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1073                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1075  00ba ca52e6        	or	a,21222
1076  00bd c752e6        	ld	21222,a
1077                     ; 463 }
1080  00c0 81            	ret
1166                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1166                     ; 475 {
1167                     	switch	.text
1168  00c1               _TIM4_GetFlagStatus:
1170  00c1 88            	push	a
1171       00000001      OFST:	set	1
1174                     ; 476   FlagStatus bitstatus = RESET;
1176                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1178                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1180  00c2 c452e5        	and	a,21221
1181  00c5 2706          	jreq	L725
1182                     ; 483     bitstatus = SET;
1184  00c7 a601          	ld	a,#1
1185  00c9 6b01          	ld	(OFST+0,sp),a
1188  00cb 2002          	jra	L135
1189  00cd               L725:
1190                     ; 487     bitstatus = RESET;
1192  00cd 0f01          	clr	(OFST+0,sp)
1194  00cf               L135:
1195                     ; 489   return ((FlagStatus)bitstatus);
1197  00cf 7b01          	ld	a,(OFST+0,sp)
1200  00d1 5b01          	addw	sp,#1
1201  00d3 81            	ret
1236                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1236                     ; 501 {
1237                     	switch	.text
1238  00d4               _TIM4_ClearFlag:
1242                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1244                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1246  00d4 43            	cpl	a
1247  00d5 c752e5        	ld	21221,a
1248                     ; 506 }
1251  00d8 81            	ret
1311                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1311                     ; 519 {
1312                     	switch	.text
1313  00d9               _TIM4_GetITStatus:
1315  00d9 88            	push	a
1316  00da 89            	pushw	x
1317       00000002      OFST:	set	2
1320                     ; 520   ITStatus bitstatus = RESET;
1322                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1326                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1328                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1330  00db c452e5        	and	a,21221
1331  00de 6b01          	ld	(OFST-1,sp),a
1333                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1335  00e0 c652e4        	ld	a,21220
1336  00e3 1403          	and	a,(OFST+1,sp)
1337  00e5 6b02          	ld	(OFST+0,sp),a
1339                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1341  00e7 0d01          	tnz	(OFST-1,sp)
1342  00e9 270a          	jreq	L775
1344  00eb 0d02          	tnz	(OFST+0,sp)
1345  00ed 2706          	jreq	L775
1346                     ; 533     bitstatus = (ITStatus)SET;
1348  00ef a601          	ld	a,#1
1349  00f1 6b02          	ld	(OFST+0,sp),a
1352  00f3 2002          	jra	L106
1353  00f5               L775:
1354                     ; 537     bitstatus = (ITStatus)RESET;
1356  00f5 0f02          	clr	(OFST+0,sp)
1358  00f7               L106:
1359                     ; 539   return ((ITStatus)bitstatus);
1361  00f7 7b02          	ld	a,(OFST+0,sp)
1364  00f9 5b03          	addw	sp,#3
1365  00fb 81            	ret
1401                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1401                     ; 551 {
1402                     	switch	.text
1403  00fc               _TIM4_ClearITPendingBit:
1407                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1409                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1411  00fc 43            	cpl	a
1412  00fd c752e5        	ld	21221,a
1413                     ; 557 }
1416  0100 81            	ret
1475                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1475                     ; 569 {
1476                     	switch	.text
1477  0101               _TIM4_DMACmd:
1479  0101 89            	pushw	x
1480       00000000      OFST:	set	0
1483                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1485                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1487                     ; 574   if (NewState != DISABLE)
1489  0102 9f            	ld	a,xl
1490  0103 4d            	tnz	a
1491  0104 2709          	jreq	L156
1492                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1494  0106 9e            	ld	a,xh
1495  0107 ca52e3        	or	a,21219
1496  010a c752e3        	ld	21219,a
1498  010d 2009          	jra	L356
1499  010f               L156:
1500                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1502  010f 7b01          	ld	a,(OFST+1,sp)
1503  0111 43            	cpl	a
1504  0112 c452e3        	and	a,21219
1505  0115 c752e3        	ld	21219,a
1506  0118               L356:
1507                     ; 584 }
1510  0118 85            	popw	x
1511  0119 81            	ret
1535                     ; 607 void TIM4_InternalClockConfig(void)
1535                     ; 608 {
1536                     	switch	.text
1537  011a               _TIM4_InternalClockConfig:
1541                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1543  011a c652e2        	ld	a,21218
1544  011d a4f8          	and	a,#248
1545  011f c752e2        	ld	21218,a
1546                     ; 611 }
1549  0122 81            	ret
1631                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1631                     ; 652 {
1632                     	switch	.text
1633  0123               _TIM4_SelectInputTrigger:
1635  0123 88            	push	a
1636  0124 88            	push	a
1637       00000001      OFST:	set	1
1640                     ; 653   uint8_t tmpsmcr = 0;
1642                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1644                     ; 658   tmpsmcr = TIM4->SMCR;
1646  0125 c652e2        	ld	a,21218
1647  0128 6b01          	ld	(OFST+0,sp),a
1649                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1651  012a 7b01          	ld	a,(OFST+0,sp)
1652  012c a48f          	and	a,#143
1653  012e 6b01          	ld	(OFST+0,sp),a
1655                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1657  0130 7b01          	ld	a,(OFST+0,sp)
1658  0132 1a02          	or	a,(OFST+1,sp)
1659  0134 6b01          	ld	(OFST+0,sp),a
1661                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1663  0136 7b01          	ld	a,(OFST+0,sp)
1664  0138 c752e2        	ld	21218,a
1665                     ; 665 }
1668  013b 85            	popw	x
1669  013c 81            	ret
1742                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1742                     ; 677 {
1743                     	switch	.text
1744  013d               _TIM4_SelectOutputTrigger:
1746  013d 88            	push	a
1747  013e 88            	push	a
1748       00000001      OFST:	set	1
1751                     ; 678   uint8_t tmpcr2 = 0;
1753                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1755                     ; 683   tmpcr2 = TIM4->CR2;
1757  013f c652e1        	ld	a,21217
1758  0142 6b01          	ld	(OFST+0,sp),a
1760                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1762  0144 7b01          	ld	a,(OFST+0,sp)
1763  0146 a48f          	and	a,#143
1764  0148 6b01          	ld	(OFST+0,sp),a
1766                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1768  014a 7b01          	ld	a,(OFST+0,sp)
1769  014c 1a02          	or	a,(OFST+1,sp)
1770  014e 6b01          	ld	(OFST+0,sp),a
1772                     ; 691   TIM4->CR2 = tmpcr2;
1774  0150 7b01          	ld	a,(OFST+0,sp)
1775  0152 c752e1        	ld	21217,a
1776                     ; 692 }
1779  0155 85            	popw	x
1780  0156 81            	ret
1869                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1869                     ; 707 {
1870                     	switch	.text
1871  0157               _TIM4_SelectSlaveMode:
1873  0157 88            	push	a
1874  0158 88            	push	a
1875       00000001      OFST:	set	1
1878                     ; 708   uint8_t tmpsmcr = 0;
1880                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1882                     ; 713   tmpsmcr = TIM4->SMCR;
1884  0159 c652e2        	ld	a,21218
1885  015c 6b01          	ld	(OFST+0,sp),a
1887                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1889  015e 7b01          	ld	a,(OFST+0,sp)
1890  0160 a4f8          	and	a,#248
1891  0162 6b01          	ld	(OFST+0,sp),a
1893                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1895  0164 7b01          	ld	a,(OFST+0,sp)
1896  0166 1a02          	or	a,(OFST+1,sp)
1897  0168 6b01          	ld	(OFST+0,sp),a
1899                     ; 721   TIM4->SMCR = tmpsmcr;
1901  016a 7b01          	ld	a,(OFST+0,sp)
1902  016c c752e2        	ld	21218,a
1903                     ; 722 }
1906  016f 85            	popw	x
1907  0170 81            	ret
1943                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1943                     ; 731 {
1944                     	switch	.text
1945  0171               _TIM4_SelectMasterSlaveMode:
1949                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1951                     ; 736   if (NewState != DISABLE)
1953  0171 4d            	tnz	a
1954  0172 2706          	jreq	L7201
1955                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1957  0174 721e52e2      	bset	21218,#7
1959  0178 2004          	jra	L1301
1960  017a               L7201:
1961                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1963  017a 721f52e2      	bres	21218,#7
1964  017e               L1301:
1965                     ; 744 }
1968  017e 81            	ret
1981                     	xdef	_TIM4_SelectMasterSlaveMode
1982                     	xdef	_TIM4_SelectSlaveMode
1983                     	xdef	_TIM4_SelectOutputTrigger
1984                     	xdef	_TIM4_SelectInputTrigger
1985                     	xdef	_TIM4_InternalClockConfig
1986                     	xdef	_TIM4_DMACmd
1987                     	xdef	_TIM4_ClearITPendingBit
1988                     	xdef	_TIM4_GetITStatus
1989                     	xdef	_TIM4_ClearFlag
1990                     	xdef	_TIM4_GetFlagStatus
1991                     	xdef	_TIM4_GenerateEvent
1992                     	xdef	_TIM4_ITConfig
1993                     	xdef	_TIM4_Cmd
1994                     	xdef	_TIM4_SelectOnePulseMode
1995                     	xdef	_TIM4_ARRPreloadConfig
1996                     	xdef	_TIM4_UpdateRequestConfig
1997                     	xdef	_TIM4_UpdateDisableConfig
1998                     	xdef	_TIM4_GetPrescaler
1999                     	xdef	_TIM4_GetCounter
2000                     	xdef	_TIM4_SetAutoreload
2001                     	xdef	_TIM4_SetCounter
2002                     	xdef	_TIM4_PrescalerConfig
2003                     	xdef	_TIM4_TimeBaseInit
2004                     	xdef	_TIM4_DeInit
2023                     	end
