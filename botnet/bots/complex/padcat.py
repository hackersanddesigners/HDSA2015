import json
from urllib2 import urlopen
from urllib import urlencode
from pprint import pprint
import sys, argparse

parser = argparse.ArgumentParser()
parser.add_argument('padURL', help='the URL of the etherpad server')
parser.add_argument('padID', help='the name of the pad you want to pull')
parser.add_argument('--html', action="store_true", help='export HTML')
parser.add_argument('--pad-port', default="9001", help='port of pad server')
parser.add_argument('--api-key', default="APIKEY.txt", help='file with API key to use')
parser.add_argument('--api-version', default="1.2.9", help='the version of the etherpad api')
parser.add_argument('--api-url', default="/api/", help='URL path to the API')
args = parser.parse_args()

# print args
# sys.exit()

key = open(args.api_key).read()
url = args.padURL
if not url.startswith("http"):
	url = "http://" + url
if args.pad_port:
	url += ":{0}".format(args.pad_port)
url = "{0}{1}{2}/".format(url, args.api_url, args.api_version)
d = {
	'apikey': key,
	'padID': args.padID
}

if args.html:
	fn = "getHTML"
	key = "html"
else:
	fn = "getText"
	key = "text"

data = json.load(urlopen(url+fn+"?"+urlencode(d)))

# pprint(data)
text = data['data'].get(key)
print text


