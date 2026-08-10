   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
 173                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 173                     ; 136 {
 175                     	switch	.text
 176  0000               _ADC_DeInit:
 180                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 182  0000 7f            	clr	(x)
 183                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 185  0001 6f01          	clr	(1,x)
 186                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 188  0003 a61f          	ld	a,#31
 189  0005 e702          	ld	(2,x),a
 190                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 192  0007 a6ff          	ld	a,#255
 193  0009 e703          	ld	(3,x),a
 194                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 196  000b a60f          	ld	a,#15
 197  000d e706          	ld	(6,x),a
 198                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 200  000f a6ff          	ld	a,#255
 201  0011 e707          	ld	(7,x),a
 202                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 204  0013 6f08          	clr	(8,x)
 205                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 207  0015 6f09          	clr	(9,x)
 208                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 210  0017 6f0a          	clr	(10,x)
 211                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 213  0019 6f0b          	clr	(11,x)
 214                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 216  001b 6f0c          	clr	(12,x)
 217                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 219  001d 6f0d          	clr	(13,x)
 220                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 222  001f 6f0e          	clr	(14,x)
 223                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 225  0021 6f0f          	clr	(15,x)
 226                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 228  0023 6f10          	clr	(16,x)
 229                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 231  0025 6f11          	clr	(17,x)
 232                     ; 164 }
 235  0027 81            	ret
 382                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 382                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 382                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 382                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 382                     ; 190 {
 383                     	switch	.text
 384  0028               _ADC_Init:
 386  0028 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 392                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 394                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 396                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 398  0029 f6            	ld	a,(x)
 399  002a a49b          	and	a,#155
 400  002c f7            	ld	(x),a
 401                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 403  002d 7b05          	ld	a,(OFST+5,sp)
 404  002f 1a06          	or	a,(OFST+6,sp)
 405  0031 fa            	or	a,(x)
 406  0032 f7            	ld	(x),a
 407                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 409  0033 e601          	ld	a,(1,x)
 410  0035 a47f          	and	a,#127
 411  0037 e701          	ld	(1,x),a
 412                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 414  0039 e601          	ld	a,(1,x)
 415  003b 1a07          	or	a,(OFST+7,sp)
 416  003d e701          	ld	(1,x),a
 417                     ; 207 }
 420  003f 85            	popw	x
 421  0040 81            	ret
 488                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 488                     ; 217              FunctionalState NewState)
 488                     ; 218 {
 489                     	switch	.text
 490  0041               _ADC_Cmd:
 492  0041 89            	pushw	x
 493       00000000      OFST:	set	0
 496                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 498                     ; 222   if (NewState != DISABLE)
 500  0042 0d05          	tnz	(OFST+5,sp)
 501  0044 2706          	jreq	L142
 502                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 504  0046 f6            	ld	a,(x)
 505  0047 aa01          	or	a,#1
 506  0049 f7            	ld	(x),a
 508  004a 2006          	jra	L342
 509  004c               L142:
 510                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 512  004c 1e01          	ldw	x,(OFST+1,sp)
 513  004e f6            	ld	a,(x)
 514  004f a4fe          	and	a,#254
 515  0051 f7            	ld	(x),a
 516  0052               L342:
 517                     ; 232 }
 520  0052 85            	popw	x
 521  0053 81            	ret
 559                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 559                     ; 240 {
 560                     	switch	.text
 561  0054               _ADC_SoftwareStartConv:
 565                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 567  0054 f6            	ld	a,(x)
 568  0055 aa02          	or	a,#2
 569  0057 f7            	ld	(x),a
 570                     ; 243 }
 573  0058 81            	ret
 701                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 701                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 701                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 701                     ; 264 {
 702                     	switch	.text
 703  0059               _ADC_ExternalTrigConfig:
 705  0059 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 711                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 713                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 715  005a e601          	ld	a,(1,x)
 716  005c a487          	and	a,#135
 717  005e e701          	ld	(1,x),a
 718                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 718                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 720  0060 7b06          	ld	a,(OFST+6,sp)
 721  0062 1a05          	or	a,(OFST+5,sp)
 722  0064 ea01          	or	a,(1,x)
 723  0066 e701          	ld	(1,x),a
 724                     ; 276 }
 727  0068 85            	popw	x
 728  0069 81            	ret
