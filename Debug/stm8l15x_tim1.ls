   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  42                     ; 181 void TIM1_DeInit(void)
  42                     ; 182 {
  44                     	switch	.text
  45  0000               _TIM1_DeInit:
  49                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  51  0000 725f52b0      	clr	21168
  52                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  54  0004 725f52b1      	clr	21169
  55                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  57  0008 725f52b2      	clr	21170
  58                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  60  000c 725f52b3      	clr	21171
  61                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  63  0010 725f52b5      	clr	21173
  64                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  66  0014 725f52bd      	clr	21181
  67                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  69  0018 725f52be      	clr	21182
  70                     ; 193   TIM1->CCMR1 = 0x01;
  72  001c 350152b9      	mov	21177,#1
  73                     ; 194   TIM1->CCMR2 = 0x01;
  75  0020 350152ba      	mov	21178,#1
  76                     ; 195   TIM1->CCMR3 = 0x01;
  78  0024 350152bb      	mov	21179,#1
  79                     ; 196   TIM1->CCMR4 = 0x01;
  81  0028 350152bc      	mov	21180,#1
  82                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  84  002c 725f52bd      	clr	21181
  85                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  87  0030 725f52be      	clr	21182
  88                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  90  0034 725f52b9      	clr	21177
  91                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  93  0038 725f52ba      	clr	21178
  94                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  96  003c 725f52bb      	clr	21179
  97                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  99  0040 725f52bc      	clr	21180
 100                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 102  0044 725f52bf      	clr	21183
 103                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 105  0048 725f52c0      	clr	21184
 106                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 108  004c 725f52c1      	clr	21185
 109                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 111  0050 725f52c2      	clr	21186
 112                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 114  0054 35ff52c3      	mov	21187,#255
 115                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 117  0058 35ff52c4      	mov	21188,#255
 118                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 120  005c 725f52c6      	clr	21190
 121                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 123  0060 725f52c7      	clr	21191
 124                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 126  0064 725f52c8      	clr	21192
 127                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 129  0068 725f52c9      	clr	21193
 130                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 132  006c 725f52ca      	clr	21194
 133                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 135  0070 725f52cb      	clr	21195
 136                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 138  0074 725f52cc      	clr	21196
 139                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 141  0078 725f52cd      	clr	21197
 142                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 144  007c 725f52d0      	clr	21200
 145                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 147  0080 350152b8      	mov	21176,#1
 148                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 150  0084 725f52cf      	clr	21199
 151                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 153  0088 725f52ce      	clr	21198
 154                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 156  008c 725f52c5      	clr	21189
 157                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 159  0090 725f52b6      	clr	21174
 160                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 162  0094 725f52b7      	clr	21175
 163                     ; 225 }
 166  0098 81            	ret
 269                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 269                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 269                     ; 243                        uint16_t TIM1_Period,
 269                     ; 244                        uint8_t TIM1_RepetitionCounter)
 269                     ; 245 {
 270                     	switch	.text
 271  0099               _TIM1_TimeBaseInit:
 273  0099 89            	pushw	x
 274       00000000      OFST:	set	0
 277                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 279                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 281  009a 7b06          	ld	a,(OFST+6,sp)
 282  009c c752c3        	ld	21187,a
 283                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 285  009f 7b07          	ld	a,(OFST+7,sp)
 286  00a1 c752c4        	ld	21188,a
 287                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 289  00a4 9e            	ld	a,xh
 290  00a5 c752c1        	ld	21185,a
 291                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 293  00a8 9f            	ld	a,xl
 294  00a9 c752c2        	ld	21186,a
 295                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 295                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 297  00ac c652b0        	ld	a,21168
 298  00af a48f          	and	a,#143
 299  00b1 1a05          	or	a,(OFST+5,sp)
 300  00b3 c752b0        	ld	21168,a
 301                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 303  00b6 7b08          	ld	a,(OFST+8,sp)
 304  00b8 c752c5        	ld	21189,a
 305                     ; 265 }
 308  00bb 85            	popw	x
 309  00bc 81            	ret
 374                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 374                     ; 280 {
 375                     	switch	.text
 376  00bd               _TIM1_PrescalerConfig:
 378  00bd 89            	pushw	x
 379       00000000      OFST:	set	0
 382                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 384                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 386  00be 9e            	ld	a,xh
 387  00bf c752c1        	ld	21185,a
 388                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 390  00c2 9f            	ld	a,xl
 391  00c3 c752c2        	ld	21186,a
 392                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 394  00c6 7b05          	ld	a,(OFST+5,sp)
 395  00c8 c752b8        	ld	21176,a
 396                     ; 290 }
 399  00cb 85            	popw	x
 400  00cc 81            	ret
 436                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 436                     ; 304 {
 437                     	switch	.text
 438  00cd               _TIM1_CounterModeConfig:
 440  00cd 88            	push	a
 441       00000000      OFST:	set	0
 444                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 446                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 446                     ; 311                         | (uint8_t)TIM1_CounterMode);
 448  00ce c652b0        	ld	a,21168
 449  00d1 a48f          	and	a,#143
 450  00d3 1a01          	or	a,(OFST+1,sp)
 451  00d5 c752b0        	ld	21168,a
 452                     ; 312 }
 455  00d8 84            	pop	a
 456  00d9 81            	ret
 488                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 488                     ; 321 {
 489                     	switch	.text
 490  00da               _TIM1_SetCounter:
 494                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 496  00da 9e            	ld	a,xh
 497  00db c752bf        	ld	21183,a
 498                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 500  00de 9f            	ld	a,xl
 501  00df c752c0        	ld	21184,a
 502                     ; 325 }
 505  00e2 81            	ret
 537                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 537                     ; 334 {
 538                     	switch	.text
 539  00e3               _TIM1_SetAutoreload:
 543                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 545  00e3 9e            	ld	a,xh
 546  00e4 c752c3        	ld	21187,a
 547                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 549  00e7 9f            	ld	a,xl
 550  00e8 c752c4        	ld	21188,a
 551                     ; 338 }
 554  00eb 81            	ret
 600                     ; 345 uint16_t TIM1_GetCounter(void)
 600                     ; 346 {
 601                     	switch	.text
 602  00ec               _TIM1_GetCounter:
 604  00ec 5204          	subw	sp,#4
 605       00000004      OFST:	set	4
 608                     ; 348   uint16_t tmpcntr = 0;
 610                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 614                     ; 351   tmpcntrh = TIM1->CNTRH;
 616  00ee c652bf        	ld	a,21183
 617  00f1 6b02          	ld	(OFST-2,sp),a
 619                     ; 352   tmpcntrl = TIM1->CNTRL;
 621  00f3 c652c0        	ld	a,21184
 622  00f6 6b01          	ld	(OFST-3,sp),a
 624                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 626  00f8 7b01          	ld	a,(OFST-3,sp)
 627  00fa 5f            	clrw	x
 628  00fb 97            	ld	xl,a
 629  00fc 1f03          	ldw	(OFST-1,sp),x
 631                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 633  00fe 7b02          	ld	a,(OFST-2,sp)
 634  0100 5f            	clrw	x
 635  0101 97            	ld	xl,a
 636  0102 4f            	clr	a
 637  0103 02            	rlwa	x,a
 638  0104 01            	rrwa	x,a
 639  0105 1a04          	or	a,(OFST+0,sp)
 640  0107 01            	rrwa	x,a
 641  0108 1a03          	or	a,(OFST-1,sp)
 642  010a 01            	rrwa	x,a
 643  010b 1f03          	ldw	(OFST-1,sp),x
 645                     ; 358   return (uint16_t)tmpcntr;
 647  010d 1e03          	ldw	x,(OFST-1,sp)
 650  010f 5b04          	addw	sp,#4
 651  0111 81            	ret
 683                     ; 366 uint16_t TIM1_GetPrescaler(void)
 683                     ; 367 {
 684                     	switch	.text
 685  0112               _TIM1_GetPrescaler:
 687  0112 89            	pushw	x
 688       00000002      OFST:	set	2
 691                     ; 368   uint16_t tmpreg = 0;
 693                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 695  0113 c652c1        	ld	a,21185
 696  0116 5f            	clrw	x
 697  0117 97            	ld	xl,a
 698  0118 4f            	clr	a
 699  0119 02            	rlwa	x,a
 700  011a 1f01          	ldw	(OFST-1,sp),x
 702                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 704  011c c652c2        	ld	a,21186
 705  011f 5f            	clrw	x
 706  0120 97            	ld	xl,a
 707  0121 01            	rrwa	x,a
 708  0122 1a02          	or	a,(OFST+0,sp)
 709  0124 01            	rrwa	x,a
 710  0125 1a01          	or	a,(OFST-1,sp)
 711  0127 01            	rrwa	x,a
 714  0128 5b02          	addw	sp,#2
 715  012a 81            	ret
 771                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 771                     ; 381 {
 772                     	switch	.text
 773  012b               _TIM1_UpdateDisableConfig:
 777                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 779                     ; 386   if (NewState != DISABLE)
 781  012b 4d            	tnz	a
 782  012c 2706          	jreq	L352
 783                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 785  012e 721252b0      	bset	21168,#1
 787  0132 2004          	jra	L552
 788  0134               L352:
 789                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 791  0134 721352b0      	bres	21168,#1
 792  0138               L552:
 793                     ; 394 }
 796  0138 81            	ret
 854                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 854                     ; 405 {
 855                     	switch	.text
 856  0139               _TIM1_UpdateRequestConfig:
 860                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 862                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 864  0139 4d            	tnz	a
 865  013a 2706          	jreq	L503
 866                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 868  013c 721452b0      	bset	21168,#2
 870  0140 2004          	jra	L703
 871  0142               L503:
 872                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 874  0142 721552b0      	bres	21168,#2
 875  0146               L703:
 876                     ; 418 }
 879  0146 81            	ret
 915                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 915                     ; 427 {
 916                     	switch	.text
 917  0147               _TIM1_ARRPreloadConfig:
 921                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 923                     ; 432   if (NewState != DISABLE)
 925  0147 4d            	tnz	a
 926  0148 2706          	jreq	L723
 927                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 929  014a 721e52b0      	bset	21168,#7
 931  014e 2004          	jra	L133
 932  0150               L723:
 933                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 935  0150 721f52b0      	bres	21168,#7
 936  0154               L133:
 937                     ; 440 }
 940  0154 81            	ret
 997                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 997                     ; 451 {
 998                     	switch	.text
 999  0155               _TIM1_SelectOnePulseMode:
1003                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1005                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1007  0155 4d            	tnz	a
1008  0156 2706          	jreq	L163
1009                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1011  0158 721652b0      	bset	21168,#3
1013  015c 2004          	jra	L363
1014  015e               L163:
1015                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1017  015e 721752b0      	bres	21168,#3
1018  0162               L363:
1019                     ; 464 }
1022  0162 81            	ret
1057                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1057                     ; 473 {
1058                     	switch	.text
1059  0163               _TIM1_Cmd:
1063                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1065                     ; 478   if (NewState != DISABLE)
1067  0163 4d            	tnz	a
1068  0164 2706          	jreq	L304
1069                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1071  0166 721052b0      	bset	21168,#0
1073  016a 2004          	jra	L504
1074  016c               L304:
1075                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1077  016c 721152b0      	bres	21168,#0
1078  0170               L504:
1079                     ; 486 }
1082  0170 81            	ret
1365                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1365                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1365                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1365                     ; 580                   uint16_t TIM1_Pulse,
1365                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1365                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1365                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1365                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1365                     ; 585 {
1366                     	switch	.text
1367  0171               _TIM1_OC1Init:
1369  0171 89            	pushw	x
1370  0172 5203          	subw	sp,#3
1371       00000003      OFST:	set	3
1374                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1376                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1378                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1380                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1382                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1384                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1386                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1388                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1388                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1390  0174 c652bd        	ld	a,21181
1391  0177 a4f0          	and	a,#240
1392  0179 c752bd        	ld	21181,a
1393                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1393                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1393                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1393                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1395  017c 7b0c          	ld	a,(OFST+9,sp)
1396  017e a408          	and	a,#8
1397  0180 6b03          	ld	(OFST+0,sp),a
1399  0182 7b0b          	ld	a,(OFST+8,sp)
1400  0184 a402          	and	a,#2
1401  0186 1a03          	or	a,(OFST+0,sp)
1402  0188 6b02          	ld	(OFST-1,sp),a
1404  018a 7b08          	ld	a,(OFST+5,sp)
1405  018c a404          	and	a,#4
1406  018e 6b01          	ld	(OFST-2,sp),a
1408  0190 9f            	ld	a,xl
1409  0191 a401          	and	a,#1
1410  0193 1a01          	or	a,(OFST-2,sp)
1411  0195 1a02          	or	a,(OFST-1,sp)
1412  0197 ca52bd        	or	a,21181
1413  019a c752bd        	ld	21181,a
1414                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1414                     ; 608                           | (uint8_t)TIM1_OCMode);
1416  019d c652b9        	ld	a,21177
1417  01a0 a48f          	and	a,#143
1418  01a2 1a04          	or	a,(OFST+1,sp)
1419  01a4 c752b9        	ld	21177,a
1420                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1422  01a7 c652d0        	ld	a,21200
1423  01aa a4fc          	and	a,#252
1424  01ac c752d0        	ld	21200,a
1425                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1425                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1427  01af 7b0e          	ld	a,(OFST+11,sp)
1428  01b1 a402          	and	a,#2
1429  01b3 6b03          	ld	(OFST+0,sp),a
1431  01b5 7b0d          	ld	a,(OFST+10,sp)
1432  01b7 a401          	and	a,#1
1433  01b9 1a03          	or	a,(OFST+0,sp)
1434  01bb ca52d0        	or	a,21200
1435  01be c752d0        	ld	21200,a
1436                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1438  01c1 7b09          	ld	a,(OFST+6,sp)
1439  01c3 c752c6        	ld	21190,a
1440                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1442  01c6 7b0a          	ld	a,(OFST+7,sp)
1443  01c8 c752c7        	ld	21191,a
1444                     ; 619 }
1447  01cb 5b05          	addw	sp,#5
1448  01cd 81            	ret
1550                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1550                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1550                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1550                     ; 661                   uint16_t TIM1_Pulse,
1550                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1550                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1550                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1550                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1550                     ; 666 {
1551                     	switch	.text
1552  01ce               _TIM1_OC2Init:
1554  01ce 89            	pushw	x
1555  01cf 5203          	subw	sp,#3
1556       00000003      OFST:	set	3
1559                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1561                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1563                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1565                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1567                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1569                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1571                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1573                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1575  01d1 c652bd        	ld	a,21181
1576  01d4 a40f          	and	a,#15
1577  01d6 c752bd        	ld	21181,a
1578                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1578                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1580  01d9 7b0c          	ld	a,(OFST+9,sp)
1581  01db a480          	and	a,#128
1582  01dd 6b03          	ld	(OFST+0,sp),a
1584  01df 7b0b          	ld	a,(OFST+8,sp)
1585  01e1 a420          	and	a,#32
1586  01e3 1a03          	or	a,(OFST+0,sp)
1587  01e5 6b02          	ld	(OFST-1,sp),a
1589  01e7 7b08          	ld	a,(OFST+5,sp)
1590  01e9 a440          	and	a,#64
1591  01eb 6b01          	ld	(OFST-2,sp),a
1593  01ed 9f            	ld	a,xl
1594  01ee a410          	and	a,#16
1595  01f0 1a01          	or	a,(OFST-2,sp)
1596  01f2 1a02          	or	a,(OFST-1,sp)
1597  01f4 ca52bd        	or	a,21181
1598  01f7 c752bd        	ld	21181,a
1599                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1601  01fa c652ba        	ld	a,21178
1602  01fd a48f          	and	a,#143
1603  01ff 1a04          	or	a,(OFST+1,sp)
1604  0201 c752ba        	ld	21178,a
1605                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1607  0204 c652d0        	ld	a,21200
1608  0207 a4f3          	and	a,#243
1609  0209 c752d0        	ld	21200,a
1610                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1612  020c 7b0e          	ld	a,(OFST+11,sp)
1613  020e a408          	and	a,#8
1614  0210 6b03          	ld	(OFST+0,sp),a
1616  0212 7b0d          	ld	a,(OFST+10,sp)
1617  0214 a404          	and	a,#4
1618  0216 1a03          	or	a,(OFST+0,sp)
1619  0218 ca52d0        	or	a,21200
1620  021b c752d0        	ld	21200,a
1621                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1623  021e 7b09          	ld	a,(OFST+6,sp)
1624  0220 c752c8        	ld	21192,a
1625                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1627  0223 7b0a          	ld	a,(OFST+7,sp)
1628  0225 c752c9        	ld	21193,a
1629                     ; 696 }
1632  0228 5b05          	addw	sp,#5
1633  022a 81            	ret
1735                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1735                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1735                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1735                     ; 738                   uint16_t TIM1_Pulse,
1735                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1735                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1735                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1735                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1735                     ; 743 {
1736                     	switch	.text
1737  022b               _TIM1_OC3Init:
1739  022b 89            	pushw	x
1740  022c 5203          	subw	sp,#3
1741       00000003      OFST:	set	3
1744                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1746                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1748                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1750                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1752                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1754                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1756                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1758                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1760  022e c652be        	ld	a,21182
1761  0231 a4f0          	and	a,#240
1762  0233 c752be        	ld	21182,a
1763                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1763                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1765  0236 7b0c          	ld	a,(OFST+9,sp)
1766  0238 a408          	and	a,#8
1767  023a 6b03          	ld	(OFST+0,sp),a
1769  023c 7b0b          	ld	a,(OFST+8,sp)
1770  023e a402          	and	a,#2
1771  0240 1a03          	or	a,(OFST+0,sp)
1772  0242 6b02          	ld	(OFST-1,sp),a
1774  0244 7b08          	ld	a,(OFST+5,sp)
1775  0246 a404          	and	a,#4
1776  0248 6b01          	ld	(OFST-2,sp),a
1778  024a 9f            	ld	a,xl
1779  024b a401          	and	a,#1
1780  024d 1a01          	or	a,(OFST-2,sp)
1781  024f 1a02          	or	a,(OFST-1,sp)
1782  0251 ca52be        	or	a,21182
1783  0254 c752be        	ld	21182,a
1784                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1786  0257 c652bb        	ld	a,21179
1787  025a a48f          	and	a,#143
1788  025c 1a04          	or	a,(OFST+1,sp)
1789  025e c752bb        	ld	21179,a
1790                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1792  0261 c652d0        	ld	a,21200
1793  0264 a4cf          	and	a,#207
1794  0266 c752d0        	ld	21200,a
1795                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1797  0269 7b0e          	ld	a,(OFST+11,sp)
1798  026b a420          	and	a,#32
1799  026d 6b03          	ld	(OFST+0,sp),a
1801  026f 7b0d          	ld	a,(OFST+10,sp)
1802  0271 a410          	and	a,#16
1803  0273 1a03          	or	a,(OFST+0,sp)
1804  0275 ca52d0        	or	a,21200
1805  0278 c752d0        	ld	21200,a
1806                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1808  027b 7b09          	ld	a,(OFST+6,sp)
1809  027d c752ca        	ld	21194,a
1810                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1812  0280 7b0a          	ld	a,(OFST+7,sp)
1813  0282 c752cb        	ld	21195,a
1814                     ; 773 }
1817  0285 5b05          	addw	sp,#5
1818  0287 81            	ret
2023                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2023                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2023                     ; 805                      uint8_t TIM1_DeadTime,
2023                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2023                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2023                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2023                     ; 809 {
2024                     	switch	.text
2025  0288               _TIM1_BDTRConfig:
2027  0288 89            	pushw	x
2028  0289 88            	push	a
2029       00000001      OFST:	set	1
2032                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2034                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2036                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2038                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2040                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2042                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2044  028a 7b06          	ld	a,(OFST+5,sp)
2045  028c c752cf        	ld	21199,a
2046                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2046                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2046                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2048  028f 7b07          	ld	a,(OFST+6,sp)
2049  0291 1a08          	or	a,(OFST+7,sp)
2050  0293 1a09          	or	a,(OFST+8,sp)
2051  0295 6b01          	ld	(OFST+0,sp),a
2053  0297 9f            	ld	a,xl
2054  0298 1a02          	or	a,(OFST+1,sp)
2055  029a 1a01          	or	a,(OFST+0,sp)
2056  029c c752ce        	ld	21198,a
2057                     ; 826 }
2060  029f 5b03          	addw	sp,#3
2061  02a1 81            	ret
2097                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2097                     ; 835 {
2098                     	switch	.text
2099  02a2               _TIM1_CtrlPWMOutputs:
2103                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2105                     ; 841   if (NewState != DISABLE)
2107  02a2 4d            	tnz	a
2108  02a3 2706          	jreq	L1301
2109                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2111  02a5 721e52ce      	bset	21198,#7
2113  02a9 2004          	jra	L3301
2114  02ab               L1301:
2115                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2117  02ab 721f52ce      	bres	21198,#7
2118  02af               L3301:
2119                     ; 849 }
2122  02af 81            	ret
2201                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2201                     ; 872 {
2202                     	switch	.text
2203  02b0               _TIM1_SelectOCxM:
2205  02b0 89            	pushw	x
2206       00000000      OFST:	set	0
2209                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2211                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2213                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2215  02b1 9e            	ld	a,xh
2216  02b2 4d            	tnz	a
2217  02b3 2610          	jrne	L3701
2218                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2220  02b5 721152bd      	bres	21181,#0
2221                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2223  02b9 c652b9        	ld	a,21177
2224  02bc a48f          	and	a,#143
2225  02be 1a02          	or	a,(OFST+2,sp)
2226  02c0 c752b9        	ld	21177,a
2228  02c3 2024          	jra	L5701
2229  02c5               L3701:
2230                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2232  02c5 7b01          	ld	a,(OFST+1,sp)
2233  02c7 a101          	cp	a,#1
2234  02c9 2610          	jrne	L7701
2235                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2237  02cb 721952bd      	bres	21181,#4
2238                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2240  02cf c652ba        	ld	a,21178
2241  02d2 a48f          	and	a,#143
2242  02d4 1a02          	or	a,(OFST+2,sp)
2243  02d6 c752ba        	ld	21178,a
2245  02d9 200e          	jra	L5701
2246  02db               L7701:
2247                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2249  02db 721152be      	bres	21182,#0
2250                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2252  02df c652bb        	ld	a,21179
2253  02e2 a48f          	and	a,#143
2254  02e4 1a02          	or	a,(OFST+2,sp)
2255  02e6 c752bb        	ld	21179,a
2256  02e9               L5701:
2257                     ; 902 }
2260  02e9 85            	popw	x
2261  02ea 81            	ret
2293                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2293                     ; 911 {
2294                     	switch	.text
2295  02eb               _TIM1_SetCompare1:
2299                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2301  02eb 9e            	ld	a,xh
2302  02ec c752c6        	ld	21190,a
2303                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2305  02ef 9f            	ld	a,xl
2306  02f0 c752c7        	ld	21191,a
2307                     ; 916 }
2310  02f3 81            	ret
2342                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2342                     ; 925 {
2343                     	switch	.text
2344  02f4               _TIM1_SetCompare2:
2348                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2350  02f4 9e            	ld	a,xh
2351  02f5 c752c8        	ld	21192,a
2352                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2354  02f8 9f            	ld	a,xl
2355  02f9 c752c9        	ld	21193,a
2356                     ; 929 }
2359  02fc 81            	ret
2391                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2391                     ; 938 {
2392                     	switch	.text
2393  02fd               _TIM1_SetCompare3:
2397                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2399  02fd 9e            	ld	a,xh
2400  02fe c752ca        	ld	21194,a
2401                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2403  0301 9f            	ld	a,xl
2404  0302 c752cb        	ld	21195,a
2405                     ; 942 }
2408  0305 81            	ret
2440                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2440                     ; 951 {
2441                     	switch	.text
2442  0306               _TIM1_SetCompare4:
2446                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2448  0306 9e            	ld	a,xh
2449  0307 c752cc        	ld	21196,a
2450                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2452  030a 9f            	ld	a,xl
2453  030b c752cd        	ld	21197,a
2454                     ; 955 }
2457  030e 81            	ret
2493                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2493                     ; 964 {
2494                     	switch	.text
2495  030f               _TIM1_CCPreloadControl:
2499                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2501                     ; 969   if (NewState != DISABLE)
2503  030f 4d            	tnz	a
2504  0310 2706          	jreq	L1021
2505                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2507  0312 721052b1      	bset	21169,#0
2509  0316 2004          	jra	L3021
2510  0318               L1021:
2511                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2513  0318 721152b1      	bres	21169,#0
2514  031c               L3021:
2515                     ; 977 }
2518  031c 81            	ret
2576                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2576                     ; 988 {
2577                     	switch	.text
2578  031d               _TIM1_ForcedOC1Config:
2580  031d 88            	push	a
2581       00000000      OFST:	set	0
2584                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2586                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2588  031e c652b9        	ld	a,21177
2589  0321 a48f          	and	a,#143
2590  0323 1a01          	or	a,(OFST+1,sp)
2591  0325 c752b9        	ld	21177,a
2592                     ; 994 }
2595  0328 84            	pop	a
2596  0329 81            	ret
2632                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2632                     ; 1005 {
2633                     	switch	.text
2634  032a               _TIM1_ForcedOC2Config:
2636  032a 88            	push	a
2637       00000000      OFST:	set	0
2640                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2642                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2644  032b c652ba        	ld	a,21178
2645  032e a48f          	and	a,#143
2646  0330 1a01          	or	a,(OFST+1,sp)
2647  0332 c752ba        	ld	21178,a
2648                     ; 1011 }
2651  0335 84            	pop	a
2652  0336 81            	ret
2688                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2688                     ; 1022 {
2689                     	switch	.text
2690  0337               _TIM1_ForcedOC3Config:
2692  0337 88            	push	a
2693       00000000      OFST:	set	0
2696                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2698                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2700  0338 c652bb        	ld	a,21179
2701  033b a48f          	and	a,#143
2702  033d 1a01          	or	a,(OFST+1,sp)
2703  033f c752bb        	ld	21179,a
2704                     ; 1028 }
2707  0342 84            	pop	a
2708  0343 81            	ret
2744                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2744                     ; 1037 {
2745                     	switch	.text
2746  0344               _TIM1_OC1PreloadConfig:
2750                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2752                     ; 1042   if (NewState != DISABLE)
2754  0344 4d            	tnz	a
2755  0345 2706          	jreq	L5031
2756                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2758  0347 721652b9      	bset	21177,#3
2760  034b 2004          	jra	L7031
2761  034d               L5031:
2762                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2764  034d 721752b9      	bres	21177,#3
2765  0351               L7031:
2766                     ; 1050 }
2769  0351 81            	ret
2805                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2805                     ; 1059 {
2806                     	switch	.text
2807  0352               _TIM1_OC2PreloadConfig:
2811                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2813                     ; 1064   if (NewState != DISABLE)
2815  0352 4d            	tnz	a
2816  0353 2706          	jreq	L7231
2817                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2819  0355 721652ba      	bset	21178,#3
2821  0359 2004          	jra	L1331
2822  035b               L7231:
2823                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2825  035b 721752ba      	bres	21178,#3
2826  035f               L1331:
2827                     ; 1072 }
2830  035f 81            	ret
2866                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2866                     ; 1081 {
2867                     	switch	.text
2868  0360               _TIM1_OC3PreloadConfig:
2872                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2874                     ; 1086   if (NewState != DISABLE)
2876  0360 4d            	tnz	a
2877  0361 2706          	jreq	L1531
2878                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2880  0363 721652bb      	bset	21179,#3
2882  0367 2004          	jra	L3531
2883  0369               L1531:
2884                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2886  0369 721752bb      	bres	21179,#3
2887  036d               L3531:
2888                     ; 1094 }
2891  036d 81            	ret
2927                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2927                     ; 1103 {
2928                     	switch	.text
2929  036e               _TIM1_OC4PreloadConfig:
2933                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2935                     ; 1108   if (NewState != DISABLE)
2937  036e 4d            	tnz	a
2938  036f 2706          	jreq	L3731
2939                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2941  0371 721652bc      	bset	21180,#3
2943  0375 2004          	jra	L5731
2944  0377               L3731:
2945                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2947  0377 721752bc      	bres	21180,#3
2948  037b               L5731:
2949                     ; 1116 }
2952  037b 81            	ret
2987                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
2987                     ; 1125 {
2988                     	switch	.text
2989  037c               _TIM1_OC1FastConfig:
2993                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
2995                     ; 1130   if (NewState != DISABLE)
2997  037c 4d            	tnz	a
2998  037d 2706          	jreq	L5141
2999                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3001  037f 721452b9      	bset	21177,#2
3003  0383 2004          	jra	L7141
3004  0385               L5141:
3005                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3007  0385 721552b9      	bres	21177,#2
3008  0389               L7141:
3009                     ; 1138 }
3012  0389 81            	ret
3047                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3047                     ; 1147 {
3048                     	switch	.text
3049  038a               _TIM1_OC2FastConfig:
3053                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3055                     ; 1152   if (NewState != DISABLE)
3057  038a 4d            	tnz	a
3058  038b 2706          	jreq	L7341
3059                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3061  038d 721452ba      	bset	21178,#2
3063  0391 2004          	jra	L1441
3064  0393               L7341:
3065                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3067  0393 721552ba      	bres	21178,#2
3068  0397               L1441:
3069                     ; 1160 }
3072  0397 81            	ret
3107                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3107                     ; 1169 {
3108                     	switch	.text
3109  0398               _TIM1_OC3FastConfig:
3113                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3115                     ; 1174   if (NewState != DISABLE)
3117  0398 4d            	tnz	a
3118  0399 2706          	jreq	L1641
3119                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3121  039b 721452bb      	bset	21179,#2
3123  039f 2004          	jra	L3641
3124  03a1               L1641:
3125                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3127  03a1 721552bb      	bres	21179,#2
3128  03a5               L3641:
3129                     ; 1182 }
3132  03a5 81            	ret
3167                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3167                     ; 1191 {
3168                     	switch	.text
3169  03a6               _TIM1_ClearOC1Ref:
3173                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3175                     ; 1196   if (NewState != DISABLE)
3177  03a6 4d            	tnz	a
3178  03a7 2706          	jreq	L3051
3179                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3181  03a9 721e52b9      	bset	21177,#7
3183  03ad 2004          	jra	L5051
3184  03af               L3051:
3185                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3187  03af 721f52b9      	bres	21177,#7
3188  03b3               L5051:
3189                     ; 1204 }
3192  03b3 81            	ret
3227                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3227                     ; 1213 {
3228                     	switch	.text
3229  03b4               _TIM1_ClearOC2Ref:
3233                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3235                     ; 1218   if (NewState != DISABLE)
3237  03b4 4d            	tnz	a
3238  03b5 2706          	jreq	L5251
3239                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3241  03b7 721e52ba      	bset	21178,#7
3243  03bb 2004          	jra	L7251
3244  03bd               L5251:
3245                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3247  03bd 721f52ba      	bres	21178,#7
3248  03c1               L7251:
3249                     ; 1226 }
3252  03c1 81            	ret
3287                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3287                     ; 1235 {
3288                     	switch	.text
3289  03c2               _TIM1_ClearOC3Ref:
3293                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3295                     ; 1240   if (NewState != DISABLE)
3297  03c2 4d            	tnz	a
3298  03c3 2706          	jreq	L7451
3299                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3301  03c5 721e52bb      	bset	21179,#7
3303  03c9 2004          	jra	L1551
3304  03cb               L7451:
3305                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3307  03cb 721f52bb      	bres	21179,#7
3308  03cf               L1551:
3309                     ; 1248 }
3312  03cf 81            	ret
3347                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3347                     ; 1257 {
3348                     	switch	.text
3349  03d0               _TIM1_ClearOC4Ref:
3353                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3355                     ; 1262   if (NewState != DISABLE)
3357  03d0 4d            	tnz	a
3358  03d1 2706          	jreq	L1751
3359                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3361  03d3 721e52bc      	bset	21180,#7
3363  03d7 2004          	jra	L3751
3364  03d9               L1751:
3365                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3367  03d9 721f52bc      	bres	21180,#7
3368  03dd               L3751:
3369                     ; 1270 }
3372  03dd 81            	ret
3408                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3408                     ; 1281 {
3409                     	switch	.text
3410  03de               _TIM1_OC1PolarityConfig:
3414                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3416                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3418  03de 4d            	tnz	a
3419  03df 2706          	jreq	L3161
3420                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3422  03e1 721252bd      	bset	21181,#1
3424  03e5 2004          	jra	L5161
3425  03e7               L3161:
3426                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3428  03e7 721352bd      	bres	21181,#1
3429  03eb               L5161:
3430                     ; 1294 }
3433  03eb 81            	ret
3469                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3469                     ; 1305 {
3470                     	switch	.text
3471  03ec               _TIM1_OC1NPolarityConfig:
3475                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3477                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3479  03ec 4d            	tnz	a
3480  03ed 2706          	jreq	L5361
3481                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3483  03ef 721652bd      	bset	21181,#3
3485  03f3 2004          	jra	L7361
3486  03f5               L5361:
3487                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3489  03f5 721752bd      	bres	21181,#3
3490  03f9               L7361:
3491                     ; 1318 }
3494  03f9 81            	ret
3530                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3530                     ; 1329 {
3531                     	switch	.text
3532  03fa               _TIM1_OC2PolarityConfig:
3536                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3538                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3540  03fa 4d            	tnz	a
3541  03fb 2706          	jreq	L7561
3542                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3544  03fd 721a52bd      	bset	21181,#5
3546  0401 2004          	jra	L1661
3547  0403               L7561:
3548                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3550  0403 721b52bd      	bres	21181,#5
3551  0407               L1661:
3552                     ; 1342 }
3555  0407 81            	ret
3591                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3591                     ; 1353 {
3592                     	switch	.text
3593  0408               _TIM1_OC2NPolarityConfig:
3597                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3599                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3601  0408 4d            	tnz	a
3602  0409 2706          	jreq	L1071
3603                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3605  040b 721e52bd      	bset	21181,#7
3607  040f 2004          	jra	L3071
3608  0411               L1071:
3609                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3611  0411 721f52bd      	bres	21181,#7
3612  0415               L3071:
3613                     ; 1366 }
3616  0415 81            	ret
3652                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3652                     ; 1377 {
3653                     	switch	.text
3654  0416               _TIM1_OC3PolarityConfig:
3658                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3660                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3662  0416 4d            	tnz	a
3663  0417 2706          	jreq	L3271
3664                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3666  0419 721252be      	bset	21182,#1
3668  041d 2004          	jra	L5271
3669  041f               L3271:
3670                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3672  041f 721352be      	bres	21182,#1
3673  0423               L5271:
3674                     ; 1390 }
3677  0423 81            	ret
3713                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3713                     ; 1401 {
3714                     	switch	.text
3715  0424               _TIM1_OC3NPolarityConfig:
3719                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3721                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3723  0424 4d            	tnz	a
3724  0425 2706          	jreq	L5471
3725                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3727  0427 721652be      	bset	21182,#3
3729  042b 2004          	jra	L7471
3730  042d               L5471:
3731                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3733  042d 721752be      	bres	21182,#3
3734  0431               L7471:
3735                     ; 1414 }
3738  0431 81            	ret
3797                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3797                     ; 1425 {
3798                     	switch	.text
3799  0432               _TIM1_SelectOCREFClear:
3803                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3805                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3807  0432 721752b2      	bres	21170,#3
3808                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3810  0436 ca52b2        	or	a,21170
3811  0439 c752b2        	ld	21170,a
3812                     ; 1432 }
3815  043c 81            	ret
3850                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3850                     ; 1441 {
3851                     	switch	.text
3852  043d               _TIM1_SelectCOM:
3856                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3858                     ; 1446   if (NewState != DISABLE)
3860  043d 4d            	tnz	a
3861  043e 2706          	jreq	L5102
3862                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3864  0440 721452b1      	bset	21169,#2
3866  0444 2004          	jra	L7102
3867  0446               L5102:
3868                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3870  0446 721552b1      	bres	21169,#2
3871  044a               L7102:
3872                     ; 1454 }
3875  044a 81            	ret
3920                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3920                     ; 1469 {
3921                     	switch	.text
3922  044b               _TIM1_CCxCmd:
3924  044b 89            	pushw	x
3925       00000000      OFST:	set	0
3928                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3930                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3932                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3934  044c 9e            	ld	a,xh
3935  044d 4d            	tnz	a
3936  044e 2610          	jrne	L3402
3937                     ; 1477     if (NewState != DISABLE)
3939  0450 9f            	ld	a,xl
3940  0451 4d            	tnz	a
3941  0452 2706          	jreq	L5402
3942                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3944  0454 721052bd      	bset	21181,#0
3946  0458 2040          	jra	L1502
3947  045a               L5402:
3948                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3950  045a 721152bd      	bres	21181,#0
3951  045e 203a          	jra	L1502
3952  0460               L3402:
3953                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3955  0460 7b01          	ld	a,(OFST+1,sp)
3956  0462 a101          	cp	a,#1
3957  0464 2610          	jrne	L3502
3958                     ; 1489     if (NewState != DISABLE)
3960  0466 0d02          	tnz	(OFST+2,sp)
3961  0468 2706          	jreq	L5502
3962                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3964  046a 721852bd      	bset	21181,#4
3966  046e 202a          	jra	L1502
3967  0470               L5502:
3968                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3970  0470 721952bd      	bres	21181,#4
3971  0474 2024          	jra	L1502
3972  0476               L3502:
3973                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3975  0476 7b01          	ld	a,(OFST+1,sp)
3976  0478 a102          	cp	a,#2
3977  047a 2610          	jrne	L3602
3978                     ; 1501     if (NewState != DISABLE)
3980  047c 0d02          	tnz	(OFST+2,sp)
3981  047e 2706          	jreq	L5602
3982                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3984  0480 721052be      	bset	21182,#0
3986  0484 2014          	jra	L1502
3987  0486               L5602:
3988                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3990  0486 721152be      	bres	21182,#0
3991  048a 200e          	jra	L1502
3992  048c               L3602:
3993                     ; 1513     if (NewState != DISABLE)
3995  048c 0d02          	tnz	(OFST+2,sp)
3996  048e 2706          	jreq	L3702
3997                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3999  0490 721852be      	bset	21182,#4
4001  0494 2004          	jra	L1502
4002  0496               L3702:
4003                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4005  0496 721952be      	bres	21182,#4
4006  049a               L1502:
4007                     ; 1522 }
4010  049a 85            	popw	x
4011  049b 81            	ret
4056                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4056                     ; 1536 {
4057                     	switch	.text
4058  049c               _TIM1_CCxNCmd:
4060  049c 89            	pushw	x
4061       00000000      OFST:	set	0
4064                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4066                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4068                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4070  049d 9e            	ld	a,xh
4071  049e 4d            	tnz	a
4072  049f 2610          	jrne	L1212
4073                     ; 1544     if (NewState != DISABLE)
4075  04a1 9f            	ld	a,xl
4076  04a2 4d            	tnz	a
4077  04a3 2706          	jreq	L3212
4078                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4080  04a5 721452bd      	bset	21181,#2
4082  04a9 202a          	jra	L7212
4083  04ab               L3212:
4084                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4086  04ab 721552bd      	bres	21181,#2
4087  04af 2024          	jra	L7212
4088  04b1               L1212:
4089                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4091  04b1 7b01          	ld	a,(OFST+1,sp)
4092  04b3 a101          	cp	a,#1
4093  04b5 2610          	jrne	L1312
4094                     ; 1556     if (NewState != DISABLE)
4096  04b7 0d02          	tnz	(OFST+2,sp)
4097  04b9 2706          	jreq	L3312
4098                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4100  04bb 721c52bd      	bset	21181,#6
4102  04bf 2014          	jra	L7212
4103  04c1               L3312:
4104                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4106  04c1 721d52bd      	bres	21181,#6
4107  04c5 200e          	jra	L7212
4108  04c7               L1312:
4109                     ; 1568     if (NewState != DISABLE)
4111  04c7 0d02          	tnz	(OFST+2,sp)
4112  04c9 2706          	jreq	L1412
4113                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4115  04cb 721452be      	bset	21182,#2
4117  04cf 2004          	jra	L7212
4118  04d1               L1412:
4119                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4121  04d1 721552be      	bres	21182,#2
4122  04d5               L7212:
4123                     ; 1577 }
4126  04d5 85            	popw	x
4127  04d6 81            	ret
4293                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4293                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4293                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4293                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4293                     ; 1668                  uint8_t TIM1_ICFilter)
4293                     ; 1669 {
4294                     	switch	.text
4295  04d7               _TIM1_ICInit:
4297  04d7 89            	pushw	x
4298       00000000      OFST:	set	0
4301                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4303                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4305                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4307                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4309                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4311                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4313  04d8 9e            	ld	a,xh
4314  04d9 4d            	tnz	a
4315  04da 2614          	jrne	L7322
4316                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4318  04dc 7b07          	ld	a,(OFST+7,sp)
4319  04de 88            	push	a
4320  04df 7b06          	ld	a,(OFST+6,sp)
4321  04e1 97            	ld	xl,a
4322  04e2 7b03          	ld	a,(OFST+3,sp)
4323  04e4 95            	ld	xh,a
4324  04e5 cd080b        	call	L3_TI1_Config
4326  04e8 84            	pop	a
4327                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4329  04e9 7b06          	ld	a,(OFST+6,sp)
4330  04eb cd0640        	call	_TIM1_SetIC1Prescaler
4333  04ee 2046          	jra	L1422
4334  04f0               L7322:
4335                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4337  04f0 7b01          	ld	a,(OFST+1,sp)
4338  04f2 a101          	cp	a,#1
4339  04f4 2614          	jrne	L3422
4340                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4342  04f6 7b07          	ld	a,(OFST+7,sp)
4343  04f8 88            	push	a
4344  04f9 7b06          	ld	a,(OFST+6,sp)
4345  04fb 97            	ld	xl,a
4346  04fc 7b03          	ld	a,(OFST+3,sp)
4347  04fe 95            	ld	xh,a
4348  04ff cd083b        	call	L5_TI2_Config
4350  0502 84            	pop	a
4351                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4353  0503 7b06          	ld	a,(OFST+6,sp)
4354  0505 cd064d        	call	_TIM1_SetIC2Prescaler
4357  0508 202c          	jra	L1422
4358  050a               L3422:
4359                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4361  050a 7b01          	ld	a,(OFST+1,sp)
4362  050c a102          	cp	a,#2
4363  050e 2614          	jrne	L7422
4364                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4366  0510 7b07          	ld	a,(OFST+7,sp)
4367  0512 88            	push	a
4368  0513 7b06          	ld	a,(OFST+6,sp)
4369  0515 97            	ld	xl,a
4370  0516 7b03          	ld	a,(OFST+3,sp)
4371  0518 95            	ld	xh,a
4372  0519 cd086b        	call	L7_TI3_Config
4374  051c 84            	pop	a
4375                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4377  051d 7b06          	ld	a,(OFST+6,sp)
4378  051f cd065a        	call	_TIM1_SetIC3Prescaler
4381  0522 2012          	jra	L1422
4382  0524               L7422:
4383                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4385  0524 7b07          	ld	a,(OFST+7,sp)
4386  0526 88            	push	a
4387  0527 7b06          	ld	a,(OFST+6,sp)
4388  0529 97            	ld	xl,a
4389  052a 7b03          	ld	a,(OFST+3,sp)
4390  052c 95            	ld	xh,a
4391  052d cd089b        	call	L11_TI4_Config
4393  0530 84            	pop	a
4394                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4396  0531 7b06          	ld	a,(OFST+6,sp)
4397  0533 cd0667        	call	_TIM1_SetIC4Prescaler
4399  0536               L1422:
4400                     ; 1706 }
4403  0536 85            	popw	x
4404  0537 81            	ret
4500                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4500                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4500                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4500                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4500                     ; 1737                      uint8_t TIM1_ICFilter)
4500                     ; 1738 {
4501                     	switch	.text
4502  0538               _TIM1_PWMIConfig:
4504  0538 89            	pushw	x
4505  0539 89            	pushw	x
4506       00000002      OFST:	set	2
4509                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4511                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4513                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4515                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4517                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4519                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4521                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4523  053a 9f            	ld	a,xl
4524  053b a101          	cp	a,#1
4525  053d 2706          	jreq	L7132
4526                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4528  053f a601          	ld	a,#1
4529  0541 6b01          	ld	(OFST-1,sp),a
4532  0543 2002          	jra	L1232
4533  0545               L7132:
4534                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4536  0545 0f01          	clr	(OFST-1,sp)
4538  0547               L1232:
4539                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4541  0547 7b07          	ld	a,(OFST+5,sp)
4542  0549 a101          	cp	a,#1
4543  054b 2606          	jrne	L3232
4544                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4546  054d a602          	ld	a,#2
4547  054f 6b02          	ld	(OFST+0,sp),a
4550  0551 2004          	jra	L5232
4551  0553               L3232:
4552                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4554  0553 a601          	ld	a,#1
4555  0555 6b02          	ld	(OFST+0,sp),a
4557  0557               L5232:
4558                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4560  0557 0d03          	tnz	(OFST+1,sp)
4561  0559 2626          	jrne	L7232
4562                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4564  055b 7b09          	ld	a,(OFST+7,sp)
4565  055d 88            	push	a
4566  055e 7b08          	ld	a,(OFST+6,sp)
4567  0560 97            	ld	xl,a
4568  0561 7b05          	ld	a,(OFST+3,sp)
4569  0563 95            	ld	xh,a
4570  0564 cd080b        	call	L3_TI1_Config
4572  0567 84            	pop	a
4573                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4575  0568 7b08          	ld	a,(OFST+6,sp)
4576  056a cd0640        	call	_TIM1_SetIC1Prescaler
4578                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4580  056d 7b09          	ld	a,(OFST+7,sp)
4581  056f 88            	push	a
4582  0570 7b03          	ld	a,(OFST+1,sp)
4583  0572 97            	ld	xl,a
4584  0573 7b02          	ld	a,(OFST+0,sp)
4585  0575 95            	ld	xh,a
4586  0576 cd083b        	call	L5_TI2_Config
4588  0579 84            	pop	a
4589                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4591  057a 7b08          	ld	a,(OFST+6,sp)
4592  057c cd064d        	call	_TIM1_SetIC2Prescaler
4595  057f 2024          	jra	L1332
4596  0581               L7232:
4597                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4599  0581 7b09          	ld	a,(OFST+7,sp)
4600  0583 88            	push	a
4601  0584 7b08          	ld	a,(OFST+6,sp)
4602  0586 97            	ld	xl,a
4603  0587 7b05          	ld	a,(OFST+3,sp)
4604  0589 95            	ld	xh,a
4605  058a cd083b        	call	L5_TI2_Config
4607  058d 84            	pop	a
4608                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4610  058e 7b08          	ld	a,(OFST+6,sp)
4611  0590 cd064d        	call	_TIM1_SetIC2Prescaler
4613                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4615  0593 7b09          	ld	a,(OFST+7,sp)
4616  0595 88            	push	a
4617  0596 7b03          	ld	a,(OFST+1,sp)
4618  0598 97            	ld	xl,a
4619  0599 7b02          	ld	a,(OFST+0,sp)
4620  059b 95            	ld	xh,a
4621  059c cd080b        	call	L3_TI1_Config
4623  059f 84            	pop	a
4624                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4626  05a0 7b08          	ld	a,(OFST+6,sp)
4627  05a2 cd0640        	call	_TIM1_SetIC1Prescaler
4629  05a5               L1332:
4630                     ; 1796 }
4633  05a5 5b04          	addw	sp,#4
4634  05a7 81            	ret
4680                     ; 1803 uint16_t TIM1_GetCapture1(void)
4680                     ; 1804 {
4681                     	switch	.text
4682  05a8               _TIM1_GetCapture1:
4684  05a8 5204          	subw	sp,#4
4685       00000004      OFST:	set	4
4688                     ; 1807   uint16_t tmpccr1 = 0;
4690                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4694                     ; 1810   tmpccr1h = TIM1->CCR1H;
4696  05aa c652c6        	ld	a,21190
4697  05ad 6b02          	ld	(OFST-2,sp),a
4699                     ; 1811   tmpccr1l = TIM1->CCR1L;
4701  05af c652c7        	ld	a,21191
4702  05b2 6b01          	ld	(OFST-3,sp),a
4704                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4706  05b4 7b01          	ld	a,(OFST-3,sp)
4707  05b6 5f            	clrw	x
4708  05b7 97            	ld	xl,a
4709  05b8 1f03          	ldw	(OFST-1,sp),x
4711                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4713  05ba 7b02          	ld	a,(OFST-2,sp)
4714  05bc 5f            	clrw	x
4715  05bd 97            	ld	xl,a
4716  05be 4f            	clr	a
4717  05bf 02            	rlwa	x,a
4718  05c0 01            	rrwa	x,a
4719  05c1 1a04          	or	a,(OFST+0,sp)
4720  05c3 01            	rrwa	x,a
4721  05c4 1a03          	or	a,(OFST-1,sp)
4722  05c6 01            	rrwa	x,a
4723  05c7 1f03          	ldw	(OFST-1,sp),x
4725                     ; 1816   return (uint16_t)tmpccr1;
4727  05c9 1e03          	ldw	x,(OFST-1,sp)
4730  05cb 5b04          	addw	sp,#4
4731  05cd 81            	ret
4777                     ; 1824 uint16_t TIM1_GetCapture2(void)
4777                     ; 1825 {
4778                     	switch	.text
4779  05ce               _TIM1_GetCapture2:
4781  05ce 5204          	subw	sp,#4
4782       00000004      OFST:	set	4
4785                     ; 1828   uint16_t tmpccr2 = 0;
4787                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4791                     ; 1831   tmpccr2h = TIM1->CCR2H;
4793  05d0 c652c8        	ld	a,21192
4794  05d3 6b02          	ld	(OFST-2,sp),a
4796                     ; 1832   tmpccr2l = TIM1->CCR2L;
4798  05d5 c652c9        	ld	a,21193
4799  05d8 6b01          	ld	(OFST-3,sp),a
4801                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4803  05da 7b01          	ld	a,(OFST-3,sp)
4804  05dc 5f            	clrw	x
4805  05dd 97            	ld	xl,a
4806  05de 1f03          	ldw	(OFST-1,sp),x
4808                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4810  05e0 7b02          	ld	a,(OFST-2,sp)
4811  05e2 5f            	clrw	x
4812  05e3 97            	ld	xl,a
4813  05e4 4f            	clr	a
4814  05e5 02            	rlwa	x,a
4815  05e6 01            	rrwa	x,a
4816  05e7 1a04          	or	a,(OFST+0,sp)
4817  05e9 01            	rrwa	x,a
4818  05ea 1a03          	or	a,(OFST-1,sp)
4819  05ec 01            	rrwa	x,a
4820  05ed 1f03          	ldw	(OFST-1,sp),x
4822                     ; 1837   return (uint16_t)tmpccr2;
4824  05ef 1e03          	ldw	x,(OFST-1,sp)
4827  05f1 5b04          	addw	sp,#4
4828  05f3 81            	ret
4874                     ; 1845 uint16_t TIM1_GetCapture3(void)
4874                     ; 1846 {
4875                     	switch	.text
4876  05f4               _TIM1_GetCapture3:
4878  05f4 5204          	subw	sp,#4
4879       00000004      OFST:	set	4
4882                     ; 1848   uint16_t tmpccr3 = 0;
4884                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4888                     ; 1851   tmpccr3h = TIM1->CCR3H;
4890  05f6 c652ca        	ld	a,21194
4891  05f9 6b02          	ld	(OFST-2,sp),a
4893                     ; 1852   tmpccr3l = TIM1->CCR3L;
4895  05fb c652cb        	ld	a,21195
4896  05fe 6b01          	ld	(OFST-3,sp),a
4898                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4900  0600 7b01          	ld	a,(OFST-3,sp)
4901  0602 5f            	clrw	x
4902  0603 97            	ld	xl,a
4903  0604 1f03          	ldw	(OFST-1,sp),x
4905                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4907  0606 7b02          	ld	a,(OFST-2,sp)
4908  0608 5f            	clrw	x
4909  0609 97            	ld	xl,a
4910  060a 4f            	clr	a
4911  060b 02            	rlwa	x,a
4912  060c 01            	rrwa	x,a
4913  060d 1a04          	or	a,(OFST+0,sp)
4914  060f 01            	rrwa	x,a
4915  0610 1a03          	or	a,(OFST-1,sp)
4916  0612 01            	rrwa	x,a
4917  0613 1f03          	ldw	(OFST-1,sp),x
4919                     ; 1857   return (uint16_t)tmpccr3;
4921  0615 1e03          	ldw	x,(OFST-1,sp)
4924  0617 5b04          	addw	sp,#4
4925  0619 81            	ret
4971                     ; 1865 uint16_t TIM1_GetCapture4(void)
4971                     ; 1866 {
4972                     	switch	.text
4973  061a               _TIM1_GetCapture4:
4975  061a 5204          	subw	sp,#4
4976       00000004      OFST:	set	4
4979                     ; 1868   uint16_t tmpccr4 = 0;
4981                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4985                     ; 1871   tmpccr4h = TIM1->CCR4H;
4987  061c c652cc        	ld	a,21196
4988  061f 6b02          	ld	(OFST-2,sp),a
4990                     ; 1872   tmpccr4l = TIM1->CCR4L;
4992  0621 c652cd        	ld	a,21197
4993  0624 6b01          	ld	(OFST-3,sp),a
4995                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
4997  0626 7b01          	ld	a,(OFST-3,sp)
4998  0628 5f            	clrw	x
4999  0629 97            	ld	xl,a
5000  062a 1f03          	ldw	(OFST-1,sp),x
5002                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5004  062c 7b02          	ld	a,(OFST-2,sp)
5005  062e 5f            	clrw	x
5006  062f 97            	ld	xl,a
5007  0630 4f            	clr	a
5008  0631 02            	rlwa	x,a
5009  0632 01            	rrwa	x,a
5010  0633 1a04          	or	a,(OFST+0,sp)
5011  0635 01            	rrwa	x,a
5012  0636 1a03          	or	a,(OFST-1,sp)
5013  0638 01            	rrwa	x,a
5014  0639 1f03          	ldw	(OFST-1,sp),x
5016                     ; 1877   return (uint16_t)tmpccr4;
5018  063b 1e03          	ldw	x,(OFST-1,sp)
5021  063d 5b04          	addw	sp,#4
5022  063f 81            	ret
5058                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5058                     ; 1891 {
5059                     	switch	.text
5060  0640               _TIM1_SetIC1Prescaler:
5062  0640 88            	push	a
5063       00000000      OFST:	set	0
5066                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5068                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5070  0641 c652b9        	ld	a,21177
5071  0644 a4f3          	and	a,#243
5072  0646 1a01          	or	a,(OFST+1,sp)
5073  0648 c752b9        	ld	21177,a
5074                     ; 1897 }
5077  064b 84            	pop	a
5078  064c 81            	ret
5114                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5114                     ; 1910 {
5115                     	switch	.text
5116  064d               _TIM1_SetIC2Prescaler:
5118  064d 88            	push	a
5119       00000000      OFST:	set	0
5122                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5124                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5126  064e c652ba        	ld	a,21178
5127  0651 a4f3          	and	a,#243
5128  0653 1a01          	or	a,(OFST+1,sp)
5129  0655 c752ba        	ld	21178,a
5130                     ; 1916 }
5133  0658 84            	pop	a
5134  0659 81            	ret
5170                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5170                     ; 1929 {
5171                     	switch	.text
5172  065a               _TIM1_SetIC3Prescaler:
5174  065a 88            	push	a
5175       00000000      OFST:	set	0
5178                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5180                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5182  065b c652bb        	ld	a,21179
5183  065e a4f3          	and	a,#243
5184  0660 1a01          	or	a,(OFST+1,sp)
5185  0662 c752bb        	ld	21179,a
5186                     ; 1936 }
5189  0665 84            	pop	a
5190  0666 81            	ret
5226                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5226                     ; 1949 {
5227                     	switch	.text
5228  0667               _TIM1_SetIC4Prescaler:
5230  0667 88            	push	a
5231       00000000      OFST:	set	0
5234                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5236                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5238  0668 c652bc        	ld	a,21180
5239  066b a4f3          	and	a,#243
5240  066d 1a01          	or	a,(OFST+1,sp)
5241  066f c752bc        	ld	21180,a
5242                     ; 1956 }
5245  0672 84            	pop	a
5246  0673 81            	ret
5353                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5353                     ; 1992 {
5354                     	switch	.text
5355  0674               _TIM1_ITConfig:
5357  0674 89            	pushw	x
5358       00000000      OFST:	set	0
5361                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5363                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5365                     ; 1997   if (NewState != DISABLE)
5367  0675 9f            	ld	a,xl
5368  0676 4d            	tnz	a
5369  0677 2709          	jreq	L1752
5370                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5372  0679 9e            	ld	a,xh
5373  067a ca52b5        	or	a,21173
5374  067d c752b5        	ld	21173,a
5376  0680 2009          	jra	L3752
5377  0682               L1752:
5378                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5380  0682 7b01          	ld	a,(OFST+1,sp)
5381  0684 43            	cpl	a
5382  0685 c452b5        	and	a,21173
5383  0688 c752b5        	ld	21173,a
5384  068b               L3752:
5385                     ; 2007 }
5388  068b 85            	popw	x
5389  068c 81            	ret
5494                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5494                     ; 2024 {
5495                     	switch	.text
5496  068d               _TIM1_GenerateEvent:
5500                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5502                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5504  068d c752b8        	ld	21176,a
5505                     ; 2030 }
5508  0690 81            	ret
5678                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5678                     ; 2050 {
5679                     	switch	.text
5680  0691               _TIM1_GetFlagStatus:
5682  0691 89            	pushw	x
5683  0692 89            	pushw	x
5684       00000002      OFST:	set	2
5687                     ; 2051   FlagStatus bitstatus = RESET;
5689                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5693                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5695                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5697  0693 9f            	ld	a,xl
5698  0694 c452b6        	and	a,21174
5699  0697 6b01          	ld	(OFST-1,sp),a
5701                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5703  0699 c652b7        	ld	a,21175
5704  069c 1403          	and	a,(OFST+1,sp)
5705  069e 6b02          	ld	(OFST+0,sp),a
5707                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5709  06a0 7b01          	ld	a,(OFST-1,sp)
5710  06a2 1a02          	or	a,(OFST+0,sp)
5711  06a4 2706          	jreq	L1372
5712                     ; 2062     bitstatus = SET;
5714  06a6 a601          	ld	a,#1
5715  06a8 6b02          	ld	(OFST+0,sp),a
5718  06aa 2002          	jra	L3372
5719  06ac               L1372:
5720                     ; 2066     bitstatus = RESET;
5722  06ac 0f02          	clr	(OFST+0,sp)
5724  06ae               L3372:
5725                     ; 2068   return (FlagStatus)(bitstatus);
5727  06ae 7b02          	ld	a,(OFST+0,sp)
5730  06b0 5b04          	addw	sp,#4
5731  06b2 81            	ret
5766                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5766                     ; 2090 {
5767                     	switch	.text
5768  06b3               _TIM1_ClearFlag:
5770  06b3 89            	pushw	x
5771       00000000      OFST:	set	0
5774                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5776                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5778  06b4 9f            	ld	a,xl
5779  06b5 43            	cpl	a
5780  06b6 c752b6        	ld	21174,a
5781                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5783  06b9 7b01          	ld	a,(OFST+1,sp)
5784  06bb 43            	cpl	a
5785  06bc a41e          	and	a,#30
5786  06be c752b7        	ld	21175,a
5787                     ; 2097 }
5790  06c1 85            	popw	x
5791  06c2 81            	ret
5851                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5851                     ; 2115 {
5852                     	switch	.text
5853  06c3               _TIM1_GetITStatus:
5855  06c3 88            	push	a
5856  06c4 89            	pushw	x
5857       00000002      OFST:	set	2
5860                     ; 2116   ITStatus bitstatus = RESET;
5862                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5866                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5868                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5870  06c5 c452b6        	and	a,21174
5871  06c8 6b01          	ld	(OFST-1,sp),a
5873                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5875  06ca c652b5        	ld	a,21173
5876  06cd 1403          	and	a,(OFST+1,sp)
5877  06cf 6b02          	ld	(OFST+0,sp),a
5879                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5881  06d1 0d01          	tnz	(OFST-1,sp)
5882  06d3 270a          	jreq	L1003
5884  06d5 0d02          	tnz	(OFST+0,sp)
5885  06d7 2706          	jreq	L1003
5886                     ; 2129     bitstatus = SET;
5888  06d9 a601          	ld	a,#1
5889  06db 6b02          	ld	(OFST+0,sp),a
5892  06dd 2002          	jra	L3003
5893  06df               L1003:
5894                     ; 2133     bitstatus = RESET;
5896  06df 0f02          	clr	(OFST+0,sp)
5898  06e1               L3003:
5899                     ; 2135   return (ITStatus)(bitstatus);
5901  06e1 7b02          	ld	a,(OFST+0,sp)
5904  06e3 5b03          	addw	sp,#3
5905  06e5 81            	ret
5941                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5941                     ; 2153 {
5942                     	switch	.text
5943  06e6               _TIM1_ClearITPendingBit:
5947                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5949                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5951  06e6 43            	cpl	a
5952  06e7 c752b6        	ld	21174,a
5953                     ; 2159 }
5956  06ea 81            	ret
6494                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6494                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6494                     ; 2169 {
6495                     	switch	.text
6496  06eb               _TIM1_DMAConfig:
6500                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6502                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6504                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6506  06eb 9e            	ld	a,xh
6507  06ec c752d1        	ld	21201,a
6508                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6510  06ef 9f            	ld	a,xl
6511  06f0 c752d2        	ld	21202,a
6512                     ; 2177 }
6515  06f3 81            	ret
6609                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6609                     ; 2190 {
6610                     	switch	.text
6611  06f4               _TIM1_DMACmd:
6613  06f4 89            	pushw	x
6614       00000000      OFST:	set	0
6617                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6619                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6621                     ; 2195   if (NewState != DISABLE)
6623  06f5 9f            	ld	a,xl
6624  06f6 4d            	tnz	a
6625  06f7 2709          	jreq	L7133
6626                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6628  06f9 9e            	ld	a,xh
6629  06fa ca52b4        	or	a,21172
6630  06fd c752b4        	ld	21172,a
6632  0700 2009          	jra	L1233
6633  0702               L7133:
6634                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6636  0702 7b01          	ld	a,(OFST+1,sp)
6637  0704 43            	cpl	a
6638  0705 c452b4        	and	a,21172
6639  0708 c752b4        	ld	21172,a
6640  070b               L1233:
6641                     ; 2205 }
6644  070b 85            	popw	x
6645  070c 81            	ret
6680                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6680                     ; 2214 {
6681                     	switch	.text
6682  070d               _TIM1_SelectCCDMA:
6686                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6688                     ; 2218   if (NewState != DISABLE)
6690  070d 4d            	tnz	a
6691  070e 2706          	jreq	L1433
6692                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6694  0710 721652b1      	bset	21169,#3
6696  0714 2004          	jra	L3433
6697  0716               L1433:
6698                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6700  0716 721752b1      	bres	21169,#3
6701  071a               L3433:
6702                     ; 2228 }
6705  071a 81            	ret
6729                     ; 2251 void TIM1_InternalClockConfig(void)
6729                     ; 2252 {
6730                     	switch	.text
6731  071b               _TIM1_InternalClockConfig:
6735                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6737  071b c652b2        	ld	a,21170
6738  071e a4f8          	and	a,#248
6739  0720 c752b2        	ld	21170,a
6740                     ; 2255 }
6743  0723 81            	ret
6830                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6830                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6830                     ; 2274                                  uint8_t ICFilter)
6830                     ; 2275 {
6831                     	switch	.text
6832  0724               _TIM1_TIxExternalClockConfig:
6834  0724 89            	pushw	x
6835       00000000      OFST:	set	0
6838                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6840                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6842                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6844                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6846  0725 9e            	ld	a,xh
6847  0726 a160          	cp	a,#96
6848  0728 260e          	jrne	L3143
6849                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6851  072a 7b05          	ld	a,(OFST+5,sp)
6852  072c 88            	push	a
6853  072d 9f            	ld	a,xl
6854  072e ae0001        	ldw	x,#1
6855  0731 95            	ld	xh,a
6856  0732 cd083b        	call	L5_TI2_Config
6858  0735 84            	pop	a
6860  0736 200d          	jra	L5143
6861  0738               L3143:
6862                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6864  0738 7b05          	ld	a,(OFST+5,sp)
6865  073a 88            	push	a
6866  073b 7b03          	ld	a,(OFST+3,sp)
6867  073d ae0001        	ldw	x,#1
6868  0740 95            	ld	xh,a
6869  0741 cd080b        	call	L3_TI1_Config
6871  0744 84            	pop	a
6872  0745               L5143:
6873                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6875  0745 7b01          	ld	a,(OFST+1,sp)
6876  0747 ad34          	call	_TIM1_SelectInputTrigger
6878                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6880  0749 c652b2        	ld	a,21170
6881  074c aa07          	or	a,#7
6882  074e c752b2        	ld	21170,a
6883                     ; 2296 }
6886  0751 85            	popw	x
6887  0752 81            	ret
7002                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7002                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7002                     ; 2316                               uint8_t ExtTRGFilter)
7002                     ; 2317 {
7003                     	switch	.text
7004  0753               _TIM1_ETRClockMode1Config:
7006  0753 89            	pushw	x
7007       00000000      OFST:	set	0
7010                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7012                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7014                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7016                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7018  0754 7b05          	ld	a,(OFST+5,sp)
7019  0756 88            	push	a
7020  0757 9f            	ld	a,xl
7021  0758 97            	ld	xl,a
7022  0759 7b02          	ld	a,(OFST+2,sp)
7023  075b 95            	ld	xh,a
7024  075c ad54          	call	_TIM1_ETRConfig
7026  075e 84            	pop	a
7027                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7027                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7029  075f c652b2        	ld	a,21170
7030  0762 a488          	and	a,#136
7031  0764 aa77          	or	a,#119
7032  0766 c752b2        	ld	21170,a
7033                     ; 2329 }
7036  0769 85            	popw	x
7037  076a 81            	ret
7093                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7093                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7093                     ; 2349                               uint8_t ExtTRGFilter)
7093                     ; 2350 {
7094                     	switch	.text
7095  076b               _TIM1_ETRClockMode2Config:
7097  076b 89            	pushw	x
7098       00000000      OFST:	set	0
7101                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7103                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7105                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7107  076c 7b05          	ld	a,(OFST+5,sp)
7108  076e 88            	push	a
7109  076f 9f            	ld	a,xl
7110  0770 97            	ld	xl,a
7111  0771 7b02          	ld	a,(OFST+2,sp)
7112  0773 95            	ld	xh,a
7113  0774 ad3c          	call	_TIM1_ETRConfig
7115  0776 84            	pop	a
7116                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7118  0777 721c52b3      	bset	21171,#6
7119                     ; 2360 }
7122  077b 85            	popw	x
7123  077c 81            	ret
7230                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7230                     ; 2411 {
7231                     	switch	.text
7232  077d               _TIM1_SelectInputTrigger:
7234  077d 88            	push	a
7235       00000000      OFST:	set	0
7238                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7240                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7242  077e c652b2        	ld	a,21170
7243  0781 a48f          	and	a,#143
7244  0783 1a01          	or	a,(OFST+1,sp)
7245  0785 c752b2        	ld	21170,a
7246                     ; 2417 }
7249  0788 84            	pop	a
7250  0789 81            	ret
7356                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7356                     ; 2434 {
7357                     	switch	.text
7358  078a               _TIM1_SelectOutputTrigger:
7360  078a 88            	push	a
7361       00000000      OFST:	set	0
7364                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7366                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7368  078b c652b1        	ld	a,21169
7369  078e a48f          	and	a,#143
7370  0790 1a01          	or	a,(OFST+1,sp)
7371  0792 c752b1        	ld	21169,a
7372                     ; 2439 }
7375  0795 84            	pop	a
7376  0796 81            	ret
7450                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7450                     ; 2452 {
7451                     	switch	.text
7452  0797               _TIM1_SelectSlaveMode:
7454  0797 88            	push	a
7455       00000000      OFST:	set	0
7458                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7460                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7462  0798 c652b2        	ld	a,21170
7463  079b a4f8          	and	a,#248
7464  079d 1a01          	or	a,(OFST+1,sp)
7465  079f c752b2        	ld	21170,a
7466                     ; 2459 }
7469  07a2 84            	pop	a
7470  07a3 81            	ret
7506                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7506                     ; 2468 {
7507                     	switch	.text
7508  07a4               _TIM1_SelectMasterSlaveMode:
7512                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7514                     ; 2473   if (NewState != DISABLE)
7516  07a4 4d            	tnz	a
7517  07a5 2706          	jreq	L7663
7518                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7520  07a7 721e52b2      	bset	21170,#7
7522  07ab 2004          	jra	L1763
7523  07ad               L7663:
7524                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7526  07ad 721f52b2      	bres	21170,#7
7527  07b1               L1763:
7528                     ; 2481 }
7531  07b1 81            	ret
7585                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7585                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7585                     ; 2501                     uint8_t ExtTRGFilter)
7585                     ; 2502 {
7586                     	switch	.text
7587  07b2               _TIM1_ETRConfig:
7589  07b2 89            	pushw	x
7590       00000000      OFST:	set	0
7593                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7595                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7595                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7595                     ; 2508                          | (uint8_t) ExtTRGFilter);
7597  07b3 9f            	ld	a,xl
7598  07b4 1a01          	or	a,(OFST+1,sp)
7599  07b6 1a05          	or	a,(OFST+5,sp)
7600  07b8 ca52b3        	or	a,21171
7601  07bb c752b3        	ld	21171,a
7602                     ; 2509 }
7605  07be 85            	popw	x
7606  07bf 81            	ret
7692                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7692                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7692                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7692                     ; 2550 {
7693                     	switch	.text
7694  07c0               _TIM1_EncoderInterfaceConfig:
7696  07c0 89            	pushw	x
7697       00000000      OFST:	set	0
7700                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7702                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7704                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7706                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7708  07c1 9f            	ld	a,xl
7709  07c2 4d            	tnz	a
7710  07c3 2706          	jreq	L7573
7711                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7713  07c5 721252bd      	bset	21181,#1
7715  07c9 2004          	jra	L1673
7716  07cb               L7573:
7717                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7719  07cb 721352bd      	bres	21181,#1
7720  07cf               L1673:
7721                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7723  07cf 0d05          	tnz	(OFST+5,sp)
7724  07d1 2706          	jreq	L3673
7725                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7727  07d3 721a52bd      	bset	21181,#5
7729  07d7 2004          	jra	L5673
7730  07d9               L3673:
7731                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7733  07d9 721b52bd      	bres	21181,#5
7734  07dd               L5673:
7735                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7737  07dd c652b2        	ld	a,21170
7738  07e0 a4f0          	and	a,#240
7739  07e2 1a01          	or	a,(OFST+1,sp)
7740  07e4 c752b2        	ld	21170,a
7741                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7743  07e7 c652b9        	ld	a,21177
7744  07ea a4fc          	and	a,#252
7745  07ec aa01          	or	a,#1
7746  07ee c752b9        	ld	21177,a
7747                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7749  07f1 c652ba        	ld	a,21178
7750  07f4 a4fc          	and	a,#252
7751  07f6 aa01          	or	a,#1
7752  07f8 c752ba        	ld	21178,a
7753                     ; 2581 }
7756  07fb 85            	popw	x
7757  07fc 81            	ret
7793                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7793                     ; 2590 {
7794                     	switch	.text
7795  07fd               _TIM1_SelectHallSensor:
7799                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7801                     ; 2595   if (NewState != DISABLE)
7803  07fd 4d            	tnz	a
7804  07fe 2706          	jreq	L5004
7805                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7807  0800 721e52b1      	bset	21169,#7
7809  0804 2004          	jra	L7004
7810  0806               L5004:
7811                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7813  0806 721f52b1      	bres	21169,#7
7814  080a               L7004:
7815                     ; 2603 }
7818  080a 81            	ret
7864                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7864                     ; 2624 {
7865                     	switch	.text
7866  080b               L3_TI1_Config:
7868  080b 89            	pushw	x
7869  080c 88            	push	a
7870       00000001      OFST:	set	1
7873                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7875  080d 721152bd      	bres	21181,#0
7876                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7876                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7878  0811 7b06          	ld	a,(OFST+5,sp)
7879  0813 97            	ld	xl,a
7880  0814 a610          	ld	a,#16
7881  0816 42            	mul	x,a
7882  0817 9f            	ld	a,xl
7883  0818 1a03          	or	a,(OFST+2,sp)
7884  081a 6b01          	ld	(OFST+0,sp),a
7886  081c c652b9        	ld	a,21177
7887  081f a40c          	and	a,#12
7888  0821 1a01          	or	a,(OFST+0,sp)
7889  0823 c752b9        	ld	21177,a
7890                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7892  0826 0d02          	tnz	(OFST+1,sp)
7893  0828 2706          	jreq	L1304
7894                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7896  082a 721252bd      	bset	21181,#1
7898  082e 2004          	jra	L3304
7899  0830               L1304:
7900                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7902  0830 721352bd      	bres	21181,#1
7903  0834               L3304:
7904                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7906  0834 721052bd      	bset	21181,#0
7907                     ; 2647 }
7910  0838 5b03          	addw	sp,#3
7911  083a 81            	ret
7957                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7957                     ; 2664 {
7958                     	switch	.text
7959  083b               L5_TI2_Config:
7961  083b 89            	pushw	x
7962  083c 88            	push	a
7963       00000001      OFST:	set	1
7966                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7968  083d 721952bd      	bres	21181,#4
7969                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7969                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7971  0841 7b06          	ld	a,(OFST+5,sp)
7972  0843 97            	ld	xl,a
7973  0844 a610          	ld	a,#16
7974  0846 42            	mul	x,a
7975  0847 9f            	ld	a,xl
7976  0848 1a03          	or	a,(OFST+2,sp)
7977  084a 6b01          	ld	(OFST+0,sp),a
7979  084c c652ba        	ld	a,21178
7980  084f a40c          	and	a,#12
7981  0851 1a01          	or	a,(OFST+0,sp)
7982  0853 c752ba        	ld	21178,a
7983                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7985  0856 0d02          	tnz	(OFST+1,sp)
7986  0858 2706          	jreq	L5504
7987                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7989  085a 721a52bd      	bset	21181,#5
7991  085e 2004          	jra	L7504
7992  0860               L5504:
7993                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7995  0860 721b52bd      	bres	21181,#5
7996  0864               L7504:
7997                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7999  0864 721852bd      	bset	21181,#4
8000                     ; 2682 }
8003  0868 5b03          	addw	sp,#3
8004  086a 81            	ret
8050                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8050                     ; 2699 {
8051                     	switch	.text
8052  086b               L7_TI3_Config:
8054  086b 89            	pushw	x
8055  086c 88            	push	a
8056       00000001      OFST:	set	1
8059                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8061  086d 721152be      	bres	21182,#0
8062                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8062                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8064  0871 7b06          	ld	a,(OFST+5,sp)
8065  0873 97            	ld	xl,a
8066  0874 a610          	ld	a,#16
8067  0876 42            	mul	x,a
8068  0877 9f            	ld	a,xl
8069  0878 1a03          	or	a,(OFST+2,sp)
8070  087a 6b01          	ld	(OFST+0,sp),a
8072  087c c652bb        	ld	a,21179
8073  087f a40c          	and	a,#12
8074  0881 1a01          	or	a,(OFST+0,sp)
8075  0883 c752bb        	ld	21179,a
8076                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8078  0886 0d02          	tnz	(OFST+1,sp)
8079  0888 2706          	jreq	L1014
8080                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8082  088a 721252be      	bset	21182,#1
8084  088e 2004          	jra	L3014
8085  0890               L1014:
8086                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8088  0890 721352be      	bres	21182,#1
8089  0894               L3014:
8090                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8092  0894 721052be      	bset	21182,#0
8093                     ; 2718 }
8096  0898 5b03          	addw	sp,#3
8097  089a 81            	ret
8143                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8143                     ; 2734 {
8144                     	switch	.text
8145  089b               L11_TI4_Config:
8147  089b 89            	pushw	x
8148  089c 88            	push	a
8149       00000001      OFST:	set	1
8152                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8154  089d 721952be      	bres	21182,#4
8155                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8155                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8157  08a1 7b06          	ld	a,(OFST+5,sp)
8158  08a3 97            	ld	xl,a
8159  08a4 a610          	ld	a,#16
8160  08a6 42            	mul	x,a
8161  08a7 9f            	ld	a,xl
8162  08a8 1a03          	or	a,(OFST+2,sp)
8163  08aa 6b01          	ld	(OFST+0,sp),a
8165  08ac c652bc        	ld	a,21180
8166  08af a40c          	and	a,#12
8167  08b1 1a01          	or	a,(OFST+0,sp)
8168  08b3 c752bc        	ld	21180,a
8169                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8171  08b6 0d02          	tnz	(OFST+1,sp)
8172  08b8 2706          	jreq	L5214
8173                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8175  08ba 721a52be      	bset	21182,#5
8177  08be 2004          	jra	L7214
8178  08c0               L5214:
8179                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8181  08c0 721b52be      	bres	21182,#5
8182  08c4               L7214:
8183                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8185  08c4 721852be      	bset	21182,#4
8186                     ; 2755 }
8189  08c8 5b03          	addw	sp,#3
8190  08ca 81            	ret
8203                     	xdef	_TIM1_SelectHallSensor
8204                     	xdef	_TIM1_EncoderInterfaceConfig
8205                     	xdef	_TIM1_ETRConfig
8206                     	xdef	_TIM1_SelectMasterSlaveMode
8207                     	xdef	_TIM1_SelectSlaveMode
8208                     	xdef	_TIM1_SelectOutputTrigger
8209                     	xdef	_TIM1_SelectInputTrigger
8210                     	xdef	_TIM1_ETRClockMode2Config
8211                     	xdef	_TIM1_ETRClockMode1Config
8212                     	xdef	_TIM1_TIxExternalClockConfig
8213                     	xdef	_TIM1_InternalClockConfig
8214                     	xdef	_TIM1_SelectCCDMA
8215                     	xdef	_TIM1_DMACmd
8216                     	xdef	_TIM1_DMAConfig
8217                     	xdef	_TIM1_ClearITPendingBit
8218                     	xdef	_TIM1_GetITStatus
8219                     	xdef	_TIM1_ClearFlag
8220                     	xdef	_TIM1_GetFlagStatus
8221                     	xdef	_TIM1_GenerateEvent
8222                     	xdef	_TIM1_ITConfig
8223                     	xdef	_TIM1_SetIC4Prescaler
8224                     	xdef	_TIM1_SetIC3Prescaler
8225                     	xdef	_TIM1_SetIC2Prescaler
8226                     	xdef	_TIM1_SetIC1Prescaler
8227                     	xdef	_TIM1_GetCapture4
8228                     	xdef	_TIM1_GetCapture3
8229                     	xdef	_TIM1_GetCapture2
8230                     	xdef	_TIM1_GetCapture1
8231                     	xdef	_TIM1_PWMIConfig
8232                     	xdef	_TIM1_ICInit
8233                     	xdef	_TIM1_CCxNCmd
8234                     	xdef	_TIM1_CCxCmd
8235                     	xdef	_TIM1_SelectCOM
8236                     	xdef	_TIM1_SelectOCREFClear
8237                     	xdef	_TIM1_OC3NPolarityConfig
8238                     	xdef	_TIM1_OC3PolarityConfig
8239                     	xdef	_TIM1_OC2NPolarityConfig
8240                     	xdef	_TIM1_OC2PolarityConfig
8241                     	xdef	_TIM1_OC1NPolarityConfig
8242                     	xdef	_TIM1_OC1PolarityConfig
8243                     	xdef	_TIM1_ClearOC4Ref
8244                     	xdef	_TIM1_ClearOC3Ref
8245                     	xdef	_TIM1_ClearOC2Ref
8246                     	xdef	_TIM1_ClearOC1Ref
8247                     	xdef	_TIM1_OC3FastConfig
8248                     	xdef	_TIM1_OC2FastConfig
8249                     	xdef	_TIM1_OC1FastConfig
8250                     	xdef	_TIM1_OC4PreloadConfig
8251                     	xdef	_TIM1_OC3PreloadConfig
8252                     	xdef	_TIM1_OC2PreloadConfig
8253                     	xdef	_TIM1_OC1PreloadConfig
8254                     	xdef	_TIM1_ForcedOC3Config
8255                     	xdef	_TIM1_ForcedOC2Config
8256                     	xdef	_TIM1_ForcedOC1Config
8257                     	xdef	_TIM1_CCPreloadControl
8258                     	xdef	_TIM1_SetCompare4
8259                     	xdef	_TIM1_SetCompare3
8260                     	xdef	_TIM1_SetCompare2
8261                     	xdef	_TIM1_SetCompare1
8262                     	xdef	_TIM1_SelectOCxM
8263                     	xdef	_TIM1_CtrlPWMOutputs
8264                     	xdef	_TIM1_BDTRConfig
8265                     	xdef	_TIM1_OC3Init
8266                     	xdef	_TIM1_OC2Init
8267                     	xdef	_TIM1_OC1Init
8268                     	xdef	_TIM1_Cmd
8269                     	xdef	_TIM1_SelectOnePulseMode
8270                     	xdef	_TIM1_ARRPreloadConfig
8271                     	xdef	_TIM1_UpdateRequestConfig
8272                     	xdef	_TIM1_UpdateDisableConfig
8273                     	xdef	_TIM1_GetPrescaler
8274                     	xdef	_TIM1_GetCounter
8275                     	xdef	_TIM1_SetAutoreload
8276                     	xdef	_TIM1_SetCounter
8277                     	xdef	_TIM1_CounterModeConfig
8278                     	xdef	_TIM1_PrescalerConfig
8279                     	xdef	_TIM1_TimeBaseInit
8280                     	xdef	_TIM1_DeInit
8299                     	end
