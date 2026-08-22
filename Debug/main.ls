   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  57                     ; 21 main(void){
  59                     	switch	.text
  60  0000               _main:
  64                     ; 24 clk_setup();
  66  0000 cd0000        	call	_clk_setup
  68                     ; 27 gpio_setup();
  70  0003 cd0000        	call	_gpio_setup
  72                     ; 30 PWM_Input();
  74  0006 cd0000        	call	_PWM_Input
  76                     ; 33 SYSCTRL_Timer();
  78  0009 cd0000        	call	_SYSCTRL_Timer
  80                     ; 36 PWM_Output_Timer();
  82  000c cd0000        	call	_PWM_Output_Timer
  84                     ; 39 PWM_Output_Control();
  86  000f cd0000        	call	_PWM_Output_Control
  88                     ; 42 ADC_Setup();
  90  0012 cd0000        	call	_ADC_Setup
  92                     ; 45 enableInterrupts();
  95  0015 9a            rim
  97                     ; 48 Delay_ms(3000);
 100  0016 ae0bb8        	ldw	x,#3000
 101  0019 cd0000        	call	_Delay_ms
 103                     ; 51 EEPROM_Setup();
 105  001c cd0000        	call	_EEPROM_Setup
 107                     ; 54 Calibration_Read_EEPROM();
 109  001f cd0000        	call	_Calibration_Read_EEPROM
 111                     ; 57 Delay_ms(500);
 113  0022 ae01f4        	ldw	x,#500
 114  0025 cd0000        	call	_Delay_ms
 116  0028               L12:
 117                     ; 61 	PWM_Received_Flag();
 119  0028 cd0000        	call	_PWM_Received_Flag
 121                     ; 63   while (PWM_Input_IsValid() == FALSE);
 123  002b cd0000        	call	_PWM_Input_IsValid
 125  002e 4d            	tnz	a
 126  002f 27f7          	jreq	L12
 127                     ; 66 System_StateMachine();
 129  0031 cd0000        	call	_System_StateMachine
 131  0034               L72:
 132                     ; 77 	Glow_PWM_Output();
 134  0034 cd0000        	call	_Glow_PWM_Output
 137  0037 20fb          	jra	L72
 150                     	xdef	_main
 151                     	xref	_Glow_PWM_Output
 152                     	xref	_System_StateMachine
 153                     	xref	_Delay_ms
 154                     	xref	_Calibration_Read_EEPROM
 155                     	xref	_EEPROM_Setup
 156                     	xref	_PWM_Output_Control
 157                     	xref	_SYSCTRL_Timer
 158                     	xref	_PWM_Output_Timer
 159                     	xref	_PWM_Input_IsValid
 160                     	xref	_PWM_Received_Flag
 161                     	xref	_PWM_Input
 162                     	xref	_clk_setup
 163                     	xref	_gpio_setup
 164                     	xref	_ADC_Setup
 183                     	end
