{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 21.0, 77.0, 528.0, 291.0 ],
		"bglocked" : 0,
		"defrect" : [ 21.0, 77.0, 528.0, 291.0 ],
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
					"text" : "Float between 0 and 1",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 17.0, 25.0, 69.0, 43.0 ],
					"id" : "obj-1",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 40.0, 55.0, 15.0, 15.0 ],
					"id" : "obj-2",
					"numinlets" : 0,
					"comment" : "Float between 0 and 1"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 220.0, 55.0, 15.0, 15.0 ],
					"id" : "obj-3",
					"numinlets" : 0,
					"comment" : "Steepness index (> 1)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Steepness index (> 1)",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 199.0, 25.0, 65.0, 31.0 ],
					"id" : "obj-4",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr log($f1 * ($f2 - 1) + 1) / log($f2)",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 40.0, 146.0, 190.0, 19.0 ],
					"id" : "obj-5",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 183.0, 15.0, 15.0 ],
					"id" : "obj-6",
					"numinlets" : 1,
					"comment" : "Logarithmic curve between 0 and 1"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Logarithmic curve between 0 and 1",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 22.0, 207.0, 86.0, 31.0 ],
					"id" : "obj-7",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "float #1",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 220.0, 80.0, 60.0, 19.0 ],
					"id" : "obj-8",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 254.0, 55.0, 63.0, 19.0 ],
					"id" : "obj-9",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "by Eric L. Singer [1994]",
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 246.0, 216.0, 141.0, 20.0 ],
					"id" : "obj-10",
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
					"patching_rect" : [ 246.0, 195.0, 92.0, 27.0 ],
					"id" : "obj-11",
					"fontname" : "Times New Roman",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $f1 == 0 then 50. else $f1",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 220.0, 101.0, 138.0, 19.0 ],
					"id" : "obj-12",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $f1 > 1. then $f1 else out2 \"LogCurve index must be > 1\"",
					"outlettype" : [ "", "" ],
					"numoutlets" : 2,
					"fontsize" : 9.0,
					"patching_rect" : [ 220.0, 122.0, 274.0, 19.0 ],
					"id" : "obj-13",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "print \"• error\"",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 419.0, 146.0, 75.0, 19.0 ],
					"id" : "obj-14",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-13", 0 ],
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
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 1 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-5", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
