from whoosh.index import create_in, open_dir
from whoosh.fields import *
from whoosh.qparser import QueryParser
from whoosh.analysis import StemmingAnalyzer
from whoosh import qparser
import os
import random

stem_ana = StemmingAnalyzer()
DEFAULT_SCHEMA = Schema(
    text=TEXT(stored=True, analyzer=stem_ana),
    years=KEYWORD(stored=True),
    urls=KEYWORD(stored=True)
)

def create_index (indexdir, schema):
    ix = create_in(indexdir, schema)
    return ix

def get_or_create_index(indexdir, schema=DEFAULT_SCHEMA):
    try:
        return open_dir(indexdir)
    except OSError:
        os.mkdir(indexdir)
        return create_in(indexdir, schema)

def index_sentences (ix, f):

    writer = ix.writer()
    for line in f:
        line = line.strip().decode("utf-8")
        if line:
            # extract YEARS + URLs
            years = u" ".join(re.findall(ur"\b\d{4}\b", line))
            writer.add_document(text=line, years=years)
    writer.commit()

def index_search (ix, querytext):
    ret = []
    with ix.searcher() as searcher:
        parser = qparser.QueryParser("text", schema=ix.schema, group=qparser.OrGroup)
        # query = QueryParser("content", ix.schema).parse(querytext)
        query = parser.parse(querytext)
        for r in searcher.search(query):
            result = r.fields()
            result['_score'] = r.score
            ret.append(result)
    return ret

class ConversationCallback (object):

    def __init__ (self, index, remember_items=10):
        self.recent = list()
        self.index = index
        self.remember_items = remember_items

    def remember (self, msg):
        self.recent = self.recent[-self.remember_items:]
        self.recent.append(msg)

    def callback (self, msg):
        search_results = index_search(self.index, msg)
        while len(search_results) > 0:
            r = random.choice(search_results)
            if r not in self.recent:
                self.remember(r)
                # return u"{0} ({1})".format(r['text'], r['_score'])
                return r['text']
            else:
                search_results.remove(r)

