// Author: Sergey Smirnov

#include "PeriodMeter.h"

#include "WProgram.h"
void setup();
inline void printWord(unsigned int word);
inline void printResultCod(uint8_t mux, uint16_t periods, uint32_t ticks);
inline void printResultText(uint8_t mux, uint16_t periods, uint32_t ticks);
void pmNewResult(uint8_t mux, uint16_t periods, uint32_t ticks);
void loop ();
void setup() {
  Serial.begin(57600);
  pmSetup();
  pmSetMeasurementTimeRaw(8);
  pmSetNumberOfSensors(1);
}

inline void printWord(unsigned int word) {
    Serial.print((word >> 0) & 0x7F, BYTE);
    Serial.print((word >> 7) & 0x7F, BYTE);
}

inline void printResultCod(uint8_t mux, uint16_t periods, uint32_t ticks) {
  if (mux == 0xFF) {
    Serial.print(0x80, BYTE);
    return;
  }
  
  Serial.print(mux & 0x7F, BYTE);
  printWord(periods);
  
  printWord(ticks);
  printWord(ticks >> 14);
  
  Serial.print(0x80, BYTE);
}

inline void printResultText(uint8_t mux, uint16_t periods, uint32_t ticks) {
  if (mux == 0xFF) {
    Serial.println("");
    return;
  }
  
  Serial.print((int)mux);
  Serial.print(' ');
  Serial.print(periods);
  Serial.print(' ');
  Serial.println(ticks);
}

//#define printResult printResultCod
#define printResult printResultText

void pmNewResult(uint8_t mux, uint16_t periods, uint32_t ticks) {
  printResult(mux, periods, ticks);
}

void loop () {
  uint8_t status = pmPollResult();
  if (status) {
    if (status == 2) {
      printResult(0xFF, 0, 0);
    }
  }
  if (Serial.available() >= 3) {
    if (0xFF == Serial.read()) {
      uint8_t maxOverflows = Serial.read();
      uint8_t sensorCount = Serial.read();
      pmSetMeasurementTimeRaw(maxOverflows);
      pmSetNumberOfSensors(sensorCount);
    }
  }
}


int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

