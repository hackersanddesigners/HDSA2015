#ifndef __PERIODMETERCONFIG_H__
#define __PERIODMETERCONFIG_H__

/** Sets maximum number of sensors that can be set using pmSetNumberOfSensors().
    Range: 1..8
*/
const uint8_t PM_MAX_SENSORS = 6;

/** Define if the measurement result passed in pmNewResult() should be float.
*/
//#define PM_FLOAT_RESULT

/** Define if you need to do something in the Timer1 overflow's interrupt
    handler. See pmTimer1OverflowHandler().
*/
//#define PM_HAVE_TIMER1_OVERFLOW_HANDLER

/** Define if you need some special procedure for selecting next sensor to be
    measured. See pmSelectNextMux().
*/
//#define PM_HAVE_MUX_SELECTOR

/** Define if Timer/Counter1 Output Compare B Match Interrupt should be enabled.
    If defined user have to define TIMER1_COMPB_vect interrupt handler.
*/
//#define PM_ENABLE_TIMER1_COMPB_INTERRUPT

#endif // __PERIODMETERCONFIG_H__

