#!/usr/bin/env python
# -*- coding: utf-8 -*-
# An Mertens, Kapitalist schrijft tekst, maart 2015. 
# geïnspireerd op idee van Atelier xxx tijdens Open Projectweek in Kask, Gent
# Copyleft: This is a free work, you can copy, distribute, and modify it under the terms of the 
# Free Art License http://artlibre.org/licence/lal/en/


# Originele tekst
zin = raw_input("Schrijf een zin:")


# waarden van de letters, als woordenboek
gewicht = {'a': 1, 'b': 3, 'c': 5, 'd': 2, 'e': 1, 'f': 4, 'g': 3,
	'h': 4, 'i': 1, 'j': 4, 'k': 3, 'l': 3, 'm': 3, 'n':1, 'o': 1,
	'p': 3, 'q': 10, 'r': 2, 's': 2, 't': 2, 'u': 4, 'v': 4, 'w': 5,
	'x': 8, 'y': 8, 'z': 4}

nonevalues = ["\n", " ", "'", ".", "?", ",", "!", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
nummers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
totaal = []

def kapitalist(gedicht):
	# maak van elk woord een lijst letters
	tekst = zin.lower()
	letters = [letter for letter in tekst]
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
	kapitalistische_zin = " ".join(letters)
	print kapitalistische_zin
	print som

kapitalist(zin)


