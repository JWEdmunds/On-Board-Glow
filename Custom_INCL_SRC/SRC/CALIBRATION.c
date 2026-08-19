/*CALIBRATION.C
*
*John W Edmunds
*
*/

//Location for functions and variables that determine PWM output and by extension GLOW drive
//This is probably the busiest of the sources as the calibration routine has a lot of hoops to go through
//too ensure that it doesnt get bricked.

//Includes
#include "stm8l15x_flash.h"
#include "calibration.h"
#include "system_control.h"
#include "pwm_input.h"

//Defines


//Declarations

static uint16_t samples[100];
static uint16_t EEPROM_Read_U16(uint32_t address);

static uint16_t pwm_difference;
static uint16_t previous_pwm;
static uint16_t current_pwm;
static uint8_t stable_count;

//Variables
volatile uint16_t magic = 0;
volatile uint16_t stick_high_position = 0;
volatile uint16_t stick_low_position = 0;
volatile uint16_t pwm_upper_limit = 0;
volatile uint16_t pwm_lower_limit = 0;
volatile uint16_t glow_on = 0;
volatile uint16_t glow_off = 0;
volatile uint8_t throttle_inverted = 0;

static uint32_t sample_sum = 0;
static uint32_t valid_sum = 0;
static uint16_t sample_average = 0;
static uint16_t calibrated_position = 0;
static uint8_t valid_sample_count = 0;

//Struct

//Calibration save structure
typedef struct{
  //Magic number used to see if data is stored. 
  uint16_t magic;
  //PWM value in stick high postion
  uint16_t stick_high_position;
  //PWM value in stick low position
  uint16_t stick_low_position;
  //PWM upper limit
  uint16_t pwm_upper_limit;
  //PWM lower limit
  uint16_t pwm_lower_limit;  
  //Lower throttle limit of transmitter
  uint16_t glow_on;
  //Upper throttle limit of transmitter
  uint16_t glow_off;
  //Boolean indicating the PWM input orientation. Required as some transmitter have inverted signals
  uint8_t throttle_inverted;
}
Calibration_Data_TypeDef;

//Functions

//Basic Flash setup for the MCU
void EEPROM_Setup(void){
  //De-init all FLASH registers to default values
  FLASH_DeInit();
  //Set the programming time, this dows not rquire unlocking the EEPROM
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
}

//8 Bit write with a basic readback test.
static bool EEPROM_Write_U8(uint32_t address, uint8_t value){
  //Function to write 8 bit value to EEPROM
  //Create nickname :)
  FLASH_Status_TypeDef status;
  //Program the byte into specified address
  FLASH_ProgramByte(address, value);
  //Make sure the operation is complete
  status = FLASH_WaitForLastOperation(FLASH_MemType_Data);
  //Return True or False
  //return (status == FLASH_Status_Successful_Operation);
  //AI broke this in the first instance trying to improve things :D took ages to work out. Had to go back forward a few times till the broken bit became apparent.
	if ((uint8_t)status != (uint8_t)FLASH_FLAG_HVOFF)
	{
		return FALSE;
	}

    if (FLASH_ReadByte(address) != value)
    {
        return FALSE;
    }

    return TRUE;
}

bool EEPROM_Write_U16(uint32_t address, uint16_t value){
  //Function to split the 16 bit integer into two 8 bit integers and write them into the EEPROM
  //Create 2 integers to store the upper and lower bytes
  uint8_t low_byte;
  uint8_t high_byte;
  //Split 16 bit value into two 8 bits
  low_byte = (uint8_t)(value & 0x00FFU);
  high_byte = (uint8_t)((value >> 8) & 0x00FFU);
  //Write each byte and return false if they fail to write
  if (!EEPROM_Write_U8(address, low_byte)){
	return FALSE;
  }
  if (!EEPROM_Write_U8(address + 1U, high_byte)){
	return FALSE;
  }
  return TRUE;
}

