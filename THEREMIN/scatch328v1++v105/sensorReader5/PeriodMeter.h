#ifndef __PERIODMETER_H__
#define __PERIODMETER_H__
/** 
PeriodMeter measures period of a square-wave.
    
Hardware resources:
 - ADC's multiplexer and comparator (ADC can't be used by other applications)
 - Input Capture Unit of Timer/Counter1
 - Timer/Counter1 is used partially: it's configured with I/O clock, noice canceler,
    counter must count from 0 to 0xFFFF and we use its ICU.
 - Timer/Counter1 CAPT and OVF interrupts are used with nested interrupts enabled

Registers adjusted during setup (ATmega168):
ADCSRA, ADCSRB, ACSR, ADMUX, TIFR1, TCCR1A, TCCR1B, OCR1A, OCR1B, TIMSK1

Ported to:
ATmega168
*/

#include <stdint.h>

#include "PeriodMeterConfig.h"

/** Setup
*/
void pmSetup();

void pmSetMeasurementTimeRaw(uint8_t overflows);

void pmSetMeasurementTime(uint8_t milliseconds);

void pmModifyMeasurementTimeRaw(int8_t delta);

void pmSetNumberOfSensors(uint8_t sensors);

/** Returns 0 if there are no events to process.
    Returns 1 and calls pmNewResult if a period was measured.
    Returns 2 in case of a timeout (no square wave on a pin).
 */
uint8_t pmPollResult();

#ifdef PM_FLOAT_RESULT
/** Callback that have to be defined by user to receive information on
    periods measured.
    
    @param[in] mux ADC multiplexer's pin number beginning with 0.
    @param[in] frequency The frequency of a square wave measured in Hz.
*/
void pmNewResult(uint8_t mux, float frequency);
#else
void pmNewResult(uint8_t mux, uint16_t periods, uint32_t ticks);
#endif

#ifdef PM_HAVE_TIMER1_OVERFLOW_HANDLER
/** Callback called during the Timer1 Overflow interrupt. It have
    to be processed quickly.
*/
void pmTimer1OverflowHandler();
#endif // PM_HAVE_TIMER1_OVERFLOW_HANDLER

#ifdef PM_HAVE_MUX_SELECTOR
/** Handler used to select next sensor's pin from which the singnal will be measured.
    It's called from an interrupt handler.
    
    @param[in] current Mux of the previous measurement
    @param[in] sensorCount Number of sensor set.
    @param[out] idlePeriods Number of input signal periods to wait before
        starting the measurement process. Have to be set to 1 or higher.
    @return Next mux to use. It must be less than sensorCount.
*/
uint8_t pmSelectNextMux(uint8_t current, uint8_t sensorCount, uint16_t &idlePeriods);
#endif // PM_HAVE_MUX_SELECTOR

#endif // __PERIODMETER_H__

