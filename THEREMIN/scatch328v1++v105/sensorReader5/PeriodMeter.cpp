// Author: Sergey Smirnov

#include <avr/interrupt.h>
#include <string.h>
#include "PeriodMeter.h"


#ifdef ADCSRB
    #define ADC_CONTROL ADCSRB
#else 
    #define ADC_CONTROL SFIOR
#endif // ADCSRB

#ifdef TIFR1
    #define TIMER1_INT_FLAGS TIFR1
#else
    #define TIMER1_INT_FLAGS TIFR
#endif // TIFR1

#ifdef TIMSK1
    #define TIMER1_INT_MASK TIMSK1
#else
    #define TIMER1_INT_MASK TIMSK
#endif // TIMSK1


enum PeriodMeterState {
    PMS_NOP,
    PMS_FIRST_FALL,
    PMS_FIRST_RISE,
    PMS_FALL,
    PMS_RISE,
    PMS_END
};

struct Interval {
    uint16_t startTime;
    uint16_t endTime;
    uint8_t overflows;
    uint8_t tempOverflows;
};

struct Result {
    Interval ups;
    Interval downs;
    uint16_t periods;
    uint8_t mux;
    PeriodMeterState state;
};

const uint8_t RISING_EDGE = 0;
const uint8_t FALLING_EDGE = 1;

Result results[2];
Result *current = results;
Result *collected = results + 1;

bool resultUpdated = false;

const uint8_t IDLE_PERIODS = 2;

uint8_t maxOverflows = 4;
uint8_t sensorCount = 1;
uint16_t idlePeriods = IDLE_PERIODS;

bool timerOverflow = false;
uint8_t timerOverflows = 0;

const float MEASUREMENT_TIME_MULT = 1. / (65536. * 1000. / (float)F_CPU);

inline void setEdge(uint8_t edge) {
    if (edge == RISING_EDGE) {
        TCCR1B |= _BV(ICES1);
    } else {
        TCCR1B &= ~_BV(ICES1);
    }
}

inline void setupNextMux(uint8_t lastMux) {
    Result *next = collected;
    memset(next, 0, sizeof(Result));
    timerOverflows = 0;
    
    uint8_t mux = lastMux;
    
    idlePeriods = IDLE_PERIODS;
    
#ifndef PM_HAVE_MUX_SELECTOR    
    ++mux;
    if (mux >= sensorCount) {
        mux = 0;
    }
#else
    mux = pmSelectNextMux(mux, sensorCount, idlePeriods);
#endif // PM_HAVE_MUX_SELECTOR

    next->mux = mux;
    collected = current;
    current = next;
    resultUpdated = true;
    
    setEdge(FALLING_EDGE);
    ADMUX = mux;
    
#ifdef PM_IDLE_DEBUG_PORT
    PM_IDLE_DEBUG_PORT |= (1 << PM_IDLE_DEBUG_PIN);
#endif // PM_IDLE_DEBUG_PORT
}

inline void swapResults() {
    Result *tmp = current;
    current = collected;
    collected = tmp;
    current->mux = collected->mux;
}

void pmSetNumberOfSensors(uint8_t sensors) {
    sensorCount = (sensors >= 1) ? ((sensors <= PM_MAX_SENSORS) ? sensors : PM_MAX_SENSORS) : 1;
}

void pmSetMeasurementTimeRaw(uint8_t overflows) {
    maxOverflows = (overflows >= 1) ? overflows : 1;
}

void pmModifyMeasurementTimeRaw(int8_t delta) {
    pmSetMeasurementTimeRaw(maxOverflows + delta);
}

void pmSetMeasurementTime(uint8_t milliseconds) {
    pmSetMeasurementTimeRaw(
        (uint8_t)(0.5f + (float)milliseconds * MEASUREMENT_TIME_MULT));
}

inline unsigned long calculateTicks(Result *result) {
    unsigned long ticks = result->ups.overflows + result->downs.overflows;
    ticks <<= 16;
    ticks -= result->ups.startTime;
    ticks += result->ups.endTime;
    ticks -= result->downs.startTime;
    ticks += result->downs.endTime;
    return ticks;
}

inline float calculateFloatResult(Result *result) {
    return (float)F_CPU * (float)(result->periods << 1) / (float)calculateTicks(result);
}

