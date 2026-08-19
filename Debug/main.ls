   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  55                     ; 21 main(void){
  57                     	switch	.text
  58  0000               _main:
  62                     ; 24 clk_setup();
  64  0000 cd0000        	call	_clk_setup
  66                     ; 27 gpio_setup();
  68  0003 cd0000        	call	_gpio_setup
  70                     ; 30 PWM_Input();
  72  0006 cd0000        	call	_PWM_Input
  74                     ; 33 SYSCTRL_Timer();
  76  0009 cd0000        	call	_SYSCTRL_Timer
  78                     ; 36 ADC_Setup();
  80  000c cd0000        	call	_ADC_Setup
  82                     ; 39 enableInterrupts();
  85  000f 9a            rim
  87                     ; 42 Delay_ms(3000);
  90  0010 ae0bb8        	ldw	x,#3000
  91  0013 cd0000        	call	_Delay_ms
  93                     ; 45 EEPROM_Setup();
  95  0016 cd0000        	call	_EEPROM_Setup
  97                     ; 48 Calibration_Read_EEPROM();
  99  0019 cd0000        	call	_Calibration_Read_EEPROM
 101                     ; 51 Delay_ms(500);
 103  001c ae01f4        	ldw	x,#500
 104  001f cd0000        	call	_Delay_ms
 106  0022               L12:
 107                     ; 55 	PWM_Received_Flag();
 109  0022 cd0000        	call	_PWM_Received_Flag
 111                     ; 57   while (PWM_Input_IsValid() == FALSE);
 113  0025 cd0000        	call	_PWM_Input_IsValid
 115  0028 4d            	tnz	a
 116  0029 27f7          	jreq	L12
 117                     ; 60 System_StateMachine();
 119  002b cd0000        	call	_System_StateMachine
 121  002e               L72:
 122                     ; 71 	Glow_PWM_Output();
 124  002e cd0000        	call	_Glow_PWM_Output
 127  0031 20fb          	jra	L72
 140                     	xdef	_main
 141                     	xref	_Glow_PWM_Output
 142                     	xref	_System_StateMachine
 143                     	xref	_Delay_ms
 144                     	xref	_Calibration_Read_EEPROM
 145                     	xref	_EEPROM_Setup
 146                     	xref	_SYSCTRL_Timer
 147                     	xref	_PWM_Input_IsValid
 148                     	xref	_PWM_Received_Flag
 149                     	xref	_PWM_Input
 150                     	xref	_clk_setup
 151                     	xref	_gpio_setup
 152                     	xref	_ADC_Setup
 171                     	end
