
void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print("Hello from arduino. ");
  Serial.flush();
  delay(60000);
}
