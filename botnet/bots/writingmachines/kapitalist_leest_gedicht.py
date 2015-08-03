#!/usr/bin/env python
# -*- coding: utf-8 -*-
# An Mertens, Kapitalist lees gedicht, maart 2015. 
# geïnspireerd op idee van Atelier xxx tijdens Open Projectweek in Kask, Gent
# Copyleft: This is a free work, you can copy, distribute, and modify it under the terms of the 
# Free Art License http://artlibre.org/licence/lal/en/



# Originele tekst
gedicht = (
	"Belgiese zondag \n\n"
	"Een gramofoon van 's morgens acht \n"
 	"iemand vergeet niet zijn soldatetijd \n"
 	"en speelt clairon \n"
 	"het bier is flauw \n"
 	"                             limonade \n"
 	"UIT ZUIVERE VRUCHTEN \n\n"
	"Na de hoogmis wast bewondering \n"
 	"voor de renners de coureurs \n"
 	"     21 7 17 48 83 \n"
 	"fraaie hoofdgroep door het dorp \n"
 	"Jonge boeren en arbeiders spreken \n"
 	"             sportliterair \n"
 	"             citaten uit de Sportwereld \n"
 	"Koorknapen gaan onkelwaarts zondagsent \n"
 	"                            TE DEUM zingend \n"
 	"Vrouwen wachten op \n"
 	"               deemstering \n"
 	"                          kaarten zijn spekvet \n"
 	"       Fumez la cigarette Dubec \n"
 	"       La Cigarette du Connaisseur \n"
 	"alle dorpelingen zijn kenners \n"
 	"             zij roken la cigarette Dubec \n\n"
 	"Kinderen zijn vuil \n"
 	"                       huizen ook \n"
 	"Mijn land zondag alpdruk boos \n"	

	)

# waarden van de letters, als woordenboek
gewicht = {'a': 1, 'b': 3, 'c': 5, 'd': 2, 'e': 1, 'f': 4, 'g': 3,
	'h': 4, 'i': 1, 'j': 4, 'k': 3, 'l': 3, 'm': 3, 'n':1, 'o': 1,
	'p': 3, 'q': 10, 'r': 2, 's': 2, 't': 2, 'u': 4, 'v': 4, 'w': 5,
	'x': 8, 'y': 8, 'z': 4 }

nonevalues = ["\n", " ", "'", ",", ".", "?", "!", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
nummers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
totaal = []

def kapitalist(gedicht):
	# maak van elk woord een lijst letters
	gedicht = gedicht.lower()
	letters = [letter for letter in gedicht]
	for letter in letters:
		i = 0
		if letter in nonevalues:
			i += 1
		else:
			pos = letters.index(letter)
			for key, value in gewicht.items():
				waarde = gewicht.get(letter)
				letters[pos] = waarde
	for letter in letters:
		if letter in nummers:
			totaal.append(int(letter))
			som = sum(totaal)
	letters = [str(letter) for letter in letters]
	kapitalistisch_gedicht = " ".join(letters)
	return gedicht, kapitalistisch_gedicht, som

gedicht, kapitalistisch_gedicht, som = kapitalist(gedicht)
f = open('paul_van_ostaijen.txt', 'a') 
f.write(gedicht + "\n \n" + kapitalistisch_gedicht + "\n" + "De waarde van dit gedicht is " + str(som)) 

