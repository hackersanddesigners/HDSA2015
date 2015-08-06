{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 96.0, 117.0, 887.0, 476.0 ],
		"bglocked" : 0,
		"defrect" : [ 96.0, 117.0, 887.0, 476.0 ],
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
					"maxclass" : "message",
					"text" : "500",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 188.0, 200.0, 26.0, 15.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click to run",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 56.0, 53.0, 61.0, 17.0 ],
					"id" : "obj-2",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change index value and watch oscilograms",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 260.0, 218.0, 115.0, 27.0 ],
					"id" : "obj-3",
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
					"patching_rect" : [ 227.0, 289.0, 57.0, 17.0 ],
					"id" : "obj-4",
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
					"patching_rect" : [ 152.0, 289.0, 57.0, 17.0 ],
					"id" : "obj-5",
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
					"text" : "• Outlet 1 - pitch values after smoothing and logarithmic convertion (sig);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 119.0, 402.0, 17.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlet 3 - exact linear pitch values (for tunning and monitoring) (float);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 158.0, 338.0, 17.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlet 2 - same as outlet 1, but float;\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 139.0, 382.0, 17.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pfol2~ © 2002-2005 Andrei & Sergei Smirnov Theremin Center for Electroacoustic Music, Moscow box2@theremin.ru http://asmir.theremin.ru",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 454.0, 266.0, 225.0, 38.0 ],
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "version 2.O for OSX",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 454.0, 321.0, 106.0, 17.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Inlet 2 - steepness index for logarithmic convertion ( must be > 1, default=20);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 93.0, 377.0, 17.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• arg2 - same as inlet 2.",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 225.0, 131.0, 17.0 ],
					"id" : "obj-12",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• arg1 - time-average range (ms) to smooth the input stream and get rid of artifacts;\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 207.0, 411.0, 17.0 ],
					"id" : "obj-13",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pfol2~ object was created to measure frequency of signal, produced by theremin (or any other similar periodic signal) to provide gestural control over the interactive system by means of human body motion and gesture.",
					"linecount" : 5,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 169.0, 58.0, 213.0, 58.0 ],
					"id" : "obj-14",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"mult" : 35.0,
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 77.0, 138.0, 28.0, 49.0 ],
					"id" : "obj-15",
					"orientation" : 2,
					"size" : 127.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 317.0, 311.0, 29.0, 15.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"numoutlets" : 0,
					"patching_rect" : [ 317.0, 339.0, 33.0, 33.0 ],
					"id" : "obj-17",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Start processing",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 365.0, 348.0, 74.0, 17.0 ],
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "snapshot~ 10",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 289.0, 69.0, 17.0 ],
					"id" : "obj-19",
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
					"patching_rect" : [ 77.0, 311.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.156863, 0.627451, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-20",
					"orientation" : 0,
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ 0.0, 5500.0 ],
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
					"patching_rect" : [ 227.0, 312.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.156863, 0.627451, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-21",
					"orientation" : 0,
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ 0.0, 5500.0 ],
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
					"patching_rect" : [ 152.0, 312.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.156863, 0.627451, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-22",
					"orientation" : 0,
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ 0.0, 5500.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "100",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 218.0, 200.0, 26.0, 15.0 ],
					"id" : "obj-23",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "10",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 248.0, 200.0, 20.0, 15.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 218.0, 221.0, 39.0, 17.0 ],
					"id" : "obj-25",
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
					"text" : "log",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 196.0, 221.0, 21.0, 17.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pfol2~ 100 20",
					"outlettype" : [ "", "", "" ],
					"numoutlets" : 3,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 255.0, 160.0, 17.0 ],
					"id" : "obj-27",
					"color" : [ 0.4, 0.4, 0.8, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"patching_rect" : [ 77.0, 70.0, 15.0, 15.0 ],
					"id" : "obj-28",
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
					"patching_rect" : [ 77.0, 91.0, 51.0, 17.0 ],
					"id" : "obj-29",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 2 0 127",
					"outlettype" : [ "int", "", "", "int" ],
					"numoutlets" : 4,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 115.0, 82.0, 17.0 ],
					"id" : "obj-30",
					"fontname" : "Arial",
					"numinlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"patching_rect" : [ 32.0, 202.0, 35.0, 35.0 ],
					"id" : "obj-31",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 195.0, 50.0, 17.0 ],
					"id" : "obj-32",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cycle~",
					"outlettype" : [ "signal" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 219.0, 38.0, 17.0 ],
					"id" : "obj-33",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set 0",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 33.0, 187.0, 33.0, 17.0 ],
					"id" : "obj-34",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "distance/sig",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 70.0, 377.0, 66.0, 17.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "distance/float",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 146.0, 377.0, 73.0, 17.0 ],
					"id" : "obj-36",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pitch/monitoring",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 220.0, 377.0, 84.0, 17.0 ],
					"id" : "obj-37",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pfol2~",
					"numoutlets" : 0,
					"fontsize" : 20.0,
					"patching_rect" : [ 170.0, 22.0, 100.0, 35.0 ],
					"id" : "obj-38",
					"fontname" : "Arial Black",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Inlet 1 - periodic signal with easy waveform, typical useful range 40-5000 hz. Bang 1-st inlet to set zero point;\r",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 404.0, 60.0, 245.0, 27.0 ],
					"id" : "obj-39",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pfol2~ object follows pitch of the input signal, converts linear pitch values to logarithmic curve, producing filtering and envelope following to smooth input data and get rid of artifacts.",
					"linecount" : 4,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 169.0, 125.0, 209.0, 48.0 ],
					"id" : "obj-40",
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
					"patching_rect" : [ 404.0, 192.0, 68.0, 17.0 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 2 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-27", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 1 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
