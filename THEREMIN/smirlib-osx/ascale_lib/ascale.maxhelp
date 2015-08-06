{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 15.0, 55.0, 868.0, 685.0 ],
		"bglocked" : 0,
		"defrect" : [ 15.0, 55.0, 868.0, 685.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"metadata" : [  ],
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 464.0, 463.0, 35.0, 17.0 ],
					"id" : "obj-73",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 407.0, 464.0, 35.0, 17.0 ],
					"id" : "obj-72",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 508.0, 423.0, 35.0, 17.0 ],
					"id" : "obj-1",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Inlet 6 - time to release input range borders (int, float) (seconds)",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 151.0, 331.0, 17.0 ],
					"id" : "obj-2",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "10",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 476.0, 435.0, 20.0, 15.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.0025",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 437.0, 436.0, 38.0, 15.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "release",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 451.0, 421.0, 44.0, 17.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1.",
					"hidden" : 1,
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 201.0, 363.0, 27.0, 17.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 3.",
					"hidden" : 1,
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 201.0, 344.0, 27.0, 17.0 ],
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 461.0, 27.0, 17.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mousestate",
					"hidden" : 1,
					"outlettype" : [ "int", "int", "int", "int", "int" ],
					"numoutlets" : 5,
					"fontsize" : 9.0,
					"patching_rect" : [ 201.0, 323.0, 66.0, 17.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"patching_rect" : [ 201.0, 286.0, 33.0, 33.0 ],
					"id" : "obj-12",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"linecount" : 2,
					"hidden" : 1,
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 457.0, 364.0, 45.0, 27.0 ],
					"id" : "obj-13",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "65",
					"hidden" : 1,
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 466.0, 386.0, 20.0, 15.0 ],
					"id" : "obj-14",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ascale 0. 127 0.001 300. 1 0.00001",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 508.0, 441.0, 155.0, 17.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 8
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 508.0, 400.0, 185.0, 20.0 ],
					"id" : "obj-16",
					"orientation" : 1,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ascale -100 100 -150 150. 0.1 10 1",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 202.0, 489.0, 325.0, 17.0 ],
					"id" : "obj-17",
					"fontname" : "Arial",
					"numinlets" : 8
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 508.0, 465.0, 45.0, 17.0 ],
					"id" : "obj-18",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Inlet 7 - steepness index for logarithmic and exponential convertion (int, float)",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 165.0, 402.0, 17.0 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "-50 50 0 200. 0.005 100",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 216.0, 439.0, 106.0, 15.0 ],
					"id" : "obj-20",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"setstyle" : 3,
					"outlettype" : [ "", "" ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"numoutlets" : 2,
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"patching_rect" : [ 80.0, 539.0, 99.0, 73.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-21",
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ -500.0, 500.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"setstyle" : 3,
					"outlettype" : [ "", "" ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"numoutlets" : 2,
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"patching_rect" : [ 202.0, 539.0, 99.0, 73.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-22",
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ -256.0, 256.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "-100 100 -150 150. 0.001 10",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 202.0, 415.0, 124.0, 15.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "-50 50 -200 0. 1 500",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 231.0, 463.0, 109.0, 15.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Stop metro, move slider, watch and compare oscilograms",
					"linecount" : 5,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 120.0, 320.0, 68.0, 58.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change value and watch oscilograms",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 132.0, 156.0, 102.0, 27.0 ],
					"id" : "obj-27",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change values and watch oscilogram",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 538.0, 493.0, 170.0, 17.0 ],
					"id" : "obj-28",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "version 1.O for OSX",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 318.0, 616.0, 106.0, 17.0 ],
					"id" : "obj-29",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "-100 >>",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 39.0, 372.0, 44.0, 17.0 ],
					"id" : "obj-30",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 515.0, 72.0, 17.0 ],
					"id" : "obj-31",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"min" : 2.0,
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 121.0, 132.0, 95.0, 21.0 ],
					"id" : "obj-32",
					"orientation" : 1,
					"size" : 25.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click to run",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 59.0, 121.0, 61.0, 17.0 ],
					"id" : "obj-33",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 135.0, 15.0, 15.0 ],
					"id" : "obj-34",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 10",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 162.0, 51.0, 17.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 2 0 120",
					"outlettype" : [ "int", "", "", "int" ],
					"numoutlets" : 4,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 187.0, 82.0, 17.0 ],
					"id" : "obj-36",
					"fontname" : "Arial",
					"numinlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 256",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 251.0, 35.0, 17.0 ],
					"id" : "obj-37",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 4",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 230.0, 27.0, 17.0 ],
					"id" : "obj-38",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 60",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 209.0, 29.0, 17.0 ],
					"id" : "obj-39",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "+100 >>",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 39.0, 318.0, 44.0, 17.0 ],
					"id" : "obj-40",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 256.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 80.0, 434.0, 38.0, 17.0 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 274.0, 35.0, 154.0 ],
					"id" : "obj-42",
					"orientation" : 2,
					"size" : 512.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "10",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 407.0, 436.0, 20.0, 15.0 ],
					"id" : "obj-43",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.5",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 381.0, 437.0, 25.5, 15.0 ],
					"id" : "obj-44",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.0025",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 342.0, 438.0, 38.0, 15.0 ],
					"id" : "obj-45",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ascale",
					"numoutlets" : 0,
					"fontsize" : 18.0,
					"patching_rect" : [ 260.0, 23.0, 90.0, 32.0 ],
					"id" : "obj-46",
					"fontname" : "Arial Black",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Maps input range of values to output range. The mapping can be linear, logarithmic or exponential.",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 55.0, 475.0, 17.0 ],
					"id" : "obj-47",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "float/integer number as input",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 133.0, 428.0, 82.0, 27.0 ],
					"id" : "obj-48",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Outputs a scaled version of the input number with auto adaptation to the real input range",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 318.0, 515.0, 167.0, 38.0 ],
					"id" : "obj-49",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "arg1 is input low value (default 0.);\rarg2 is input high value (default 127.);\rarg3 is output low value (default 0.);\rarg4 is output high value (default 1.);\rarg5 is an attack time to fit real nput range borders (seconds);\rarg6 is a release time to move back input range borders (seconds) (default 1.);\rarg7 is steepness index n (default 1.);\rWhen n > 1 the mapping is logarithmic, similar to LogCurve by Eric L. Singer;\rWhen n = 1 the mapping is linear;\rWhen 0 < n < 1 the mapping is exponential;\rIf all four range arguments are <int>, the output will be <int> otherwise it is <float>.",
					"linecount" : 11,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 307.0, 202.0, 377.0, 120.0 ],
					"id" : "obj-50",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 202.0, 515.0, 72.0, 17.0 ],
					"id" : "obj-51",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Similar to scale object with one main difference: output never exeeds specified range. When peaks of the input stream of numbers exceed the specified input range, the borders of the input range immediately move to the new peak values to fit real input range, then moving back to the specified values with the rate, correspondng to the release time constant, specified by the argument 5.",
					"linecount" : 4,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 67.0, 476.0, 48.0 ],
					"id" : "obj-52",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "0 >>>>>",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 42.0, 346.0, 44.0, 17.0 ],
					"id" : "obj-53",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "input data",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 105.0, 618.0, 55.0, 17.0 ],
					"id" : "obj-54",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "steepness index",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 568.0, 463.0, 85.0, 17.0 ],
					"id" : "obj-55",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Arguments:",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 307.0, 186.0, 74.0, 17.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Inlets 1-4 are the same as in scale object",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 124.0, 232.0, 17.0 ],
					"id" : "obj-57",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Inlet 5 - attack time to fit real input range borders (int, float) (seconds)",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 137.0, 331.0, 17.0 ],
					"id" : "obj-58",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "It is possible to change ranges by the list of 6 numbers, same as arguments",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 180.0, 384.0, 186.0, 27.0 ],
					"id" : "obj-59",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "autoscale output",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 211.0, 616.0, 86.0, 17.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ascale © 2007 Andrei & Sergei Smirnov Theremin Center for Electroacoustic Music, Moscow box2@theremin.ru http://asmir.theremin.ru",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 318.0, 571.0, 253.0, 38.0 ],
					"id" : "obj-61",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "1",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 594.0, 382.0, 16.0, 17.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "300",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 668.0, 382.0, 26.0, 17.0 ],
					"id" : "obj-63",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "20",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 634.0, 382.0, 19.0, 17.0 ],
					"id" : "obj-64",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "0.001",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 506.0, 382.0, 34.0, 17.0 ],
					"id" : "obj-65",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "0.1",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 557.0, 382.0, 21.0, 17.0 ],
					"id" : "obj-66",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "attack",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 384.0, 421.0, 35.0, 17.0 ],
					"id" : "obj-67",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "exp",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 506.0, 368.0, 28.0, 17.0 ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "log",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 673.0, 368.0, 21.0, 17.0 ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "lin",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 591.0, 368.0, 21.0, 17.0 ],
					"id" : "obj-70",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "input artifacts",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 188.0, 268.0, 64.0, 17.0 ],
					"id" : "obj-71",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-35", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-17", 7 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-17", 5 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-17", 6 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
