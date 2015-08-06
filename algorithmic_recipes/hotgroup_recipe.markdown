HOT GROUP
=========

FROM recipes 
WHERE 
Description LIKE “%spicy%”
AND description LIKE “%salad%”;

ID 1026
u’Chunky bacon and cucumber salad’
u’A spicy Sichuan-style salad of cucumber and fried bacon.’
Serves 6
PT30M
PT10M

re = store.find(Recipe, Recipe.id == 1026).any()
print “name”, re.name
#print “photo url”, fs.photo.url
print re.ingredients.count()

print re.ingredients.count()

for i in re.ingredients:
print i.name

name Chunky bacon and cucumber salad
16
16
3 tbsp groundnut oil
18 long dried chillies 
6 tsp Sichuan peppercorns 
3 whole star anise (optional)
300g smoked lardons, cut into 1cm/½in thick pieces
3 red chilli, de-seeded, finely chopped
3 tbsp Shaoxing rice wine or dry sherry
6 tbsp clear rice vinegar or cider vinegar
6 tbsp toasted sesame oil
600g cucumber, halved lengthways, de-seeded and sliced into 1cm/½in thick wedges
pinch sea salt
3 pinches dried chilli flakes
3 tbsp lime juice
3 tbsp chilli oil 
3 small handful fresh coriander leaves, roughly chopped dry-roasted peanuts (optional)

%%sqlite cookbook.db
SELECT id, ordinal, description FROM preparations WHERE recipe_id = 1026 ORDER BY ordinal;

id	ordinal	description
8652	1		u’Heat a wok until smoking and add the groundnut oil, then add the dried chillies and 
Sichuan peppercorns. Stir fry for a few seconds, or until fragrant. ‘
8653	2		u’Add the star anise (if using), bacon lardons and chilli and stir fry for 
2-3 minutes, or until the lardons have turned golden-brown at the edges.’
8654	3		u’Add the rice wine or sherry, vinegar and sesame oil and stir-fry for a few seconds, 
then add the cucumber and stir-fry for a few more seconds.’
8655	4		u’Season with sea salt, dried chilli flakes and lime juice, stirring well.’
8656	5		u’Pile the stir-fry onto a serving plate, drizzle over the chilli oil, garnish 
with the chopped coriander, sprinkle over some peanuts, if using, and serve 
immediately.’