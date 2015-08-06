{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 50.0, 44.0, 243.0, 297.0 ],
		"bglocked" : 0,
		"defrect" : [ 50.0, 44.0, 243.0, 297.0 ],
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
					"maxclass" : "inlet",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 155.0, 31.0, 15.0, 15.0 ],
					"id" : "obj-1",
					"numinlets" : 0,
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"patching_rect" : [ 49.0, 191.0, 15.0, 15.0 ],
					"id" : "obj-2",
					"numinlets" : 1,
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"patching_rect" : [ 49.0, 31.0, 15.0, 15.0 ],
					"id" : "obj-3",
					"numinlets" : 0,
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set $1",
					"outlettype" : [ "" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 66.0, 74.0, 48.0, 17.0 ],
					"id" : "obj-4",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 0.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 49.0, 146.0, 27.0, 19.0 ],
					"id" : "obj-5",
					"fontname" : "Geneva",
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "accum 0.",
					"outlettype" : [ "float" ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"patching_rect" : [ 66.0, 113.0, 48.0, 19.0 ],
					"id" : "obj-6",
					"fontname" : "Geneva",
					"numinlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "float in",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 6.0, 31.0, 38.0, 31.0 ],
					"id" : "obj-7",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "bang in",
					"linecount" : 2,
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 180.0, 32.0, 36.0, 31.0 ],
					"id" : "obj-8",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "float out",
					"numoutlets" : 0,
					"fontsize" : 9.0,
					"patching_rect" : [ 72.0, 192.0, 46.0, 19.0 ],
					"id" : "obj-9",
					"fontname" : "Geneva",
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-5", 1 ],
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
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-2", 0 ],
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
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
