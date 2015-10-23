#! /usr/bin/env python
import re
from textblob import TextBlob

skipWords = [
  'To',
  'Subject',
  'From',
  'Deliver',
  'Received',
  'X',
  'Return', 
  'Content',
  'NextPart',
  'Auth',
  'MIME',
  'Date',
  'NextPart',
  'charset',
  'META',
  'Fri ',
  'spfpass',
  'MessageId',
  'href',
  'Thu',
  'dkimpass',
  'dmarcpass',
  'DKIMSignature',
  'ListUnsubscribe',
  'iso',
  'MessageID',
  'by mxgooglecom',
  'Version',
  'To',
  'Wed',
  'Tue',
  'Mon',
  'Sun',
  'Email'
]

fname = "./mbox"
with open(fname) as f:
  content = f.readlines()

cleaned_strs = []
for str in content:
  msg = re.sub('<[^<]+?>', '', str) 
  msg = re.sub('[^A-Za-z\ ]+', '', msg).lstrip().rstrip()
  
  skip = False
  for item in skipWords:
    if len(msg) == 0 or msg.find(item) != -1: 
      skip = True
    words = []
      
  if skip == False:
    cleaned_strs.append(msg)


for str in cleaned_strs:
  clean_str = ""
  for word in str.split(' '):
    if len(word) < 20:
      clean_str += word + ' '
  print clean_str   

    

#blob = TextBlob("234234 >>> <<<< asldkfjsadf This is some crazy shit. 234234 3 <>><<><><>,,,,,,,,")
#print blob.noun_phrases

