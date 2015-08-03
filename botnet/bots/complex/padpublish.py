from __future__ import print_function
import json, re, os
from urllib2 import urlopen
from urllib import urlencode
from pprint import pprint
from urlparse import urljoin
import sys, argparse
import html5lib
from xml.etree import ElementTree as ET
import urllib2


urlopener = urllib2.build_opener()
urlopener.addheaders = [('User-agent', ' Mozilla/5.0 (X11; Linux i686; rv:30.0) Gecko/20100101 Firefox/30.0')]


def listAllPads (apiURL, apikey):
	data = {'apikey': apikey}
	resp = json.load(urlopen(apiURL+'listAllPads?'+urlencode(data)))
	return resp['data']['padIDs']

def getPadText (padID, apiURL, apikey):
	data = {'apikey': apikey, 'padID': padID}
	resp = json.load(urlopen(apiURL+'getText?'+urlencode(data)))
	return resp['data']['text']

def getPadHTML (padID, apiURL, apikey):
	data = {'apikey': apikey, 'padID': padID}
	resp = json.load(urlopen(apiURL+'getHTML?'+urlencode(data)))
	return resp['data']['html']

def pad_id_to_filename (n):
	return n+".html"

def name_to_link(n):
	return n.replace(" ", "_")+".html"

def name_to_pad_id (n):
	return n.replace(" ", "_")

def iterparent_enum(tree):
    for parent in tree.getiterator():
        for i, child in enumerate(parent):
            yield parent, child, i

def linkify (t, linkify=name_to_link):
	""" returns list of created a elements """
	linkpat = re.compile(r"\[\[(.*?)\]\]")
	ret = []
	for parent, elt, index in iterparent_enum(t):
		def sub(m):
			# print("MATCH {0} in {1}/{2}({3})".format(m.group(1), parent.tag, elt.tag, index), file=sys.stderr)
			a = ET.SubElement(append_elt, "a")
			if append_index != None:
				# print("SHIFT", file=sys.stderr)
				parent.remove(a)
				parent.insert(append_index+1, a)
			name = m.group(1)
			print(u"  LINK: {0}".format(name).encode("utf-8"), file=sys.stderr)
			a.text = m.group(1)
			a.set("href", linkify(name))
			# parent.append(a)
			ret.append(a)
			return u""

		if elt.text != None:
			append_elt = elt
			append_index = None
			elt.text = linkpat.sub(sub, elt.text)
		if elt.tail != None:
			append_elt = parent
			append_index = index
			elt.tail = linkpat.sub(sub, elt.tail)

	return ret


def image_previews (t, baseURL):
	for parent, elt, index in iterparent_enum(t):
		if elt.tag == "a":
			if "wikilink" in elt.get("class", ""):
				continue
			href = urljoin(baseURL, elt.get("href"))
			f = urlopener.open(href)
			ct = f.info().get("content-type", "")
			if ct.startswith("image/"):
				print("  IMAGE:", ct, file=sys.stderr)
				img = ET.SubElement(elt, "img")
				img.set("src", href)
				img.set("title", elt.text)
				elt.text = ""


def publish (apiurl, apikey, start_pad_id, css_pad_id=None, pages="./pages"):

	# load all pad ids for use in marking red links (and knowing what links not to follow)
	all_padIDs = set(listAllPads(apiurl, apikey))

	todo = []
	todo.append(start_pad_id)
	done = set()

 	# Dump Site styles
	css = []
	if css_pad_id and css_pad_id in all_padIDs:
		src = getPadText(css_pad_id, apiurl, apikey)
		fpath = os.path.join(pages, css_pad_id)
		with open(fpath, "wb") as fout:
			fout.write(src.encode("utf-8"))
			css.append(css_pad_id)

	while todo:
		padID = todo[0]
		todo = todo[1:]

		print (u"PROCESSING PAD: {0}".format(padID).encode("utf-8"), file=sys.stderr)
		done.add(padID)
		fname = os.path.join(pages, pad_id_to_filename(padID))
		src = getPadText(padID, apiurl, apikey)
		html = getPadHTML(padID, apiurl, apikey)
		# print("SOURCE HTML", html, file=sys.stderr)
		t = html5lib.parse(html, treebuilder="etree", namespaceHTMLElements=False)

		# META charset = utf-8
		meta = ET.SubElement(t.find("head"), "meta")
		meta.set("charset", "utf-8")

		# CSS
		# styles = [elt.get("href") for elt in t.findall("head/link[@rel='stylesheet']")]
		for c in css:
			link = ET.SubElement(t.find("head"), "link")
			link.set("rel", "stylesheet")
			link.set("href", c)

		# LINKIFY [[10 things to do with IRC]] ==> REPLACE WITH LINK, PUSH PAGE
		for a in linkify(t):
			pad_id = name_to_pad_id(a.text)
			if pad_id in all_padIDs:
				if not((pad_id in done) or (pad_id in todo)):
					todo.append(pad_id)
				a.set("class", "wikilink")
			else:
				a.set("class", "wikilink redlink")

		# IMAGES <a href="foo.jpg">foo.jpg</a> => IMAGE
		image_previews(t, apiurl)

		with open(os.path.join(pages, padID+".text"), "wb") as fout:
			print (src.encode("utf-8"), file=fout)
		with open(fname, "wb") as fout:
			print (ET.tostring(t, method="html").encode("utf-8"), file=fout)

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument('padURL', help='the URL of the etherpad server')
	parser.add_argument('padID', help='the name of the pad you want to start from')
	parser.add_argument('--html', action="store_true", help='export HTML')
	parser.add_argument('--pad-port', default="9001", help='port of pad server')
	parser.add_argument('--api-key', default="APIKEY.txt", help='file with API key to use')
	parser.add_argument('--api-version', default="1.2.9", help='the version of the etherpad api')
	parser.add_argument('--api-url', default="/api/", help='URL path to the API')
	parser.add_argument('--css', default="Common.css", help='pad ID for stylesheet (default Common.css)')
	parser.add_argument('--pages', default="./pages", help='path for output pages (default ./pages)')
	args = parser.parse_args()

	apikey = open(args.api_key).read()
	padurl = args.padURL
	if not padurl.startswith("http"):
		padurl = "http://" + padurl
	if args.pad_port:
		padurl += ":{0}".format(args.pad_port)
	if args.api_url.startswith("http"):
		apiurl = args.api_url
	else:
		apiurl = "{0}{1}{2}/".format(padurl, args.api_url, args.api_version)
	start_pad_id = name_to_pad_id(args.padID)
	publish(apiurl, apikey, start_pad_id, args.css, pages=args.pages)
