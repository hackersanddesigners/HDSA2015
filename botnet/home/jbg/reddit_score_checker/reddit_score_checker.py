import json
import serial
import syslog
import time
import urllib2

# Init Arduino - JBG
port = '/dev/tty.usbmodem1411'
ard = serial.Serial(port,9600,timeout=5)
time.sleep(2) # wait for Arduino

# Init Reddit Request - JBG
req = urllib2.Request('https://www.reddit.com/r/programming/comments/32kd3h/spend_summer_in_amsterdam_a_xdisciplinary_program/.json')
req.add_header('User-Agent', 'a bot by /u/datafatmunger')

while True:
  #with urllib.request.urlopen(req) as response:
    # Get the response - JBG
  response = urllib2.urlopen(req)
  data = response.read()
  # Turn the response into a String - JBG
  string = data.decode('utf-8');
  # Trun string in to objects - JBG
  obj = json.loads(string)
  # Read the score value - JBG
  score = obj[0]["data"]["children"][0]["data"]["score"]
  # Write the score to the arduino - JBG
  ard.write(str(score))
  # Read the arduino's reply - JBG
  msg = ard.read(ard.inWaiting())
  print ("Message from arduino: ")
  print (msg)

  time.sleep(5)