//Long arse function. Opens the EEPROM, writes each value in turn and then locks the EEPROM.
bool Calibration_Write_EEPROM(void){
  //Boolean declaration
    bool result = TRUE;

	  //Unlock EEPROM
	  FLASH_Unlock(FLASH_MemType_Data);

	//AI Stuff
    /* Mark calibration invalid while it is being updated */
    if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, 0x0000U))
    {
        result = FALSE;
    }
    //Write calibration values in turn
    else if (!EEPROM_Write_U16(EEPROM_STICK_HIGH_ADDRESS, stick_high_position))
	  {
		  result = FALSE;
	  }
    else if (!EEPROM_Write_U16(EEPROM_STICK_LOW_ADDRESS, stick_low_position))
	  {
		  result = FALSE;
	  }
    else if (!EEPROM_Write_U16(EEPROM_PWM_UPPER_ADDRESS, pwm_upper_limit))
	  {
		  result = FALSE;
	  }
    else if (!EEPROM_Write_U16(EEPROM_PWM_LOWER_ADDRESS, pwm_lower_limit))
	  {
		  result = FALSE;
	  }
    else if (!EEPROM_Write_U16(EEPROM_GLOW_ON_ADDRESS, glow_on))
	  {
		  result = FALSE;
	  }
    else if (!EEPROM_Write_U16(EEPROM_GLOW_OFF_ADDRESS, glow_off))
	  {
		  result = FALSE;
	  }
    else if (!EEPROM_Write_U8(EEPROM_INVERTED_ADDRESS, throttle_inverted))
	  {
		  result = FALSE;
	  }
    //Only mark calibration valid when everything else has written correctly
    if (result == TRUE)
    {
        if (!EEPROM_Write_U16(EEPROM_MAGIC_ADDRESS, CALIBRATION_MAGIC_VALUE)){
		  result = FALSE;
        }
		else{
		  magic = CALIBRATION_MAGIC_VALUE;
		}
    }

    //Lock EEPROM
    FLASH_Lock(FLASH_MemType_Data);

    return result;
}

//Simple read function for the 16 bit value
static uint16_t EEPROM_Read_U16(uint32_t address){
  //Function to read and combine 2 8 bit values from 2 memory locations
  //Create 2 integers to store the upper and lower bytes
  uint16_t low_byte;
  uint16_t high_byte;
  //Read the bytes from EEPROM
  low_byte = (uint16_t)FLASH_ReadByte(address);
  high_byte = (uint16_t)FLASH_ReadByte(address + 1u);
  //Or the values together
  return (uint16_t)(low_byte | (high_byte << 8));
}

//AI only code-----------------
bool Calibration_Values_Valid(void)
{
    uint16_t calibration_span;

    /* Calculate stick travel regardless of channel direction */
    if (stick_high_position >= stick_low_position)
    {
        calibration_span = stick_high_position - stick_low_position;
    }
    else
    {
        calibration_span = stick_low_position - stick_high_position;
    }

    /* High and low positions must be sufficiently different */
    if (calibration_span < CALIBRATION_MIN_STICK_SPAN)
    {
        return FALSE;
    }

    return TRUE;
}
//AI only Code-----------------

void Calibration_Read_EEPROM(void){
  //Read each value into RAM
  //*** Do not run this function inside an interrupt ***
  //Read Magic Value
  magic = EEPROM_Read_U16(EEPROM_MAGIC_ADDRESS);
  //Read stick high value
  stick_high_position = EEPROM_Read_U16(EEPROM_STICK_HIGH_ADDRESS);
  //Read stick low value
  stick_low_position = EEPROM_Read_U16(EEPROM_STICK_LOW_ADDRESS);
  //Read PWM upper limit
  pwm_upper_limit = EEPROM_Read_U16(EEPROM_PWM_UPPER_ADDRESS);
  //Read PWM lower limit
  pwm_lower_limit = EEPROM_Read_U16(EEPROM_PWM_LOWER_ADDRESS);  
  //Read Throttle low position
  glow_on = EEPROM_Read_U16(EEPROM_GLOW_ON_ADDRESS);
  //Read Throttle high position
  glow_off = EEPROM_Read_U16(EEPROM_GLOW_OFF_ADDRESS);
  //Read Throttle inverted bit
  throttle_inverted = FLASH_ReadByte(EEPROM_INVERTED_ADDRESS);
}

