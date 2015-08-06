import serial
import syslog
import time

# Init Arduino - JBG
port = '/dev/tty.usbmodem1411'
ard = serial.Serial(port,9600,timeout=5)
time.sleep(2) # wait for Arduino

while True:
  # Read the arduino's reply - JBG
  msg = ard.readline();
  print "Message from arduino: "
  print (msg)
  time.sleep(5)