1042                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1042                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1042                     ; 341 {
1043                     	switch	.text
1044  006a               _ADC_AnalogWatchdogChannelSelect:
1046  006a 89            	pushw	x
1047       00000000      OFST:	set	0
1050                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1052                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1054  006b e602          	ld	a,(2,x)
1055  006d a4e0          	and	a,#224
1056  006f e702          	ld	(2,x),a
1057                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1059  0071 e602          	ld	a,(2,x)
1060  0073 1a05          	or	a,(OFST+5,sp)
1061  0075 e702          	ld	(2,x),a
1062                     ; 350 }
1065  0077 85            	popw	x
1066  0078 81            	ret
1118                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1118                     ; 362 {
1119                     	switch	.text
1120  0079               _ADC_AnalogWatchdogThresholdsConfig:
1122  0079 89            	pushw	x
1123       00000000      OFST:	set	0
1126                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1128                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1130                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1132  007a 7b05          	ld	a,(OFST+5,sp)
1133  007c 1e01          	ldw	x,(OFST+1,sp)
1134  007e e706          	ld	(6,x),a
1135                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1137  0080 7b06          	ld	a,(OFST+6,sp)
1138  0082 1e01          	ldw	x,(OFST+1,sp)
1139  0084 e707          	ld	(7,x),a
1140                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1142  0086 7b07          	ld	a,(OFST+7,sp)
1143  0088 1e01          	ldw	x,(OFST+1,sp)
1144  008a e708          	ld	(8,x),a
1145                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1147  008c 7b08          	ld	a,(OFST+8,sp)
1148  008e 1e01          	ldw	x,(OFST+1,sp)
1149  0090 e709          	ld	(9,x),a
1150                     ; 374 }
1153  0092 85            	popw	x
1154  0093 81            	ret
1217                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1217                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1217                     ; 414                               uint16_t HighThreshold,
1217                     ; 415                               uint16_t LowThreshold)
1217                     ; 416 {
1218                     	switch	.text
1219  0094               _ADC_AnalogWatchdogConfig:
1221  0094 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1227                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1229                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1231                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1233  0095 e602          	ld	a,(2,x)
1234  0097 a4e0          	and	a,#224
1235  0099 e702          	ld	(2,x),a
1236                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1238  009b e602          	ld	a,(2,x)
1239  009d 1a05          	or	a,(OFST+5,sp)
1240  009f e702          	ld	(2,x),a
1241                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1243  00a1 7b06          	ld	a,(OFST+6,sp)
1244  00a3 1e01          	ldw	x,(OFST+1,sp)
1245  00a5 e706          	ld	(6,x),a
1246                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1248  00a7 7b07          	ld	a,(OFST+7,sp)
1249  00a9 1e01          	ldw	x,(OFST+1,sp)
1250  00ab e707          	ld	(7,x),a
1251                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1253  00ad 7b08          	ld	a,(OFST+8,sp)
1254  00af 1e01          	ldw	x,(OFST+1,sp)
1255  00b1 e708          	ld	(8,x),a
1256                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1258  00b3 7b09          	ld	a,(OFST+9,sp)
1259  00b5 1e01          	ldw	x,(OFST+1,sp)
1260  00b7 e709          	ld	(9,x),a
1261                     ; 435 }
1264  00b9 85            	popw	x
1265  00ba 81            	ret
1300                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1300                     ; 475 {
1301                     	switch	.text
1302  00bb               _ADC_TempSensorCmd:
1306                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1308                     ; 479   if (NewState != DISABLE)
1310  00bb 4d            	tnz	a
1311  00bc 2706          	jreq	L165
1312                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1314  00be 721a534e      	bset	21326,#5
1316  00c2 2004          	jra	L365
1317  00c4               L165:
1318                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1320  00c4 721b534e      	bres	21326,#5
1321  00c8               L365:
1322                     ; 489 }
1325  00c8 81            	ret
1360                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1360                     ; 498 {
1361                     	switch	.text
1362  00c9               _ADC_VrefintCmd:
1366                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1368                     ; 502   if (NewState != DISABLE)
1370  00c9 4d            	tnz	a
1371  00ca 2706          	jreq	L306
1372                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1374  00cc 7218534e      	bset	21326,#4
1376  00d0 2004          	jra	L506
1377  00d2               L306:
1378                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1380  00d2 7219534e      	bres	21326,#4
1381  00d6               L506:
1382                     ; 512 }
1385  00d6 81            	ret
1695                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1695                     ; 584 {
1696                     	switch	.text
1697  00d7               _ADC_ChannelCmd:
1699  00d7 89            	pushw	x
1700  00d8 88            	push	a
1701       00000001      OFST:	set	1
1704                     ; 585   uint8_t regindex = 0;
1706                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1708                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1710  00d9 7b06          	ld	a,(OFST+5,sp)
1711  00db 6b01          	ld	(OFST+0,sp),a
1713                     ; 591   if (NewState != DISABLE)
1715  00dd 0d08          	tnz	(OFST+7,sp)
1716  00df 270f          	jreq	L157
1717                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1719  00e1 01            	rrwa	x,a
1720  00e2 1b01          	add	a,(OFST+0,sp)
1721  00e4 2401          	jrnc	L23
1722  00e6 5c            	incw	x
1723  00e7               L23:
1724  00e7 02            	rlwa	x,a
1725  00e8 e60a          	ld	a,(10,x)
1726  00ea 1a07          	or	a,(OFST+6,sp)
1727  00ec e70a          	ld	(10,x),a
1729  00ee 200e          	jra	L357
1730  00f0               L157:
1731                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1733  00f0 7b01          	ld	a,(OFST+0,sp)
1734  00f2 5f            	clrw	x
1735  00f3 97            	ld	xl,a
1736  00f4 72fb02        	addw	x,(OFST+1,sp)
1737  00f7 7b07          	ld	a,(OFST+6,sp)
1738  00f9 43            	cpl	a
1739  00fa e40a          	and	a,(10,x)
1740  00fc e70a          	ld	(10,x),a
1741  00fe               L357:
1742                     ; 601 }
1745  00fe 5b03          	addw	sp,#3
1746  0100 81            	ret
1896                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1896                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1896                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1896                     ; 628 {
1897                     	switch	.text
1898  0101               _ADC_SamplingTimeConfig:
1900  0101 89            	pushw	x
1901       00000000      OFST:	set	0
1904                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1906                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1908                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1910  0102 0d05          	tnz	(OFST+5,sp)
1911  0104 2712          	jreq	L1401
1912                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1914  0106 e602          	ld	a,(2,x)
1915  0108 a41f          	and	a,#31
1916  010a e702          	ld	(2,x),a
1917                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1919  010c 7b06          	ld	a,(OFST+6,sp)
1920  010e 4e            	swap	a
1921  010f 48            	sll	a
1922  0110 a4e0          	and	a,#224
1923  0112 ea02          	or	a,(2,x)
1924  0114 e702          	ld	(2,x),a
1926  0116 2010          	jra	L3401
1927  0118               L1401:
1928                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1930  0118 1e01          	ldw	x,(OFST+1,sp)
1931  011a e601          	ld	a,(1,x)
1932  011c a4f8          	and	a,#248
1933  011e e701          	ld	(1,x),a
1934                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1936  0120 1e01          	ldw	x,(OFST+1,sp)
1937  0122 e601          	ld	a,(1,x)
1938  0124 1a06          	or	a,(OFST+6,sp)
1939  0126 e701          	ld	(1,x),a
1940  0128               L3401:
1941                     ; 645 }
1944  0128 85            	popw	x
1945  0129 81            	ret
2010                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2010                     ; 692                               FunctionalState NewState)
2010                     ; 693 {
2011                     	switch	.text
2012  012a               _ADC_SchmittTriggerConfig:
2014  012a 89            	pushw	x
2015  012b 88            	push	a
2016       00000001      OFST:	set	1
2019                     ; 694   uint8_t regindex = 0;
2021                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2023                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2025  012c 7b06          	ld	a,(OFST+5,sp)
2026  012e 6b01          	ld	(OFST+0,sp),a
2028                     ; 700   if (NewState != DISABLE)
2030  0130 0d08          	tnz	(OFST+7,sp)
2031  0132 2710          	jreq	L7701
2032                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2034  0134 01            	rrwa	x,a
2035  0135 1b01          	add	a,(OFST+0,sp)
2036  0137 2401          	jrnc	L04
2037  0139 5c            	incw	x
2038  013a               L04:
2039  013a 02            	rlwa	x,a
2040  013b 7b07          	ld	a,(OFST+6,sp)
2041  013d 43            	cpl	a
2042  013e e40e          	and	a,(14,x)
2043  0140 e70e          	ld	(14,x),a
2045  0142 200d          	jra	L1011
2046  0144               L7701:
2047                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2049  0144 7b01          	ld	a,(OFST+0,sp)
2050  0146 5f            	clrw	x
2051  0147 97            	ld	xl,a
2052  0148 72fb02        	addw	x,(OFST+1,sp)
2053  014b e60e          	ld	a,(14,x)
2054  014d 1a07          	or	a,(OFST+6,sp)
2055  014f e70e          	ld	(14,x),a
2056  0151               L1011:
2057                     ; 710 }
2060  0151 5b03          	addw	sp,#3
2061  0153 81            	ret
2106                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2106                     ; 718 {
2107                     	switch	.text
2108  0154               _ADC_GetConversionValue:
2110  0154 89            	pushw	x
2111  0155 89            	pushw	x
2112       00000002      OFST:	set	2
2115                     ; 719   uint16_t tmpreg = 0;
2117                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2119  0156 e604          	ld	a,(4,x)
2120  0158 5f            	clrw	x
2121  0159 97            	ld	xl,a
2122  015a 1f01          	ldw	(OFST-1,sp),x
2124                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2126  015c 1e01          	ldw	x,(OFST-1,sp)
2127  015e 1603          	ldw	y,(OFST+1,sp)
2128  0160 90e605        	ld	a,(5,y)
2129  0163 02            	rlwa	x,a
2130  0164 1f01          	ldw	(OFST-1,sp),x
2132                     ; 726   return (uint16_t)(tmpreg) ;
2134  0166 1e01          	ldw	x,(OFST-1,sp)
2137  0168 5b04          	addw	sp,#4
2138  016a 81            	ret
2185                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2185                     ; 761 {
2186                     	switch	.text
2187  016b               _ADC_DMACmd:
2189  016b 89            	pushw	x
2190       00000000      OFST:	set	0
2193                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2195                     ; 765   if (NewState != DISABLE)
2197  016c 0d05          	tnz	(OFST+5,sp)
2198  016e 2708          	jreq	L1511
2199                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2201  0170 e60a          	ld	a,(10,x)
2202  0172 a47f          	and	a,#127
2203  0174 e70a          	ld	(10,x),a
2205  0176 2008          	jra	L3511
2206  0178               L1511:
2207                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2209  0178 1e01          	ldw	x,(OFST+1,sp)
2210  017a e60a          	ld	a,(10,x)
2211  017c aa80          	or	a,#128
2212  017e e70a          	ld	(10,x),a
2213  0180               L3511:
2214                     ; 775 }
2217  0180 85            	popw	x
2218  0181 81            	ret
2302                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2302                     ; 832 {
2303                     	switch	.text
2304  0182               _ADC_ITConfig:
2306  0182 89            	pushw	x
2307       00000000      OFST:	set	0
2310                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2312                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2314                     ; 837   if (NewState != DISABLE)
2316  0183 0d06          	tnz	(OFST+6,sp)
2317  0185 2706          	jreq	L7121
2318                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2320  0187 f6            	ld	a,(x)
2321  0188 1a05          	or	a,(OFST+5,sp)
2322  018a f7            	ld	(x),a
2324  018b 2007          	jra	L1221
2325  018d               L7121:
2326                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2328  018d 1e01          	ldw	x,(OFST+1,sp)
2329  018f 7b05          	ld	a,(OFST+5,sp)
2330  0191 43            	cpl	a
2331  0192 f4            	and	a,(x)
2332  0193 f7            	ld	(x),a
2333  0194               L1221:
2334                     ; 847 }
2337  0194 85            	popw	x
2338  0195 81            	ret
2443                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2443                     ; 860 {
2444                     	switch	.text
2445  0196               _ADC_GetFlagStatus:
2447  0196 89            	pushw	x
2448  0197 88            	push	a
2449       00000001      OFST:	set	1
2452                     ; 861   FlagStatus flagstatus = RESET;
2454                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2456                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2458  0198 e603          	ld	a,(3,x)
2459  019a 1506          	bcp	a,(OFST+5,sp)
2460  019c 2706          	jreq	L5721
2461                     ; 870     flagstatus = SET;
2463  019e a601          	ld	a,#1
2464  01a0 6b01          	ld	(OFST+0,sp),a
2467  01a2 2002          	jra	L7721
2468  01a4               L5721:
2469                     ; 875     flagstatus = RESET;
2471  01a4 0f01          	clr	(OFST+0,sp)
2473  01a6               L7721:
2474                     ; 879   return  flagstatus;
2476  01a6 7b01          	ld	a,(OFST+0,sp)
2479  01a8 5b03          	addw	sp,#3
2480  01aa 81            	ret
2527                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2527                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2527                     ; 894 {
2528                     	switch	.text
2529  01ab               _ADC_ClearFlag:
2531  01ab 89            	pushw	x
2532       00000000      OFST:	set	0
2535                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2537                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2539  01ac 7b05          	ld	a,(OFST+5,sp)
2540  01ae 43            	cpl	a
2541  01af 1e01          	ldw	x,(OFST+1,sp)
2542  01b1 e703          	ld	(3,x),a
2543                     ; 900 }
2546  01b3 85            	popw	x
2547  01b4 81            	ret
2619                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2619                     ; 913                          ADC_IT_TypeDef ADC_IT)
2619                     ; 914 {
2620                     	switch	.text
2621  01b5               _ADC_GetITStatus:
2623  01b5 89            	pushw	x
2624  01b6 5203          	subw	sp,#3
2625       00000003      OFST:	set	3
2628                     ; 915   ITStatus itstatus = RESET;
2630                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2634                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2636                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2638  01b8 7b08          	ld	a,(OFST+5,sp)
2639  01ba 44            	srl	a
2640  01bb 44            	srl	a
2641  01bc 44            	srl	a
2642  01bd 6b03          	ld	(OFST+0,sp),a
2644                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2644                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2646  01bf 7b03          	ld	a,(OFST+0,sp)
2647  01c1 a403          	and	a,#3
2648  01c3 6b01          	ld	(OFST-2,sp),a
2650  01c5 7b03          	ld	a,(OFST+0,sp)
2651  01c7 a410          	and	a,#16
2652  01c9 44            	srl	a
2653  01ca 44            	srl	a
2654  01cb 1a01          	or	a,(OFST-2,sp)
2655  01cd 6b03          	ld	(OFST+0,sp),a
2657                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2659  01cf f6            	ld	a,(x)
2660  01d0 1408          	and	a,(OFST+5,sp)
2661  01d2 6b02          	ld	(OFST-1,sp),a
2663                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2665  01d4 e603          	ld	a,(3,x)
2666  01d6 1503          	bcp	a,(OFST+0,sp)
2667  01d8 270a          	jreq	L1631
2669  01da 0d02          	tnz	(OFST-1,sp)
2670  01dc 2706          	jreq	L1631
2671                     ; 933     itstatus = SET;
2673  01de a601          	ld	a,#1
2674  01e0 6b03          	ld	(OFST+0,sp),a
2677  01e2 2002          	jra	L3631
2678  01e4               L1631:
2679                     ; 938     itstatus = RESET;
2681  01e4 0f03          	clr	(OFST+0,sp)
2683  01e6               L3631:
2684                     ; 942   return  itstatus;
2686  01e6 7b03          	ld	a,(OFST+0,sp)
2689  01e8 5b05          	addw	sp,#5
2690  01ea 81            	ret
2745                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2745                     ; 956                            ADC_IT_TypeDef ADC_IT)
2745                     ; 957 {
2746                     	switch	.text
2747  01eb               _ADC_ClearITPendingBit:
2749  01eb 89            	pushw	x
2750  01ec 89            	pushw	x
2751       00000002      OFST:	set	2
2754                     ; 958   uint8_t itmask = 0;
2756                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2758                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2760  01ed 7b07          	ld	a,(OFST+5,sp)
2761  01ef 44            	srl	a
2762  01f0 44            	srl	a
2763  01f1 44            	srl	a
2764  01f2 6b02          	ld	(OFST+0,sp),a
2766                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2766                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2768  01f4 7b02          	ld	a,(OFST+0,sp)
2769  01f6 a403          	and	a,#3
2770  01f8 6b01          	ld	(OFST-1,sp),a
2772  01fa 7b02          	ld	a,(OFST+0,sp)
2773  01fc a410          	and	a,#16
2774  01fe 44            	srl	a
2775  01ff 44            	srl	a
2776  0200 1a01          	or	a,(OFST-1,sp)
2777  0202 6b02          	ld	(OFST+0,sp),a
2779                     ; 969   ADCx->SR = (uint8_t)~itmask;
2781  0204 7b02          	ld	a,(OFST+0,sp)
2782  0206 43            	cpl	a
2783  0207 1e03          	ldw	x,(OFST+1,sp)
2784  0209 e703          	ld	(3,x),a
2785                     ; 970 }
2788  020b 5b04          	addw	sp,#4
2789  020d 81            	ret
2802                     	xdef	_ADC_ClearITPendingBit
2803                     	xdef	_ADC_GetITStatus
2804                     	xdef	_ADC_ClearFlag
2805                     	xdef	_ADC_GetFlagStatus
2806                     	xdef	_ADC_ITConfig
2807                     	xdef	_ADC_DMACmd
2808                     	xdef	_ADC_GetConversionValue
2809                     	xdef	_ADC_SchmittTriggerConfig
2810                     	xdef	_ADC_SamplingTimeConfig
2811                     	xdef	_ADC_ChannelCmd
2812                     	xdef	_ADC_VrefintCmd
2813                     	xdef	_ADC_TempSensorCmd
2814                     	xdef	_ADC_AnalogWatchdogConfig
2815                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2816                     	xdef	_ADC_AnalogWatchdogChannelSelect
2817                     	xdef	_ADC_ExternalTrigConfig
2818                     	xdef	_ADC_SoftwareStartConv
2819                     	xdef	_ADC_Cmd
2820                     	xdef	_ADC_Init
2821                     	xdef	_ADC_DeInit
2840                     	end
