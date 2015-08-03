
int lastScore = -1000;
String readString;

// START Car stuff - JBG
/* 
Control a simple RX2-TX2 based remote control car by soldering wires to the remote control buttons.
*/

/* Connect the wires from the RC remote to the following pins */

const int fwdPin  = 2; // Forward button
const int bckPin  = 3; // Back button
const int lftPin  = 4; // Left button
const int rgtPin  = 5; // Right button

/* Each direction gets a number */
const int NEUTRAL = 0;
const int FORWARD = 1;
const int REVERSE = 2;
const int LEFT    = 3;
const int RIGHT   = 4;

/**
* Next functions below control the car. All take a time in ms as a parameter
**/
void forward( int duration ){
  gas( FORWARD );
  steer( NEUTRAL );
  delay( duration );
  stop();
}


void forward_left( int duration ){
  gas( FORWARD );
  steer( LEFT );
  delay( duration );
  stop();
}


void forward_right( int duration ){
  gas( FORWARD );
  steer( RIGHT );
  delay( duration );
  stop();
}


void back( int duration ){
  gas( REVERSE );
  steer( NEUTRAL );
  delay( duration );
  stop();
}


void back_left( int duration ){
  gas( REVERSE );
  steer( LEFT );
  delay( duration );
  stop();
}


void back_right( int duration ){
  gas( REVERSE );
  steer( RIGHT );
  delay( duration );
  stop();
}

/**
* Push the forward or back button 
* @param state (int) Direction, use direction constant
**/
void gas( int state ){
  if( state == FORWARD ){
    switchPins( fwdPin, bckPin, fwdPin );
  } else if( state == REVERSE ){
    switchPins( fwdPin, bckPin, bckPin );
  } else {
    switchPins( fwdPin, bckPin, 0 );
  }
  delay( 5 );
}

/** 
* Push the left or right button
* @param state (int) Direction to steer, use direction constant
**/
void steer( int state ){
  if( state == LEFT ){
    switchPins( lftPin, rgtPin, lftPin );
  } else if( state == RIGHT ){
    switchPins( lftPin, rgtPin, rgtPin );
  } else {
    switchPins( lftPin, rgtPin, 0 );
  }
  delay( 5 );
}

/**
* Unpress all buttons 
**/
void stop(){
  gas( NEUTRAL );
  steer( NEUTRAL );
}

/**
* We always exclusively use either forward OR back or left OR right, 
* so this function toggles one to LOW (pushes the button) while the other 
* or both (when 'which' does not match any pin) get set to an 
* INPUT (button not pressed / high impedance). 
* @param pin1 (int) First pin (use pin constant)
* @param pin2 (int) Second pin (use pin constant)
* @param which (int) If this matches pin1 or pin2 that pin (IE button) will be toggled low.
        if there is no match both pins will be inputs and no button will be pressed
*/
void switchPins( int pin1, int pin2, int which ){
  if( which == pin1 ){
    pinMode( pin1, OUTPUT );
    digitalWrite( pin1, LOW );
    pinMode( pin2, INPUT );
  } else if ( which == pin2 ) {
    pinMode( pin1, INPUT );
    pinMode( pin2, OUTPUT );
    digitalWrite( pin1, LOW );
  } else {
    pinMode( pin1, INPUT );
    pinMode( pin2, INPUT );
  }
}

// END Car Stuff - JBG

int getScore() {
  // Wait for data to arrive - JBG
  while (!Serial.available()) {} 
  // Serial read - JBG
  while (Serial.available()) {
    // Delay to allow buffer to fill - JBG
    delay(30);
    if (Serial.available() > 0) {
      //Gets one byte from serial buffer - JBG
      char c = Serial.read();
      // Makes the string in readString - JBG
      readString += c; 
    }
  }

  int delta = 0;
  if (readString.length() > 0) {
    int score = readString.toInt();

    // If it's not the first score, calculate the delta since the last score - JBG
    if(lastScore != -1000) {
      delta = score - lastScore;
    }
    lastScore = score;

    // Send the delta of the scores back to the computer - JBG
    Serial.println(delta);
    Serial.print("\n");
    Serial.flush();
  }
  delay(500);
  readString = "";
  return lastScore;
}

/* Just leave this as it is */
void setup() {
  Serial.begin(9600);
  
  pinMode( fwdPin, OUTPUT );
  pinMode( bckPin, OUTPUT );
  pinMode( lftPin, OUTPUT );
  pinMode( rgtPin, OUTPUT );

  digitalWrite( fwdPin, HIGH );
  digitalWrite( bckPin, HIGH );
  digitalWrite( lftPin, HIGH );
  digitalWrite( rgtPin, HIGH );
}

void loop() {
    /* EDIT THIS! */
    int score = getScore() * 100;

    if(score > 0) {
      forward(score);
    } else {
      back(score);
    }
    
    delay( 1000 ); 

    /* BUT STOP HERE :) */
}
