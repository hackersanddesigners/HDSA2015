from __future__ import print_function

from whoosh.index import create_in, open_dir
from whoosh.fields import *
from whoosh.analysis import StemmingAnalyzer, StopFilter
from whoosh import qparser
from whoosh.highlight import WholeFragmenter, UppercaseFormatter

from argparse import ArgumentParser
import sys, os  
from random import choice
from time import sleep


p = ArgumentParser(description="A Pipebot based on whoosh")
p.add_argument("--index", default="index", help="path of index")
p.add_argument("source", nargs="+", help="source paths of text files that are indexed by line")
args = p.parse_args()

indexdir = os.path.expanduser(args.index)

if os.path.exists(indexdir) and os.path.isdir(indexdir):
    ix = open_dir(indexdir)
else:
    # (RE)BUILD THE INDEX
    s = StopFilter()
    stop_words = set(s.stops) | set(["more", "which", "get", "did", "each", "that", "were", "about", "tell", "my", "his", "her", "after", "been", "me", "i", "wa", "you", "have", "there", "where", "what", "why", "how"])
    custom_ana = StemmingAnalyzer(stoplist = stop_words ) # | StopFilter(stoplist = stop_words)
    schema = Schema(
        text=TEXT(stored=True, analyzer=custom_ana),
        years=KEYWORD(stored=True),
        source=ID(stored=True)
    )
    os.mkdir(indexdir)
    ix = create_in(args.index, schema)
    writer = ix.writer()
    for source in args.source:
        print ("Indexing {0}".format(source).encode("utf-8"), file=sys.stderr)
        with open(source) as f:
            for line in f:
                sys.stderr.write(".")
                line = line.strip().decode("utf-8")
                if line:
                    # extract years
                    years = u" ".join(re.findall(ur"\b\d{4}\b", line))
                    writer.add_document(text=line, years=years, source=source.decode("utf-8"))
    sys.stderr.write("\n")
    writer.commit()

parser = qparser.QueryParser("text", schema=ix.schema, group=qparser.OrGroup)
with ix.searcher() as searcher:
    while True:
        line = sys.stdin.readline()
        if line == '':
            break
        line = line.rstrip().rstrip("?")
        query = parser.parse(line)
        results = searcher.search(query, terms=True)
        results.fragmenter = WholeFragmenter()
        uf = UppercaseFormatter()
        results.formatter = UppercaseFormatter()
        # could eventually use results[x].score
        if len(results) > 0:
            results = list(results)

            r = choice(results)
            # print ("Using result {0}".format(r), file=sys.stderr)
            # print (r.get("text").encode("utf-8"))
            # print (r.matched_terms())
            sleep(1)
            print (r.highlights("text").encode("utf-8"))
            # print (u", ".join(r.matched_terms()).encode("utf-8"))
        else:
            print ("")
