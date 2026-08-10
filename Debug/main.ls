   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  55                     ; 20 main(void){
  57                     	switch	.text
  58  0000               _main:
  62                     ; 23 clk_setup();
  64  0000 cd0000        	call	_clk_setup
  66                     ; 26 gpio_setup();
  68  0003 cd0000        	call	_gpio_setup
  70                     ; 29 PWM_Input();
  72  0006 cd0000        	call	_PWM_Input
  74                     ; 32 SYSCTRL_Timer();
  76  0009 cd0000        	call	_SYSCTRL_Timer
  78                     ; 35 ADC_Setup();
  80  000c cd0000        	call	_ADC_Setup
  82                     ; 38 enableInterrupts();
  85  000f 9a            rim
  87                     ; 41 EEPROM_Setup();
  90  0010 cd0000        	call	_EEPROM_Setup
  92                     ; 44 Calibration_Read_EEPROM();
  94  0013 cd0000        	call	_Calibration_Read_EEPROM
  96                     ; 47 Delay_ms(500);
  98  0016 ae01f4        	ldw	x,#500
  99  0019 cd0000        	call	_Delay_ms
 101  001c               L12:
 102                     ; 51 	PWM_Received_Flag();
 104  001c cd0000        	call	_PWM_Received_Flag
 106                     ; 53   while (PWM_Input_IsValid() == FALSE);
 108  001f cd0000        	call	_PWM_Input_IsValid
 110  0022 4d            	tnz	a
 111  0023 27f7          	jreq	L12
 112                     ; 56 System_StateMachine();
 114  0025 cd0000        	call	_System_StateMachine
 116  0028               L72:
 117                     ; 61 	ADC_current_Calc();
 119  0028 cd0000        	call	_ADC_current_Calc
 122  002b 20fb          	jra	L72
 135                     	xdef	_main
 136                     	xref	_System_StateMachine
 137                     	xref	_Delay_ms
 138                     	xref	_Calibration_Read_EEPROM
 139                     	xref	_EEPROM_Setup
 140                     	xref	_SYSCTRL_Timer
 141                     	xref	_PWM_Input_IsValid
 142                     	xref	_PWM_Received_Flag
 143                     	xref	_PWM_Input
 144                     	xref	_clk_setup
 145                     	xref	_gpio_setup
 146                     	xref	_ADC_current_Calc
 147                     	xref	_ADC_Setup
 166                     	end
