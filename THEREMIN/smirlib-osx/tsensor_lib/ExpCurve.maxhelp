{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 9.0, 45.0, 445.0, 334.0 ],
		"bglocked" : 0,
		"defrect" : [ 9.0, 45.0, 445.0, 334.0 ],
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
					"maxclass" : "comment",
					"text" : "ExpCurve",
					"numoutlets" : 0,
					"fontsize" : 18.0,
					"patching_rect" : [ 18.0, 13.0, 92.0, 27.0 ],
					"id" : "obj-1",
					"fontname" : "Times New Roman",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Converts linear input to exponential curve",
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 18.0, 34.0, 224.0, 20.0 ],
					"id" : "obj-2",
					"fontname" : "Times New Roman",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "©1994 Eric L. Singer",
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 18.0, 48.0, 141.0, 20.0 ],
					"id" : "obj-3",
					"fontname" : "Times New Roman",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"patching_rect" : [ 19.0, 74.0, 15.0, 15.0 ],
					"id" : "obj-4",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click to run (turn off overdrive for cleaner graphing)",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 38.0, 74.0, 151.0, 31.0 ],
					"id" : "obj-5",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 50",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 19.0, 107.0, 50.0, 19.0 ],
					"id" : "obj-6",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 0 127",
					"outlettype" : [ "int", "", "", "int" ],
					"numoutlets" : 4,
					"fontsize" : 9.0,
					"patching_rect" : [ 19.0, 130.0, 72.0, 19.0 ],
					"id" : "obj-7",
					"fontname" : "Geneva",
					"numinlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ExpCurve 20",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 39.0, 211.0, 65.0, 19.0 ],
					"id" : "obj-8",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "/ 128.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 39.0, 186.0, 38.0, 19.0 ],
					"id" : "obj-9",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 128.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 39.0, 236.0, 39.0, 19.0 ],
					"id" : "obj-10",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 19.0, 161.0, 35.0, 19.0 ],
					"id" : "obj-11",
					"triscale" : 0.9,
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "table",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 19.0, 264.0, 30.0, 19.0 ],
					"id" : "obj-12",
					"fontname" : "Geneva",
					"numinlets" : 2,
					"showeditor" : 1,
					"editor_rect" : [ 433.0, 298.0, 212.0, 168.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"showeditor" : 0,
						"signed" : 0,
						"name" : "",
						"notename" : 0,
						"size" : 128,
						"range" : 128
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 94.0, 186.0, 35.0, 19.0 ],
					"minimum" : 2,
					"id" : "obj-13",
					"triscale" : 0.9,
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change index value and watch graph",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 94.0, 158.0, 100.0, 31.0 ],
					"id" : "obj-14",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Inlets;\r1 = Float value between 0 and 1;\r2 = Steepness index, must be > 1;\r;\rOutlets;\r1 = Exponential curve value between 0 and 1;\r;\rArguments;\r1 = Same as inlet 2;\r",
					"linecount" : 9,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 196.0, 74.0, 224.0, 115.0 ],
					"id" : "obj-15",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "For greater efficiency, create desired curve and store in table. Then, use table to convert values.",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 196.0, 192.0, 230.0, 31.0 ],
					"id" : "obj-16",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-12", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-8", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
