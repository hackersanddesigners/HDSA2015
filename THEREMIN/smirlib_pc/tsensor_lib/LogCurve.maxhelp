{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 5.0, 44.0, 439.0, 340.0 ],
		"bglocked" : 0,
		"defrect" : [ 5.0, 44.0, 439.0, 340.0 ],
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
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 87.0, 189.0, 35.0, 19.0 ],
					"minimum" : 2,
					"id" : "obj-1",
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
					"patching_rect" : [ 12.0, 267.0, 30.0, 19.0 ],
					"id" : "obj-2",
					"fontname" : "Geneva",
					"numinlets" : 2,
					"showeditor" : 1,
					"editor_rect" : [ 432.0, 307.0, 210.0, 167.0 ],
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
					"patching_rect" : [ 12.0, 164.0, 35.0, 19.0 ],
					"id" : "obj-3",
					"triscale" : 0.9,
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 128.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 32.0, 239.0, 39.0, 19.0 ],
					"id" : "obj-4",
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
					"patching_rect" : [ 32.0, 189.0, 38.0, 19.0 ],
					"id" : "obj-5",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "LogCurve 20",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 32.0, 214.0, 65.0, 19.0 ],
					"id" : "obj-6",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change index value and watch graph",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 87.0, 161.0, 92.0, 31.0 ],
					"id" : "obj-7",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 0 127",
					"outlettype" : [ "int", "", "", "int" ],
					"numoutlets" : 4,
					"fontsize" : 9.0,
					"patching_rect" : [ 12.0, 133.0, 72.0, 19.0 ],
					"id" : "obj-8",
					"fontname" : "Geneva",
					"numinlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 50",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 12.0, 110.0, 50.0, 19.0 ],
					"id" : "obj-9",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click to run (turn off overdrive for cleaner graphing)",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 31.0, 77.0, 151.0, 31.0 ],
					"id" : "obj-10",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"numoutlets" : 1,
					"patching_rect" : [ 12.0, 77.0, 15.0, 15.0 ],
					"id" : "obj-11",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "by Eric L. Singer [1994]",
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 11.0, 51.0, 141.0, 20.0 ],
					"id" : "obj-12",
					"fontname" : "Times New Roman",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Converts linear input to logarithmic curve",
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 11.0, 37.0, 224.0, 20.0 ],
					"id" : "obj-13",
					"fontname" : "Times New Roman",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LogCurve",
					"numoutlets" : 0,
					"fontsize" : 18.0,
					"patching_rect" : [ 11.0, 16.0, 92.0, 27.0 ],
					"id" : "obj-14",
					"fontname" : "Times New Roman",
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
					"patching_rect" : [ 183.0, 195.0, 230.0, 31.0 ],
					"id" : "obj-15",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Inlets;\r1 = Float value between 0 and 1;\r2 = Steepness index, must be > 1;\r;\rOutlets;\r1 = Logarithmic curve value between 0 and 1;\r;\rArguments;\r1 = Same as inlet 2;\r",
					"linecount" : 9,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 183.0, 77.0, 224.0, 115.0 ],
					"id" : "obj-16",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-6", 0 ],
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
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
