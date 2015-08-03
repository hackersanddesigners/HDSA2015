import requests, html5lib
from lxml.cssselect import CSSSelector

hidden_url = 'http://www.hiddenurl.com'

r = requests.get(hidden_url)

doc = html5lib.parse(r.text, treebuilder='lxml', namespaceHTMLElements=False)

result_sel = CSSSelector('#geoListings .listingItem')

items = result_sel(doc)

for item in items:
    # Do some processing here
    print item.tag