uint8_t pmPollResult() {
    if (resultUpdated) {
        resultUpdated = false;
#ifdef PM_FLOAT_RESULT
        pmNewResult(collected->mux, calculateFloatResult(collected));
#else
        pmNewResult(collected->mux, collected->periods << 1, calculateTicks(collected));
#endif // PM_FLOAT_RESULT
        return 1;
    }
    if (timerOverflows >= maxOverflows + 1) {
        timerOverflows = 0;
        timerOverflow = false;
        setupNextMux(current->mux);
        return 0;
    }
    return 0;
}

ISR(TIMER1_CAPT_vect, ISR_NOBLOCK) {
    unsigned int captTime = ICR1;
    Result *cur = current;
    
    // Input signal period should be << OVF/2
    uint8_t ovfState = 0;
    if (timerOverflow) {
        timerOverflow = false;
        ovfState = (captTime & 0x8000) ? 2 : 1; // 1 - before, 2 - after
    }
    
    if (ovfState == 1) {
        ++cur->ups.overflows;
        ++cur->downs.tempOverflows;
    }
    
    switch (cur->state) {
        case PMS_NOP:
            if (--idlePeriods <= 0) {
#ifdef PM_IDLE_DEBUG_PORT
                PM_IDLE_DEBUG_PORT &= ~(1 << PM_IDLE_DEBUG_PIN);
#endif // PM_IDLE_DEBUG_PORT
                cur->state = PMS_FIRST_FALL;
            }
            break;
        case PMS_FIRST_FALL:
            cur->downs.startTime = captTime;
            cur->downs.overflows = 0;
            cur->downs.tempOverflows = 0;
            setEdge(RISING_EDGE);
            cur->state = PMS_FIRST_RISE;
            break;
        case PMS_FIRST_RISE:
            cur->ups.startTime = captTime;
            cur->ups.overflows = 0;
            cur->periods = 0;
            setEdge(FALLING_EDGE);
            cur->state = PMS_FALL;
            break;
        case PMS_FALL:
            cur->downs.endTime = captTime;
            cur->downs.overflows = cur->downs.tempOverflows;
            setEdge(RISING_EDGE);
            cur->state = PMS_RISE;
            break;
        case PMS_RISE:
            cur->ups.endTime = captTime;
            ++cur->periods;
            
            if (cur->downs.overflows >= maxOverflows) {
                cur->state = PMS_END;
                setupNextMux(cur->mux);
            } else {
                setEdge(FALLING_EDGE);
                cur->state = PMS_FALL;
            }
            break;
        case PMS_END:
            break;
    }
    
    if (ovfState == 2) {
        ++cur->ups.overflows;
        ++cur->downs.tempOverflows;
    }
    
#ifdef PM_HAVE_TIMER1_OVERFLOW_HANDLER
    if (ovfState) {
        pmTimer1OverflowHandler();
    }
#endif // PM_HAVE_TIMER1_OVERFLOW_HANDLER
}

ISR(TIMER1_OVF_vect, ISR_NOBLOCK) {
    timerOverflow = true;
    ++timerOverflows;
}

void pmSetup() {
    // Setup comparator:
    ADCSRA &= ~0x80; // disable adc to use its multiplexer
    
    ADC_CONTROL |= _BV(ACME); // enable multiplexer input for comparator (instead of AIN1 (negative))
    
    ACSR = 0x44; // Connect analog comparator to ICU and use internal bandgap reference voltage
    ADMUX = 0x00; // select input in multiplexer, need only first three bits
    
    TIMER1_INT_FLAGS &= ~_BV(ICF1); // unset Input Capture Flag (cancel a possible pending interrupt)
    
    // Setup Time/Counter1 for Fast PWM at OC1B
    TCCR1A = _BV(WGM10) | _BV(WGM11) | _BV(COM1B1); // Fast PWM (TOP=OCR1A) + PWM output at OC1B (set on BOTTOM, clear on match with OCR1A)
    TCCR1B = _BV(CS10) | _BV(WGM12) | _BV(WGM13) | _BV(ICNC1); // Noise canceler + ICE=FALLING_EDGE + Fast PWM + I/O Clock
    setEdge(FALLING_EDGE);
    
    OCR1A = 0xFFFF; // TOP value for counter
    OCR1B = 0x7FFF; // for compare match
    
    TIMER1_INT_MASK = _BV(TOIE1) | _BV(ICIE1);// enable input capture + overflow + compare B match interrupts
    
#ifdef PM_ENABLE_TIMER1_COMPB_INTERRUPT
    TIMER1_INT_MASK |= OCIE1B;
#endif // PM_ENABLE_TIMER1_COMPB_INTERRUPT
}

