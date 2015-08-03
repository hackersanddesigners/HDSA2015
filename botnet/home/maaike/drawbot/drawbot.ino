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
String incoming = "";   // for incoming serial data
int x;

/* Just leave this as it is */
void setup() {
  pinMode( fwdPin, OUTPUT );
  pinMode( bckPin, OUTPUT );
  pinMode( lftPin, OUTPUT );
  pinMode( rgtPin, OUTPUT );

  digitalWrite( fwdPin, HIGH );
  digitalWrite( bckPin, HIGH );
  digitalWrite( lftPin, HIGH );
  digitalWrite( rgtPin, HIGH );
  Serial.begin(9600);
}

/*
  This function gets executed over and over. So after the last command
  has executed it will start again at the top.

  You can edit the commands between the EDIT THIS & STOP HERE comments.
  Available commands are:

  forward( time );
  forward_left( time );
  forward_right( time );
  back( time );
  back_left( time );
  back_right( time );
  delay( time);

  TIPS:
  - delay means 'do nothing'.
  - 'time' should be a number in milliseconds (1000 ms = 1 second)
  - Don't forget the closing semicolon (;), without it the code won't compile!

*/
int count = 0;

void loop() {
  /* EDIT THIS! */
  delay(1000);
  //Serial.print("hi");
  if (Serial.available() > 0) {
    incoming = Serial.readStringUntil('\n');

    Serial.print("I received: ");
    Serial.print(incoming);
    if (incoming == "m") {
      forward_right( 550 );
      delay(100);
      forward_right( 550 );
      delay(100); 
      forward_right( 550 );
      delay(100); 
      forward_right( 500 );
      delay(100); 
      forward_right( 500 );
      delay(150);
    }
    if (incoming == "z") {
      forward( 100 );

      delay(150);
    }
  } else {
    count++;
    if (count % 60 == 0) {
      forward(150);
    }
  }
  /* BUT STOP HERE :) */
}

/**
* Next functions below control the car. All take a time in ms as a parameter
**/
void forward( int duration ) {
  gas( FORWARD );
  steer( NEUTRAL );
  delay( duration );
  stop();
}


void forward_left( int duration ) {
  gas( FORWARD );
  steer( LEFT );
  delay( duration );
  stop();
}


void forward_right( int duration ) {
  gas( FORWARD );
  steer( RIGHT );
  delay( duration );
  stop();
}


void back( int duration ) {
  gas( REVERSE );
  steer( NEUTRAL );
  delay( duration );
  stop();
}


void back_left( int duration ) {
  gas( REVERSE );
  steer( LEFT );
  delay( duration );
  stop();
}


void back_right( int duration ) {
  gas( REVERSE );
  steer( RIGHT );
  delay( duration );
  stop();
}

/**
* Push the forward or back button
* @param state (int) Direction, use direction constant
**/
void gas( int state ) {
  if ( state == FORWARD ) {
    switchPins( fwdPin, bckPin, fwdPin );
  } else if ( state == REVERSE ) {
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
void steer( int state ) {
  if ( state == LEFT ) {
    switchPins( lftPin, rgtPin, lftPin );
  } else if ( state == RIGHT ) {
    switchPins( lftPin, rgtPin, rgtPin );
  } else {
    switchPins( lftPin, rgtPin, 0 );
  }
  delay( 5 );
}

/**
* Unpress all buttons
**/
void stop() {
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
void switchPins( int pin1, int pin2, int which ) {
  if ( which == pin1 ) {
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