void Calibration_Averaging(void){
  //This function is agnostic and will be called by more than 1 function
  //Simple averaging filter to remove any bollocks samples
  int l = 0;
  //Reset variables before use
  sample_sum = 0;
  valid_sum = 0;
  sample_average = 0;
  calibrated_position = 0;
  valid_sample_count = 0;
  //Loopy loop adding the samples together to create an average
  for (l = 0; l < 100; ++l){
	//Add samples together
	sample_sum += samples[l];
  }
  //Divide the total by the number of samples
  sample_average = sample_sum / 100U;
  //Second loop to reject spurious readings
  for (l = 0; l < 100; ++l){
	//Simple calculation to determine if samples are in boundary
	if ((samples[l] >= (sample_average - 20U)) && (samples[l] <= (sample_average + 20U))){
	//Add values of samples that fit within the boundaries of sample averages +-20U
	valid_sum += samples[l];
	//Increment valid sample count
	++valid_sample_count;
	}
  }
	if (valid_sample_count > 0U){
	  calibrated_position = (uint16_t)(valid_sum / valid_sample_count);
	  }
	  //Why not have an else for fun :D
	  else{
	  //It gone wrong.. have to think about this later
	  }	
  
}

uint16_t Calibrate_Stick_Position(void){
  int k = 0;
  //Reset all values before use
  stable_count = 0;
  pwm_difference = 0;
  previous_pwm = PWM_Input_GetWidth();
  current_pwm = PWM_Input_GetWidth();
  //Check PWM stability to exclude the stick movement
  while (stable_count < 20u){
	//Delay to allow stick movement
	Delay_ms(20);
	//Record current PWM value
	current_pwm = PWM_Input_GetWidth();;
	//Check to see if current PWM is greater than the previous sample (default 0 so will always be)
	  if (current_pwm > previous_pwm){
	  //Simple maths to determine difference
		pwm_difference = current_pwm - previous_pwm;
	  }
	  else{
	  //Simple maths to determine difference in the opposite direction
		pwm_difference = previous_pwm - current_pwm;
	  }
	  //Confirm difference is within limits. If stable, increment the stability counter
	  if (pwm_difference <= 5u){
		++stable_count;
	  }
	  //Or not :)
	  else{
		stable_count = 0;
	  }
	previous_pwm = current_pwm;
  }
  //Loops through the reading of the PWM value 100 times. Required to discard any PWM values outside the mean value recorded.
	for (k = 0; k < 100; ++k){
	  //write the first PWM value into the array,
	  samples[k] = PWM_Input_GetWidth();
	  //Delay to allow moving of stick
	  Delay_ms(50);
	}
	//Run the averaging on the data stored in the samples array
  Calibration_Averaging();
  //Return the calue
  return calibrated_position;
}

void Calibrate_Stick_Limits(void){
  int i = 0;
  //Call function for upper stick position
  stick_high_position = Calibrate_Stick_Position();
	//Flashy Flashy *3
	ledFlash(3, 500);
	  //Added delay to allow stick to be moved to correct position. Causes erratic pick up if done within the sampling loop.
	  Delay_ms(2000);
		//Call function for lower stick position
		stick_low_position = Calibrate_Stick_Position();
		  //Flashy Flashy *4
		  ledFlash(4, 500);
			//Added delay to allow stick to be moved to correct position. Causes erratic pick up if done within the sampling loop.
			Delay_ms(2000);
}

void Calibrate_Glow_Limits(void){
  //Move stick to the off position first. This will typically be about 30% of throw
  int i = 0;
  //Call function for upper stick position
  glow_off = Calibrate_Stick_Position();
  //Flashy Flashy *5
	ledFlash(5, 500);
	  //Added delay to allow stick to be moved to correct position. Causes erratic pick up if done within the sampling loop.
	  Delay_ms(2000);	
		//Move stick to on position. This will be the lower position. Extending the trim below this value will switch off
		//this is so that throttle cut will kill the engine.
		glow_on = Calibrate_Stick_Position();
		//Flashy Flashy *6
		  ledFlash(6, 500);
}

