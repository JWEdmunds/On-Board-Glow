   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  44                     ; 14 void gpio_setup(void){
  46                     	switch	.text
  47  0000               _gpio_setup:
  51                     ; 15 	GPIO_DeInit(GPIOA); //prepare Port A for working 
  53  0000 ae5000        	ldw	x,#20480
  54  0003 cd0000        	call	_GPIO_DeInit
  56                     ; 16 	GPIO_DeInit(GPIOB); //prepare Port B for working
  58  0006 ae5005        	ldw	x,#20485
  59  0009 cd0000        	call	_GPIO_DeInit
  61                     ; 17 	GPIO_DeInit(GPIOC); //prepare Port C for working 
  63  000c ae500a        	ldw	x,#20490
  64  000f cd0000        	call	_GPIO_DeInit
  66                     ; 18 	GPIO_DeInit(GPIOD); //prepare Port D for working
  68  0012 ae500f        	ldw	x,#20495
  69  0015 cd0000        	call	_GPIO_DeInit
  71                     ; 19 	GPIO_DeInit(GPIOE); //prepare Port E for working
  73  0018 ae5014        	ldw	x,#20500
  74  001b cd0000        	call	_GPIO_DeInit
  76                     ; 21 	GPIO_Init(GPIOB, GPIO_Pin_7, GPIO_Mode_Out_PP_High_Slow);
  78  001e 4bd0          	push	#208
  79  0020 4b80          	push	#128
  80  0022 ae5005        	ldw	x,#20485
  81  0025 cd0000        	call	_GPIO_Init
  83  0028 85            	popw	x
  84                     ; 23 	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_In_FL_No_IT);
  86  0029 4b00          	push	#0
  87  002b 4b20          	push	#32
  88  002d ae5000        	ldw	x,#20480
  89  0030 cd0000        	call	_GPIO_Init
  91  0033 85            	popw	x
  92                     ; 25 	GPIO_Init(GPIOB, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Slow);
  94  0034 4bc0          	push	#192
  95  0036 4b02          	push	#2
  96  0038 ae5005        	ldw	x,#20485
  97  003b cd0000        	call	_GPIO_Init
  99  003e 85            	popw	x
 100                     ; 27 	GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_In_FL_No_IT);
 102  003f 4b00          	push	#0
 103  0041 4b04          	push	#4
 104  0043 ae500f        	ldw	x,#20495
 105  0046 cd0000        	call	_GPIO_Init
 107  0049 85            	popw	x
 108                     ; 31 	GPIO_Init(GPIOA, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
 110  004a 4b40          	push	#64
 111  004c 4b01          	push	#1
 112  004e ae5000        	ldw	x,#20480
 113  0051 cd0000        	call	_GPIO_Init
 115  0054 85            	popw	x
 116                     ; 32 	GPIO_Init(GPIOA, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
 118  0055 4b40          	push	#64
 119  0057 4b02          	push	#2
 120  0059 ae5000        	ldw	x,#20480
 121  005c cd0000        	call	_GPIO_Init
 123  005f 85            	popw	x
 124                     ; 33 	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
 126  0060 4b40          	push	#64
 127  0062 4b04          	push	#4
 128  0064 ae5000        	ldw	x,#20480
 129  0067 cd0000        	call	_GPIO_Init
 131  006a 85            	popw	x
 132                     ; 34 	GPIO_Init(GPIOA, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
 134  006b 4b40          	push	#64
 135  006d 4b08          	push	#8
 136  006f ae5000        	ldw	x,#20480
 137  0072 cd0000        	call	_GPIO_Init
 139  0075 85            	popw	x
 140                     ; 35 	GPIO_Init(GPIOA, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
 142  0076 4b40          	push	#64
 143  0078 4b10          	push	#16
 144  007a ae5000        	ldw	x,#20480
 145  007d cd0000        	call	_GPIO_Init
 147  0080 85            	popw	x
 148                     ; 36 	GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
 150  0081 4b40          	push	#64
 151  0083 4b40          	push	#64
 152  0085 ae5000        	ldw	x,#20480
 153  0088 cd0000        	call	_GPIO_Init
 155  008b 85            	popw	x
 156                     ; 37 	GPIO_Init(GPIOA, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
 158  008c 4b40          	push	#64
 159  008e 4b80          	push	#128
 160  0090 ae5000        	ldw	x,#20480
 161  0093 cd0000        	call	_GPIO_Init
 163  0096 85            	popw	x
 164                     ; 39 	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
 166  0097 4b40          	push	#64
 167  0099 4b01          	push	#1
 168  009b ae5005        	ldw	x,#20485
 169  009e cd0000        	call	_GPIO_Init
 171  00a1 85            	popw	x
 172                     ; 40 	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
 174  00a2 4b40          	push	#64
 175  00a4 4b04          	push	#4
 176  00a6 ae5005        	ldw	x,#20485
 177  00a9 cd0000        	call	_GPIO_Init
 179  00ac 85            	popw	x
 180                     ; 41 	GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
 182  00ad 4b40          	push	#64
 183  00af 4b08          	push	#8
 184  00b1 ae5005        	ldw	x,#20485
 185  00b4 cd0000        	call	_GPIO_Init
 187  00b7 85            	popw	x
 188                     ; 42 	GPIO_Init(GPIOB, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
 190  00b8 4b40          	push	#64
 191  00ba 4b10          	push	#16
 192  00bc ae5005        	ldw	x,#20485
 193  00bf cd0000        	call	_GPIO_Init
 195  00c2 85            	popw	x
 196                     ; 43 	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 198  00c3 4b40          	push	#64
 199  00c5 4b20          	push	#32
 200  00c7 ae5005        	ldw	x,#20485
 201  00ca cd0000        	call	_GPIO_Init
 203  00cd 85            	popw	x
 204                     ; 44 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
 206  00ce 4b40          	push	#64
 207  00d0 4b40          	push	#64
 208  00d2 ae5005        	ldw	x,#20485
 209  00d5 cd0000        	call	_GPIO_Init
 211  00d8 85            	popw	x
 212                     ; 46 	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
 214  00d9 4b40          	push	#64
 215  00db 4b01          	push	#1
 216  00dd ae500a        	ldw	x,#20490
 217  00e0 cd0000        	call	_GPIO_Init
 219  00e3 85            	popw	x
 220                     ; 47 	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
 222  00e4 4b40          	push	#64
 223  00e6 4b02          	push	#2
 224  00e8 ae500a        	ldw	x,#20490
 225  00eb cd0000        	call	_GPIO_Init
 227  00ee 85            	popw	x
 228                     ; 48 	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
 230  00ef 4b40          	push	#64
 231  00f1 4b04          	push	#4
 232  00f3 ae500a        	ldw	x,#20490
 233  00f6 cd0000        	call	_GPIO_Init
 235  00f9 85            	popw	x
 236                     ; 49 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
 238  00fa 4b40          	push	#64
 239  00fc 4b08          	push	#8
 240  00fe ae500a        	ldw	x,#20490
 241  0101 cd0000        	call	_GPIO_Init
 243  0104 85            	popw	x
 244                     ; 50 	GPIO_Init(GPIOC, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
 246  0105 4b40          	push	#64
 247  0107 4b10          	push	#16
 248  0109 ae500a        	ldw	x,#20490
 249  010c cd0000        	call	_GPIO_Init
 251  010f 85            	popw	x
 252                     ; 51 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 254  0110 4b40          	push	#64
 255  0112 4b20          	push	#32
 256  0114 ae500a        	ldw	x,#20490
 257  0117 cd0000        	call	_GPIO_Init
 259  011a 85            	popw	x
 260                     ; 52 	GPIO_Init(GPIOC, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
 262  011b 4b40          	push	#64
 263  011d 4b40          	push	#64
 264  011f ae500a        	ldw	x,#20490
 265  0122 cd0000        	call	_GPIO_Init
 267  0125 85            	popw	x
 268                     ; 53 	GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
 270  0126 4b40          	push	#64
 271  0128 4b80          	push	#128
 272  012a ae500a        	ldw	x,#20490
 273  012d cd0000        	call	_GPIO_Init
 275  0130 85            	popw	x
 276                     ; 55 	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
 278  0131 4b40          	push	#64
 279  0133 4b01          	push	#1
 280  0135 ae500f        	ldw	x,#20495
 281  0138 cd0000        	call	_GPIO_Init
 283  013b 85            	popw	x
 284                     ; 56 	GPIO_Init(GPIOD, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
 286  013c 4b40          	push	#64
 287  013e 4b02          	push	#2
 288  0140 ae500f        	ldw	x,#20495
 289  0143 cd0000        	call	_GPIO_Init
 291  0146 85            	popw	x
 292                     ; 57 	GPIO_Init(GPIOD, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
 294  0147 4b40          	push	#64
 295  0149 4b08          	push	#8
 296  014b ae500f        	ldw	x,#20495
 297  014e cd0000        	call	_GPIO_Init
 299  0151 85            	popw	x
 300                     ; 58 	GPIO_Init(GPIOD, GPIO_Pin_4, GPIO_Mode_In_PU_No_IT);
 302  0152 4b40          	push	#64
 303  0154 4b10          	push	#16
 304  0156 ae500f        	ldw	x,#20495
 305  0159 cd0000        	call	_GPIO_Init
 307  015c 85            	popw	x
 308                     ; 59 	GPIO_Init(GPIOD, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 310  015d 4b40          	push	#64
 311  015f 4b20          	push	#32
 312  0161 ae500f        	ldw	x,#20495
 313  0164 cd0000        	call	_GPIO_Init
 315  0167 85            	popw	x
 316                     ; 60 	GPIO_Init(GPIOD, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
 318  0168 4b40          	push	#64
 319  016a 4b40          	push	#64
 320  016c ae500f        	ldw	x,#20495
 321  016f cd0000        	call	_GPIO_Init
 323  0172 85            	popw	x
 324                     ; 61 	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
 326  0173 4b40          	push	#64
 327  0175 4b80          	push	#128
 328  0177 ae500f        	ldw	x,#20495
 329  017a cd0000        	call	_GPIO_Init
 331  017d 85            	popw	x
 332                     ; 63 	GPIO_Init(GPIOE, GPIO_Pin_0, GPIO_Mode_In_PU_No_IT);
 334  017e 4b40          	push	#64
 335  0180 4b01          	push	#1
 336  0182 ae5014        	ldw	x,#20500
 337  0185 cd0000        	call	_GPIO_Init
 339  0188 85            	popw	x
 340                     ; 64 	GPIO_Init(GPIOE, GPIO_Pin_1, GPIO_Mode_In_PU_No_IT);
 342  0189 4b40          	push	#64
 343  018b 4b02          	push	#2
 344  018d ae5014        	ldw	x,#20500
 345  0190 cd0000        	call	_GPIO_Init
 347  0193 85            	popw	x
 348                     ; 65 	GPIO_Init(GPIOE, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
 350  0194 4b40          	push	#64
 351  0196 4b04          	push	#4
 352  0198 ae5014        	ldw	x,#20500
 353  019b cd0000        	call	_GPIO_Init
 355  019e 85            	popw	x
 356                     ; 68 	GPIO_Init(GPIOE, GPIO_Pin_5, GPIO_Mode_In_PU_No_IT);
 358  019f 4b40          	push	#64
 359  01a1 4b20          	push	#32
 360  01a3 ae5014        	ldw	x,#20500
 361  01a6 cd0000        	call	_GPIO_Init
 363  01a9 85            	popw	x
 364                     ; 69 	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
 366  01aa 4b40          	push	#64
 367  01ac 4b40          	push	#64
 368  01ae ae5014        	ldw	x,#20500
 369  01b1 cd0000        	call	_GPIO_Init
 371  01b4 85            	popw	x
 372                     ; 70 	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
 374  01b5 4b40          	push	#64
 375  01b7 4b80          	push	#128
 376  01b9 ae5014        	ldw	x,#20500
 377  01bc cd0000        	call	_GPIO_Init
 379  01bf 85            	popw	x
 380                     ; 72 }
 383  01c0 81            	ret
 415                     ; 74 void clk_setup (void){
 416                     	switch	.text
 417  01c1               _clk_setup:
 421                     ; 82 	CLK_DeInit();
 423  01c1 cd0000        	call	_CLK_DeInit
 425                     ; 84 	CLK_HSICmd(ENABLE);
 427  01c4 a601          	ld	a,#1
 428  01c6 cd0000        	call	_CLK_HSICmd
 431  01c9               L33:
 432                     ; 86 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);
 434  01c9 a611          	ld	a,#17
 435  01cb cd0000        	call	_CLK_GetFlagStatus
 437  01ce 4d            	tnz	a
 438  01cf 27f8          	jreq	L33
 439                     ; 88 	CLK_HSEConfig(CLK_HSE_OFF);
 441  01d1 4f            	clr	a
 442  01d2 cd0000        	call	_CLK_HSEConfig
 444                     ; 90     CLK_SYSCLKSourceSwitchCmd(ENABLE);
 446  01d5 a601          	ld	a,#1
 447  01d7 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 449                     ; 92 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 451  01da a601          	ld	a,#1
 452  01dc cd0000        	call	_CLK_SYSCLKSourceConfig
 454                     ; 94 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);
 456  01df a604          	ld	a,#4
 457  01e1 cd0000        	call	_CLK_SYSCLKDivConfig
 459                     ; 96 	CLK_CCOConfig(CLK_CCOSource_Off, CLK_CCODiv_1);
 461  01e4 5f            	clrw	x
 462  01e5 cd0000        	call	_CLK_CCOConfig
 464                     ; 98 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, ENABLE);
 466  01e8 ae2301        	ldw	x,#8961
 467  01eb cd0000        	call	_CLK_PeripheralClockConfig
 469                     ; 100 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 471  01ee ae1001        	ldw	x,#4097
 472  01f1 cd0000        	call	_CLK_PeripheralClockConfig
 474                     ; 102 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 476  01f4 ae1101        	ldw	x,#4353
 477  01f7 cd0000        	call	_CLK_PeripheralClockConfig
 479                     ; 104 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
 481  01fa ae0001        	ldw	x,#1
 482  01fd cd0000        	call	_CLK_PeripheralClockConfig
 484                     ; 106 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 486  0200 ae0101        	ldw	x,#257
 487  0203 cd0000        	call	_CLK_PeripheralClockConfig
 489                     ; 108 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 491  0206 ae0201        	ldw	x,#513
 492  0209 cd0000        	call	_CLK_PeripheralClockConfig
 494                     ; 110 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
 496  020c ae0600        	ldw	x,#1536
 497  020f cd0000        	call	_CLK_PeripheralClockConfig
 499                     ; 111 	CLK_PeripheralClockConfig(CLK_Peripheral_COMP, DISABLE);
 501  0212 ae1500        	ldw	x,#5376
 502  0215 cd0000        	call	_CLK_PeripheralClockConfig
 504                     ; 112 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
 506  0218 ae0300        	ldw	x,#768
 507  021b cd0000        	call	_CLK_PeripheralClockConfig
 509                     ; 113 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 511  021e ae1300        	ldw	x,#4864
 512  0221 cd0000        	call	_CLK_PeripheralClockConfig
 514                     ; 114 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
 516  0224 ae0400        	ldw	x,#1024
 517  0227 cd0000        	call	_CLK_PeripheralClockConfig
 519                     ; 115 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 521  022a ae1400        	ldw	x,#5120
 522  022d cd0000        	call	_CLK_PeripheralClockConfig
 524                     ; 116 }
 527  0230 81            	ret
 540                     	xdef	_clk_setup
 541                     	xdef	_gpio_setup
 542                     	xref	_GPIO_Init
 543                     	xref	_GPIO_DeInit
 544                     	xref	_CLK_GetFlagStatus
 545                     	xref	_CLK_PeripheralClockConfig
 546                     	xref	_CLK_SYSCLKSourceSwitchCmd
 547                     	xref	_CLK_SYSCLKDivConfig
 548                     	xref	_CLK_SYSCLKSourceConfig
 549                     	xref	_CLK_CCOConfig
 550                     	xref	_CLK_HSEConfig
 551                     	xref	_CLK_HSICmd
 552                     	xref	_CLK_DeInit
 571                     	end
