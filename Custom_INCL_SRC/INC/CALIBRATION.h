/* CALIBRATION.H
 *
 * John W Edmunds
 */

// New version made in ChatGPT as the old calibration.h kept causing errors on save.. couldnt find the fault
#ifndef CALIBRATION_H
#define CALIBRATION_H

/* Includes */
#include "stm8l15x.h"

/* Calibration magic value */
#define CALIBRATION_MAGIC_VALUE       ((uint16_t)0xB00B)

/* EEPROM base address */
#define EEPROM_CAL_BASE_ADDRESS       ((uint32_t)0x00001000)

/* EEPROM locations */
#define EEPROM_MAGIC_ADDRESS          (EEPROM_CAL_BASE_ADDRESS + 0U)
#define EEPROM_STICK_HIGH_ADDRESS     (EEPROM_CAL_BASE_ADDRESS + 2U)
#define EEPROM_STICK_LOW_ADDRESS      (EEPROM_CAL_BASE_ADDRESS + 4U)
#define EEPROM_PWM_UPPER_ADDRESS      (EEPROM_CAL_BASE_ADDRESS + 6U)
#define EEPROM_PWM_LOWER_ADDRESS      (EEPROM_CAL_BASE_ADDRESS + 8U)
#define EEPROM_GLOW_ON_ADDRESS        (EEPROM_CAL_BASE_ADDRESS + 10U)
#define EEPROM_GLOW_OFF_ADDRESS       (EEPROM_CAL_BASE_ADDRESS + 12U)
#define EEPROM_INVERTED_ADDRESS       (EEPROM_CAL_BASE_ADDRESS + 14U)

/* Variables owned by calibration.c */
extern volatile uint16_t stick_high_position;
extern volatile uint16_t stick_low_position;
extern volatile uint16_t pwm_upper_limit;
extern volatile uint16_t pwm_lower_limit;
extern volatile uint16_t glow_on;
extern volatile uint16_t glow_off;
extern volatile uint16_t magic;
extern volatile uint8_t throttle_inverted;

/* Function declarations */
void EEPROM_Setup(void);

void Calibration_Read_EEPROM(void);
bool Calibration_Write_EEPROM(void);
bool Calibration_Data_VALID(void);

void Calibration_Sequence_Main(void);
void Calibration_Averaging(void);

void Calibrate_Stick_Limits(void);
void Calibrate_Glow_Limits(void);
uint16_t Calibrate_Stick_Position(void);

bool EEPROM_Write_U16(uint32_t address, uint16_t value);

#endif /* CALIBRATION_H */