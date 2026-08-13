   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  14                     	switch	.data
  15  0000               _ADC_Raw_Value:
  16  0000 0000          	dc.w	0
  46                     ; 67 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 6)
  46                     ; 68 {
  47                     	switch	.text
  48  0000               f_EXTI_PORTC_IRQHandler:
  52                     ; 70 }
  55  0000 80            	iret
  77                     ; 88 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 89 {
  78                     	switch	.text
  79  0001               f_TRAP_IRQHandler:
  83                     ; 93 }
  86  0001 80            	iret
 108                     ; 99 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 108                     ; 100 {
 109                     	switch	.text
 110  0002               f_FLASH_IRQHandler:
 114                     ; 104 }
 117  0002 80            	iret
 140                     ; 110 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 140                     ; 111 {
 141                     	switch	.text
 142  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 146                     ; 115 }
 149  0003 80            	iret
 172                     ; 121 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 172                     ; 122 {
 173                     	switch	.text
 174  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 178                     ; 126 }
 181  0004 80            	iret
 204                     ; 132 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 204                     ; 133 {
 205                     	switch	.text
 206  0005               f_RTC_CSSLSE_IRQHandler:
 210                     ; 137 }
 213  0005 80            	iret
 236                     ; 143 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 236                     ; 144 {
 237                     	switch	.text
 238  0006               f_EXTIE_F_PVD_IRQHandler:
 242                     ; 148 }
 245  0006 80            	iret
 267                     ; 155 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 267                     ; 156 {
 268                     	switch	.text
 269  0007               f_EXTIB_G_IRQHandler:
 273                     ; 160 }
 276  0007 80            	iret
 298                     ; 167 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 298                     ; 168 {
 299                     	switch	.text
 300  0008               f_EXTID_H_IRQHandler:
 304                     ; 172 }
 307  0008 80            	iret
 329                     ; 179 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 329                     ; 180 {
 330                     	switch	.text
 331  0009               f_EXTI0_IRQHandler:
 335                     ; 184 }
 338  0009 80            	iret
 360                     ; 191 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 360                     ; 192 {
 361                     	switch	.text
 362  000a               f_EXTI1_IRQHandler:
 366                     ; 196 }
 369  000a 80            	iret
 391                     ; 203 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 391                     ; 204 {
 392                     	switch	.text
 393  000b               f_EXTI2_IRQHandler:
 397                     ; 209 }
 400  000b 80            	iret
 422                     ; 216 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 422                     ; 217 {
 423                     	switch	.text
 424  000c               f_EXTI3_IRQHandler:
 428                     ; 222 }
 431  000c 80            	iret
 453                     ; 229 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 453                     ; 230 {
 454                     	switch	.text
 455  000d               f_EXTI4_IRQHandler:
 459                     ; 234 }
 462  000d 80            	iret
 484                     ; 241 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 484                     ; 242 {
 485                     	switch	.text
 486  000e               f_EXTI5_IRQHandler:
 490                     ; 246 }
 493  000e 80            	iret
 515                     ; 253 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 515                     ; 254 {
 516                     	switch	.text
 517  000f               f_EXTI6_IRQHandler:
 521                     ; 258 }
 524  000f 80            	iret
 546                     ; 265 @svlreg INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 546                     ; 266 {
 547                     	switch	.text
 548  0010               f_EXTI7_IRQHandler:
 550  0010 be02          	ldw	x,c_lreg+2
 551  0012 89            	pushw	x
 552  0013 be00          	ldw	x,c_lreg
 553  0015 89            	pushw	x
 556                     ; 270 }
 559  0016 85            	popw	x
 560  0017 bf00          	ldw	c_lreg,x
 561  0019 85            	popw	x
 562  001a bf02          	ldw	c_lreg+2,x
 563  001c 80            	iret
 585                     ; 276 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 585                     ; 277 {
 586                     	switch	.text
 587  001d               f_LCD_AES_IRQHandler:
 591                     ; 281 }
 594  001d 80            	iret
 617                     ; 287 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 617                     ; 288 {
 618                     	switch	.text
 619  001e               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 623                     ; 292 }
 626  001e 80            	iret
 652                     ; 299 @svlreg INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 652                     ; 300 {
 653                     	switch	.text
 654  001f               f_ADC1_COMP_IRQHandler:
 656  001f 8a            	push	cc
 657  0020 84            	pop	a
 658  0021 a4bf          	and	a,#191
 659  0023 88            	push	a
 660  0024 86            	pop	cc
 661  0025 3b0002        	push	c_x+2
 662  0028 be00          	ldw	x,c_x
 663  002a 89            	pushw	x
 664  002b 3b0002        	push	c_y+2
 665  002e be00          	ldw	x,c_y
 666  0030 89            	pushw	x
 667  0031 be02          	ldw	x,c_lreg+2
 668  0033 89            	pushw	x
 669  0034 be00          	ldw	x,c_lreg
 670  0036 89            	pushw	x
 673                     ; 305 	ADC_Raw_Value = ADC_GetConversionValue(ADC1);
 675  0037 ae5340        	ldw	x,#21312
 676  003a cd0000        	call	_ADC_GetConversionValue
 678  003d cf0000        	ldw	_ADC_Raw_Value,x
 679                     ; 307 	ADC_ClearITPendingBit(ADC1, ADC_IT_EOC);
 681  0040 4b08          	push	#8
 682  0042 ae5340        	ldw	x,#21312
 683  0045 cd0000        	call	_ADC_ClearITPendingBit
 685  0048 84            	pop	a
 686                     ; 308 }
 689  0049 85            	popw	x
 690  004a bf00          	ldw	c_lreg,x
 691  004c 85            	popw	x
 692  004d bf02          	ldw	c_lreg+2,x
 693  004f 85            	popw	x
 694  0050 bf00          	ldw	c_y,x
 695  0052 320002        	pop	c_y+2
 696  0055 85            	popw	x
 697  0056 bf00          	ldw	c_x,x
 698  0058 320002        	pop	c_x+2
 699  005b 80            	iret
 726                     ; 315 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 726                     ; 316 {
 727                     	switch	.text
 728  005c               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 730  005c 8a            	push	cc
 731  005d 84            	pop	a
 732  005e a4bf          	and	a,#191
 733  0060 88            	push	a
 734  0061 86            	pop	cc
 735  0062 3b0002        	push	c_x+2
 736  0065 be00          	ldw	x,c_x
 737  0067 89            	pushw	x
 738  0068 3b0002        	push	c_y+2
 739  006b be00          	ldw	x,c_y
 740  006d 89            	pushw	x
 743                     ; 321 	if (TIM2_GetITStatus(TIM2_IT_Update) != RESET){
 745  006e a601          	ld	a,#1
 746  0070 cd0000        	call	_TIM2_GetITStatus
 748  0073 4d            	tnz	a
 749  0074 270d          	jreq	L162
 750                     ; 323 	  system_time_ms++;
 752  0076 ae0000        	ldw	x,#_system_time_ms
 753  0079 a601          	ld	a,#1
 754  007b cd0000        	call	c_lgadc
 756                     ; 325 	  TIM2_ClearITPendingBit(TIM2_IT_Update);
 758  007e a601          	ld	a,#1
 759  0080 cd0000        	call	_TIM2_ClearITPendingBit
 761  0083               L162:
 762                     ; 328 }
 765  0083 85            	popw	x
 766  0084 bf00          	ldw	c_y,x
 767  0086 320002        	pop	c_y+2
 768  0089 85            	popw	x
 769  008a bf00          	ldw	c_x,x
 770  008c 320002        	pop	c_x+2
 771  008f 80            	iret
 794                     ; 335 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 794                     ; 336 {
 795                     	switch	.text
 796  0090               f_TIM2_CC_USART2_RX_IRQHandler:
 800                     ; 340 }
 803  0090 80            	iret
 827                     ; 348 @svlreg INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 827                     ; 349 {
 828                     	switch	.text
 829  0091               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 831  0091 be02          	ldw	x,c_lreg+2
 832  0093 89            	pushw	x
 833  0094 be00          	ldw	x,c_lreg
 834  0096 89            	pushw	x
 837                     ; 354 }
 840  0097 85            	popw	x
 841  0098 bf00          	ldw	c_lreg,x
 842  009a 85            	popw	x
 843  009b bf02          	ldw	c_lreg+2,x
 844  009d 80            	iret
 867                     ; 360 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 867                     ; 361 {
 868                     	switch	.text
 869  009e               f_TIM3_CC_USART3_RX_IRQHandler:
 873                     ; 365 }
 876  009e 80            	iret
 899                     ; 371 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 899                     ; 372 {
 900                     	switch	.text
 901  009f               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 905                     ; 376 }
 908  009f 80            	iret
 936                     ; 382 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 936                     ; 383 {
 937                     	switch	.text
 938  00a0               f_TIM1_CC_IRQHandler:
 940  00a0 8a            	push	cc
 941  00a1 84            	pop	a
 942  00a2 a4bf          	and	a,#191
 943  00a4 88            	push	a
 944  00a5 86            	pop	cc
 945       00000002      OFST:	set	2
 946  00a6 3b0002        	push	c_x+2
 947  00a9 be00          	ldw	x,c_x
 948  00ab 89            	pushw	x
 949  00ac 3b0002        	push	c_y+2
 950  00af be00          	ldw	x,c_y
 951  00b1 89            	pushw	x
 952  00b2 89            	pushw	x
 955                     ; 390   if (TIM1_GetITStatus(TIM1_IT_CC2) != RESET){
 957  00b3 a604          	ld	a,#4
 958  00b5 cd0000        	call	_TIM1_GetITStatus
 960  00b8 4d            	tnz	a
 961  00b9 2717          	jreq	L333
 962                     ; 391 	 pwm_width_us = TIM1_GetCapture2() - TIM1_GetCapture1();
 964  00bb cd0000        	call	_TIM1_GetCapture1
 966  00be 1f01          	ldw	(OFST-1,sp),x
 968  00c0 cd0000        	call	_TIM1_GetCapture2
 970  00c3 72f001        	subw	x,(OFST-1,sp)
 971  00c6 cf0000        	ldw	_pwm_width_us,x
 972                     ; 393 	TIM1_ClearITPendingBit(TIM1_IT_CC2);
 974  00c9 a604          	ld	a,#4
 975  00cb cd0000        	call	_TIM1_ClearITPendingBit
 977                     ; 395 	pwm_sample_received = TRUE;
 979  00ce 35010000      	mov	_pwm_sample_received,#1
 980  00d2               L333:
 981                     ; 398 }
 984  00d2 5b02          	addw	sp,#2
 985  00d4 85            	popw	x
 986  00d5 bf00          	ldw	c_y,x
 987  00d7 320002        	pop	c_y+2
 988  00da 85            	popw	x
 989  00db bf00          	ldw	c_x,x
 990  00dd 320002        	pop	c_x+2
 991  00e0 80            	iret
1014                     ; 405 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
1014                     ; 406 {
1015                     	switch	.text
1016  00e1               f_TIM4_UPD_OVF_TRG_IRQHandler:
1020                     ; 410 }
1023  00e1 80            	iret
1045                     ; 416 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1045                     ; 417 {
1046                     	switch	.text
1047  00e2               f_SPI1_IRQHandler:
1051                     ; 421 }
1054  00e2 80            	iret
1078                     ; 428 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1078                     ; 429 {
1079                     	switch	.text
1080  00e3               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1084                     ; 433 }
1087  00e3 80            	iret
1110                     ; 440 @svlreg INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1110                     ; 441 {
1111                     	switch	.text
1112  00e4               f_USART1_RX_TIM5_CC_IRQHandler:
1114  00e4 be02          	ldw	x,c_lreg+2
1115  00e6 89            	pushw	x
1116  00e7 be00          	ldw	x,c_lreg
1117  00e9 89            	pushw	x
1120                     ; 445 }
1123  00ea 85            	popw	x
1124  00eb bf00          	ldw	c_lreg,x
1125  00ed 85            	popw	x
1126  00ee bf02          	ldw	c_lreg+2,x
1127  00f0 80            	iret
1150                     ; 452 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1150                     ; 453 {
1151                     	switch	.text
1152  00f1               f_I2C1_SPI2_IRQHandler:
1156                     ; 457 }
1159  00f1 80            	iret
1196                     	xdef	f_EXTI_PORTC_IRQHandler
1197                     	switch	.bss
1198  0000               _pwm_falling:
1199  0000 0000          	ds.b	2
1200                     	xdef	_pwm_falling
1201  0002               _pwm_rising:
1202  0002 0000          	ds.b	2
1203                     	xdef	_pwm_rising
1204                     	xdef	_ADC_Raw_Value
1205                     	xref	_system_time_ms
1206                     	xref	_pwm_sample_received
1207                     	xref	_pwm_width_us
1208                     	xdef	f_I2C1_SPI2_IRQHandler
1209                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1210                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1211                     	xdef	f_SPI1_IRQHandler
1212                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1213                     	xdef	f_TIM1_CC_IRQHandler
1214                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1215                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1216                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1217                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1218                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1219                     	xdef	f_ADC1_COMP_IRQHandler
1220                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1221                     	xdef	f_LCD_AES_IRQHandler
1222                     	xdef	f_EXTI7_IRQHandler
1223                     	xdef	f_EXTI6_IRQHandler
1224                     	xdef	f_EXTI5_IRQHandler
1225                     	xdef	f_EXTI4_IRQHandler
1226                     	xdef	f_EXTI3_IRQHandler
1227                     	xdef	f_EXTI2_IRQHandler
1228                     	xdef	f_EXTI1_IRQHandler
1229                     	xdef	f_EXTI0_IRQHandler
1230                     	xdef	f_EXTID_H_IRQHandler
1231                     	xdef	f_EXTIB_G_IRQHandler
1232                     	xdef	f_EXTIE_F_PVD_IRQHandler
1233                     	xdef	f_RTC_CSSLSE_IRQHandler
1234                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1235                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1236                     	xdef	f_FLASH_IRQHandler
1237                     	xdef	f_TRAP_IRQHandler
1238                     	xref	_TIM2_ClearITPendingBit
1239                     	xref	_TIM2_GetITStatus
1240                     	xref	_TIM1_ClearITPendingBit
1241                     	xref	_TIM1_GetITStatus
1242                     	xref	_TIM1_GetCapture2
1243                     	xref	_TIM1_GetCapture1
1244                     	xref	_ADC_ClearITPendingBit
1245                     	xref	_ADC_GetConversionValue
1246                     	xref.b	c_lreg
1247                     	xref.b	c_x
1248                     	xref.b	c_y
1268                     	xref	c_lgadc
1269                     	end
