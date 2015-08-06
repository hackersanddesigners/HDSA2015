{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 232.0, 481.0, 552.0, 240.0 ],
		"bglocked" : 0,
		"defrect" : [ 232.0, 481.0, 552.0, 240.0 ],
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
					"text" : "The timer will count in case the input value = 1",
					"id" : "obj-1",
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 49.0, 410.0, 17.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-2",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 98.0, 107.0, 32.0, 32.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"id" : "obj-3",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 134.0, 106.0, 32.0, 32.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"id" : "obj-4",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 134.0, 177.0, 32.0, 32.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-5",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 227.0, 179.0, 54.0, 27.0 ],
					"fontsize" : 18.0,
					"triscale" : 0.9,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s_timer 10",
					"id" : "obj-6",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 134.0, 150.0, 103.0, 17.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Produces bangs on its outlet1 every time interval, specified by argument (seconds).",
					"id" : "obj-7",
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 36.0, 410.0, 17.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "The bang or 1 to 0 transition at the inlet1 will reset internal counter.",
					"id" : "obj-8",
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 62.0, 388.0, 17.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "s_timer",
					"id" : "obj-9",
					"fontname" : "Arial Black",
					"numoutlets" : 0,
					"patching_rect" : [ 79.0, 13.0, 65.0, 26.0 ],
					"fontsize" : 14.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Condition of internal counter can be monitired on outlet2.",
					"id" : "obj-10",
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 75.0, 362.0, 17.0 ],
					"fontsize" : 9.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "One of the possible purposes of s_timer - to produce autotuning of long term installations, based on the theremin-sensors, when no motion in the control area of the sensors is detected (velocity=0) within the time interval, specified by s_timer's argument.",
					"linecount" : 6,
					"id" : "obj-11",
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 295.0, 104.0, 214.0, 75.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-6", 0 ],
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
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