//AI CODE------------ I was tired
bool Calibration_Data_VALID(void)
{
	//Check Magic number
    if (magic != CALIBRATION_MAGIC_VALUE)
    {
        return FALSE;
    }
	//Check values are not stupid
	if (Calibration_Values_Valid() == FALSE)
	{
		return FALSE;
	}
	//Check PWM limits are not stupid
    if (pwm_lower_limit >= pwm_upper_limit)
    {
        return FALSE;
    }

    return TRUE;
}

bool Recalibration_High_Position_Detect(void)
{
    uint16_t stick_span;
    uint16_t recal_threshold;

    if (stick_high_position >= stick_low_position)
    {
        //Normal direction
        stick_span = stick_high_position - stick_low_position;

        recal_threshold =
            stick_low_position + ((stick_span * 3U) / 4U);

        return (pwm_width_us >= recal_threshold);
    }
    else
    {
        //Inverted direction
        stick_span = stick_low_position - stick_high_position;

        recal_threshold =
            stick_low_position - ((stick_span * 3U) / 4U);

        return (pwm_width_us <= recal_threshold);
    }
}
//AI Code---------------







void Calibration_Sequence_Main(void){
  //This function allows you to calibrate the upper and lower limits of the available PWM in addition too
  //the on and off positions of the glow driver.
  //The inverion bit is a by-product of the PWM upper and lower limits when referenced to stick position
  //Magic number is written only on valid calibration
  //This sequence will be written in the destructions.
  //This sequence makes HEAVY use of the LED flashing. I have written a 500ms flasher that is specific to this function
  int i = 0;
  //While loop created to allow immediate recalibartion if data not valid. Found this out the hard way.
  while(1){
	//Flash LED 10 Times to indicate programming mod. No other function will use this length of flashing (I would rather leave 10 flashes than cut short)  
	ledFlash(10, 500);
	//Function records PWM value relative to upper and lower position of sticks
	Calibrate_Stick_Limits();
	//Calibrate_Glow_Position. This is kept seperate from stick limits for reasons lof legibility
	Calibrate_Glow_Limits();
	//Sort the PWM limits and inverted bit
	if (stick_high_position > stick_low_position){
		  pwm_upper_limit = stick_high_position;
		  pwm_lower_limit = stick_low_position;
		  throttle_inverted = FALSE;
	  }
	  else{
		  pwm_upper_limit = stick_low_position;
		  pwm_lower_limit = stick_high_position;
		  throttle_inverted = TRUE;
	  }
/*	//Check values are outside the check value to prevent writing of bullshit values; (Did this during design.. fecked things up royally)
	if (Calibration_Values_Valid() == TRUE)
	  {
		//Write the sodding EEPROM, FINALLY :D
		Calibration_Write_EEPROM();
		//Slight delay to seperate flashes
		Delay_ms(1000);
		//Calibration complete LED flash
		ledFlash(10, 500);
		//Break out of the loop
		break;
	  }
	else
	  {
		//Furiously flash LED 
		ledFlash(20, 50);
		//Go back to start of loooooop. Allows user to drop right into the recalibration routine instead of having to use the recalibration state.
		//continue;
		*/
		
		//Check calibration values are sensible
	if (Calibration_Values_Valid() == TRUE)
	{
	  //Calibration is good - attempt EEPROM write
	  if (Calibration_Write_EEPROM() == TRUE)
	  {
		  Delay_ms(1000);
		  ledFlash(10, 500);
	
		  //Calibration complete
		  break;
	  }
    else
	  {
        //EEPROM write failed
        ledFlash(20, 50);

        //Start calibration again
        continue;
	  }
	}
  else
	{
    //Calibration values were rubbish
    ledFlash(20, 50);

    //Start calibration again
    continue;
		
	}
  }
}