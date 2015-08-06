The Human/Machine Recipe Collaboration
======================================

    import re
    import operator

    verbMap = {}
    adjMap = {}
    otherMap = {}

    o = store.find(Recipe, Recipe.name.like(u'%onions%'))
    for r in o:
        for i in r.ingredients:
            #print i.name
            l = i.name.split()
            for j in l:
                s = re.sub('[^A-Za-z]+', '', j)
                if s.endswith('ly'):
                    if s in adjMap:
                        adjMap[s] += 1
                    else:
                        adjMap[s] = 1
                elif s.endswith('ed') or s.endswith('ing'):
                    if s in verbMap:
                        verbMap[s] += 1
                    else:
                        verbMap[s] = 1
                else:
                    if s in ingMap:
                        ingMap[s] += 1
                    else:
                        ingMap[s] = 1
                 
                  
    #for key, value in ingMap.iteritems():
    #    print key, value
        
    sortedAdj = sorted(adjMap.keys(), key=lambda key: adjMap[key], reverse=True)
    for ing in sortedAdj:
      print ing
    print "------"
    sortedVerbs = sorted(verbMap.keys(), key=lambda key: verbMap[key], reverse=True)
    for ing in sortedVerbs:
        print ing
    print "------"
    sortedIng = sorted(ingMap.keys(), key=lambda key: ingMap[key], reverse=True)
    for ing in sortedIng:
        print ing

The Output
----------
* freshly chopped onions
* finely sliced olives
* thinly peeled potatos
* roughly halved chicken
* thickly grated garlic

The End...Eat!
==============

