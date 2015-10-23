import processing.serial.*;

Serial ser;

int width = 320;
int height = 240;

void setup() {
  size(width, height);
  println(Serial.list());
  ser = new Serial(this, Serial.list()[5], 57600);
}

int count = 0;
Boolean process = false;

int[] packet = new int[8];

void draw() {
  background(0);
  fill(255);
  
  while (ser.available() > 0) {
    int inByte = ser.read();
    if(inByte == 63) {
      if(process) {
        int lsb = packet[4];
        int msb = packet[6];
        int combined = (msb << 8 ) | (lsb & 0xff);
        int size = combined / 100;
        //println("SIZE: " + size);
        //println(packet);
        if(size > 0) {
          textSize(size);
        }
        textAlign(CENTER, CENTER);
        text("WORD", width/2, 60);
      }
      // Okay we can start looking at packets now - JBG
      process = true;
      count = 0;
    }
    packet[count] = inByte;
    ++count;
  }  
}

