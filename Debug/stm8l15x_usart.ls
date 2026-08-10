   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
 162                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 162                     ; 149 {
 164                     	switch	.text
 165  0000               _USART_DeInit:
 169                     ; 153   (void) USARTx->SR;
 171  0000 f6            	ld	a,(x)
 172                     ; 154   (void) USARTx->DR;
 174  0001 e601          	ld	a,(1,x)
 175                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 177  0003 6f03          	clr	(3,x)
 178                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 180  0005 6f02          	clr	(2,x)
 181                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 183  0007 6f04          	clr	(4,x)
 184                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 186  0009 6f05          	clr	(5,x)
 187                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 189  000b 6f06          	clr	(6,x)
 190                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 192  000d 6f07          	clr	(7,x)
 193                     ; 163 }
 196  000f 81            	ret
 384                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 384                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 384                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 384                     ; 195 {
 385                     	switch	.text
 386  0010               _USART_Init:
 388  0010 89            	pushw	x
 389  0011 5204          	subw	sp,#4
 390       00000004      OFST:	set	4
 393                     ; 196   uint32_t BaudRate_Mantissa = 0;
 395                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 397                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 399                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 401                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 403                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 405                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 407  0013 e604          	ld	a,(4,x)
 408  0015 a4e9          	and	a,#233
 409  0017 e704          	ld	(4,x),a
 410                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 412  0019 7b0d          	ld	a,(OFST+9,sp)
 413  001b 1a0f          	or	a,(OFST+11,sp)
 414  001d ea04          	or	a,(4,x)
 415  001f e704          	ld	(4,x),a
 416                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 418  0021 e606          	ld	a,(6,x)
 419  0023 a4cf          	and	a,#207
 420  0025 e706          	ld	(6,x),a
 421                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 423  0027 e606          	ld	a,(6,x)
 424  0029 1a0e          	or	a,(OFST+10,sp)
 425  002b e706          	ld	(6,x),a
 426                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 428  002d 6f02          	clr	(2,x)
 429                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 431  002f e603          	ld	a,(3,x)
 432  0031 a40f          	and	a,#15
 433  0033 e703          	ld	(3,x),a
 434                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 436  0035 e603          	ld	a,(3,x)
 437  0037 a4f0          	and	a,#240
 438  0039 e703          	ld	(3,x),a
 439                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 441  003b cd0000        	call	_CLK_GetClockFreq
 443  003e 96            	ldw	x,sp
 444  003f 1c0009        	addw	x,#OFST+5
 445  0042 cd0000        	call	c_ludv
 447  0045 96            	ldw	x,sp
 448  0046 1c0001        	addw	x,#OFST-3
 449  0049 cd0000        	call	c_rtol
 452                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 454  004c 7b03          	ld	a,(OFST-1,sp)
 455  004e a4f0          	and	a,#240
 456  0050 1e05          	ldw	x,(OFST+1,sp)
 457  0052 e703          	ld	(3,x),a
 458                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 460  0054 1e05          	ldw	x,(OFST+1,sp)
 461  0056 7b04          	ld	a,(OFST+0,sp)
 462  0058 a40f          	and	a,#15
 463  005a ea03          	or	a,(3,x)
 464  005c e703          	ld	(3,x),a
 465                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 467  005e 96            	ldw	x,sp
 468  005f 1c0001        	addw	x,#OFST-3
 469  0062 cd0000        	call	c_ltor
 471  0065 a604          	ld	a,#4
 472  0067 cd0000        	call	c_lursh
 474  006a b603          	ld	a,c_lreg+3
 475  006c 1e05          	ldw	x,(OFST+1,sp)
 476  006e e702          	ld	(2,x),a
 477                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 479  0070 1e05          	ldw	x,(OFST+1,sp)
 480  0072 e605          	ld	a,(5,x)
 481  0074 a4f3          	and	a,#243
 482  0076 e705          	ld	(5,x),a
 483                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 485  0078 1e05          	ldw	x,(OFST+1,sp)
 486  007a e605          	ld	a,(5,x)
 487  007c 1a10          	or	a,(OFST+12,sp)
 488  007e e705          	ld	(5,x),a
 489                     ; 239 }
 492  0080 5b06          	addw	sp,#6
 493  0082 81            	ret
 653                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 653                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 653                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 653                     ; 267 {
 654                     	switch	.text
 655  0083               _USART_ClockInit:
 657  0083 89            	pushw	x
 658       00000000      OFST:	set	0
 661                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 663                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 665                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 667                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 669                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 671  0084 e606          	ld	a,(6,x)
 672  0086 a4f8          	and	a,#248
 673  0088 e706          	ld	(6,x),a
 674                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 676  008a 7b06          	ld	a,(OFST+6,sp)
 677  008c 1a07          	or	a,(OFST+7,sp)
 678  008e 1a08          	or	a,(OFST+8,sp)
 679  0090 ea06          	or	a,(6,x)
 680  0092 e706          	ld	(6,x),a
 681                     ; 279   if (USART_Clock != USART_Clock_Disable)
 683  0094 0d05          	tnz	(OFST+5,sp)
 684  0096 2708          	jreq	L123
 685                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 687  0098 e606          	ld	a,(6,x)
 688  009a aa08          	or	a,#8
 689  009c e706          	ld	(6,x),a
 691  009e 2008          	jra	L323
 692  00a0               L123:
 693                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 695  00a0 1e01          	ldw	x,(OFST+1,sp)
 696  00a2 e606          	ld	a,(6,x)
 697  00a4 a4f7          	and	a,#247
 698  00a6 e706          	ld	(6,x),a
 699  00a8               L323:
 700                     ; 287 }
 703  00a8 85            	popw	x
 704  00a9 81            	ret
 771                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 771                     ; 297 {
 772                     	switch	.text
 773  00aa               _USART_Cmd:
 775  00aa 89            	pushw	x
 776       00000000      OFST:	set	0
 779                     ; 298   if (NewState != DISABLE)
 781  00ab 0d05          	tnz	(OFST+5,sp)
 782  00ad 2708          	jreq	L163
 783                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 785  00af e604          	ld	a,(4,x)
 786  00b1 a4df          	and	a,#223
 787  00b3 e704          	ld	(4,x),a
 789  00b5 2008          	jra	L363
 790  00b7               L163:
 791                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 793  00b7 1e01          	ldw	x,(OFST+1,sp)
 794  00b9 e604          	ld	a,(4,x)
 795  00bb aa20          	or	a,#32
 796  00bd e704          	ld	(4,x),a
 797  00bf               L363:
 798                     ; 306 }
 801  00bf 85            	popw	x
 802  00c0 81            	ret
 846                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 846                     ; 330 {
 847                     	switch	.text
 848  00c1               _USART_SetPrescaler:
 850  00c1 89            	pushw	x
 851       00000000      OFST:	set	0
 854                     ; 332   USARTx->PSCR = USART_Prescaler;
 856  00c2 7b05          	ld	a,(OFST+5,sp)
 857  00c4 1e01          	ldw	x,(OFST+1,sp)
 858  00c6 e70a          	ld	(10,x),a
 859                     ; 333 }
 862  00c8 85            	popw	x
 863  00c9 81            	ret
 900                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 900                     ; 341 {
 901                     	switch	.text
 902  00ca               _USART_SendBreak:
 906                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 908  00ca e605          	ld	a,(5,x)
 909  00cc aa01          	or	a,#1
 910  00ce e705          	ld	(5,x),a
 911                     ; 343 }
 914  00d0 81            	ret
 951                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 951                     ; 383 {
 952                     	switch	.text
 953  00d1               _USART_ReceiveData8:
 957                     ; 384   return USARTx->DR;
 959  00d1 e601          	ld	a,(1,x)
 962  00d3 81            	ret
1006                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1006                     ; 393 {
1007                     	switch	.text
1008  00d4               _USART_ReceiveData9:
1010  00d4 89            	pushw	x
1011  00d5 89            	pushw	x
1012       00000002      OFST:	set	2
1015                     ; 394   uint16_t temp = 0;
1017                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1019  00d6 e604          	ld	a,(4,x)
1020  00d8 5f            	clrw	x
1021  00d9 a480          	and	a,#128
1022  00db 5f            	clrw	x
1023  00dc 02            	rlwa	x,a
1024  00dd 58            	sllw	x
1025  00de 1f01          	ldw	(OFST-1,sp),x
1027                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1029  00e0 1e03          	ldw	x,(OFST+1,sp)
1030  00e2 e601          	ld	a,(1,x)
1031  00e4 5f            	clrw	x
1032  00e5 97            	ld	xl,a
1033  00e6 01            	rrwa	x,a
1034  00e7 1a02          	or	a,(OFST+0,sp)
1035  00e9 01            	rrwa	x,a
1036  00ea 1a01          	or	a,(OFST-1,sp)
1037  00ec 01            	rrwa	x,a
1038  00ed 01            	rrwa	x,a
1039  00ee a4ff          	and	a,#255
1040  00f0 01            	rrwa	x,a
1041  00f1 a401          	and	a,#1
1042  00f3 01            	rrwa	x,a
1045  00f4 5b04          	addw	sp,#4
1046  00f6 81            	ret
1090                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1090                     ; 406 {
1091                     	switch	.text
1092  00f7               _USART_SendData8:
1094  00f7 89            	pushw	x
1095       00000000      OFST:	set	0
1098                     ; 408   USARTx->DR = Data;
1100  00f8 7b05          	ld	a,(OFST+5,sp)
1101  00fa 1e01          	ldw	x,(OFST+1,sp)
1102  00fc e701          	ld	(1,x),a
1103                     ; 409 }
1106  00fe 85            	popw	x
1107  00ff 81            	ret
1151                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1151                     ; 419 {
1152                     	switch	.text
1153  0100               _USART_SendData9:
1155  0100 89            	pushw	x
1156       00000000      OFST:	set	0
1159                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1161                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1163  0101 e604          	ld	a,(4,x)
1164  0103 a4bf          	and	a,#191
1165  0105 e704          	ld	(4,x),a
1166                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1168  0107 1605          	ldw	y,(OFST+5,sp)
1169  0109 9054          	srlw	y
1170  010b 9054          	srlw	y
1171  010d 909f          	ld	a,yl
1172  010f a440          	and	a,#64
1173  0111 ea04          	or	a,(4,x)
1174  0113 e704          	ld	(4,x),a
1175                     ; 429   USARTx->DR   = (uint8_t)(Data);
1177  0115 7b06          	ld	a,(OFST+6,sp)
1178  0117 1e01          	ldw	x,(OFST+1,sp)
1179  0119 e701          	ld	(1,x),a
1180                     ; 430 }
1183  011b 85            	popw	x
1184  011c 81            	ret
1232                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1232                     ; 474 {
1233                     	switch	.text
1234  011d               _USART_ReceiverWakeUpCmd:
1236  011d 89            	pushw	x
1237       00000000      OFST:	set	0
1240                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1242                     ; 477   if (NewState != DISABLE)
1244  011e 0d05          	tnz	(OFST+5,sp)
1245  0120 2708          	jreq	L165
1246                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1248  0122 e605          	ld	a,(5,x)
1249  0124 aa02          	or	a,#2
1250  0126 e705          	ld	(5,x),a
1252  0128 2008          	jra	L365
1253  012a               L165:
1254                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1256  012a 1e01          	ldw	x,(OFST+1,sp)
1257  012c e605          	ld	a,(5,x)
1258  012e a4fd          	and	a,#253
1259  0130 e705          	ld	(5,x),a
1260  0132               L365:
1261                     ; 487 }
1264  0132 85            	popw	x
1265  0133 81            	ret
1309                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1309                     ; 497 {
1310                     	switch	.text
1311  0134               _USART_SetAddress:
1313  0134 89            	pushw	x
1314       00000000      OFST:	set	0
1317                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1319                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1321  0135 e607          	ld	a,(7,x)
1322  0137 a4f0          	and	a,#240
1323  0139 e707          	ld	(7,x),a
1324                     ; 504   USARTx->CR4 |= USART_Address;
1326  013b e607          	ld	a,(7,x)
1327  013d 1a05          	or	a,(OFST+5,sp)
1328  013f e707          	ld	(7,x),a
1329                     ; 505 }
1332  0141 85            	popw	x
1333  0142 81            	ret
1402                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1402                     ; 516 {
1403                     	switch	.text
1404  0143               _USART_WakeUpConfig:
1406  0143 89            	pushw	x
1407       00000000      OFST:	set	0
1410                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1412                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1414  0144 e604          	ld	a,(4,x)
1415  0146 a4f7          	and	a,#247
1416  0148 e704          	ld	(4,x),a
1417                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1419  014a e604          	ld	a,(4,x)
1420  014c 1a05          	or	a,(OFST+5,sp)
1421  014e e704          	ld	(4,x),a
1422                     ; 521 }
1425  0150 85            	popw	x
1426  0151 81            	ret
1474                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1474                     ; 567 {
1475                     	switch	.text
1476  0152               _USART_HalfDuplexCmd:
1478  0152 89            	pushw	x
1479       00000000      OFST:	set	0
1482                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1484                     ; 570   if (NewState != DISABLE)
1486  0153 0d05          	tnz	(OFST+5,sp)
1487  0155 2708          	jreq	L766
1488                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1490  0157 e608          	ld	a,(8,x)
1491  0159 aa08          	or	a,#8
1492  015b e708          	ld	(8,x),a
1494  015d 2008          	jra	L176
1495  015f               L766:
1496                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1498  015f 1e01          	ldw	x,(OFST+1,sp)
1499  0161 e608          	ld	a,(8,x)
1500  0163 a4f7          	and	a,#247
1501  0165 e708          	ld	(8,x),a
1502  0167               L176:
1503                     ; 578 }
1506  0167 85            	popw	x
1507  0168 81            	ret
1554                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1554                     ; 645 {
1555                     	switch	.text
1556  0169               _USART_SmartCardCmd:
1558  0169 89            	pushw	x
1559       00000000      OFST:	set	0
1562                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1564                     ; 648   if (NewState != DISABLE)
1566  016a 0d05          	tnz	(OFST+5,sp)
1567  016c 2708          	jreq	L717
1568                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1570  016e e608          	ld	a,(8,x)
1571  0170 aa20          	or	a,#32
1572  0172 e708          	ld	(8,x),a
1574  0174 2008          	jra	L127
1575  0176               L717:
1576                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1578  0176 1e01          	ldw	x,(OFST+1,sp)
1579  0178 e608          	ld	a,(8,x)
1580  017a a4df          	and	a,#223
1581  017c e708          	ld	(8,x),a
1582  017e               L127:
1583                     ; 658 }
1586  017e 85            	popw	x
1587  017f 81            	ret
1635                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1635                     ; 668 {
1636                     	switch	.text
1637  0180               _USART_SmartCardNACKCmd:
1639  0180 89            	pushw	x
1640       00000000      OFST:	set	0
1643                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1645                     ; 671   if (NewState != DISABLE)
1647  0181 0d05          	tnz	(OFST+5,sp)
1648  0183 2708          	jreq	L747
1649                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1651  0185 e608          	ld	a,(8,x)
1652  0187 aa10          	or	a,#16
1653  0189 e708          	ld	(8,x),a
1655  018b 2008          	jra	L157
1656  018d               L747:
1657                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1659  018d 1e01          	ldw	x,(OFST+1,sp)
1660  018f e608          	ld	a,(8,x)
1661  0191 a4ef          	and	a,#239
1662  0193 e708          	ld	(8,x),a
1663  0195               L157:
1664                     ; 681 }
1667  0195 85            	popw	x
1668  0196 81            	ret
1712                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1712                     ; 691 {
1713                     	switch	.text
1714  0197               _USART_SetGuardTime:
1716  0197 89            	pushw	x
1717       00000000      OFST:	set	0
1720                     ; 693   USARTx->GTR = USART_GuardTime;
1722  0198 7b05          	ld	a,(OFST+5,sp)
1723  019a 1e01          	ldw	x,(OFST+1,sp)
1724  019c e709          	ld	(9,x),a
1725                     ; 694 }
1728  019e 85            	popw	x
1729  019f 81            	ret
1798                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1798                     ; 752 {
1799                     	switch	.text
1800  01a0               _USART_IrDAConfig:
1802  01a0 89            	pushw	x
1803       00000000      OFST:	set	0
1806                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1808                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1810  01a1 0d05          	tnz	(OFST+5,sp)
1811  01a3 2708          	jreq	L1301
1812                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1814  01a5 e608          	ld	a,(8,x)
1815  01a7 aa04          	or	a,#4
1816  01a9 e708          	ld	(8,x),a
1818  01ab 2008          	jra	L3301
1819  01ad               L1301:
1820                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1822  01ad 1e01          	ldw	x,(OFST+1,sp)
1823  01af e608          	ld	a,(8,x)
1824  01b1 a4fb          	and	a,#251
1825  01b3 e708          	ld	(8,x),a
1826  01b5               L3301:
1827                     ; 763 }
1830  01b5 85            	popw	x
1831  01b6 81            	ret
1878                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1878                     ; 773 {
1879                     	switch	.text
1880  01b7               _USART_IrDACmd:
1882  01b7 89            	pushw	x
1883       00000000      OFST:	set	0
1886                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1888                     ; 778   if (NewState != DISABLE)
1890  01b8 0d05          	tnz	(OFST+5,sp)
1891  01ba 2708          	jreq	L1601
1892                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1894  01bc e608          	ld	a,(8,x)
1895  01be aa02          	or	a,#2
1896  01c0 e708          	ld	(8,x),a
1898  01c2 2008          	jra	L3601
1899  01c4               L1601:
1900                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1902  01c4 1e01          	ldw	x,(OFST+1,sp)
1903  01c6 e608          	ld	a,(8,x)
1904  01c8 a4fd          	and	a,#253
1905  01ca e708          	ld	(8,x),a
1906  01cc               L3601:
1907                     ; 788 }
1910  01cc 85            	popw	x
1911  01cd 81            	ret
1988                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1988                     ; 819                   FunctionalState NewState)
1988                     ; 820 {
1989                     	switch	.text
1990  01ce               _USART_DMACmd:
1992  01ce 89            	pushw	x
1993       00000000      OFST:	set	0
1996                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1998                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2000                     ; 825   if (NewState != DISABLE)
2002  01cf 0d06          	tnz	(OFST+6,sp)
2003  01d1 2708          	jreq	L5211
2004                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2006  01d3 e608          	ld	a,(8,x)
2007  01d5 1a05          	or	a,(OFST+5,sp)
2008  01d7 e708          	ld	(8,x),a
2010  01d9 2009          	jra	L7211
2011  01db               L5211:
2012                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2014  01db 1e01          	ldw	x,(OFST+1,sp)
2015  01dd 7b05          	ld	a,(OFST+5,sp)
2016  01df 43            	cpl	a
2017  01e0 e408          	and	a,(8,x)
2018  01e2 e708          	ld	(8,x),a
2019  01e4               L7211:
2020                     ; 837 }
2023  01e4 85            	popw	x
2024  01e5 81            	ret
2164                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2164                     ; 940 {
2165                     	switch	.text
2166  01e6               _USART_ITConfig:
2168  01e6 89            	pushw	x
2169  01e7 89            	pushw	x
2170       00000002      OFST:	set	2
2173                     ; 941   uint8_t usartreg, itpos = 0x00;
2175                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2177                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2179                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2181  01e8 7b07          	ld	a,(OFST+5,sp)
2182  01ea 6b01          	ld	(OFST-1,sp),a
2184                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2186  01ec 7b08          	ld	a,(OFST+6,sp)
2187  01ee a40f          	and	a,#15
2188  01f0 5f            	clrw	x
2189  01f1 97            	ld	xl,a
2190  01f2 a601          	ld	a,#1
2191  01f4 5d            	tnzw	x
2192  01f5 2704          	jreq	L65
2193  01f7               L06:
2194  01f7 48            	sll	a
2195  01f8 5a            	decw	x
2196  01f9 26fc          	jrne	L06
2197  01fb               L65:
2198  01fb 6b02          	ld	(OFST+0,sp),a
2200                     ; 950   if (NewState != DISABLE)
2202  01fd 0d09          	tnz	(OFST+7,sp)
2203  01ff 272a          	jreq	L3121
2204                     ; 953     if (usartreg == 0x01)
2206  0201 7b01          	ld	a,(OFST-1,sp)
2207  0203 a101          	cp	a,#1
2208  0205 260a          	jrne	L5121
2209                     ; 955       USARTx->CR1 |= itpos;
2211  0207 1e03          	ldw	x,(OFST+1,sp)
2212  0209 e604          	ld	a,(4,x)
2213  020b 1a02          	or	a,(OFST+0,sp)
2214  020d e704          	ld	(4,x),a
2216  020f 2045          	jra	L5221
2217  0211               L5121:
2218                     ; 957     else if (usartreg == 0x05)
2220  0211 7b01          	ld	a,(OFST-1,sp)
2221  0213 a105          	cp	a,#5
2222  0215 260a          	jrne	L1221
2223                     ; 959       USARTx->CR5 |= itpos;
2225  0217 1e03          	ldw	x,(OFST+1,sp)
2226  0219 e608          	ld	a,(8,x)
2227  021b 1a02          	or	a,(OFST+0,sp)
2228  021d e708          	ld	(8,x),a
2230  021f 2035          	jra	L5221
2231  0221               L1221:
2232                     ; 964       USARTx->CR2 |= itpos;
2234  0221 1e03          	ldw	x,(OFST+1,sp)
2235  0223 e605          	ld	a,(5,x)
2236  0225 1a02          	or	a,(OFST+0,sp)
2237  0227 e705          	ld	(5,x),a
2238  0229 202b          	jra	L5221
2239  022b               L3121:
2240                     ; 970     if (usartreg == 0x01)
2242  022b 7b01          	ld	a,(OFST-1,sp)
2243  022d a101          	cp	a,#1
2244  022f 260b          	jrne	L7221
2245                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2247  0231 1e03          	ldw	x,(OFST+1,sp)
2248  0233 7b02          	ld	a,(OFST+0,sp)
2249  0235 43            	cpl	a
2250  0236 e404          	and	a,(4,x)
2251  0238 e704          	ld	(4,x),a
2253  023a 201a          	jra	L5221
2254  023c               L7221:
2255                     ; 974     else if (usartreg == 0x05)
2257  023c 7b01          	ld	a,(OFST-1,sp)
2258  023e a105          	cp	a,#5
2259  0240 260b          	jrne	L3321
2260                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2262  0242 1e03          	ldw	x,(OFST+1,sp)
2263  0244 7b02          	ld	a,(OFST+0,sp)
2264  0246 43            	cpl	a
2265  0247 e408          	and	a,(8,x)
2266  0249 e708          	ld	(8,x),a
2268  024b 2009          	jra	L5221
2269  024d               L3321:
2270                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2272  024d 1e03          	ldw	x,(OFST+1,sp)
2273  024f 7b02          	ld	a,(OFST+0,sp)
2274  0251 43            	cpl	a
2275  0252 e405          	and	a,(5,x)
2276  0254 e705          	ld	(5,x),a
2277  0256               L5221:
2278                     ; 984 }
2281  0256 5b04          	addw	sp,#4
2282  0258 81            	ret
2430                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2430                     ; 1003 {
2431                     	switch	.text
2432  0259               _USART_GetFlagStatus:
2434  0259 89            	pushw	x
2435  025a 88            	push	a
2436       00000001      OFST:	set	1
2439                     ; 1004   FlagStatus status = RESET;
2441                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2443                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2445  025b 1e06          	ldw	x,(OFST+5,sp)
2446  025d a30101        	cpw	x,#257
2447  0260 2612          	jrne	L5231
2448                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2450  0262 1e02          	ldw	x,(OFST+1,sp)
2451  0264 e605          	ld	a,(5,x)
2452  0266 1507          	bcp	a,(OFST+6,sp)
2453  0268 2706          	jreq	L7231
2454                     ; 1014       status = SET;
2456  026a a601          	ld	a,#1
2457  026c 6b01          	ld	(OFST+0,sp),a
2460  026e 2013          	jra	L3331
2461  0270               L7231:
2462                     ; 1019       status = RESET;
2464  0270 0f01          	clr	(OFST+0,sp)
2466  0272 200f          	jra	L3331
2467  0274               L5231:
2468                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2470  0274 1e02          	ldw	x,(OFST+1,sp)
2471  0276 f6            	ld	a,(x)
2472  0277 1507          	bcp	a,(OFST+6,sp)
2473  0279 2706          	jreq	L5331
2474                     ; 1027       status = SET;
2476  027b a601          	ld	a,#1
2477  027d 6b01          	ld	(OFST+0,sp),a
2480  027f 2002          	jra	L3331
2481  0281               L5331:
2482                     ; 1032       status = RESET;
2484  0281 0f01          	clr	(OFST+0,sp)
2486  0283               L3331:
2487                     ; 1036   return status;
2489  0283 7b01          	ld	a,(OFST+0,sp)
2492  0285 5b03          	addw	sp,#3
2493  0287 81            	ret
2540                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2540                     ; 1061 {
2541                     	switch	.text
2542  0288               _USART_ClearFlag:
2544  0288 89            	pushw	x
2545       00000000      OFST:	set	0
2548                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2550                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2552  0289 7b06          	ld	a,(OFST+6,sp)
2553  028b 43            	cpl	a
2554  028c 1e01          	ldw	x,(OFST+1,sp)
2555  028e f7            	ld	(x),a
2556                     ; 1066 }
2559  028f 85            	popw	x
2560  0290 81            	ret
2653                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2653                     ; 1084 {
2654                     	switch	.text
2655  0291               _USART_GetITStatus:
2657  0291 89            	pushw	x
2658  0292 5203          	subw	sp,#3
2659       00000003      OFST:	set	3
2662                     ; 1085   ITStatus pendingbitstatus = RESET;
2664                     ; 1086   uint8_t temp = 0;
2666                     ; 1087   uint8_t itpos = 0;
2668                     ; 1088   uint8_t itmask1 = 0;
2670                     ; 1089   uint8_t itmask2 = 0;
2672                     ; 1090   uint8_t enablestatus = 0;
2674                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2676                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2678  0294 7b09          	ld	a,(OFST+6,sp)
2679  0296 a40f          	and	a,#15
2680  0298 5f            	clrw	x
2681  0299 97            	ld	xl,a
2682  029a a601          	ld	a,#1
2683  029c 5d            	tnzw	x
2684  029d 2704          	jreq	L07
2685  029f               L27:
2686  029f 48            	sll	a
2687  02a0 5a            	decw	x
2688  02a1 26fc          	jrne	L27
2689  02a3               L07:
2690  02a3 6b02          	ld	(OFST-1,sp),a
2692                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2694  02a5 7b09          	ld	a,(OFST+6,sp)
2695  02a7 4e            	swap	a
2696  02a8 a40f          	and	a,#15
2697  02aa 6b03          	ld	(OFST+0,sp),a
2699                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2701  02ac 7b03          	ld	a,(OFST+0,sp)
2702  02ae 5f            	clrw	x
2703  02af 97            	ld	xl,a
2704  02b0 a601          	ld	a,#1
2705  02b2 5d            	tnzw	x
2706  02b3 2704          	jreq	L47
2707  02b5               L67:
2708  02b5 48            	sll	a
2709  02b6 5a            	decw	x
2710  02b7 26fc          	jrne	L67
2711  02b9               L47:
2712  02b9 6b03          	ld	(OFST+0,sp),a
2714                     ; 1103   if (USART_IT == USART_IT_PE)
2716  02bb 1e08          	ldw	x,(OFST+5,sp)
2717  02bd a30100        	cpw	x,#256
2718  02c0 261d          	jrne	L7241
2719                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2721  02c2 1e04          	ldw	x,(OFST+1,sp)
2722  02c4 e604          	ld	a,(4,x)
2723  02c6 1403          	and	a,(OFST+0,sp)
2724  02c8 6b03          	ld	(OFST+0,sp),a
2726                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2728  02ca 1e04          	ldw	x,(OFST+1,sp)
2729  02cc f6            	ld	a,(x)
2730  02cd 1502          	bcp	a,(OFST-1,sp)
2731  02cf 270a          	jreq	L1341
2733  02d1 0d03          	tnz	(OFST+0,sp)
2734  02d3 2706          	jreq	L1341
2735                     ; 1112       pendingbitstatus = SET;
2737  02d5 a601          	ld	a,#1
2738  02d7 6b03          	ld	(OFST+0,sp),a
2741  02d9 204f          	jra	L5341
2742  02db               L1341:
2743                     ; 1117       pendingbitstatus = RESET;
2745  02db 0f03          	clr	(OFST+0,sp)
2747  02dd 204b          	jra	L5341
2748  02df               L7241:
2749                     ; 1121   else if (USART_IT == USART_IT_OR)
2751  02df 1e08          	ldw	x,(OFST+5,sp)
2752  02e1 a30235        	cpw	x,#565
2753  02e4 2629          	jrne	L7341
2754                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2756  02e6 1e04          	ldw	x,(OFST+1,sp)
2757  02e8 e605          	ld	a,(5,x)
2758  02ea 1403          	and	a,(OFST+0,sp)
2759  02ec 6b03          	ld	(OFST+0,sp),a
2761                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2763  02ee 1e04          	ldw	x,(OFST+1,sp)
2764  02f0 e608          	ld	a,(8,x)
2765  02f2 a401          	and	a,#1
2766  02f4 6b01          	ld	(OFST-2,sp),a
2768                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2770  02f6 1e04          	ldw	x,(OFST+1,sp)
2771  02f8 f6            	ld	a,(x)
2772  02f9 1502          	bcp	a,(OFST-1,sp)
2773  02fb 270e          	jreq	L1441
2775  02fd 0d03          	tnz	(OFST+0,sp)
2776  02ff 2604          	jrne	L3441
2778  0301 0d01          	tnz	(OFST-2,sp)
2779  0303 2706          	jreq	L1441
2780  0305               L3441:
2781                     ; 1132       pendingbitstatus = SET;
2783  0305 a601          	ld	a,#1
2784  0307 6b03          	ld	(OFST+0,sp),a
2787  0309 201f          	jra	L5341
2788  030b               L1441:
2789                     ; 1137       pendingbitstatus = RESET;
2791  030b 0f03          	clr	(OFST+0,sp)
2793  030d 201b          	jra	L5341
2794  030f               L7341:
2795                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2797  030f 1e04          	ldw	x,(OFST+1,sp)
2798  0311 e605          	ld	a,(5,x)
2799  0313 1403          	and	a,(OFST+0,sp)
2800  0315 6b03          	ld	(OFST+0,sp),a
2802                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2804  0317 1e04          	ldw	x,(OFST+1,sp)
2805  0319 f6            	ld	a,(x)
2806  031a 1502          	bcp	a,(OFST-1,sp)
2807  031c 270a          	jreq	L1541
2809  031e 0d03          	tnz	(OFST+0,sp)
2810  0320 2706          	jreq	L1541
2811                     ; 1149       pendingbitstatus = SET;
2813  0322 a601          	ld	a,#1
2814  0324 6b03          	ld	(OFST+0,sp),a
2817  0326 2002          	jra	L5341
2818  0328               L1541:
2819                     ; 1154       pendingbitstatus = RESET;
2821  0328 0f03          	clr	(OFST+0,sp)
2823  032a               L5341:
2824                     ; 1159   return  pendingbitstatus;
2826  032a 7b03          	ld	a,(OFST+0,sp)
2829  032c 5b05          	addw	sp,#5
2830  032e 81            	ret
2868                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2868                     ; 1184 {
2869                     	switch	.text
2870  032f               _USART_ClearITPendingBit:
2874                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2876                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2878  032f f6            	ld	a,(x)
2879  0330 a4bf          	and	a,#191
2880  0332 f7            	ld	(x),a
2881                     ; 1189 }
2884  0333 81            	ret
2897                     	xdef	_USART_ClearITPendingBit
2898                     	xdef	_USART_GetITStatus
2899                     	xdef	_USART_ClearFlag
2900                     	xdef	_USART_GetFlagStatus
2901                     	xdef	_USART_ITConfig
2902                     	xdef	_USART_DMACmd
2903                     	xdef	_USART_IrDACmd
2904                     	xdef	_USART_IrDAConfig
2905                     	xdef	_USART_SetGuardTime
2906                     	xdef	_USART_SmartCardNACKCmd
2907                     	xdef	_USART_SmartCardCmd
2908                     	xdef	_USART_HalfDuplexCmd
2909                     	xdef	_USART_SetAddress
2910                     	xdef	_USART_ReceiverWakeUpCmd
2911                     	xdef	_USART_WakeUpConfig
2912                     	xdef	_USART_ReceiveData9
2913                     	xdef	_USART_ReceiveData8
2914                     	xdef	_USART_SendData9
2915                     	xdef	_USART_SendData8
2916                     	xdef	_USART_SendBreak
2917                     	xdef	_USART_SetPrescaler
2918                     	xdef	_USART_Cmd
2919                     	xdef	_USART_ClockInit
2920                     	xdef	_USART_Init
2921                     	xdef	_USART_DeInit
2922                     	xref	_CLK_GetClockFreq
2923                     	xref.b	c_lreg
2924                     	xref.b	c_x
2943                     	xref	c_lursh
2944                     	xref	c_ltor
2945                     	xref	c_rtol
2946                     	xref	c_ludv
2947                     	end
