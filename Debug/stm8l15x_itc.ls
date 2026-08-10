   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  42                     ; 56 uint8_t ITC_GetCPUCC(void)
  42                     ; 57 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 59   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 60   _asm("pop a");
  57  0001 84            pop a
  59                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 87 void ITC_DeInit(void)
  85                     ; 88 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 97 }
 118  0023 81            	ret
 143                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 105 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 465                     .const:	section	.text
 466  0000               L22:
 467  0000 004d          	dc.w	L14
 468  0002 004d          	dc.w	L14
 469  0004 004d          	dc.w	L14
 470  0006 0056          	dc.w	L34
 471  0008 0056          	dc.w	L34
 472  000a 0056          	dc.w	L34
 473  000c 0056          	dc.w	L34
 474  000e 005f          	dc.w	L54
 475  0010 005f          	dc.w	L54
 476  0012 005f          	dc.w	L54
 477  0014 005f          	dc.w	L54
 478  0016 0068          	dc.w	L74
 479  0018 0068          	dc.w	L74
 480  001a 0068          	dc.w	L74
 481  001c 0068          	dc.w	L74
 482  001e 0071          	dc.w	L15
 483  0020 0071          	dc.w	L15
 484  0022 0071          	dc.w	L15
 485  0024 0071          	dc.w	L15
 486  0026 007a          	dc.w	L35
 487  0028 007a          	dc.w	L35
 488  002a 007a          	dc.w	L35
 489  002c 007a          	dc.w	L35
 490  002e 0083          	dc.w	L55
 491  0030 0083          	dc.w	L55
 492  0032 0083          	dc.w	L55
 493  0034 0083          	dc.w	L55
 494  0036 008c          	dc.w	L75
 495  0038 008c          	dc.w	L75
 496                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 496                     ; 115 {
 497                     	switch	.text
 498  0029               _ITC_GetSoftwarePriority:
 500  0029 88            	push	a
 501  002a 89            	pushw	x
 502       00000002      OFST:	set	2
 505                     ; 116   uint8_t Value = 0;
 507  002b 0f02          	clr	(OFST+0,sp)
 509                     ; 117   uint8_t Mask = 0;
 511                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 513                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 515  002d a403          	and	a,#3
 516  002f 48            	sll	a
 517  0030 5f            	clrw	x
 518  0031 97            	ld	xl,a
 519  0032 a603          	ld	a,#3
 520  0034 5d            	tnzw	x
 521  0035 2704          	jreq	L41
 522  0037               L61:
 523  0037 48            	sll	a
 524  0038 5a            	decw	x
 525  0039 26fc          	jrne	L61
 526  003b               L41:
 527  003b 6b01          	ld	(OFST-1,sp),a
 529                     ; 125   switch (IRQn)
 531  003d 7b03          	ld	a,(OFST+1,sp)
 533                     ; 223     default:
 533                     ; 224       break;
 534  003f 4a            	dec	a
 535  0040 a11d          	cp	a,#29
 536  0042 2407          	jruge	L02
 537  0044 5f            	clrw	x
 538  0045 97            	ld	xl,a
 539  0046 58            	sllw	x
 540  0047 de0000        	ldw	x,(L22,x)
 541  004a fc            	jp	(x)
 542  004b               L02:
 543  004b 2046          	jra	L122
 544  004d               L14:
 545                     ; 127     case FLASH_IRQn:
 545                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 545                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 545                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 547  004d c67f70        	ld	a,32624
 548  0050 1401          	and	a,(OFST-1,sp)
 549  0052 6b02          	ld	(OFST+0,sp),a
 551                     ; 131       break;
 553  0054 203d          	jra	L122
 554  0056               L34:
 555                     ; 133     case EXTIE_F_PVD_IRQn:
 555                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 555                     ; 135     case RTC_IRQn:
 555                     ; 136     case EXTIB_IRQn:
 555                     ; 137     case EXTID_IRQn:
 555                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 555                     ; 139     case RTC_CSSLSE_IRQn:
 555                     ; 140     case EXTIB_IRQn:
 555                     ; 141     case EXTID_IRQn:
 555                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 555                     ; 143     case RTC_CSSLSE_IRQn:
 555                     ; 144     case EXTIB_G_IRQn:
 555                     ; 145     case EXTID_H_IRQn:
 555                     ; 146 #endif  /* STM8L15X_MD */
 555                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 557  0056 c67f71        	ld	a,32625
 558  0059 1401          	and	a,(OFST-1,sp)
 559  005b 6b02          	ld	(OFST+0,sp),a
 561                     ; 148       break;
 563  005d 2034          	jra	L122
 564  005f               L54:
 565                     ; 150     case EXTI0_IRQn:
 565                     ; 151     case EXTI1_IRQn:
 565                     ; 152     case EXTI2_IRQn:
 565                     ; 153     case EXTI3_IRQn:
 565                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 567  005f c67f72        	ld	a,32626
 568  0062 1401          	and	a,(OFST-1,sp)
 569  0064 6b02          	ld	(OFST+0,sp),a
 571                     ; 155       break;
 573  0066 202b          	jra	L122
 574  0068               L74:
 575                     ; 157     case EXTI4_IRQn:
 575                     ; 158     case EXTI5_IRQn:
 575                     ; 159     case EXTI6_IRQn:
 575                     ; 160     case EXTI7_IRQn:
 575                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 577  0068 c67f73        	ld	a,32627
 578  006b 1401          	and	a,(OFST-1,sp)
 579  006d 6b02          	ld	(OFST+0,sp),a
 581                     ; 162       break;
 583  006f 2022          	jra	L122
 584  0071               L15:
 585                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 585                     ; 168 #endif /* STM8L15X_LD */		
 585                     ; 169     case ADC1_COMP_IRQn:
 585                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 585                     ; 171     case LCD_IRQn:
 585                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 585                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 585                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 585                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 585                     ; 176     case LCD_AES_IRQn:
 585                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 585                     ; 178 #endif  /* STM8L15X_MD */
 585                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 587  0071 c67f74        	ld	a,32628
 588  0074 1401          	and	a,(OFST-1,sp)
 589  0076 6b02          	ld	(OFST+0,sp),a
 591                     ; 180       break;
 593  0078 2019          	jra	L122
 594  007a               L35:
 595                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 595                     ; 184 #endif /* STM8L15X_LD */		
 595                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 595                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 595                     ; 187     case TIM2_CC_IRQn:
 595                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 595                     ; 189     case TIM3_CC_IRQn:
 595                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 595                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 595                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 595                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 595                     ; 194 #endif  /* STM8L15X_MD */
 595                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 597  007a c67f75        	ld	a,32629
 598  007d 1401          	and	a,(OFST-1,sp)
 599  007f 6b02          	ld	(OFST+0,sp),a
 601                     ; 196       break;
 603  0081 2010          	jra	L122
 604  0083               L55:
 605                     ; 199     case TIM1_CC_IRQn:
 605                     ; 200 #endif /* STM8L15X_LD */	
 605                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 605                     ; 202     case SPI1_IRQn:
 605                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 605                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 605                     ; 205     case USART1_TX_IRQn:
 605                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 605                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 605                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 605                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 607  0083 c67f76        	ld	a,32630
 608  0086 1401          	and	a,(OFST-1,sp)
 609  0088 6b02          	ld	(OFST+0,sp),a
 611                     ; 210       break;
 613  008a 2007          	jra	L122
 614  008c               L75:
 615                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 615                     ; 218     case I2C1_SPI2_IRQn:
 615                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 615                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 617  008c c67f77        	ld	a,32631
 618  008f 1401          	and	a,(OFST-1,sp)
 619  0091 6b02          	ld	(OFST+0,sp),a
 621                     ; 221       break;
 623  0093               L16:
 624                     ; 223     default:
 624                     ; 224       break;
 626  0093               L122:
 627                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 629  0093 7b03          	ld	a,(OFST+1,sp)
 630  0095 a403          	and	a,#3
 631  0097 48            	sll	a
 632  0098 5f            	clrw	x
 633  0099 97            	ld	xl,a
 634  009a 7b02          	ld	a,(OFST+0,sp)
 635  009c 5d            	tnzw	x
 636  009d 2704          	jreq	L42
 637  009f               L62:
 638  009f 44            	srl	a
 639  00a0 5a            	decw	x
 640  00a1 26fc          	jrne	L62
 641  00a3               L42:
 642  00a3 6b02          	ld	(OFST+0,sp),a
 644                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 646  00a5 7b02          	ld	a,(OFST+0,sp)
 649  00a7 5b03          	addw	sp,#3
 650  00a9 81            	ret
 710                     	switch	.const
 711  003a               L44:
 712  003a 00e2          	dc.w	L322
 713  003c 00e2          	dc.w	L322
 714  003e 00e2          	dc.w	L322
 715  0040 00f4          	dc.w	L522
 716  0042 00f4          	dc.w	L522
 717  0044 00f4          	dc.w	L522
 718  0046 00f4          	dc.w	L522
 719  0048 0106          	dc.w	L722
 720  004a 0106          	dc.w	L722
 721  004c 0106          	dc.w	L722
 722  004e 0106          	dc.w	L722
 723  0050 0118          	dc.w	L132
 724  0052 0118          	dc.w	L132
 725  0054 0118          	dc.w	L132
 726  0056 0118          	dc.w	L132
 727  0058 012a          	dc.w	L332
 728  005a 012a          	dc.w	L332
 729  005c 012a          	dc.w	L332
 730  005e 012a          	dc.w	L332
 731  0060 013c          	dc.w	L532
 732  0062 013c          	dc.w	L532
 733  0064 013c          	dc.w	L532
 734  0066 013c          	dc.w	L532
 735  0068 014e          	dc.w	L732
 736  006a 014e          	dc.w	L732
 737  006c 014e          	dc.w	L732
 738  006e 014e          	dc.w	L732
 739  0070 0160          	dc.w	L142
 740  0072 0160          	dc.w	L142
 741                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 741                     ; 251 {
 742                     	switch	.text
 743  00aa               _ITC_SetSoftwarePriority:
 745  00aa 89            	pushw	x
 746  00ab 89            	pushw	x
 747       00000002      OFST:	set	2
 750                     ; 252   uint8_t Mask = 0;
 752                     ; 253   uint8_t NewPriority = 0;
 754                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 756                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 758                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 760                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 762  00ac 9e            	ld	a,xh
 763  00ad a403          	and	a,#3
 764  00af 48            	sll	a
 765  00b0 5f            	clrw	x
 766  00b1 97            	ld	xl,a
 767  00b2 a603          	ld	a,#3
 768  00b4 5d            	tnzw	x
 769  00b5 2704          	jreq	L23
 770  00b7               L43:
 771  00b7 48            	sll	a
 772  00b8 5a            	decw	x
 773  00b9 26fc          	jrne	L43
 774  00bb               L23:
 775  00bb 43            	cpl	a
 776  00bc 6b01          	ld	(OFST-1,sp),a
 778                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 780  00be 7b03          	ld	a,(OFST+1,sp)
 781  00c0 a403          	and	a,#3
 782  00c2 48            	sll	a
 783  00c3 5f            	clrw	x
 784  00c4 97            	ld	xl,a
 785  00c5 7b04          	ld	a,(OFST+2,sp)
 786  00c7 5d            	tnzw	x
 787  00c8 2704          	jreq	L63
 788  00ca               L04:
 789  00ca 48            	sll	a
 790  00cb 5a            	decw	x
 791  00cc 26fc          	jrne	L04
 792  00ce               L63:
 793  00ce 6b02          	ld	(OFST+0,sp),a
 795                     ; 268   switch (IRQn)
 797  00d0 7b03          	ld	a,(OFST+1,sp)
 799                     ; 372     default:
 799                     ; 373       break;
 800  00d2 4a            	dec	a
 801  00d3 a11d          	cp	a,#29
 802  00d5 2407          	jruge	L24
 803  00d7 5f            	clrw	x
 804  00d8 97            	ld	xl,a
 805  00d9 58            	sllw	x
 806  00da de003a        	ldw	x,(L44,x)
 807  00dd fc            	jp	(x)
 808  00de               L24:
 809  00de ac700170      	jpf	L572
 810  00e2               L322:
 811                     ; 270     case FLASH_IRQn:
 811                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 811                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 811                     ; 273       ITC->ISPR1 &= Mask;
 813  00e2 c67f70        	ld	a,32624
 814  00e5 1401          	and	a,(OFST-1,sp)
 815  00e7 c77f70        	ld	32624,a
 816                     ; 274       ITC->ISPR1 |= NewPriority;
 818  00ea c67f70        	ld	a,32624
 819  00ed 1a02          	or	a,(OFST+0,sp)
 820  00ef c77f70        	ld	32624,a
 821                     ; 275       break;
 823  00f2 207c          	jra	L572
 824  00f4               L522:
 825                     ; 277     case EXTIE_F_PVD_IRQn:
 825                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 825                     ; 279     case RTC_IRQn:
 825                     ; 280     case EXTIB_IRQn:
 825                     ; 281     case EXTID_IRQn:
 825                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 825                     ; 283     case RTC_CSSLSE_IRQn:
 825                     ; 284     case EXTIB_IRQn:
 825                     ; 285     case EXTID_IRQn:
 825                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 825                     ; 287     case RTC_CSSLSE_IRQn:
 825                     ; 288     case EXTIB_G_IRQn:
 825                     ; 289     case EXTID_H_IRQn:
 825                     ; 290 #endif  /* STM8L15X_MD */
 825                     ; 291       ITC->ISPR2 &= Mask;
 827  00f4 c67f71        	ld	a,32625
 828  00f7 1401          	and	a,(OFST-1,sp)
 829  00f9 c77f71        	ld	32625,a
 830                     ; 292       ITC->ISPR2 |= NewPriority;
 832  00fc c67f71        	ld	a,32625
 833  00ff 1a02          	or	a,(OFST+0,sp)
 834  0101 c77f71        	ld	32625,a
 835                     ; 293       break;
 837  0104 206a          	jra	L572
 838  0106               L722:
 839                     ; 295     case EXTI0_IRQn:
 839                     ; 296     case EXTI1_IRQn:
 839                     ; 297     case EXTI2_IRQn:
 839                     ; 298     case EXTI3_IRQn:
 839                     ; 299       ITC->ISPR3 &= Mask;
 841  0106 c67f72        	ld	a,32626
 842  0109 1401          	and	a,(OFST-1,sp)
 843  010b c77f72        	ld	32626,a
 844                     ; 300       ITC->ISPR3 |= NewPriority;
 846  010e c67f72        	ld	a,32626
 847  0111 1a02          	or	a,(OFST+0,sp)
 848  0113 c77f72        	ld	32626,a
 849                     ; 301       break;
 851  0116 2058          	jra	L572
 852  0118               L132:
 853                     ; 303     case EXTI4_IRQn:
 853                     ; 304     case EXTI5_IRQn:
 853                     ; 305     case EXTI6_IRQn:
 853                     ; 306     case EXTI7_IRQn:
 853                     ; 307       ITC->ISPR4 &= Mask;
 855  0118 c67f73        	ld	a,32627
 856  011b 1401          	and	a,(OFST-1,sp)
 857  011d c77f73        	ld	32627,a
 858                     ; 308       ITC->ISPR4 |= NewPriority;
 860  0120 c67f73        	ld	a,32627
 861  0123 1a02          	or	a,(OFST+0,sp)
 862  0125 c77f73        	ld	32627,a
 863                     ; 309       break;
 865  0128 2046          	jra	L572
 866  012a               L332:
 867                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 867                     ; 312 #else
 867                     ; 313     case SWITCH_CSS_IRQn:
 867                     ; 314 #endif /*	STM8L15X_LD	*/
 867                     ; 315     case ADC1_COMP_IRQn:
 867                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 867                     ; 317     case LCD_IRQn:
 867                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 867                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 867                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 867                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 867                     ; 322     case LCD_AES_IRQn:
 867                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 867                     ; 324 #endif  /* STM8L15X_MD */
 867                     ; 325       ITC->ISPR5 &= Mask;
 869  012a c67f74        	ld	a,32628
 870  012d 1401          	and	a,(OFST-1,sp)
 871  012f c77f74        	ld	32628,a
 872                     ; 326       ITC->ISPR5 |= NewPriority;
 874  0132 c67f74        	ld	a,32628
 875  0135 1a02          	or	a,(OFST+0,sp)
 876  0137 c77f74        	ld	32628,a
 877                     ; 327       break;
 879  013a 2034          	jra	L572
 880  013c               L532:
 881                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 881                     ; 330 #endif  /* STM8L15X_LD */
 881                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 881                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 881                     ; 333     case TIM2_CC_IRQn:
 881                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 881                     ; 335     case TIM3_CC_IRQn:
 881                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 881                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 881                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 881                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 881                     ; 340 #endif  /* STM8L15X_MD */
 881                     ; 341       ITC->ISPR6 &= Mask;
 883  013c c67f75        	ld	a,32629
 884  013f 1401          	and	a,(OFST-1,sp)
 885  0141 c77f75        	ld	32629,a
 886                     ; 342       ITC->ISPR6 |= NewPriority;
 888  0144 c67f75        	ld	a,32629
 889  0147 1a02          	or	a,(OFST+0,sp)
 890  0149 c77f75        	ld	32629,a
 891                     ; 343       break;
 893  014c 2022          	jra	L572
 894  014e               L732:
 895                     ; 346     case TIM1_CC_IRQn:
 895                     ; 347 #endif  /* STM8L15X_LD */
 895                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 895                     ; 349     case SPI1_IRQn:
 895                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 895                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 895                     ; 352     case USART1_TX_IRQn:
 895                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 895                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 895                     ; 355 #endif  /* STM8L15X_MD */
 895                     ; 356       ITC->ISPR7 &= Mask;
 897  014e c67f76        	ld	a,32630
 898  0151 1401          	and	a,(OFST-1,sp)
 899  0153 c77f76        	ld	32630,a
 900                     ; 357       ITC->ISPR7 |= NewPriority;
 902  0156 c67f76        	ld	a,32630
 903  0159 1a02          	or	a,(OFST+0,sp)
 904  015b c77f76        	ld	32630,a
 905                     ; 358       break;
 907  015e 2010          	jra	L572
 908  0160               L142:
 909                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 909                     ; 366     case I2C1_SPI2_IRQn:
 909                     ; 367 #endif  /* STM8L15X_MD */
 909                     ; 368       ITC->ISPR8 &= Mask;
 911  0160 c67f77        	ld	a,32631
 912  0163 1401          	and	a,(OFST-1,sp)
 913  0165 c77f77        	ld	32631,a
 914                     ; 369       ITC->ISPR8 |= NewPriority;
 916  0168 c67f77        	ld	a,32631
 917  016b 1a02          	or	a,(OFST+0,sp)
 918  016d c77f77        	ld	32631,a
 919                     ; 370       break;
 921  0170               L342:
 922                     ; 372     default:
 922                     ; 373       break;
 924  0170               L572:
 925                     ; 375 }
 928  0170 5b04          	addw	sp,#4
 929  0172 81            	ret
 942                     	xdef	_ITC_GetSoftwarePriority
 943                     	xdef	_ITC_SetSoftwarePriority
 944                     	xdef	_ITC_GetSoftIntStatus
 945                     	xdef	_ITC_GetCPUCC
 946                     	xdef	_ITC_DeInit
 965                     	end
