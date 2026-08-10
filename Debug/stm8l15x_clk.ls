   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     .const:	section	.text
  15  0000               _SYSDivFactor:
  16  0000 01            	dc.b	1
  17  0001 02            	dc.b	2
  18  0002 04            	dc.b	4
  19  0003 08            	dc.b	8
  20  0004 10            	dc.b	16
  49                     ; 120 void CLK_DeInit(void)
  49                     ; 121 {
  51                     	switch	.text
  52  0000               _CLK_DeInit:
  56                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  58  0000 351150c2      	mov	20674,#17
  59                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  61  0004 725f50c6      	clr	20678
  62                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  64  0008 725f50c1      	clr	20673
  65                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  67  000c 725f50cb      	clr	20683
  68                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  70  0010 350150c8      	mov	20680,#1
  71                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  73  0014 725f50c9      	clr	20681
  74                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  76  0018 350350c0      	mov	20672,#3
  77                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  79  001c 725f50c3      	clr	20675
  80                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  82  0020 358050c4      	mov	20676,#128
  83                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  85  0024 725f50d0      	clr	20688
  86                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  88  0028 725f50ca      	clr	20682
  89                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  002c 725f50c5      	clr	20677
  92                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  94  0030 725f50cd      	clr	20685
  95                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  97  0034 725f50cc      	clr	20684
  98                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 100  0038 725f50ce      	clr	20686
 101                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 103  003c 35b950cf      	mov	20687,#185
 104                     ; 138 }
 107  0040 81            	ret
 162                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 162                     ; 161 {
 163                     	switch	.text
 164  0041               _CLK_HSICmd:
 168                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 170                     ; 165   if (NewState != DISABLE)
 172  0041 4d            	tnz	a
 173  0042 2706          	jreq	L74
 174                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 176  0044 721050c2      	bset	20674,#0
 178  0048 2004          	jra	L15
 179  004a               L74:
 180                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 182  004a 721150c2      	bres	20674,#0
 183  004e               L15:
 184                     ; 175 }
 187  004e 81            	ret
 221                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 221                     ; 189 {
 222                     	switch	.text
 223  004f               _CLK_AdjustHSICalibrationValue:
 227                     ; 191   CLK->HSIUNLCKR = 0xAC;
 229  004f 35ac50ce      	mov	20686,#172
 230                     ; 192   CLK->HSIUNLCKR = 0x35;
 232  0053 353550ce      	mov	20686,#53
 233                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 235  0057 c750cd        	ld	20685,a
 236                     ; 196 }
 239  005a 81            	ret
 274                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 274                     ; 213 {
 275                     	switch	.text
 276  005b               _CLK_LSICmd:
 280                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 282                     ; 218   if (NewState != DISABLE)
 284  005b 4d            	tnz	a
 285  005c 2706          	jreq	L501
 286                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 288  005e 721450c2      	bset	20674,#2
 290  0062 2004          	jra	L701
 291  0064               L501:
 292                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 294  0064 721550c2      	bres	20674,#2
 295  0068               L701:
 296                     ; 228 }
 299  0068 81            	ret
 361                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 361                     ; 250 {
 362                     	switch	.text
 363  0069               _CLK_HSEConfig:
 367                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 369                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 371  0069 721150c6      	bres	20678,#0
 372                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 374  006d 721950c6      	bres	20678,#4
 375                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 377  0071 ca50c6        	or	a,20678
 378  0074 c750c6        	ld	20678,a
 379                     ; 263 }
 382  0077 81            	ret
 444                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 444                     ; 281 {
 445                     	switch	.text
 446  0078               _CLK_LSEConfig:
 450                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 452                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 454  0078 721550c6      	bres	20678,#2
 455                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 457  007c 721b50c6      	bres	20678,#5
 458                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 460  0080 ca50c6        	or	a,20678
 461  0083 c750c6        	ld	20678,a
 462                     ; 295 }
 465  0086 81            	ret
 489                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 489                     ; 307 {
 490                     	switch	.text
 491  0087               _CLK_ClockSecuritySystemEnable:
 495                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 497  0087 721050ca      	bset	20682,#0
 498                     ; 310 }
 501  008b 81            	ret
 537                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 537                     ; 318 {
 538                     	switch	.text
 539  008c               _CLK_ClockSecuritySytemDeglitchCmd:
 543                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 545                     ; 322   if (NewState != DISABLE)
 547  008c 4d            	tnz	a
 548  008d 2706          	jreq	L712
 549                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 551  008f 721850ca      	bset	20682,#4
 553  0093 2004          	jra	L122
 554  0095               L712:
 555                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 557  0095 721950ca      	bres	20682,#4
 558  0099               L122:
 559                     ; 332 }
 562  0099 81            	ret
 703                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 703                     ; 357 {
 704                     	switch	.text
 705  009a               _CLK_CCOConfig:
 707  009a 89            	pushw	x
 708       00000000      OFST:	set	0
 711                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 713                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 715                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 717  009b 9f            	ld	a,xl
 718  009c 1a01          	or	a,(OFST+1,sp)
 719  009e c750c5        	ld	20677,a
 720                     ; 364 }
 723  00a1 85            	popw	x
 724  00a2 81            	ret
 798                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 798                     ; 417 {
 799                     	switch	.text
 800  00a3               _CLK_SYSCLKSourceConfig:
 804                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 806                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 808  00a3 c750c8        	ld	20680,a
 809                     ; 423 }
 812  00a6 81            	ret
 837                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 837                     ; 436 {
 838                     	switch	.text
 839  00a7               _CLK_GetSYSCLKSource:
 843                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 845  00a7 c650c7        	ld	a,20679
 848  00aa 81            	ret
 912                     ; 478 uint32_t CLK_GetClockFreq(void)
 912                     ; 479 {
 913                     	switch	.text
 914  00ab               _CLK_GetClockFreq:
 916  00ab 5209          	subw	sp,#9
 917       00000009      OFST:	set	9
 920                     ; 480   uint32_t clockfrequency = 0;
 922                     ; 481   uint32_t sourcefrequency = 0;
 924  00ad ae0000        	ldw	x,#0
 925  00b0 1f07          	ldw	(OFST-2,sp),x
 926  00b2 ae0000        	ldw	x,#0
 927  00b5 1f05          	ldw	(OFST-4,sp),x
 929                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 931                     ; 483   uint8_t tmp = 0, presc = 0;
 935                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 937  00b7 c650c7        	ld	a,20679
 938  00ba 6b09          	ld	(OFST+0,sp),a
 940                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 942  00bc 7b09          	ld	a,(OFST+0,sp)
 943  00be a101          	cp	a,#1
 944  00c0 260c          	jrne	L573
 945                     ; 490     sourcefrequency = HSI_VALUE;
 947  00c2 ae2400        	ldw	x,#9216
 948  00c5 1f07          	ldw	(OFST-2,sp),x
 949  00c7 ae00f4        	ldw	x,#244
 950  00ca 1f05          	ldw	(OFST-4,sp),x
 953  00cc 2022          	jra	L773
 954  00ce               L573:
 955                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 957  00ce 7b09          	ld	a,(OFST+0,sp)
 958  00d0 a102          	cp	a,#2
 959  00d2 260c          	jrne	L104
 960                     ; 494     sourcefrequency = LSI_VALUE;
 962  00d4 ae9470        	ldw	x,#38000
 963  00d7 1f07          	ldw	(OFST-2,sp),x
 964  00d9 ae0000        	ldw	x,#0
 965  00dc 1f05          	ldw	(OFST-4,sp),x
 968  00de 2010          	jra	L773
 969  00e0               L104:
 970                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 972  00e0 7b09          	ld	a,(OFST+0,sp)
 973  00e2 a104          	cp	a,#4
 974  00e4 260a          	jrne	L504
 975                     ; 498     sourcefrequency = HSE_VALUE;
 977  00e6 ae2400        	ldw	x,#9216
 978  00e9 1f07          	ldw	(OFST-2,sp),x
 979  00eb ae00f4        	ldw	x,#244
 980  00ee 1f05          	ldw	(OFST-4,sp),x
 983  00f0               L504:
 984                     ; 502     clockfrequency = LSE_VALUE;
 986  00f0               L773:
 987                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 989  00f0 c650c0        	ld	a,20672
 990  00f3 a407          	and	a,#7
 991  00f5 6b09          	ld	(OFST+0,sp),a
 993                     ; 507   presc = SYSDivFactor[tmp];
 995  00f7 7b09          	ld	a,(OFST+0,sp)
 996  00f9 5f            	clrw	x
 997  00fa 97            	ld	xl,a
 998  00fb d60000        	ld	a,(_SYSDivFactor,x)
 999  00fe 6b09          	ld	(OFST+0,sp),a
1001                     ; 510   clockfrequency = sourcefrequency / presc;
1003  0100 7b09          	ld	a,(OFST+0,sp)
1004  0102 b703          	ld	c_lreg+3,a
1005  0104 3f02          	clr	c_lreg+2
1006  0106 3f01          	clr	c_lreg+1
1007  0108 3f00          	clr	c_lreg
1008  010a 96            	ldw	x,sp
1009  010b 1c0001        	addw	x,#OFST-8
1010  010e cd0000        	call	c_rtol
1013  0111 96            	ldw	x,sp
1014  0112 1c0005        	addw	x,#OFST-4
1015  0115 cd0000        	call	c_ltor
1017  0118 96            	ldw	x,sp
1018  0119 1c0001        	addw	x,#OFST-8
1019  011c cd0000        	call	c_ludv
1021  011f 96            	ldw	x,sp
1022  0120 1c0005        	addw	x,#OFST-4
1023  0123 cd0000        	call	c_rtol
1026                     ; 512   return((uint32_t)clockfrequency);
1028  0126 96            	ldw	x,sp
1029  0127 1c0005        	addw	x,#OFST-4
1030  012a cd0000        	call	c_ltor
1034  012d 5b09          	addw	sp,#9
1035  012f 81            	ret
1133                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1133                     ; 529 {
1134                     	switch	.text
1135  0130               _CLK_SYSCLKDivConfig:
1139                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1141                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1143  0130 c750c0        	ld	20672,a
1144                     ; 534 }
1147  0133 81            	ret
1183                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1183                     ; 542 {
1184                     	switch	.text
1185  0134               _CLK_SYSCLKSourceSwitchCmd:
1189                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1191                     ; 546   if (NewState != DISABLE)
1193  0134 4d            	tnz	a
1194  0135 2706          	jreq	L174
1195                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1197  0137 721250c9      	bset	20681,#1
1199  013b 2004          	jra	L374
1200  013d               L174:
1201                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1203  013d 721350c9      	bres	20681,#1
1204  0141               L374:
1205                     ; 556 }
1208  0141 81            	ret
1354                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1354                     ; 617 {
1355                     	switch	.text
1356  0142               _CLK_RTCClockConfig:
1358  0142 89            	pushw	x
1359       00000000      OFST:	set	0
1362                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1364                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1366                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1368  0143 9f            	ld	a,xl
1369  0144 1a01          	or	a,(OFST+1,sp)
1370  0146 c750c1        	ld	20673,a
1371                     ; 624 }
1374  0149 85            	popw	x
1375  014a 81            	ret
1441                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1441                     ; 636 {
1442                     	switch	.text
1443  014b               _CLK_BEEPClockConfig:
1447                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1449                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1451  014b c750cb        	ld	20683,a
1452                     ; 643 }
1455  014e 81            	ret
1678                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1678                     ; 678 {
1679                     	switch	.text
1680  014f               _CLK_PeripheralClockConfig:
1682  014f 89            	pushw	x
1683  0150 88            	push	a
1684       00000001      OFST:	set	1
1687                     ; 679   uint8_t reg = 0;
1689                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1691                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1693                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1695  0151 9e            	ld	a,xh
1696  0152 a4f0          	and	a,#240
1697  0154 6b01          	ld	(OFST+0,sp),a
1699                     ; 688   if ( reg == 0x00)
1701  0156 0d01          	tnz	(OFST+0,sp)
1702  0158 2635          	jrne	L117
1703                     ; 690     if (NewState != DISABLE)
1705  015a 0d03          	tnz	(OFST+2,sp)
1706  015c 2719          	jreq	L317
1707                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1709  015e 7b02          	ld	a,(OFST+1,sp)
1710  0160 a40f          	and	a,#15
1711  0162 5f            	clrw	x
1712  0163 97            	ld	xl,a
1713  0164 a601          	ld	a,#1
1714  0166 5d            	tnzw	x
1715  0167 2704          	jreq	L64
1716  0169               L05:
1717  0169 48            	sll	a
1718  016a 5a            	decw	x
1719  016b 26fc          	jrne	L05
1720  016d               L64:
1721  016d ca50c3        	or	a,20675
1722  0170 c750c3        	ld	20675,a
1724  0173 acf901f9      	jpf	L717
1725  0177               L317:
1726                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1728  0177 7b02          	ld	a,(OFST+1,sp)
1729  0179 a40f          	and	a,#15
1730  017b 5f            	clrw	x
1731  017c 97            	ld	xl,a
1732  017d a601          	ld	a,#1
1733  017f 5d            	tnzw	x
1734  0180 2704          	jreq	L25
1735  0182               L45:
1736  0182 48            	sll	a
1737  0183 5a            	decw	x
1738  0184 26fc          	jrne	L45
1739  0186               L25:
1740  0186 43            	cpl	a
1741  0187 c450c3        	and	a,20675
1742  018a c750c3        	ld	20675,a
1743  018d 206a          	jra	L717
1744  018f               L117:
1745                     ; 701   else if (reg == 0x10)
1747  018f 7b01          	ld	a,(OFST+0,sp)
1748  0191 a110          	cp	a,#16
1749  0193 2633          	jrne	L127
1750                     ; 703     if (NewState != DISABLE)
1752  0195 0d03          	tnz	(OFST+2,sp)
1753  0197 2717          	jreq	L327
1754                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1756  0199 7b02          	ld	a,(OFST+1,sp)
1757  019b a40f          	and	a,#15
1758  019d 5f            	clrw	x
1759  019e 97            	ld	xl,a
1760  019f a601          	ld	a,#1
1761  01a1 5d            	tnzw	x
1762  01a2 2704          	jreq	L65
1763  01a4               L06:
1764  01a4 48            	sll	a
1765  01a5 5a            	decw	x
1766  01a6 26fc          	jrne	L06
1767  01a8               L65:
1768  01a8 ca50c4        	or	a,20676
1769  01ab c750c4        	ld	20676,a
1771  01ae 2049          	jra	L717
1772  01b0               L327:
1773                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1775  01b0 7b02          	ld	a,(OFST+1,sp)
1776  01b2 a40f          	and	a,#15
1777  01b4 5f            	clrw	x
1778  01b5 97            	ld	xl,a
1779  01b6 a601          	ld	a,#1
1780  01b8 5d            	tnzw	x
1781  01b9 2704          	jreq	L26
1782  01bb               L46:
1783  01bb 48            	sll	a
1784  01bc 5a            	decw	x
1785  01bd 26fc          	jrne	L46
1786  01bf               L26:
1787  01bf 43            	cpl	a
1788  01c0 c450c4        	and	a,20676
1789  01c3 c750c4        	ld	20676,a
1790  01c6 2031          	jra	L717
1791  01c8               L127:
1792                     ; 716     if (NewState != DISABLE)
1794  01c8 0d03          	tnz	(OFST+2,sp)
1795  01ca 2717          	jreq	L137
1796                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1798  01cc 7b02          	ld	a,(OFST+1,sp)
1799  01ce a40f          	and	a,#15
1800  01d0 5f            	clrw	x
1801  01d1 97            	ld	xl,a
1802  01d2 a601          	ld	a,#1
1803  01d4 5d            	tnzw	x
1804  01d5 2704          	jreq	L66
1805  01d7               L07:
1806  01d7 48            	sll	a
1807  01d8 5a            	decw	x
1808  01d9 26fc          	jrne	L07
1809  01db               L66:
1810  01db ca50d0        	or	a,20688
1811  01de c750d0        	ld	20688,a
1813  01e1 2016          	jra	L717
1814  01e3               L137:
1815                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1817  01e3 7b02          	ld	a,(OFST+1,sp)
1818  01e5 a40f          	and	a,#15
1819  01e7 5f            	clrw	x
1820  01e8 97            	ld	xl,a
1821  01e9 a601          	ld	a,#1
1822  01eb 5d            	tnzw	x
1823  01ec 2704          	jreq	L27
1824  01ee               L47:
1825  01ee 48            	sll	a
1826  01ef 5a            	decw	x
1827  01f0 26fc          	jrne	L47
1828  01f2               L27:
1829  01f2 43            	cpl	a
1830  01f3 c450d0        	and	a,20688
1831  01f6 c750d0        	ld	20688,a
1832  01f9               L717:
1833                     ; 727 }
1836  01f9 5b03          	addw	sp,#3
1837  01fb 81            	ret
1861                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1861                     ; 766 {
1862                     	switch	.text
1863  01fc               _CLK_LSEClockSecuritySystemEnable:
1867                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1869  01fc 72105190      	bset	20880,#0
1870                     ; 769 }
1873  0200 81            	ret
1897                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1897                     ; 778 {
1898                     	switch	.text
1899  0201               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1903                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1905  0201 72125190      	bset	20880,#1
1906                     ; 781 }
1909  0205 81            	ret
1984                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1984                     ; 808 {
1985                     	switch	.text
1986  0206               _CLK_HaltConfig:
1988  0206 89            	pushw	x
1989       00000000      OFST:	set	0
1992                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1994                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1996                     ; 813   if (NewState != DISABLE)
1998  0207 9f            	ld	a,xl
1999  0208 4d            	tnz	a
2000  0209 2709          	jreq	L1101
2001                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2003  020b 9e            	ld	a,xh
2004  020c ca50c2        	or	a,20674
2005  020f c750c2        	ld	20674,a
2007  0212 2009          	jra	L3101
2008  0214               L1101:
2009                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2011  0214 7b01          	ld	a,(OFST+1,sp)
2012  0216 43            	cpl	a
2013  0217 c450c2        	and	a,20674
2014  021a c750c2        	ld	20674,a
2015  021d               L3101:
2016                     ; 821 }
2019  021d 85            	popw	x
2020  021e 81            	ret
2056                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2056                     ; 832 {
2057                     	switch	.text
2058  021f               _CLK_MainRegulatorCmd:
2062                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2064                     ; 836   if (NewState != DISABLE)
2066  021f 4d            	tnz	a
2067  0220 2706          	jreq	L3301
2068                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2070  0222 721350cf      	bres	20687,#1
2072  0226 2004          	jra	L5301
2073  0228               L3301:
2074                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2076  0228 721250cf      	bset	20687,#1
2077  022c               L5301:
2078                     ; 846 }
2081  022c 81            	ret
2153                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2153                     ; 876 {
2154                     	switch	.text
2155  022d               _CLK_ITConfig:
2157  022d 89            	pushw	x
2158       00000000      OFST:	set	0
2161                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2163                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2165                     ; 882   if (NewState != DISABLE)
2167  022e 9f            	ld	a,xl
2168  022f 4d            	tnz	a
2169  0230 271d          	jreq	L3701
2170                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2172  0232 9e            	ld	a,xh
2173  0233 a11c          	cp	a,#28
2174  0235 2606          	jrne	L5701
2175                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2177  0237 721450c9      	bset	20681,#2
2179  023b 202e          	jra	L5011
2180  023d               L5701:
2181                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2183  023d 7b01          	ld	a,(OFST+1,sp)
2184  023f a12c          	cp	a,#44
2185  0241 2606          	jrne	L1011
2186                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2188  0243 72145190      	bset	20880,#2
2190  0247 2022          	jra	L5011
2191  0249               L1011:
2192                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2194  0249 721450ca      	bset	20682,#2
2195  024d 201c          	jra	L5011
2196  024f               L3701:
2197                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2199  024f 7b01          	ld	a,(OFST+1,sp)
2200  0251 a11c          	cp	a,#28
2201  0253 2606          	jrne	L7011
2202                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2204  0255 721550c9      	bres	20681,#2
2206  0259 2010          	jra	L5011
2207  025b               L7011:
2208                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2210  025b 7b01          	ld	a,(OFST+1,sp)
2211  025d a12c          	cp	a,#44
2212  025f 2606          	jrne	L3111
2213                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2215  0261 72155190      	bres	20880,#2
2217  0265 2004          	jra	L5011
2218  0267               L3111:
2219                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2221  0267 721550ca      	bres	20682,#2
2222  026b               L5011:
2223                     ; 918 }
2226  026b 85            	popw	x
2227  026c 81            	ret
2446                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2446                     ; 946 {
2447                     	switch	.text
2448  026d               _CLK_GetFlagStatus:
2450  026d 88            	push	a
2451  026e 89            	pushw	x
2452       00000002      OFST:	set	2
2455                     ; 947   uint8_t reg = 0;
2457                     ; 948   uint8_t pos = 0;
2459                     ; 949   FlagStatus bitstatus = RESET;
2461                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2463                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2465  026f a4f0          	and	a,#240
2466  0271 6b02          	ld	(OFST+0,sp),a
2468                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2470  0273 7b03          	ld	a,(OFST+1,sp)
2471  0275 a40f          	and	a,#15
2472  0277 6b01          	ld	(OFST-1,sp),a
2474                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2476  0279 0d02          	tnz	(OFST+0,sp)
2477  027b 2607          	jrne	L7221
2478                     ; 962     reg = CLK->CRTCR;
2480  027d c650c1        	ld	a,20673
2481  0280 6b02          	ld	(OFST+0,sp),a
2484  0282 2060          	jra	L1321
2485  0284               L7221:
2486                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2488  0284 7b02          	ld	a,(OFST+0,sp)
2489  0286 a110          	cp	a,#16
2490  0288 2607          	jrne	L3321
2491                     ; 966     reg = CLK->ICKCR;
2493  028a c650c2        	ld	a,20674
2494  028d 6b02          	ld	(OFST+0,sp),a
2497  028f 2053          	jra	L1321
2498  0291               L3321:
2499                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2501  0291 7b02          	ld	a,(OFST+0,sp)
2502  0293 a120          	cp	a,#32
2503  0295 2607          	jrne	L7321
2504                     ; 970     reg = CLK->CCOR;
2506  0297 c650c5        	ld	a,20677
2507  029a 6b02          	ld	(OFST+0,sp),a
2510  029c 2046          	jra	L1321
2511  029e               L7321:
2512                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2514  029e 7b02          	ld	a,(OFST+0,sp)
2515  02a0 a130          	cp	a,#48
2516  02a2 2607          	jrne	L3421
2517                     ; 974     reg = CLK->ECKCR;
2519  02a4 c650c6        	ld	a,20678
2520  02a7 6b02          	ld	(OFST+0,sp),a
2523  02a9 2039          	jra	L1321
2524  02ab               L3421:
2525                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2527  02ab 7b02          	ld	a,(OFST+0,sp)
2528  02ad a140          	cp	a,#64
2529  02af 2607          	jrne	L7421
2530                     ; 978     reg = CLK->SWCR;
2532  02b1 c650c9        	ld	a,20681
2533  02b4 6b02          	ld	(OFST+0,sp),a
2536  02b6 202c          	jra	L1321
2537  02b8               L7421:
2538                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2540  02b8 7b02          	ld	a,(OFST+0,sp)
2541  02ba a150          	cp	a,#80
2542  02bc 2607          	jrne	L3521
2543                     ; 982     reg = CLK->CSSR;
2545  02be c650ca        	ld	a,20682
2546  02c1 6b02          	ld	(OFST+0,sp),a
2549  02c3 201f          	jra	L1321
2550  02c5               L3521:
2551                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2553  02c5 7b02          	ld	a,(OFST+0,sp)
2554  02c7 a170          	cp	a,#112
2555  02c9 2607          	jrne	L7521
2556                     ; 986     reg = CLK->REGCSR;
2558  02cb c650cf        	ld	a,20687
2559  02ce 6b02          	ld	(OFST+0,sp),a
2562  02d0 2012          	jra	L1321
2563  02d2               L7521:
2564                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2566  02d2 7b02          	ld	a,(OFST+0,sp)
2567  02d4 a180          	cp	a,#128
2568  02d6 2607          	jrne	L3621
2569                     ; 990     reg = CSSLSE->CSR;
2571  02d8 c65190        	ld	a,20880
2572  02db 6b02          	ld	(OFST+0,sp),a
2575  02dd 2005          	jra	L1321
2576  02df               L3621:
2577                     ; 994     reg = CLK->CBEEPR;
2579  02df c650cb        	ld	a,20683
2580  02e2 6b02          	ld	(OFST+0,sp),a
2582  02e4               L1321:
2583                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2585  02e4 7b01          	ld	a,(OFST-1,sp)
2586  02e6 5f            	clrw	x
2587  02e7 97            	ld	xl,a
2588  02e8 a601          	ld	a,#1
2589  02ea 5d            	tnzw	x
2590  02eb 2704          	jreq	L211
2591  02ed               L411:
2592  02ed 48            	sll	a
2593  02ee 5a            	decw	x
2594  02ef 26fc          	jrne	L411
2595  02f1               L211:
2596  02f1 1402          	and	a,(OFST+0,sp)
2597  02f3 2706          	jreq	L7621
2598                     ; 1000     bitstatus = SET;
2600  02f5 a601          	ld	a,#1
2601  02f7 6b02          	ld	(OFST+0,sp),a
2604  02f9 2002          	jra	L1721
2605  02fb               L7621:
2606                     ; 1004     bitstatus = RESET;
2608  02fb 0f02          	clr	(OFST+0,sp)
2610  02fd               L1721:
2611                     ; 1008   return((FlagStatus)bitstatus);
2613  02fd 7b02          	ld	a,(OFST+0,sp)
2616  02ff 5b03          	addw	sp,#3
2617  0301 81            	ret
2640                     ; 1016 void CLK_ClearFlag(void)
2640                     ; 1017 {
2641                     	switch	.text
2642  0302               _CLK_ClearFlag:
2646                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2648  0302 72175190      	bres	20880,#3
2649                     ; 1021 }
2652  0306 81            	ret
2698                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2698                     ; 1033 {
2699                     	switch	.text
2700  0307               _CLK_GetITStatus:
2702  0307 88            	push	a
2703  0308 88            	push	a
2704       00000001      OFST:	set	1
2707                     ; 1035   ITStatus bitstatus = RESET;
2709                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2711                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2713  0309 a11c          	cp	a,#28
2714  030b 2611          	jrne	L5231
2715                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2717  030d c450c9        	and	a,20681
2718  0310 a10c          	cp	a,#12
2719  0312 2606          	jrne	L7231
2720                     ; 1045       bitstatus = SET;
2722  0314 a601          	ld	a,#1
2723  0316 6b01          	ld	(OFST+0,sp),a
2726  0318 202e          	jra	L3331
2727  031a               L7231:
2728                     ; 1049       bitstatus = RESET;
2730  031a 0f01          	clr	(OFST+0,sp)
2732  031c 202a          	jra	L3331
2733  031e               L5231:
2734                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2736  031e 7b02          	ld	a,(OFST+1,sp)
2737  0320 a12c          	cp	a,#44
2738  0322 2613          	jrne	L5331
2739                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2741  0324 c65190        	ld	a,20880
2742  0327 1402          	and	a,(OFST+1,sp)
2743  0329 a10c          	cp	a,#12
2744  032b 2606          	jrne	L7331
2745                     ; 1057       bitstatus = SET;
2747  032d a601          	ld	a,#1
2748  032f 6b01          	ld	(OFST+0,sp),a
2751  0331 2015          	jra	L3331
2752  0333               L7331:
2753                     ; 1061       bitstatus = RESET;
2755  0333 0f01          	clr	(OFST+0,sp)
2757  0335 2011          	jra	L3331
2758  0337               L5331:
2759                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2761  0337 c650ca        	ld	a,20682
2762  033a 1402          	and	a,(OFST+1,sp)
2763  033c a10c          	cp	a,#12
2764  033e 2606          	jrne	L5431
2765                     ; 1069       bitstatus = SET;
2767  0340 a601          	ld	a,#1
2768  0342 6b01          	ld	(OFST+0,sp),a
2771  0344 2002          	jra	L3331
2772  0346               L5431:
2773                     ; 1073       bitstatus = RESET;
2775  0346 0f01          	clr	(OFST+0,sp)
2777  0348               L3331:
2778                     ; 1078   return bitstatus;
2780  0348 7b01          	ld	a,(OFST+0,sp)
2783  034a 85            	popw	x
2784  034b 81            	ret
2820                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2820                     ; 1090 {
2821                     	switch	.text
2822  034c               _CLK_ClearITPendingBit:
2826                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2828                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2830  034c a4f0          	and	a,#240
2831  034e a120          	cp	a,#32
2832  0350 2606          	jrne	L7631
2833                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2835  0352 72175190      	bres	20880,#3
2837  0356 2004          	jra	L1731
2838  0358               L7631:
2839                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2841  0358 721750c9      	bres	20681,#3
2842  035c               L1731:
2843                     ; 1105 }
2846  035c 81            	ret
2871                     	xdef	_SYSDivFactor
2872                     	xdef	_CLK_ClearITPendingBit
2873                     	xdef	_CLK_GetITStatus
2874                     	xdef	_CLK_ClearFlag
2875                     	xdef	_CLK_GetFlagStatus
2876                     	xdef	_CLK_ITConfig
2877                     	xdef	_CLK_MainRegulatorCmd
2878                     	xdef	_CLK_HaltConfig
2879                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2880                     	xdef	_CLK_LSEClockSecuritySystemEnable
2881                     	xdef	_CLK_PeripheralClockConfig
2882                     	xdef	_CLK_BEEPClockConfig
2883                     	xdef	_CLK_RTCClockConfig
2884                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2885                     	xdef	_CLK_SYSCLKDivConfig
2886                     	xdef	_CLK_GetClockFreq
2887                     	xdef	_CLK_GetSYSCLKSource
2888                     	xdef	_CLK_SYSCLKSourceConfig
2889                     	xdef	_CLK_CCOConfig
2890                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2891                     	xdef	_CLK_ClockSecuritySystemEnable
2892                     	xdef	_CLK_LSEConfig
2893                     	xdef	_CLK_HSEConfig
2894                     	xdef	_CLK_LSICmd
2895                     	xdef	_CLK_AdjustHSICalibrationValue
2896                     	xdef	_CLK_HSICmd
2897                     	xdef	_CLK_DeInit
2898                     	xref.b	c_lreg
2899                     	xref.b	c_x
2918                     	xref	c_ludv
2919                     	xref	c_rtol
2920                     	xref	c_ltor
2921                     	end
