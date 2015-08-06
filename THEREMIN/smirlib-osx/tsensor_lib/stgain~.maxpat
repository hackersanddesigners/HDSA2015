{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 47.0, 126.0, 460.0, 285.0 ],
		"bglocked" : 0,
		"defrect" : [ 47.0, 126.0, 460.0, 285.0 ],
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
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 384.0, 75.0, 43.0, 17.0 ],
					"id" : "obj-1",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 98.0, 62.0, 15.0, 15.0 ],
					"id" : "obj-2",
					"comment" : "(signal) Input Ch 2"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "right signal out",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 215.0, 76.0, 19.0 ],
					"id" : "obj-3",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "left signal out",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 4.0, 215.0, 70.0, 19.0 ],
					"id" : "obj-4",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 29.0, 197.0, 15.0, 15.0 ],
					"id" : "obj-5",
					"comment" : "(signal) Output Ch 1"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 29.0, 169.0, 27.0, 19.0 ],
					"id" : "obj-6",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 29.0, 62.0, 15.0, 15.0 ],
					"id" : "obj-7",
					"comment" : "(signal) Input Ch 1"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 98.0, 169.0, 27.0, 19.0 ],
					"id" : "obj-8",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 98.0, 197.0, 15.0, 15.0 ],
					"id" : "obj-9",
					"comment" : "(signal) Output Ch 2"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "line~",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 153.0, 136.0, 30.0, 19.0 ],
					"id" : "obj-10",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "right signal in",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 82.0, 46.0, 70.0, 19.0 ],
					"id" : "obj-11",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "left signal in",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 12.0, 46.0, 64.0, 19.0 ],
					"id" : "obj-12",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 153.0, 62.0, 15.0, 15.0 ],
					"id" : "obj-13",
					"comment" : "Output Level (0 - 157, 127 = 0dB)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "fade-time <int> ms.",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 220.0, 64.0, 96.0, 19.0 ],
					"id" : "obj-14",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 317.0, 62.0, 15.0, 15.0 ],
					"id" : "obj-15",
					"comment" : "Fade Time (int) ms"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 0",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 384.0, 94.0, 30.0, 19.0 ],
					"id" : "obj-16",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 384.0, 53.0, 51.0, 19.0 ],
					"id" : "obj-17",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "f",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 153.0, 86.0, 27.0, 19.0 ],
					"id" : "obj-18",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "linedrive 157 7.94321 1.03 1000",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 153.0, 112.0, 162.0, 19.0 ],
					"id" : "obj-19",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "output level <float/int> 0 <=n<=157 (127 = 0db)",
					"linecount" : 2,
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 153.0, 46.0, 227.0, 31.0 ],
					"id" : "obj-20",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "arg1: <optional> fade-time (default=30)",
					"numinlets" : 1,
					"fontsize" : 9.0,
					"numoutlets" : 0,
					"patching_rect" : [ 43.0, 24.0, 188.0, 19.0 ],
					"id" : "obj-21",
					"fontname" : "Geneva"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "30",
					"numinlets" : 2,
					"fontsize" : 9.0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 384.0, 118.0, 26.0, 17.0 ],
					"id" : "obj-22",
					"fontname" : "Geneva"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 1 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-10", 0 ],
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
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-8", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
