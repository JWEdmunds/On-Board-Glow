   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
 108                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 97 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 117  0000 6f04          	clr	(4,x)
 118                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 120  0002 7f            	clr	(x)
 121                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 123  0003 6f02          	clr	(2,x)
 124                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 126  0005 6f03          	clr	(3,x)
 127                     ; 102 }
 130  0007 81            	ret
 284                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 284                     ; 134 {
 285                     	switch	.text
 286  0008               _GPIO_Init:
 288  0008 89            	pushw	x
 289       00000000      OFST:	set	0
 292                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 294                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 296                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 298  0009 7b05          	ld	a,(OFST+5,sp)
 299  000b 43            	cpl	a
 300  000c e404          	and	a,(4,x)
 301  000e e704          	ld	(4,x),a
 302                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 304  0010 7b06          	ld	a,(OFST+6,sp)
 305  0012 a580          	bcp	a,#128
 306  0014 271d          	jreq	L341
 307                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 309  0016 7b06          	ld	a,(OFST+6,sp)
 310  0018 a510          	bcp	a,#16
 311  001a 2706          	jreq	L541
 312                     ; 153       GPIOx->ODR |= GPIO_Pin;
 314  001c f6            	ld	a,(x)
 315  001d 1a05          	or	a,(OFST+5,sp)
 316  001f f7            	ld	(x),a
 318  0020 2007          	jra	L741
 319  0022               L541:
 320                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 322  0022 1e01          	ldw	x,(OFST+1,sp)
 323  0024 7b05          	ld	a,(OFST+5,sp)
 324  0026 43            	cpl	a
 325  0027 f4            	and	a,(x)
 326  0028 f7            	ld	(x),a
 327  0029               L741:
 328                     ; 159     GPIOx->DDR |= GPIO_Pin;
 330  0029 1e01          	ldw	x,(OFST+1,sp)
 331  002b e602          	ld	a,(2,x)
 332  002d 1a05          	or	a,(OFST+5,sp)
 333  002f e702          	ld	(2,x),a
 335  0031 2009          	jra	L151
 336  0033               L341:
 337                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 339  0033 1e01          	ldw	x,(OFST+1,sp)
 340  0035 7b05          	ld	a,(OFST+5,sp)
 341  0037 43            	cpl	a
 342  0038 e402          	and	a,(2,x)
 343  003a e702          	ld	(2,x),a
 344  003c               L151:
 345                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 347  003c 7b06          	ld	a,(OFST+6,sp)
 348  003e a540          	bcp	a,#64
 349  0040 270a          	jreq	L351
 350                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 352  0042 1e01          	ldw	x,(OFST+1,sp)
 353  0044 e603          	ld	a,(3,x)
 354  0046 1a05          	or	a,(OFST+5,sp)
 355  0048 e703          	ld	(3,x),a
 357  004a 2009          	jra	L551
 358  004c               L351:
 359                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 361  004c 1e01          	ldw	x,(OFST+1,sp)
 362  004e 7b05          	ld	a,(OFST+5,sp)
 363  0050 43            	cpl	a
 364  0051 e403          	and	a,(3,x)
 365  0053 e703          	ld	(3,x),a
 366  0055               L551:
 367                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 369  0055 7b06          	ld	a,(OFST+6,sp)
 370  0057 a520          	bcp	a,#32
 371  0059 270a          	jreq	L751
 372                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 374  005b 1e01          	ldw	x,(OFST+1,sp)
 375  005d e604          	ld	a,(4,x)
 376  005f 1a05          	or	a,(OFST+5,sp)
 377  0061 e704          	ld	(4,x),a
 379  0063 2009          	jra	L161
 380  0065               L751:
 381                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 383  0065 1e01          	ldw	x,(OFST+1,sp)
 384  0067 7b05          	ld	a,(OFST+5,sp)
 385  0069 43            	cpl	a
 386  006a e404          	and	a,(4,x)
 387  006c e704          	ld	(4,x),a
 388  006e               L161:
 389                     ; 190 }
 392  006e 85            	popw	x
 393  006f 81            	ret
 468                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 468                     ; 210 {
 469                     	switch	.text
 470  0070               _GPIO_ExternalPullUpConfig:
 472  0070 89            	pushw	x
 473       00000000      OFST:	set	0
 476                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 478                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 480                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 482  0071 0d06          	tnz	(OFST+6,sp)
 483  0073 2708          	jreq	L122
 484                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 486  0075 e603          	ld	a,(3,x)
 487  0077 1a05          	or	a,(OFST+5,sp)
 488  0079 e703          	ld	(3,x),a
 490  007b 2009          	jra	L322
 491  007d               L122:
 492                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 494  007d 1e01          	ldw	x,(OFST+1,sp)
 495  007f 7b05          	ld	a,(OFST+5,sp)
 496  0081 43            	cpl	a
 497  0082 e403          	and	a,(3,x)
 498  0084 e703          	ld	(3,x),a
 499  0086               L322:
 500                     ; 222 }
 503  0086 85            	popw	x
 504  0087 81            	ret
 548                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 548                     ; 249 {
 549                     	switch	.text
 550  0088               _GPIO_Write:
 552  0088 89            	pushw	x
 553       00000000      OFST:	set	0
 556                     ; 250   GPIOx->ODR = GPIO_PortVal;
 558  0089 7b05          	ld	a,(OFST+5,sp)
 559  008b 1e01          	ldw	x,(OFST+1,sp)
 560  008d f7            	ld	(x),a
 561                     ; 251 }
 564  008e 85            	popw	x
 565  008f 81            	ret
 725                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 725                     ; 271 {
 726                     	switch	.text
 727  0090               _GPIO_WriteBit:
 729  0090 89            	pushw	x
 730       00000000      OFST:	set	0
 733                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 735                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 737                     ; 276   if (GPIO_BitVal != RESET)
 739  0091 0d06          	tnz	(OFST+6,sp)
 740  0093 2706          	jreq	L143
 741                     ; 278     GPIOx->ODR |= GPIO_Pin;
 743  0095 f6            	ld	a,(x)
 744  0096 1a05          	or	a,(OFST+5,sp)
 745  0098 f7            	ld	(x),a
 747  0099 2007          	jra	L343
 748  009b               L143:
 749                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 751  009b 1e01          	ldw	x,(OFST+1,sp)
 752  009d 7b05          	ld	a,(OFST+5,sp)
 753  009f 43            	cpl	a
 754  00a0 f4            	and	a,(x)
 755  00a1 f7            	ld	(x),a
 756  00a2               L343:
 757                     ; 285 }
 760  00a2 85            	popw	x
 761  00a3 81            	ret
 805                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 805                     ; 304 {
 806                     	switch	.text
 807  00a4               _GPIO_SetBits:
 809  00a4 89            	pushw	x
 810       00000000      OFST:	set	0
 813                     ; 305   GPIOx->ODR |= GPIO_Pin;
 815  00a5 f6            	ld	a,(x)
 816  00a6 1a05          	or	a,(OFST+5,sp)
 817  00a8 f7            	ld	(x),a
 818                     ; 306 }
 821  00a9 85            	popw	x
 822  00aa 81            	ret
 866                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 866                     ; 325 {
 867                     	switch	.text
 868  00ab               _GPIO_ResetBits:
 870  00ab 89            	pushw	x
 871       00000000      OFST:	set	0
 874                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 876  00ac 7b05          	ld	a,(OFST+5,sp)
 877  00ae 43            	cpl	a
 878  00af f4            	and	a,(x)
 879  00b0 f7            	ld	(x),a
 880                     ; 327 }
 883  00b1 85            	popw	x
 884  00b2 81            	ret
 928                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 928                     ; 337 {
 929                     	switch	.text
 930  00b3               _GPIO_ToggleBits:
 932  00b3 89            	pushw	x
 933       00000000      OFST:	set	0
 936                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 938  00b4 f6            	ld	a,(x)
 939  00b5 1805          	xor	a,(OFST+5,sp)
 940  00b7 f7            	ld	(x),a
 941                     ; 339 }
 944  00b8 85            	popw	x
 945  00b9 81            	ret
 982                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 982                     ; 348 {
 983                     	switch	.text
 984  00ba               _GPIO_ReadInputData:
 988                     ; 349   return ((uint8_t)GPIOx->IDR);
 990  00ba e601          	ld	a,(1,x)
 993  00bc 81            	ret
1031                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1031                     ; 359 {
1032                     	switch	.text
1033  00bd               _GPIO_ReadOutputData:
1037                     ; 360   return ((uint8_t)GPIOx->ODR);
1039  00bd f6            	ld	a,(x)
1042  00be 81            	ret
1091                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1091                     ; 379 {
1092                     	switch	.text
1093  00bf               _GPIO_ReadInputDataBit:
1095  00bf 89            	pushw	x
1096       00000000      OFST:	set	0
1099                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1101  00c0 e601          	ld	a,(1,x)
1102  00c2 1405          	and	a,(OFST+5,sp)
1105  00c4 85            	popw	x
1106  00c5 81            	ret
1155                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1155                     ; 390 {
1156                     	switch	.text
1157  00c6               _GPIO_ReadOutputDataBit:
1159  00c6 89            	pushw	x
1160       00000000      OFST:	set	0
1163                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1165  00c7 f6            	ld	a,(x)
1166  00c8 1405          	and	a,(OFST+5,sp)
1169  00ca 85            	popw	x
1170  00cb 81            	ret
1183                     	xdef	_GPIO_ReadOutputDataBit
1184                     	xdef	_GPIO_ReadInputDataBit
1185                     	xdef	_GPIO_ReadOutputData
1186                     	xdef	_GPIO_ReadInputData
1187                     	xdef	_GPIO_ToggleBits
1188                     	xdef	_GPIO_ResetBits
1189                     	xdef	_GPIO_SetBits
1190                     	xdef	_GPIO_WriteBit
1191                     	xdef	_GPIO_Write
1192                     	xdef	_GPIO_ExternalPullUpConfig
1193                     	xdef	_GPIO_Init
1194                     	xdef	_GPIO_DeInit
1213                     	end
