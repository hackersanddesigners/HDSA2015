{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 29.0, 55.0, 936.0, 659.0 ],
		"bglocked" : 0,
		"defrect" : [ 29.0, 55.0, 936.0, 659.0 ],
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
					"maxclass" : "multislider",
					"presentation_rect" : [ 346.0, 593.0, 0.0, 0.0 ],
					"setstyle" : 3,
					"outlettype" : [ "", "" ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"numoutlets" : 2,
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"patching_rect" : [ 330.0, 515.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.156863, 0.627451, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-74",
					"orientation" : 0,
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ 0.0, 250.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Inlet 3 - steepness index for logarithmic convertion ( must be > 1, default=20);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 95.0, 387.0, 17.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change index values and watch oscilograms",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 303.0, 378.0, 206.0, 17.0 ],
					"id" : "obj-2",
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
					"patching_rect" : [ 190.0, 185.0, 102.0, 27.0 ],
					"id" : "obj-3",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click to run",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 55.0, 177.0, 61.0, 17.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
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
					"patching_rect" : [ 300.0, 393.0, 26.0, 15.0 ],
					"id" : "obj-5",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "30",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 457.0, 393.0, 20.0, 15.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 439.0, 393.0, 16.0, 15.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "direction2",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 364.0, 480.0, 54.0, 17.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "velocity2",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 329.0, 579.0, 53.0, 17.0 ],
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "distance2",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 265.0, 579.0, 51.0, 17.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1000",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 262.0, 212.0, 33.0, 15.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "500",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 233.0, 212.0, 26.0, 15.0 ],
					"id" : "obj-12",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "250",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 204.0, 212.0, 26.0, 15.0 ],
					"id" : "obj-13",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 187.0, 212.0, 16.0, 15.0 ],
					"id" : "obj-14",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 233.0, 236.0, 53.0, 17.0 ],
					"id" : "obj-15",
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
					"text" : "pipe 500",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 204.0, 259.0, 48.0, 17.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"patching_rect" : [ 77.0, 190.0, 15.0, 15.0 ],
					"id" : "obj-17",
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
					"patching_rect" : [ 77.0, 211.0, 51.0, 17.0 ],
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 2 1 127",
					"outlettype" : [ "int", "", "", "int" ],
					"numoutlets" : 4,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 235.0, 82.0, 17.0 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"numinlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 557.0, 415.0, 29.0, 15.0 ],
					"id" : "obj-20",
					"fontname" : "Arial",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "threshold",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 478.0, 394.0, 49.0, 17.0 ],
					"id" : "obj-21",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"patching_rect" : [ 35.0, 396.0, 35.0, 35.0 ],
					"id" : "obj-22",
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
					"patching_rect" : [ 415.0, 515.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-23",
					"orientation" : 0,
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 457.0, 461.0, 35.0, 17.0 ],
					"id" : "obj-24",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
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
					"patching_rect" : [ 268.0, 515.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.980392, 0.156863, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-26",
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
					"patching_rect" : [ 161.0, 514.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.156863, 0.627451, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-27",
					"orientation" : 0,
					"compatibility" : 1,
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"setminmax" : [ 0.0, 250.0 ],
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
					"patching_rect" : [ 96.0, 514.0, 37.0, 59.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"slidercolor" : [ 0.156863, 0.627451, 0.0, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"id" : "obj-28",
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
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 392.0, 50.0, 17.0 ],
					"id" : "obj-29",
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
					"mult" : 40.0,
					"min" : 1.0,
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 77.0, 283.0, 27.0, 102.0 ],
					"id" : "obj-30",
					"orientation" : 2,
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
					"patching_rect" : [ 77.0, 413.0, 38.0, 17.0 ],
					"id" : "obj-31",
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
					"patching_rect" : [ 204.0, 389.0, 50.0, 17.0 ],
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
					"maxclass" : "slider",
					"mult" : 40.0,
					"min" : 1.0,
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 204.0, 281.0, 27.0, 102.0 ],
					"id" : "obj-33",
					"orientation" : 2,
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
					"patching_rect" : [ 204.0, 411.0, 38.0, 17.0 ],
					"id" : "obj-34",
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
					"patching_rect" : [ 415.0, 461.0, 35.0, 17.0 ],
					"id" : "obj-35",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "20",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 330.0, 393.0, 20.0, 15.0 ],
					"id" : "obj-36",
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
					"patching_rect" : [ 457.0, 413.0, 39.0, 17.0 ],
					"id" : "obj-37",
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
					"patching_rect" : [ 330.0, 414.0, 39.0, 17.0 ],
					"id" : "obj-38",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 373.0, 461.0, 35.0, 17.0 ],
					"id" : "obj-39",
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
					"patching_rect" : [ 330.0, 495.0, 60.0, 17.0 ],
					"id" : "obj-40",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 204.0, 461.0, 35.0, 17.0 ],
					"id" : "obj-41",
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
					"patching_rect" : [ 161.0, 494.0, 60.0, 17.0 ],
					"id" : "obj-42",
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
					"patching_rect" : [ 268.0, 461.0, 69.0, 17.0 ],
					"id" : "obj-43",
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
					"patching_rect" : [ 246.0, 495.0, 69.0, 17.0 ],
					"id" : "obj-44",
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
					"patching_rect" : [ 96.0, 461.0, 69.0, 17.0 ],
					"id" : "obj-45",
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
					"patching_rect" : [ 77.0, 493.0, 69.0, 17.0 ],
					"id" : "obj-46",
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"triscale" : 0.9,
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"numoutlets" : 0,
					"patching_rect" : [ 557.0, 443.0, 33.0, 33.0 ],
					"id" : "obj-47",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "tsensor~ 200 20 1 200",
					"outlettype" : [ "", "", "", "", "", "", "", "", "", "" ],
					"numoutlets" : 10,
					"fontsize" : 9.0,
					"patching_rect" : [ 77.0, 438.0, 399.0, 17.0 ],
					"id" : "obj-48",
					"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• arg 1 - time-average range (ms) to smooth the input stream and get rid of artifacts;\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 289.0, 389.0, 17.0 ],
					"id" : "obj-49",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• arg 2 - same as inlet 3;\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 304.0, 140.0, 17.0 ],
					"id" : "obj-50",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• arg 3 - same as inlet 4;\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 319.0, 146.0, 17.0 ],
					"id" : "obj-51",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• arg 4 - time-average range (ms) to smoothi the stream of velocity values.",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 334.0, 411.0, 17.0 ],
					"id" : "obj-52",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set 0",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 36.0, 381.0, 33.0, 17.0 ],
					"id" : "obj-53",
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
					"patching_rect" : [ 353.0, 393.0, 21.0, 17.0 ],
					"id" : "obj-54",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "tsensor~ object was created to measure frequences of two theremin output signals (or any other periodic audio signals) and process related pitch data to provide gestural control over the interactive system. tsensor~ object follows pitch of the input signal, converts linear pitch values to logarithmic curve, produce filtering and envelope following to smooth input data and get rid of artifacts, calculats velocity, estimates drection of motion.",
					"linecount" : 7,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 24.0, 61.0, 306.0, 79.0 ],
					"id" : "obj-55",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "tsensor~",
					"numoutlets" : 0,
					"fontsize" : 20.0,
					"patching_rect" : [ 24.0, 25.0, 202.0, 35.0 ],
					"id" : "obj-56",
					"fontname" : "Arial Black",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Inlets 1, 2 - inputs of two similar channels. Suitable for periodic signals with easy waveforms and typical range 40-5000 hz. Bang 1-st inlet to set zero point for both channels;\r",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 61.0, 400.0, 27.0 ],
					"id" : "obj-57",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Inlet 4 - threshold value for both channels (default=1.);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 117.0, 311.0, 17.0 ],
					"id" : "obj-58",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlets 1, 5 - exact linear pitch values for channels 1 and 2 (for tunning and monitoring);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 145.0, 485.0, 17.0 ],
					"id" : "obj-59",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlets 2, 6 - distances D1 and D2 for channels 1 and 2 (input pitch values after smoothing and logarithmic convertion) (sig);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 166.0, 542.0, 17.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlets 3, 7 - velocities of motion V1 and V2 for channels 1 and 2 (abs values of distance change per second);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 188.0, 469.0, 17.0 ],
					"id" : "obj-61",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlets 4, 8 - direction of motion for channels 1 and 2 (ints + -1);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 216.0, 299.0, 17.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlet 9 - middle point: 0 if D1 = D2 else - positive value (float);\r",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 234.0, 289.0, 17.0 ],
					"id" : "obj-63",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "• Outlet 10 - motion: 1 if V1 or V2 > threshold value else 0.",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 346.0, 252.0, 307.0, 17.0 ],
					"id" : "obj-64",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "tsensor~ © 2002-2005 Andrei & Sergei Smirnov Theremin Center for Electroacoustic Music, Moscow box2@theremin.ru http://asmir.theremin.ru",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 525.0, 512.0, 232.0, 38.0 ],
					"id" : "obj-65",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Start processing",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 605.0, 452.0, 74.0, 17.0 ],
					"id" : "obj-66",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "distance1",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 94.0, 579.0, 50.0, 17.0 ],
					"id" : "obj-67",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "velocity1",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 159.0, 579.0, 53.0, 17.0 ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "middle point",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 406.0, 579.0, 68.0, 17.0 ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "motion",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 457.0, 479.0, 44.0, 17.0 ],
					"id" : "obj-70",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "direction1",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 199.0, 479.0, 53.0, 17.0 ],
					"id" : "obj-71",
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
					"patching_rect" : [ 346.0, 270.0, 100.0, 17.0 ],
					"id" : "obj-72",
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
					"patching_rect" : [ 525.0, 562.0, 106.0, 17.0 ],
					"id" : "obj-73",
					"fontname" : "Arial",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 9 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-48", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 8 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 7 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 6 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-48", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 5 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 4 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-16", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 3 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-48", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 2 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 1 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
