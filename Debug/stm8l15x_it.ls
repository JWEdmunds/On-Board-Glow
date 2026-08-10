   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  43                     ; 64 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 6)
  43                     ; 65 {
  44                     	switch	.text
  45  0000               f_EXTI_PORTC_IRQHandler:
  49                     ; 67 }
  52  0000 80            	iret
  74                     ; 85 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 86 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 90 }
  83  0001 80            	iret
 105                     ; 96 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 105                     ; 97 {
 106                     	switch	.text
 107  0002               f_FLASH_IRQHandler:
 111                     ; 101 }
 114  0002 80            	iret
 137                     ; 107 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 137                     ; 108 {
 138                     	switch	.text
 139  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 143                     ; 112 }
 146  0003 80            	iret
 169                     ; 118 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 169                     ; 119 {
 170                     	switch	.text
 171  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 175                     ; 123 }
 178  0004 80            	iret
 201                     ; 129 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 201                     ; 130 {
 202                     	switch	.text
 203  0005               f_RTC_CSSLSE_IRQHandler:
 207                     ; 134 }
 210  0005 80            	iret
 233                     ; 140 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 233                     ; 141 {
 234                     	switch	.text
 235  0006               f_EXTIE_F_PVD_IRQHandler:
 239                     ; 145 }
 242  0006 80            	iret
 264                     ; 152 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 264                     ; 153 {
 265                     	switch	.text
 266  0007               f_EXTIB_G_IRQHandler:
 270                     ; 157 }
 273  0007 80            	iret
 295                     ; 164 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 295                     ; 165 {
 296                     	switch	.text
 297  0008               f_EXTID_H_IRQHandler:
 301                     ; 169 }
 304  0008 80            	iret
 326                     ; 176 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 326                     ; 177 {
 327                     	switch	.text
 328  0009               f_EXTI0_IRQHandler:
 332                     ; 181 }
 335  0009 80            	iret
 357                     ; 188 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 357                     ; 189 {
 358                     	switch	.text
 359  000a               f_EXTI1_IRQHandler:
 363                     ; 193 }
 366  000a 80            	iret
 388                     ; 200 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 388                     ; 201 {
 389                     	switch	.text
 390  000b               f_EXTI2_IRQHandler:
 394                     ; 206 }
 397  000b 80            	iret
 419                     ; 213 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 419                     ; 214 {
 420                     	switch	.text
 421  000c               f_EXTI3_IRQHandler:
 425                     ; 219 }
 428  000c 80            	iret
 450                     ; 226 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 450                     ; 227 {
 451                     	switch	.text
 452  000d               f_EXTI4_IRQHandler:
 456                     ; 231 }
 459  000d 80            	iret
 481                     ; 238 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 481                     ; 239 {
 482                     	switch	.text
 483  000e               f_EXTI5_IRQHandler:
 487                     ; 243 }
 490  000e 80            	iret
 512                     ; 250 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 512                     ; 251 {
 513                     	switch	.text
 514  000f               f_EXTI6_IRQHandler:
 518                     ; 255 }
 521  000f 80            	iret
 543                     ; 262 @svlreg INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 543                     ; 263 {
 544                     	switch	.text
 545  0010               f_EXTI7_IRQHandler:
 547  0010 be02          	ldw	x,c_lreg+2
 548  0012 89            	pushw	x
 549  0013 be00          	ldw	x,c_lreg
 550  0015 89            	pushw	x
 553                     ; 267 }
 556  0016 85            	popw	x
 557  0017 bf00          	ldw	c_lreg,x
 558  0019 85            	popw	x
 559  001a bf02          	ldw	c_lreg+2,x
 560  001c 80            	iret
 582                     ; 273 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 582                     ; 274 {
 583                     	switch	.text
 584  001d               f_LCD_AES_IRQHandler:
 588                     ; 278 }
 591  001d 80            	iret
 614                     ; 284 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 614                     ; 285 {
 615                     	switch	.text
 616  001e               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 620                     ; 289 }
 623  001e 80            	iret
 646                     ; 296 @svlreg INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 646                     ; 297 {
 647                     	switch	.text
 648  001f               f_ADC1_COMP_IRQHandler:
 650  001f be02          	ldw	x,c_lreg+2
 651  0021 89            	pushw	x
 652  0022 be00          	ldw	x,c_lreg
 653  0024 89            	pushw	x
 656                     ; 302 }
 659  0025 85            	popw	x
 660  0026 bf00          	ldw	c_lreg,x
 661  0028 85            	popw	x
 662  0029 bf02          	ldw	c_lreg+2,x
 663  002b 80            	iret
 690                     ; 309 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 690                     ; 310 {
 691                     	switch	.text
 692  002c               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 694  002c 8a            	push	cc
 695  002d 84            	pop	a
 696  002e a4bf          	and	a,#191
 697  0030 88            	push	a
 698  0031 86            	pop	cc
 699  0032 3b0002        	push	c_x+2
 700  0035 be00          	ldw	x,c_x
 701  0037 89            	pushw	x
 702  0038 3b0002        	push	c_y+2
 703  003b be00          	ldw	x,c_y
 704  003d 89            	pushw	x
 707                     ; 315 	if (TIM2_GetITStatus(TIM2_IT_Update) != RESET){
 709  003e a601          	ld	a,#1
 710  0040 cd0000        	call	_TIM2_GetITStatus
 712  0043 4d            	tnz	a
 713  0044 270d          	jreq	L162
 714                     ; 317 	  system_time_ms++;
 716  0046 ae0000        	ldw	x,#_system_time_ms
 717  0049 a601          	ld	a,#1
 718  004b cd0000        	call	c_lgadc
 720                     ; 319 	  TIM2_ClearITPendingBit(TIM2_IT_Update);
 722  004e a601          	ld	a,#1
 723  0050 cd0000        	call	_TIM2_ClearITPendingBit
 725  0053               L162:
 726                     ; 322 }
 729  0053 85            	popw	x
 730  0054 bf00          	ldw	c_y,x
 731  0056 320002        	pop	c_y+2
 732  0059 85            	popw	x
 733  005a bf00          	ldw	c_x,x
 734  005c 320002        	pop	c_x+2
 735  005f 80            	iret
 758                     ; 329 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 758                     ; 330 {
 759                     	switch	.text
 760  0060               f_TIM2_CC_USART2_RX_IRQHandler:
 764                     ; 334 }
 767  0060 80            	iret
 791                     ; 342 @svlreg INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 791                     ; 343 {
 792                     	switch	.text
 793  0061               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 795  0061 be02          	ldw	x,c_lreg+2
 796  0063 89            	pushw	x
 797  0064 be00          	ldw	x,c_lreg
 798  0066 89            	pushw	x
 801                     ; 348 }
 804  0067 85            	popw	x
 805  0068 bf00          	ldw	c_lreg,x
 806  006a 85            	popw	x
 807  006b bf02          	ldw	c_lreg+2,x
 808  006d 80            	iret
 831                     ; 354 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 831                     ; 355 {
 832                     	switch	.text
 833  006e               f_TIM3_CC_USART3_RX_IRQHandler:
 837                     ; 359 }
 840  006e 80            	iret
 863                     ; 365 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 863                     ; 366 {
 864                     	switch	.text
 865  006f               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 869                     ; 370 }
 872  006f 80            	iret
 900                     ; 376 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 900                     ; 377 {
 901                     	switch	.text
 902  0070               f_TIM1_CC_IRQHandler:
 904  0070 8a            	push	cc
 905  0071 84            	pop	a
 906  0072 a4bf          	and	a,#191
 907  0074 88            	push	a
 908  0075 86            	pop	cc
 909       00000002      OFST:	set	2
 910  0076 3b0002        	push	c_x+2
 911  0079 be00          	ldw	x,c_x
 912  007b 89            	pushw	x
 913  007c 3b0002        	push	c_y+2
 914  007f be00          	ldw	x,c_y
 915  0081 89            	pushw	x
 916  0082 89            	pushw	x
 919                     ; 384   if (TIM1_GetITStatus(TIM1_IT_CC2) != RESET){
 921  0083 a604          	ld	a,#4
 922  0085 cd0000        	call	_TIM1_GetITStatus
 924  0088 4d            	tnz	a
 925  0089 2717          	jreq	L333
 926                     ; 385 	 pwm_width_us = TIM1_GetCapture2() - TIM1_GetCapture1();
 928  008b cd0000        	call	_TIM1_GetCapture1
 930  008e 1f01          	ldw	(OFST-1,sp),x
 932  0090 cd0000        	call	_TIM1_GetCapture2
 934  0093 72f001        	subw	x,(OFST-1,sp)
 935  0096 cf0000        	ldw	_pwm_width_us,x
 936                     ; 387 	TIM1_ClearITPendingBit(TIM1_IT_CC2);
 938  0099 a604          	ld	a,#4
 939  009b cd0000        	call	_TIM1_ClearITPendingBit
 941                     ; 389 	pwm_sample_received = TRUE;
 943  009e 35010000      	mov	_pwm_sample_received,#1
 944  00a2               L333:
 945                     ; 392 }
 948  00a2 5b02          	addw	sp,#2
 949  00a4 85            	popw	x
 950  00a5 bf00          	ldw	c_y,x
 951  00a7 320002        	pop	c_y+2
 952  00aa 85            	popw	x
 953  00ab bf00          	ldw	c_x,x
 954  00ad 320002        	pop	c_x+2
 955  00b0 80            	iret
 978                     ; 399 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 978                     ; 400 {
 979                     	switch	.text
 980  00b1               f_TIM4_UPD_OVF_TRG_IRQHandler:
 984                     ; 404 }
 987  00b1 80            	iret
1009                     ; 410 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1009                     ; 411 {
1010                     	switch	.text
1011  00b2               f_SPI1_IRQHandler:
1015                     ; 415 }
1018  00b2 80            	iret
1042                     ; 422 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1042                     ; 423 {
1043                     	switch	.text
1044  00b3               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1048                     ; 427 }
1051  00b3 80            	iret
1074                     ; 434 @svlreg INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1074                     ; 435 {
1075                     	switch	.text
1076  00b4               f_USART1_RX_TIM5_CC_IRQHandler:
1078  00b4 be02          	ldw	x,c_lreg+2
1079  00b6 89            	pushw	x
1080  00b7 be00          	ldw	x,c_lreg
1081  00b9 89            	pushw	x
1084                     ; 439 }
1087  00ba 85            	popw	x
1088  00bb bf00          	ldw	c_lreg,x
1089  00bd 85            	popw	x
1090  00be bf02          	ldw	c_lreg+2,x
1091  00c0 80            	iret
1114                     ; 446 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1114                     ; 447 {
1115                     	switch	.text
1116  00c1               f_I2C1_SPI2_IRQHandler:
1120                     ; 451 }
1123  00c1 80            	iret
1151                     	xdef	f_EXTI_PORTC_IRQHandler
1152                     	switch	.bss
1153  0000               _pwm_falling:
1154  0000 0000          	ds.b	2
1155                     	xdef	_pwm_falling
1156  0002               _pwm_rising:
1157  0002 0000          	ds.b	2
1158                     	xdef	_pwm_rising
1159                     	xref	_system_time_ms
1160                     	xref	_pwm_sample_received
1161                     	xref	_pwm_width_us
1162                     	xdef	f_I2C1_SPI2_IRQHandler
1163                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1164                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1165                     	xdef	f_SPI1_IRQHandler
1166                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1167                     	xdef	f_TIM1_CC_IRQHandler
1168                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1169                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1170                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1171                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1172                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1173                     	xdef	f_ADC1_COMP_IRQHandler
1174                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1175                     	xdef	f_LCD_AES_IRQHandler
1176                     	xdef	f_EXTI7_IRQHandler
1177                     	xdef	f_EXTI6_IRQHandler
1178                     	xdef	f_EXTI5_IRQHandler
1179                     	xdef	f_EXTI4_IRQHandler
1180                     	xdef	f_EXTI3_IRQHandler
1181                     	xdef	f_EXTI2_IRQHandler
1182                     	xdef	f_EXTI1_IRQHandler
1183                     	xdef	f_EXTI0_IRQHandler
1184                     	xdef	f_EXTID_H_IRQHandler
1185                     	xdef	f_EXTIB_G_IRQHandler
1186                     	xdef	f_EXTIE_F_PVD_IRQHandler
1187                     	xdef	f_RTC_CSSLSE_IRQHandler
1188                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1189                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1190                     	xdef	f_FLASH_IRQHandler
1191                     	xdef	f_TRAP_IRQHandler
1192                     	xref	_TIM2_ClearITPendingBit
1193                     	xref	_TIM2_GetITStatus
1194                     	xref	_TIM1_ClearITPendingBit
1195                     	xref	_TIM1_GetITStatus
1196                     	xref	_TIM1_GetCapture2
1197                     	xref	_TIM1_GetCapture1
1198                     	xref.b	c_lreg
1199                     	xref.b	c_x
1200                     	xref.b	c_y
1220                     	xref	c_lgadc
1221                     	end
