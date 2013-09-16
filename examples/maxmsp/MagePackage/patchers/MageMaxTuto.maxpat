{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 3,
			"architecture" : "x86"
		}
,
		"rect" : [ 134.0, 44.0, 967.0, 719.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 134.0, 70.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 818.5, 57.5, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-38",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 818.5, 30.5, 108.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "some vocabulary",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 416.0, 312.0, 29.0 ],
									"text" : "about the data outlets of mage~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-22",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 455.5, 634.0, 49.0 ],
									"text" : "You may have noticed rarely used data outlets from the mage~ object. The first one (from left to right) is a bang each time a label is pushed to the labelqueue. The second one is the number of labels when a label lists is loaded. The third one is the duration, in frames, of currently computed label."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-23",
									"linecount" : 12,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 513.5, 640.0, 176.0 ],
									"text" : "Data outlets provide half useful information because they are synced with the label queue, not the model queue, hence it gives informations at a different rate than what is output. For exemple : the \"label size\" outlet gives the size of the label that just got computed, not of the next to-be-output label ; if you give a big list to compute it is likely to be computed very fast or slightly faster than it is output. \n\nIt is possible to sort of workaround this, using a custom queue, recalculating each size of label in samples and syncing precisely with the start of the synthesis ; however it is not really easy to achieve, even harder if you take into account that your aim is to control the timing of labels and you have to recompute the size of a label each time its duration is affected - so you need to recalculate values in the queue, etc... what's more, you have to detect the exact time mage begins to synthesize, which is different from the time you fill the queue (there is the computation inbetween, which time frame is not known in advance.) Example patch will come later."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-21",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 9.0, 513.5, 266.0, 120.0 ],
									"text" : "It's obviously interesting to use controllers of all sorts with mage~, and the main interest of mage's implementation in MaxMSP and PureData. Patch example of interfacing mage with the native macbooks trackpad, a wacom bamboo tablet and the Razer Hydra game controller will come later."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-16",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 9.0, 464.0, 226.0, 29.0 ],
									"text" : "using controllers"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 9.0, 339.0, 226.0, 29.0 ],
									"text" : "using poly~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-14",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 9.0, 384.0, 243.0, 35.0 ],
									"text" : "Many things to do with mage~ and poly~ ! Example patchs will come later."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 156.5, 13.5, 226.0, 29.0 ],
									"text" : "creating a voice engine"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 160.5, 86.0, 203.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "http://www.acapela-group.com/",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-10",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 157.5, 88.0, 206.0, 17.5 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-11",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 401.0, 89.0, 283.0, 32.0 ],
									"text" : ";\rmax launchbrowser http://www.acapela-group.com/"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-12",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 156.5, 57.5, 574.0, 49.0 ],
									"text" : "Creating a voice engine is a complex and long process, those included are freely available and were created using, among other things, proprietary software from the acapela group \n(                                                   )."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 128.5, 172.0, 29.0 ],
									"text" : "creating .lab files"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.5, 229.5, 264.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "http://www.cstr.ed.ac.uk/projects/festival/",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-7",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 384.0, 194.0, 21.0 ],
									"text" : "Better solutions will come later."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-2",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 300.0, 597.0, 77.0 ],
									"text" : "You could also look at the formating of a .lab file in the examples and, knowing that each line is a label and that the important information is the first few characters of each line, where you see the 3 previous phonems - the current phonem - then the 3 next phonems - all separated by special separator characters that are the same for each line ; you can recompose label files from this... obviously, the result will be strange."
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-5",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 601.5, 232.5, 268.0, 16.5 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-4",
									"linecount" : 4,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 601.5, 305.0, 122.0, 59.0 ],
									"text" : ";\rmax launchbrowser http://www.cstr.ed.ac.uk/projects/festival/"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-1",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 215.5, 583.0, 77.0 ],
									"text" : "This is a quite sensible and legitimate request. However, it is quite difficult at the moment. You need to install the festival speech synthesis system (                                                                  ) and figure how to translate a text to a format used by mage, using this. If you know nothing about this, it means quite a lot of work. Alternately, provided it's not on a per-day basis, you can send me a text to format at vic.hvk@gmail.com. "
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-3",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.5, 173.5, 583.0, 35.0 ],
									"text" : "By now, you might know everyting about mage and mage~, and may want to create your own .lab files from whatever text you fancy."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-108",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 191.5, 255.0, 120.0 ],
									"text" : "If you recompile mage~, you can replace the commented out lines (in mage~.cpp, lines 222-230) that load the engines on mage startup by the path to the engines on your computer. This will allow you to have all engines preloaded each start you start mage (hence not needing engineadd engineremove mesages)."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-113",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 146.5, 121.0, 29.0 ],
									"text" : "recompiling"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-33",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 818.5, 30.5, 108.0, 21.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 668.0, 86.0, 186.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p \"slightly more advanced topics\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-32",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 743.212769, 160.640747, 134.0, 21.0 ],
									"text" : "vibrato rate in Hz"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 374.0, 271.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 115.0, 132.0, 19.0 ],
													"text" : "expr pow($f1\\,-1.)*48000."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-2",
													"linecount" : 5,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 201.0, 92.5, 145.0, 77.0 ],
													"text" : "conversion from vibrato rate in hz to period size in samples at samplerate of 48000 Hz"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-187",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "float", "int" ],
													"patching_rect" : [ 50.0, 168.5, 95.0, 20.0 ],
													"text" : "maximum 0.001"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-28",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-30",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 200.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-187", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-28", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-187", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-3", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 639.0, 186.640747, 116.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 11.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p \"rate to threshold\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-29",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 408.0, 8.0, 318.0, 35.0 ],
									"text" : "Vibrato - to give a vibrato effect to the currently synthesized speech."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 77.0, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-38",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 50.0, 90.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "a sort of lexic",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 332.5, 215.90274, 37.0, 18.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 215.90274, 54.0, 20.0 ],
									"text" : "r menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 193.40274, 56.0, 20.0 ],
									"text" : "s menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 4.700932,
									"id" : "obj-205",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 266.90274, 75.75, 10.0 ],
									"text" : "clearchecks, checkitem $1 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-204",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 676.0, 102.0, 317.0, 504.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 168.0, 282.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 391.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 338.0, 32.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 365.0, 128.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 418.747559, 123.0, 20.0 ],
													"text" : "sprintf append %s%s"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 205.0, 128.5, 20.0 ],
													"text" : "t l l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-197",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 168.0, 330.747528, 106.0, 20.0 ],
													"text" : "prepend append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-196",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 23.0, 310.0, 104.0, 21.0 ],
													"text" : "regexp (.+).lab"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-150",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 168.0, 203.397827, 35.0, 20.0 ],
													"text" : "b 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-141",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 168.0, 240.247528, 86.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-151",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 97.0, 61.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-152",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 72.0, 91.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-153",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 282.0, 81.0, 20.0 ],
													"text" : "route append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-156",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 245.747528, 41.0, 20.0 ],
													"text" : "folder"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-157",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 165.247528, 91.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-158",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 128.397827, 61.0, 20.0 ],
													"text" : "route fold"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-201",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-202",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 65.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-203",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 168.0, 445.747559, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-197", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-141", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-150", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-158", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-151", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-196", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-153", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-153", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-156", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-157", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-150", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-196", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-197", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-152", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-201", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-202", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-156", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 278.5, 167.5, 75.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 12.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p filldamenu"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 7.588239,
									"frgb" : 0.0,
									"id" : "obj-200",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 105.897827, 64.0, 42.0 ],
									"text" : "drop one label file or folder full of label files"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-198",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 278.5, 243.5, 100.0, 20.0 ],
									"pattrmode" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 278.5, 105.897827, 61.0, 42.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-91",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 318.5, 282.0, 53.0, 18.0 ],
									"text" : "label $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 114.860001, 509.320007, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 465.687683, 54.0, 20.0 ],
									"text" : "sig~ -99"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 486.318176, 48.0, 20.0 ],
									"text" : "dbtoa~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 445.551331, 45.0, 20.0 ],
									"text" : "r siglvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 206.5, 652.7771, 40.0, 20.0 ],
									"text" : "s ctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 461.824036, 55.0, 20.0 ],
									"text" : "r outctlvl"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 182.5, 509.320007, 67.0, 131.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~[6]",
											"parameter_shortname" : "output level",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"varname" : "live.gain~[1]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 482.454529, 43.0, 18.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 439.5, 73.0, 20.0 ],
									"text" : "s magehelp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-22",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 735.0, 320.393188, 134.0, 63.0 ],
									"text" : "offset the period -\nuseful with zoom, to create different shapes than sinus."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-21",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 735.0, 267.893188, 134.0, 35.0 ],
									"text" : "zoom inside one period"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-20",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 743.212769, 206.5, 134.0, 49.0 ],
									"text" : "threshold is the size of one vibrato period, in samples"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-18",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 743.212769, 88.897827, 103.0, 49.0 ],
									"text" : "amplitude of the vibrato, in hertz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-179",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 705.490173, 555.490234, 14.509805, 14.509805 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 7.77605,
									"frgb" : 0.0,
									"id" : "obj-177",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 726.5, 523.5, 156.0, 43.0 ],
									"text" : "sending a pitch overwrite message continuously is necessary in order for the vibrato to be updated when the phonem is frozen."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 7.862669,
									"id" : "obj-166",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 703.5, 581.239197, 37.0, 15.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.283234,
									"hidden" : 1,
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 558.0, 530.0, 32.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 524.0, 530.0, 32.5, 18.0 ],
									"text" : "/ 10."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.283234,
									"hidden" : 1,
									"id" : "obj-51",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 558.0, 570.0, 32.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 6.843845,
									"hidden" : 1,
									"id" : "obj-112",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 590.0, 530.0, 34.0, 14.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.753232,
									"id" : "obj-14",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 620.0, 552.0, 44.0, 17.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 558.0, 552.0, 32.5, 18.0 ],
									"text" : "* 10."
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-15",
									"maxclass" : "slider",
									"min" : 0.01,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 620.0, 530.0, 72.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 620.0, 570.0, 86.0, 16.0 ],
									"text" : "pitchoverwrite $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 658.0, 495.0, 89.0, 18.0 ],
									"text" : "labelnextvowel"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-196",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 639.0, 320.393188, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-197",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 639.0, 340.393188, 92.0, 18.0 ],
									"text" : "vibratooffset $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-195",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 639.0, 267.893188, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-194",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 639.0, 88.897827, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-192",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 658.0, 213.5, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-190",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 639.0, 160.640747, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-183",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 639.0, 287.893188, 93.0, 18.0 ],
									"text" : "vibratozoom $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-181",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 639.0, 234.640747, 97.0, 18.0 ],
									"text" : "vibratothresh $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-178",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 639.0, 109.897827, 87.0, 18.0 ],
									"text" : "vibratoamp $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 67.86364, 415.0, 78.0, 21.0 ],
									"text" : "play it safe."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 67.86364, 439.5, 92.0, 20.0 ],
									"text" : "loadmess reset"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 388.212769, 398.5, 47.0, 18.0 ],
									"text" : "labelfill"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 419.212769, 377.5, 103.0, 21.0 ],
									"text" : "fills label queue"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-33",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 164.0, 50.0, 90.0, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-26",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 605.073486, 325.636353, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "6",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-25",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 605.073486, 274.393188, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "5",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-24",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 605.073486, 220.0, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "4",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-17",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 605.0, 96.211609, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-13",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 41.51059, 424.636353, 22.706104, 22.858788 ],
									"presentation_rect" : [ 90.0, 90.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "0",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-110",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 391.0, 368.454529, 21.853052, 22.0 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-94",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 253.718628, 116.897827, 21.790001, 21.0 ],
									"presentation_rect" : [ 75.0, 75.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 397.712769, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-166", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 648.5, 138.0, 583.0, 138.0, 583.0, 432.0, 192.0, 432.0 ],
									"source" : [ "obj-178", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-166", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-179", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 648.5, 252.0, 583.0, 252.0, 583.0, 432.0, 192.0, 432.0 ],
									"source" : [ "obj-181", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 648.5, 306.0, 583.0, 306.0, 583.0, 432.0, 192.0, 432.0 ],
									"source" : [ "obj-183", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-190", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-178", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-194", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-183", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-195", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-197", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-196", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 648.5, 360.0, 583.0, 360.0, 583.0, 432.0, 192.0, 432.0 ],
									"source" : [ "obj-197", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-205", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-204", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 288.0, 277.397827, 267.75, 277.397827, 267.75, 238.397827, 288.0, 238.397827 ],
									"source" : [ "obj-205", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-181", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-192", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-7", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 328.0, 422.75, 192.0, 422.75 ],
									"source" : [ "obj-91", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 603.0, 86.0, 65.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p vibrato"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.556233,
									"hidden" : 1,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 865.0, 533.0, 66.0, 16.0 ],
									"text" : "loadmess 110"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-79",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 668.5, 610.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-76",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 802.0, 557.0, 91.0, 21.0 ],
									"text" : "base pitch"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-71",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 751.5, 557.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-67",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 707.0, 376.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 220.0, 70.0, 60.0, 19.0 ],
													"text" : "prepend 3"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 515.0, 153.0, 26.0, 19.0 ],
													"text" : "b 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 515.0, 193.0, 32.5, 19.0 ],
													"text" : "f"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-18",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 639.0, 147.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-17",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 161.0, 70.0, 60.0, 19.0 ],
													"text" : "prepend 2"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-15",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 101.0, 70.0, 60.0, 19.0 ],
													"text" : "prepend 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 41.0, 70.0, 60.0, 19.0 ],
													"text" : "prepend 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 5,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 41.0, 41.0, 258.0, 19.0 ],
													"text" : "route pitchoverwrite pitchshift pitchscale pitchsynth"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-1",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 41.0, 6.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-16",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 320.0, 46.0, 38.0, 17.0 ],
													"text" : "$2 $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 291.5, 259.0, 81.0, 19.0 ],
													"text" : "loadmess 110."
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-13",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 385.0, 328.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 385.0, 285.0, 32.5, 19.0 ],
													"text" : "f"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 450.0, 221.0, 38.0, 19.0 ],
													"text" : "* 110."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 385.0, 221.0, 41.0, 19.0 ],
													"text" : "+ 110."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-8",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 466.5, 124.0, 40.0, 21.0 ],
													"text" : "scale"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-7",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 399.5, 124.0, 36.0, 21.0 ],
													"text" : "shift"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-6",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 262.0, 124.0, 64.0, 21.0 ],
													"text" : "overwrite"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 6,
													"outlettype" : [ "", "", "", "", "", "" ],
													"patching_rect" : [ 320.0, 105.0, 344.0, 19.0 ],
													"text" : "route 0 1 2 3 4"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-3",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 320.0, 6.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 668.5, 583.0, 102.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 11.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p \"current pitch\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-66",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 591.0, 631.318176, 359.0, 49.0 ],
									"text" : "The \"current pitch\" subpatcher gives current speech pitch. You will need to provide it with a base pitch though, if it's different from mage's default pitch (110 Hz)."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-63",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 616.0, 252.90274, 19.0, 21.0 ],
									"text" : "Î"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-61",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 580.0, 266.5, 91.0, 21.0 ],
									"text" : "current speed"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-59",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 693.5, 254.5, 192.0, 49.0 ],
									"text" : "this gives a ratio of current speed compared to the default speed (240 - ratio of 1)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-58",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 677.5, 232.363647, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 677.5, 204.40274, 125.0, 20.0 ],
									"text" : "expr pow($f1/240.\\,-1)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-53",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 602.0, 232.363647, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 539.0, 395.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-16",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 107.0, 79.0, 38.0, 17.0 ],
													"text" : "$2 $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 322.5, 257.0, 82.0, 19.0 ],
													"text" : "loadmess 240."
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-13",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 172.0, 327.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 172.0, 284.0, 32.5, 19.0 ],
													"text" : "f"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 197.75, 174.0, 32.5, 19.0 ],
													"text" : "f"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 237.0, 220.0, 39.0, 19.0 ],
													"text" : "* 240."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 172.0, 220.0, 41.0, 19.0 ],
													"text" : "+ 240."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-8",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 253.5, 123.0, 40.0, 21.0 ],
													"text" : "scale"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-7",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 186.5, 123.0, 36.0, 21.0 ],
													"text" : "shift"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-6",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 49.0, 123.0, 64.0, 21.0 ],
													"text" : "overwrite"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.0,
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 6,
													"outlettype" : [ "", "", "", "", "", "" ],
													"patching_rect" : [ 107.0, 104.0, 344.0, 19.0 ],
													"text" : "route 0 1 2 3 4"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-3",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 107.0, 6.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 181.5, 304.0, 292.0, 304.0, 292.0, 164.0, 207.25, 164.0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-4", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 631.5, 175.5, 102.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 11.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p \"current speed\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-45",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 476.0, 9.0, 318.0, 35.0 ],
									"text" : "\"speed\" is the size of one frame, in samples. Default speed is of 240 samples per frame."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 370.0, 342.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-4",
													"linecount" : 10,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 184.5, 352.0, 148.0 ],
													"text" : "Mage synthesizes speech not only at a given central frequency, but also with continuous variations (accentuation). The shift and scale methods allow you to preserve that accentuation, whereas the overwrite method doesn't. If you overwrite, you set a new pitch, which won't be altered by mage. If after overwriting you use the shift or scale method, the accentuation will be synthesized again, but the shifting and scaling will occur from default frequency, not the one currently set with pitch overwrite method."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-3",
													"linecount" : 9,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 45.0, 352.0, 134.0 ],
													"text" : "Whatever pitch method you use, it will always perform the requested operation comparatively to a fixed default pitch, not the one set previously by user. The default Mage pitch is 110 Hz, but this value is very dependant on currently used voice engine. The pitch scale and shift methods will perform change relatively to that current default frequency (which depends on the engine). The overwrite method will overwrite the current pitch, and is agnostic in regard to that default frequency."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-2",
													"linecount" : 2,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 4.0, 347.0, 35.0 ],
													"text" : "Different rules apply to operations on pitch - notwithstanding vibrato (see later)."
												}

											}
 ],
										"lines" : [  ]
									}
,
									"patching_rect" : [ 589.0, 422.5, 147.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 11.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p \"about pitch operations\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 535.0, 367.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-7",
													"linecount" : 2,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 272.0, 516.0, 35.0 ],
													"text" : "The subpatcher \"current speed\" gives you the current speed, taking into consideration the changes you may effect with the connected sliders and different methods."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-6",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 216.0, 516.0, 49.0 ],
													"text" : "Each time you shift or scale, you're shifting or scaling the current speed value, not the original/default one - so using those shift and scale sliders you can very quickly exponentially increase the duration in an uncontrolled fashion."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-4",
													"linecount" : 9,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 76.0, 523.0, 134.0 ],
													"text" : "Each phoneme has a different amount of frames. Each frame has a fixed number of samples. The \"speed\" parameter affects the number of samples in all the frames, but the number of frames per phoneme is still calculated by mage, and more than likely to be different for each phoneme. Each phoneme is divided in 5 states, and mage calculates the duration of each states individually, which is heavily dependant on everything (surrounding phonemes, consonne/vowel...). The \"duration $1 $2 $3 $4 $5\" message is the way to override default Mage's generated duration in frames for one phoneme. Each number argument you give to that message will override the corresponding state's duration for the next generated phoneme."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-2",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 4.0, 17.0, 523.0, 49.0 ],
													"text" : "-overwrite : redefines the size, in samples, of one frame. \n-shift : shifts the size of the frame by the given amount of samples. \n-scale : multiplies the current number of samples in one frame by the number you give."
												}

											}
 ],
										"lines" : [  ]
									}
,
									"patching_rect" : [ 770.5, 166.5, 154.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 11.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p \"about speed operations\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 77.0, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-31",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 50.0, 138.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "an attempt at helping",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 332.5, 215.90274, 37.0, 18.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 215.90274, 54.0, 20.0 ],
									"text" : "r menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 193.40274, 56.0, 20.0 ],
									"text" : "s menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 4.700932,
									"id" : "obj-205",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 266.90274, 75.75, 10.0 ],
									"text" : "clearchecks, checkitem $1 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-204",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 676.0, 102.0, 317.0, 504.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 168.0, 282.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 391.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 338.0, 32.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 365.0, 128.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 418.747559, 123.0, 20.0 ],
													"text" : "sprintf append %s%s"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 205.0, 128.5, 20.0 ],
													"text" : "t l l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-197",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 168.0, 330.747528, 106.0, 20.0 ],
													"text" : "prepend append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-196",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 23.0, 310.0, 104.0, 21.0 ],
													"text" : "regexp (.+).lab"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-150",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 168.0, 203.397827, 35.0, 20.0 ],
													"text" : "b 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-141",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 168.0, 240.247528, 86.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-151",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 97.0, 61.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-152",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 72.0, 91.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-153",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 282.0, 81.0, 20.0 ],
													"text" : "route append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-156",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 245.747528, 41.0, 20.0 ],
													"text" : "folder"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-157",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 165.247528, 91.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-158",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 128.397827, 61.0, 20.0 ],
													"text" : "route fold"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-201",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-202",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 65.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-203",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 168.0, 445.747559, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-197", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-141", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-150", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-158", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-151", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-196", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-153", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-153", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-156", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-157", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-150", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-196", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-197", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-152", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-201", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-202", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-156", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 278.5, 167.5, 75.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 12.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p filldamenu"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 7.588239,
									"frgb" : 0.0,
									"id" : "obj-200",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 105.897827, 64.0, 42.0 ],
									"text" : "drop one label file or folder full of label files"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-198",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 278.5, 243.5, 100.0, 20.0 ],
									"pattrmode" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 278.5, 105.897827, 61.0, 42.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-91",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 318.5, 282.0, 53.0, 18.0 ],
									"text" : "label $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 114.860001, 509.320007, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 465.869507, 54.0, 20.0 ],
									"text" : "sig~ -99"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 486.5, 48.0, 20.0 ],
									"text" : "dbtoa~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 445.733154, 45.0, 20.0 ],
									"text" : "r siglvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 206.5, 652.958923, 40.0, 20.0 ],
									"text" : "s ctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 462.005859, 55.0, 20.0 ],
									"text" : "r outctlvl"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 182.5, 509.320007, 67.0, 131.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~[5]",
											"parameter_shortname" : "output level",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"varname" : "live.gain~[1]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 482.636353, 43.0, 18.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 439.5, 73.0, 20.0 ],
									"text" : "s magehelp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-25",
									"linecount" : 6,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 445.733154, 101.0, 91.0 ],
									"text" : "Alternatively, you can send explicit messages for pitch operations."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 6.843845,
									"hidden" : 1,
									"id" : "obj-73",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 450.0, 557.0, 34.0, 14.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.283234,
									"hidden" : 1,
									"id" : "obj-60",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 491.5, 32.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.283234,
									"hidden" : 1,
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 514.5, 32.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.753232,
									"id" : "obj-65",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 486.5, 511.5, 44.0, 17.0 ]
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-70",
									"maxclass" : "slider",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 486.5, 489.5, 72.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"id" : "obj-72",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 486.5, 529.5, 64.0, 16.0 ],
									"text" : "pitchshift $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.818506,
									"hidden" : 1,
									"id" : "obj-56",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 417.0, 557.0, 33.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-55",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 383.5, 557.0, 32.5, 18.0 ],
									"text" : "* 10."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.283234,
									"hidden" : 1,
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 424.5, 425.0, 32.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 390.5, 425.0, 32.5, 18.0 ],
									"text" : "/ 10."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.283234,
									"hidden" : 1,
									"id" : "obj-51",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 424.5, 465.0, 32.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 8.818506,
									"hidden" : 1,
									"id" : "obj-48",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 417.0, 596.0, 33.0, 14.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 6.843845,
									"hidden" : 1,
									"id" : "obj-112",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 456.5, 425.0, 34.0, 14.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.753232,
									"id" : "obj-7",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 486.5, 447.0, 44.0, 17.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-147",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 486.5, 575.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 417.0, 577.0, 32.5, 18.0 ],
									"text" : "/ 10."
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-35",
									"maxclass" : "slider",
									"min" : 1.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 486.5, 554.0, 72.0, 18.0 ],
									"size" : 40.0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 424.5, 447.0, 32.5, 18.0 ],
									"text" : "* 10."
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-23",
									"maxclass" : "slider",
									"min" : 0.01,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 487.0, 425.0, 72.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"id" : "obj-40",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 486.5, 638.818176, 56.0, 16.0 ],
									"text" : "pitchsynth"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 486.5, 596.0, 69.0, 16.0 ],
									"text" : "pitchscale $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"id" : "obj-24",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 486.5, 465.0, 86.0, 16.0 ],
									"text" : "pitchoverwrite $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-18",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 532.0, 75.5, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-17",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 770.5, 422.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 857.5, 377.5, 78.0, 107.0 ],
									"tabs" : [ "overwrite", "shift", "scale", "synthetic", "noaction" ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 770.5, 462.5, 59.0, 20.0 ],
									"text" : "pack 0. 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 770.5, 498.5, 69.0, 18.0 ],
									"text" : "pitch $1 $2"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 532.0, 120.5, 59.0, 20.0 ],
									"text" : "pack 0. 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 532.0, 166.5, 77.0, 18.0 ],
									"text" : "speed $1 $2"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 620.0, 43.0, 78.0, 107.0 ],
									"tabs" : [ "overwrite", "shift", "scale", "synthetic", "noaction" ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-38",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 698.0, 43.0, 257.0, 120.0 ],
									"text" : "2d integer is the type of operation to apply :\n\n0 - overwrite old value by current value\n1 - shift old by current value\n2 - scale old by current\n3 - mage will compute duration (default) \n4 - no effect"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 67.86364, 415.0, 78.0, 21.0 ],
									"text" : "play it safe."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 67.86364, 439.5, 92.0, 20.0 ],
									"text" : "loadmess reset"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 168.0, 350.5, 47.0, 18.0 ],
									"text" : "labelfill"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 199.0, 329.5, 103.0, 21.0 ],
									"text" : "fills label queue"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-33",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 164.0, 50.0, 138.0, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-21",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 770.5, 388.181824, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "4",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-20",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 532.0, 43.0, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-13",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 41.51059, 424.636353, 22.706104, 22.858788 ],
									"presentation_rect" : [ 90.0, 90.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "0",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-110",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 170.787231, 320.454529, 21.853052, 22.0 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-94",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 253.718628, 116.897827, 21.790001, 21.0 ],
									"presentation_rect" : [ 105.0, 105.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 177.5, 424.0, 192.0, 424.0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 780.0, 532.0, 747.0, 532.0, 747.0, 408.0, 326.0, 408.0, 326.0, 424.0, 192.0, 424.0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 780.0, 489.0, 850.0, 489.0, 850.0, 541.0, 719.5, 541.0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-147", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-147", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-205", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-204", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 288.0, 277.397827, 267.75, 277.397827, 267.75, 238.397827, 288.0, 238.397827 ],
									"source" : [ "obj-205", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 496.0, 483.0, 588.0, 483.0, 588.0, 546.0, 678.0, 546.0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-26", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 496.0, 624.0, 618.0, 624.0, 618.0, 546.0, 678.0, 546.0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 496.0, 667.0, 573.0, 667.0, 573.0, 624.0, 618.0, 624.0, 618.0, 546.0, 678.0, 546.0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-147", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 496.0, 547.0, 678.0, 547.0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 541.5, 307.0, 328.0, 307.0, 328.0, 424.0, 192.0, 424.0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 328.0, 423.25, 192.0, 423.25 ],
									"source" : [ "obj-91", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 445.0, 86.0, 159.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p \"pitch and speed controls\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-56",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 589.0, 299.0, 216.0, 63.0 ],
									"text" : "example of very simple control with keyboard's characters ascii codes (one state duration is typically between 1 and 10 frames)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-55",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 78.0, 113.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-2",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 18.0, 79.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-1",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 24.0, 13.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 857.5, 439.5, 41.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 11.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p thru"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-54",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 881.0, 327.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-52",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 814.0, 354.0, 34.0, 20.0 ],
									"text" : "/ 10."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 814.0, 297.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 814.0, 327.0, 54.0, 20.0 ],
									"text" : "gate 1 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 4,
									"outlettype" : [ "int", "int", "int", "int" ],
									"patching_rect" : [ 849.0, 297.0, 59.5, 20.0 ],
									"text" : "key"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 77.0, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-50",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 50.0, 81.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "some words",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 332.5, 215.90274, 37.0, 18.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 215.90274, 54.0, 20.0 ],
									"text" : "r menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 193.40274, 56.0, 20.0 ],
									"text" : "s menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 4.700932,
									"id" : "obj-205",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 266.90274, 75.75, 10.0 ],
									"text" : "clearchecks, checkitem $1 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-204",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 676.0, 102.0, 317.0, 504.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 168.0, 282.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 391.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 338.0, 32.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 365.0, 128.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 418.747559, 123.0, 20.0 ],
													"text" : "sprintf append %s%s"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 205.0, 128.5, 20.0 ],
													"text" : "t l l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-197",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 168.0, 330.747528, 106.0, 20.0 ],
													"text" : "prepend append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-196",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 23.0, 310.0, 104.0, 21.0 ],
													"text" : "regexp (.+).lab"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-150",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 168.0, 203.397827, 35.0, 20.0 ],
													"text" : "b 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-141",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 168.0, 240.247528, 86.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-151",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 97.0, 61.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-152",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 72.0, 91.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-153",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 282.0, 81.0, 20.0 ],
													"text" : "route append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-156",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 245.747528, 41.0, 20.0 ],
													"text" : "folder"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-157",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 165.247528, 91.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-158",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 128.397827, 61.0, 20.0 ],
													"text" : "route fold"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-201",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-202",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 65.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-203",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 168.0, 445.747559, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-197", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-141", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-150", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-158", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-151", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-196", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-153", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-153", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-156", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-157", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-150", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-196", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-197", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-152", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-201", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-202", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-156", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 278.5, 167.5, 75.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 12.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p filldamenu"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 7.588239,
									"frgb" : 0.0,
									"id" : "obj-200",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 105.897827, 64.0, 42.0 ],
									"text" : "drop one label file or folder full of label files"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-198",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 278.5, 243.5, 100.0, 20.0 ],
									"pattrmode" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 278.5, 105.897827, 61.0, 42.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 114.860001, 509.320007, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 467.369507, 54.0, 20.0 ],
									"text" : "sig~ -99"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 488.0, 48.0, 20.0 ],
									"text" : "dbtoa~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 447.233154, 45.0, 20.0 ],
									"text" : "r siglvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 206.5, 654.458923, 40.0, 20.0 ],
									"text" : "s ctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 463.505859, 55.0, 20.0 ],
									"text" : "r outctlvl"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 182.5, 509.320007, 67.0, 131.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~[4]",
											"parameter_shortname" : "output level",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"varname" : "live.gain~[1]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 484.136353, 43.0, 18.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 439.5, 73.0, 20.0 ],
									"text" : "s magehelp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 505.0, 584.318176, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 537.0, 584.318176, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 505.0, 616.0, 51.0, 20.0 ],
									"text" : "metro 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-44",
									"linecount" : 7,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 297.0, 552.818176, 207.0, 105.0 ],
									"text" : "The change is only effective on next synthesized (computed ?) label. If you want a permanent change from mage's default, you will need to send the message at least once each label. Easiest way to do that is to use a metro."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 608.5, 530.0, 78.0, 107.0 ],
									"tabs" : [ "overwrite", "shift", "scale", "synthetic", "noaction" ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-38",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 686.5, 530.0, 257.0, 120.0 ],
									"text" : "6th integer is the type of operation to apply :\n\n0 - overwrite old value by current value\n1 - shift old by current value\n2 - scale old by current\n3 - mage will compute duration (default) \n4 - no effect"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-37",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 529.0, 396.5, 288.0, 63.0 ],
									"text" : "control on the duration of all 5 successive states for next synthesized (or computed ?) phoneme.\nThe duration is expressed in number of frames."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-34",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 645.200012, 468.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-32",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 593.0, 468.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 542.0, 468.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-30",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 490.0, 468.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-29",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 438.0, 468.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 438.0, 494.0, 278.0, 20.0 ],
									"text" : "pak 0 0 0 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 438.0, 521.0, 154.0, 18.0 ],
									"text" : "duration $1 $2 $3 $4 $5 $6"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-17",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 710.5, 199.5, 248.0, 35.0 ],
									"text" : "gamma is another vocoder parameter which control is slightly useless."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-18",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 637.0, 195.5, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 637.0, 229.0, 67.0, 18.0 ],
									"text" : "gamma $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-14",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 710.5, 124.0, 257.0, 63.0 ],
									"text" : "alpha is one of the vocoder's parameters ; simulates the vocal track length. Default is 0.55. Should not go outside 0. - 1. range. (Shift+drag for precision tuning)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 637.0, 131.5, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 637.0, 165.0, 57.0, 18.0 ],
									"text" : "alpha $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-12",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 710.5, 70.5, 179.0, 35.0 ],
									"text" : "a quite standard though fine volume control"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 637.0, 67.5, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 637.0, 101.0, 66.0, 18.0 ],
									"text" : "volume $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 67.86364, 415.0, 78.0, 21.0 ],
									"text" : "play it safe."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 67.86364, 439.5, 92.0, 20.0 ],
									"text" : "loadmess reset"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 346.213745, 396.5, 47.0, 18.0 ],
									"text" : "labelfill"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 385.5, 371.454529, 103.0, 21.0 ],
									"text" : "fills label queue"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-91",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 318.5, 282.0, 53.0, 18.0 ],
									"text" : "label $1"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-33",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 164.0, 50.0, 81.0, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-51",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 785.200012, 297.0, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "7",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-36",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 499.0, 425.5, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "6",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-23",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 607.0, 217.0, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "5",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-22",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 607.0, 152.5, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "4",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-21",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 607.0, 88.5, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-13",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 41.51059, 424.636353, 22.706104, 22.858788 ],
									"presentation_rect" : [ 120.0, 120.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "0",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-110",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 358.787231, 371.454529, 21.853052, 22.0 ],
									"presentation_rect" : [ 90.0, 90.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-94",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 253.718628, 116.897827, 21.790001, 21.0 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 355.713745, 424.0, 192.0, 424.0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-205", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-204", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 288.0, 277.397827, 267.75, 277.397827, 267.75, 238.397827, 288.0, 238.397827 ],
									"source" : [ "obj-205", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-25", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 4 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 5 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 618.0, 638.0, 594.0, 638.0, 594.0, 548.0, 603.0, 548.0, 603.0, 524.0, 723.0, 524.0, 723.0, 486.0, 706.5, 486.0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 514.5, 638.0, 501.0, 638.0, 501.0, 557.0, 486.0, 557.0, 486.0, 545.0, 429.0, 545.0, 429.0, 490.0, 447.5, 490.0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 823.5, 375.0, 867.0, 375.0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 328.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-91", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 345.0, 86.0, 100.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p \"base controls\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-124",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 163.5, 76.5, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 114.86364, 509.318176, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 470.687683, 54.0, 20.0 ],
									"text" : "sig~ -99"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 491.318176, 48.0, 20.0 ],
									"text" : "dbtoa~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 450.551331, 45.0, 20.0 ],
									"text" : "r siglvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 206.5, 657.7771, 40.0, 20.0 ],
									"text" : "s ctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 466.824036, 55.0, 20.0 ],
									"text" : "r outctlvl"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 182.5, 509.318176, 67.0, 131.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~[2]",
											"parameter_shortname" : "output level",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"varname" : "live.gain~[1]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-15",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 487.454529, 43.0, 18.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 439.5, 73.0, 20.0 ],
									"text" : "s magehelp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-8",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 343.374512, 240.280975, 150.0, 20.0 ],
													"text" : "The default engine is slt."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-7",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ -12.787231, 260.280975, 43.0, 18.0 ],
													"text" : "set $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ -41.787231, 240.280975, 72.0, 20.0 ],
													"text" : "loadmess 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-2",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 84.0, 402.0, 287.0, 49.0 ],
													"text" : "If you have loaded n voices, you should interpolate all n voices at a time - if you don't, expect strange result."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-21",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 438.0, 307.936249, 143.0, 21.0 ],
													"text" : "Sum of all the weigths"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-18",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 251.0, 191.5, 34.0, 21.0 ],
													"text" : "bdl"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-19",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 251.469955, 117.5, 34.0, 21.0 ],
													"text" : "rms"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-20",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 251.469955, 43.14563, 34.0, 21.0 ],
													"text" : "jmk"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-17",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 3.0, 191.5, 34.0, 21.0 ],
													"text" : "clb"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-16",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 3.0, 117.5, 34.0, 21.0 ],
													"text" : "slt"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-12",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 3.212769, 43.14563, 34.0, 21.0 ],
													"text" : "awb"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-9",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 431.0, 365.780975, 150.0, 49.0 ],
													"text" : "Multiply the sum of the weights here, to obtain saturation (careful !)"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-6",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 431.0, 412.780975, 50.0, 20.0 ]
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.820369, 0.84, 0.212246, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 431.0, 442.061951, 82.0, 20.0 ],
													"text" : "s interpmultip"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "AdobeKaitiStd",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-23",
													"linecount" : 6,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 371.568115, 104.968567, 212.0, 91.0 ],
													"text" : "Once you have loaded all six engines from mage source's data/configFiles/smu-artic folder, the \"interpall\" abstraction here shows how to make sure the total of weights is always 1."
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-1",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.212769, 426.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-15",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 422.568115, 328.936249, 50.0, 20.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 8.171595,
													"frgb" : 0.0,
													"id" : "obj-376",
													"linecount" : 8,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 175.972168, 23.761227, 66.826286, 80.0 ],
													"text" : "    ________\n  (                  \\\n  0)                 )\n ∆             3   /\n   l          H  l   \n   o     HH  /\n   HHHHH  |\n         |        |\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.110359,
													"frgb" : 0.0,
													"id" : "obj-34",
													"linecount" : 6,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 174.599472, 89.912399, 70.538864, 82.0 ],
													"text" : "   cccccc\n  /    33333\n \t •     Q333\n<       3333\n  ≥      333\n   T       |"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.710993,
													"frgb" : 0.0,
													"id" : "obj-378",
													"linecount" : 5,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 174.599472, 164.537125, 76.870453, 67.0 ],
													"text" : "((())))))))\n  ⁄    ))))))       \n/°     p)))\n -       )))\n  Y    | "
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.710993,
													"frgb" : 0.0,
													"id" : "obj-379",
													"linecount" : 5,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 33.212769, 164.537125, 79.615822, 67.0 ],
													"text" : "   ( ( ( ( ) ) )\n  ( ( ( s      ô\n   ( (           .\\\n   ( (  \\        c\n         |  ---\\"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 11.110359,
													"frgb" : 0.0,
													"id" : "obj-380",
													"linecount" : 6,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 37.798725, 28.72257, 76.107719, 82.0 ],
													"text" : "   '''''''''''''''' `ı\n \"   C      <O\n\"\"               \\\n\"\"               .\\\n \"\"          _<\n     |     |/"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.710993,
													"frgb" : 0.0,
													"id" : "obj-381",
													"linecount" : 5,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 37.798725, 101.488876, 75.497765, 67.0 ],
													"text" : "   / / / / / /-\n  ////ç      <o\n  ///            .\\\n  =  \\         c\n //    |       \\"
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-384",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 340.212769, 320.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-385",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 278.212769, 320.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-386",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 216.212769, 320.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-387",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 154.212769, 320.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-388",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 92.212769, 320.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-389",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 30.212769, 320.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-392",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 9,
													"outlettype" : [ "float", "float", "float", "float", "float", "float", "float", "float", "float" ],
													"patching_rect" : [ 33.212769, 240.280975, 283.0, 20.0 ],
													"text" : "unpack 0. 0. 0. 0. 0. 0. 0. 0. 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-50",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 10.212769, 295.280975, 20.0, 20.0 ]
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-77",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 343.374512, 272.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-394",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 281.374512, 272.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-13",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 219.374512, 272.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-106",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.374512, 272.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-14",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 95.374512, 272.936249, 61.0, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.711579, 0.737236, 0.84, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-109",
													"maxclass" : "newobj",
													"numinlets" : 8,
													"numoutlets" : 7,
													"outlettype" : [ "float", "float", "float", "float", "float", "float", "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 6,
															"minor" : 1,
															"revision" : 3,
															"architecture" : "x86"
														}
,
														"rect" : [ 681.0, 85.0, 640.0, 480.0 ],
														"bglocked" : 0,
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"statusbarvisible" : 2,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"description" : "",
														"digest" : "",
														"tags" : "",
														"boxes" : [ 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-42",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 336.0, 57.0, 37.0, 18.0 ],
																	"text" : "set 1"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-41",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 391.0, 129.0, 37.0, 18.0 ],
																	"text" : "set 0"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-39",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ],
																	"patching_rect" : [ 391.0, 73.0, 60.0, 20.0 ],
																	"text" : "loadbang"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "AdobeKaitiStd",
																	"fontsize" : 12.0,
																	"frgb" : 0.0,
																	"id" : "obj-36",
																	"maxclass" : "comment",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 237.0, 263.5, 147.0, 21.0 ],
																	"text" : "<- this gives overdrive"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-34",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "bang", "float" ],
																	"patching_rect" : [ 206.5, 248.5, 32.5, 20.0 ],
																	"text" : "t b f"
																}

															}
, 															{
																"box" : 																{
																	"color" : [ 0.820369, 0.84, 0.212246, 1.0 ],
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-33",
																	"maxclass" : "newobj",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 206.5, 226.0, 80.0, 20.0 ],
																	"text" : "r interpmultip"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-32",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 250.0, 284.5, 75.0, 20.0 ],
																	"text" : "loadmess 1."
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-30",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 64.0, 278.0, 175.0, 20.0 ],
																	"text" : "vexpr $f1 * $f2 @scalarmode 1"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-31",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 372.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-28",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 372.0, 343.0, 45.0, 20.0 ],
																	"text" : "zl sum"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-29",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 313.0, 214.0, 207.0, 18.0 ],
																	"text" : "0. 0. 0.5 0. 0. 0.5"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "list of all interpolation values",
																	"id" : "obj-27",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 372.0, 298.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-26",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ],
																	"patching_rect" : [ 64.0, 185.0, 32.5, 20.0 ],
																	"text" : "+ 1"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-25",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 6,
																	"outlettype" : [ "float", "float", "float", "float", "float", "float" ],
																	"patching_rect" : [ 64.0, 343.0, 184.0, 20.0 ],
																	"text" : "unpack 0. 0. 0. 0. 0. 0."
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-24",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 64.0, 230.0, 95.0, 20.0 ],
																	"text" : "switch 2 2"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-23",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 288.0, 165.0, 45.0, 20.0 ],
																	"text" : "zl sum"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-22",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 140.0, 154.0, 32.5, 20.0 ],
																	"text" : "t l l"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-21",
																	"maxclass" : "newobj",
																	"numinlets" : 6,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 102.0, 98.0, 204.0, 20.0 ],
																	"text" : "pak 0. 0. 0. 0. 0. 0."
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-20",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 140.0, 194.0, 167.0, 20.0 ],
																	"text" : "vexpr $f1/$f2 @scalarmode 1"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-19",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ],
																	"patching_rect" : [ 64.0, 50.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-15",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 229.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-14",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 196.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-13",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 163.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-12",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 130.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-11",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 97.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-10",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 64.0, 400.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-7",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 287.0, 50.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-8",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 250.0, 50.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-3",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 213.0, 50.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-4",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 176.0, 50.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-2",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 139.0, 50.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-1",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 102.0, 50.0, 25.0, 25.0 ]
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-26", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-19", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-2", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-24", 2 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-29", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-22", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-21", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-24", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-21", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-20", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-22", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-23", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-22", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-20", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-23", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-24", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-10", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-12", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 2 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-13", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 3 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-14", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 4 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-15", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 5 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-24", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-26", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-27", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-28", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-27", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-31", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-28", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 3 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-3", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-30", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-28", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-30", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-32", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-34", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-33", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-34", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-34", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-41", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-39", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-42", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-39", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 2 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-4", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 5 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-41", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 4 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-41", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 3 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-41", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 2 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-41", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-41", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-42", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 5 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-7", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 4 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-8", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 30.212769, 295.280975, 384.355377, 20.0 ],
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"description" : "",
														"digest" : "",
														"fontface" : 0,
														"fontname" : "Arial",
														"fontsize" : 12.0,
														"globalpatchername" : "",
														"tags" : ""
													}
,
													"text" : "p interpall"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.397129,
													"id" : "obj-395",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 339.962769, 336.936249, 60.0, 28.0 ],
													"text" : "interpolate bdl $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.397129,
													"id" : "obj-396",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 277.962769, 336.936249, 60.0, 28.0 ],
													"text" : "interpolate rms $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.397129,
													"id" : "obj-397",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 215.962769, 336.936249, 60.0, 28.0 ],
													"text" : "interpolate jmk $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.397129,
													"id" : "obj-398",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 153.962769, 336.936249, 60.0, 28.0 ],
													"text" : "interpolate clb $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.397129,
													"id" : "obj-399",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 91.962769, 336.936249, 60.0, 28.0 ],
													"text" : "interpolate slt $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 10.397129,
													"id" : "obj-400",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 30.212769, 337.280975, 60.0, 28.0 ],
													"text" : "interpolate awb $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-401",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 6,
															"minor" : 1,
															"revision" : 3,
															"architecture" : "x86"
														}
,
														"rect" : [ 25.0, 69.0, 78.0, 74.0 ],
														"bglocked" : 0,
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"statusbarvisible" : 2,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"description" : "",
														"digest" : "",
														"tags" : "",
														"boxes" : [ 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-2",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 9.0, 42.0, 25.0, 25.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-1",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 9.0, 8.0, 25.0, 25.0 ]
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-2", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"midpoints" : [ 18.5, 34.0 ],
																	"source" : [ "obj-1", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 30.212769, 380.280975, 41.0, 20.0 ],
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"description" : "",
														"digest" : "",
														"fontface" : 0,
														"fontname" : "Arial",
														"fontsize" : 12.0,
														"globalpatchername" : "",
														"tags" : ""
													}
,
													"text" : "p thru"
												}

											}
, 											{
												"box" : 												{
													"floatoutput" : 1,
													"id" : "obj-402",
													"maxclass" : "slider",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 33.212769, 273.280975, 61.667709, 13.0 ],
													"size" : 1.0
												}

											}
, 											{
												"box" : 												{
													"candycane" : 8,
													"candycane2" : [ 0.145098, 0.207843, 0.356863, 0.22 ],
													"candycane3" : [ 0.294118, 0.415686, 0.717647, 0.17 ],
													"candycane4" : [ 0.439216, 0.623529, 0.07451, 0.2 ],
													"candycane5" : [ 0.588235, 0.827451, 0.431373, 0.2 ],
													"candycane6" : [ 0.733333, 0.035294, 0.788235, 0.1 ],
													"candycane7" : [ 0.882353, 0.243137, 0.14902, 0.14 ],
													"candycane8" : [ 0.027451, 0.45098, 0.505882, 0.22 ],
													"displayknob" : 2,
													"id" : "obj-403",
													"maxclass" : "nodes",
													"nodenumber" : 6,
													"nsize" : [ 0.355556, 0.342222, 0.32, 0.364445, 0.306667, 0.328889 ],
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 33.212769, 23.267395, 218.257187, 209.203064 ],
													"pointcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
													"textcolor" : [ 0.94898, 0.94898, 0.94898, 0.6 ],
													"xplace" : [ 0.23125, 0.23125, 0.218007, 0.772917, 0.739583, 0.76875 ],
													"yplace" : [ 0.112211, 0.5211, 0.83004, 0.125545, 0.516656, 0.863322 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 3 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-106", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 6 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-384", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 5 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-385", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-386", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-387", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-388", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-389", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-395", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 5 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-396", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-397", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-398", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-399", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-400", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-109", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 4 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 2 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-106", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-392", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-392", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-392", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-394", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-392", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-402", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-392", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-77", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-392", 5 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 5 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-394", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-401", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-395", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-401", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-396", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-401", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-397", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-401", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-398", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-401", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-399", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-401", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-400", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-401", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-402", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-392", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-403", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-109", 6 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-77", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 682.0, 619.318176, 266.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 12.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p \"...but what about more than two engines ??!!\""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-36",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 588.25, 579.0, 147.0, 35.0 ],
									"text" : "Ensuring this with two voices is rather easy..."
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-30",
									"maxclass" : "slider",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 500.212769, 579.0, 61.0, 13.0 ],
									"size" : 1.0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 467.712769, 572.0, 32.5, 20.0 ],
									"text" : "!- 1."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 342.712769, 542.318176, 509.698975, 21.0 ],
									"text" : "The most natural (intended) result will happen if cumulated weights of all voices is 1."
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-21",
									"maxclass" : "slider",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 345.712769, 575.5, 61.0, 13.0 ],
									"size" : 1.0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 467.712769, 597.318176, 99.0, 18.0 ],
									"text" : "interpolate slt $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 345.712769, 597.318176, 109.0, 18.0 ],
									"text" : "interpolate awb $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "int" ],
									"patching_rect" : [ 312.212769, 201.0, 130.0, 20.0 ],
									"text" : "conformpath max boot"
								}

							}
, 							{
								"box" : 								{
									"border" : 1.0,
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"id" : "obj-6",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 312.212769, 147.5, 42.712784, 43.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 312.212769, 231.0, 53.0, 18.0 ],
									"text" : "label $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 67.86364, 415.0, 78.0, 21.0 ],
									"text" : "play it safe."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 67.86364, 439.5, 92.0, 20.0 ],
									"text" : "loadmess reset"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 7.616093,
									"id" : "obj-28",
									"ignoreclick" : 1,
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 499.712769, 408.636353, 35.0, 15.0 ],
									"triangle" : 0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-27",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 342.712769, 482.636353, 375.0, 49.0 ],
									"text" : "At any moment, the cumulated interpolation weights of all the engines should not exceed 1, or it will result in saturation. You might want it at a certain point, though. Up to you."
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-25",
									"maxclass" : "slider",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 485.212769, 394.636353, 61.0, 13.0 ],
									"size" : 1.0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-24",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 541.212769, 405.636353, 175.0, 77.0 ],
									"text" : "Select one already loaded engine, then move the slider. Then select another loaded engine, move the slider again and be careful."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-23",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 438.712769, 354.0, 143.0, 35.0 ],
									"text" : "interpolation between voices."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "float" ],
									"patching_rect" : [ 485.212769, 424.636353, 32.5, 20.0 ],
									"text" : "t b f"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 376.712769, 449.0, 141.0, 20.0 ],
									"text" : "pack interpolate awb 1."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 416.712769, 394.636353, 61.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 346.712769, 291.5, 47.0, 18.0 ],
									"text" : "labelfill"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 398.712769, 256.0, 136.0, 35.0 ],
									"text" : "fills label queue with everything at once"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-108",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 366.5, 146.5, 122.0, 35.0 ],
									"text" : "drop a .lab (labels list) file here"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-107",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 196.0, 361.5, 73.0, 20.0 ],
									"text" : "print engine"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-105",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 182.5, 210.681824, 100.0, 20.0 ],
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-104",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 271.0, 100.0, 20.0 ],
									"text" : "pack l l"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-102",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 34.36364, 239.681824, 37.0, 18.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 34.36364, 271.0, 103.000008, 20.0 ],
									"text" : "prepend append"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 163.5, 239.681824, 95.0, 19.0 ],
									"text" : "regexp .+/(.*)\\\\..*"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-96",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 34.36364, 303.454529, 61.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-89",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 95.36364, 295.954529, 103.000008, 35.0 ],
									"text" : "you can revoke it any time here"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-86",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 55.36364, 334.636353, 103.0, 18.0 ],
									"text" : "engineremove $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-79",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 59.36364, 146.5, 119.0, 63.0 ],
									"text" : "drop a .slt (engine configuration informations) file here"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 334.636353, 100.0, 18.0 ],
									"text" : "engineadd $1 $2"
								}

							}
, 							{
								"box" : 								{
									"border" : 1.0,
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"id" : "obj-47",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 182.5, 156.5, 42.712784, 43.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-40",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 163.5, 49.5, 76.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "dictionary",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-39",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 163.5, 49.5, 67.712784, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-32",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 650.85498, 619.318176, 21.790001, 21.0 ],
									"presentation_rect" : [ 90.0, 90.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "6",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-35",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 312.212769, 554.5, 21.790001, 21.0 ],
									"presentation_rect" : [ 75.0, 75.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "5",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-18",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 388.712769, 373.636353, 21.790001, 21.0 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "4",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 41.51059, 424.636353, 22.706104, 22.858788 ],
									"presentation_rect" : [ 75.0, 75.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "0",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-93",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 193.0, 167.5, 21.792936, 21.0 ],
									"presentation_rect" : [ 30.0, 30.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-12",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 322.674194, 158.5, 21.790001, 21.0 ],
									"presentation_rect" : [ 75.0, 75.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-110",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 359.286255, 262.5, 21.853052, 22.0 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 321.712769, 422.25, 192.0, 422.25 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 43.86364, 258.0, 21.0, 258.0, 21.0, 300.0, 43.86364, 300.0 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 356.212769, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-14", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 355.212769, 627.0, 261.0, 627.0, 261.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 477.212769, 627.0, 261.0, 627.0, 261.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 192.0, 264.0, 306.0, 264.0, 306.0, 363.0, 426.212769, 363.0 ],
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-98", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-20", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 355.212769, 593.5, 445.212769, 593.5, 445.212769, 562.0, 477.212769, 562.0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 691.5, 651.0, 261.0, 651.0, 261.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-107", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-96", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-98", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 54.0, 86.0, 132.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p \"voices interpolation\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-53",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 663.356384, 451.5, 277.0, 21.0 ],
									"text" : "note : the label queue is only 512 labels long."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-47",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 638.356384, 521.5, 318.0, 49.0 ],
									"text" : "You can see above the size in samples of your currently loaded label file, which is sent by the third data outlet of mage~ when said files is loaded."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 77.0, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-38",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.0, 50.0, 76.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "index",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-31",
									"linecount" : 10,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 128.5, 151.0, 137.0, 148.0 ],
									"text" : "This abstraction allows one to fill the umenu with either a .lab file or a folder containing numerous .lab files, those send/receives are to share the umenu's files list through all tabs of this tutorial."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 332.5, 215.90274, 37.0, 18.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 215.90274, 54.0, 20.0 ],
									"text" : "r menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 193.40274, 56.0, 20.0 ],
									"text" : "s menus"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 4.700932,
									"id" : "obj-205",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.5, 266.90274, 75.75, 10.0 ],
									"text" : "clearchecks, checkitem $1 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-204",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 676.0, 102.0, 317.0, 504.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 168.0, 282.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 391.0, 140.0, 21.0 ],
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 338.0, 32.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 365.0, 128.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 418.747559, 123.0, 20.0 ],
													"text" : "sprintf append %s%s"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 205.0, 128.5, 20.0 ],
													"text" : "t l l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-197",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 168.0, 330.747528, 106.0, 20.0 ],
													"text" : "prepend append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-196",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 23.0, 310.0, 104.0, 21.0 ],
													"text" : "regexp (.+).lab"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-150",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 168.0, 203.397827, 35.0, 20.0 ],
													"text" : "b 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-141",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 168.0, 240.247528, 86.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-151",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 97.0, 61.0, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-152",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 23.0, 72.0, 91.5, 20.0 ],
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-153",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 282.0, 81.0, 20.0 ],
													"text" : "route append"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-156",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 23.0, 245.747528, 41.0, 20.0 ],
													"text" : "folder"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-157",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 165.247528, 91.5, 20.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-158",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 128.397827, 61.0, 20.0 ],
													"text" : "route fold"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-201",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 23.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-202",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 65.0, 12.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-203",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 168.0, 445.747559, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-197", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-141", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-150", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-158", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-151", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-141", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-152", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-196", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-153", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-153", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-156", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-157", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-150", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-157", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-158", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-196", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-197", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-152", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-201", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-151", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-202", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-156", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-203", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 278.5, 167.5, 75.0, 20.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 12.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p filldamenu"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 7.588239,
									"frgb" : 0.0,
									"id" : "obj-200",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.5, 105.897827, 64.0, 42.0 ],
									"text" : "drop one label file or folder full of label files"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-198",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 278.5, 243.5, 100.0, 20.0 ],
									"pattrmode" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 278.5, 105.897827, 61.0, 42.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-91",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 318.5, 282.0, 53.0, 18.0 ],
									"text" : "label $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 114.860001, 509.320007, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 467.369507, 54.0, 20.0 ],
									"text" : "sig~ -99"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 272.0, 488.0, 48.0, 20.0 ],
									"text" : "dbtoa~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 447.233154, 45.0, 20.0 ],
									"text" : "r siglvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 206.5, 654.458923, 40.0, 20.0 ],
									"text" : "s ctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 463.505859, 55.0, 20.0 ],
									"text" : "r outctlvl"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 182.5, 509.320007, 67.0, 131.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~[3]",
											"parameter_shortname" : "output level",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"varname" : "live.gain~[1]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 484.136353, 43.0, 18.0 ],
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 439.5, 73.0, 20.0 ],
									"text" : "s magehelp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 67.86364, 415.0, 78.0, 21.0 ],
									"text" : "play it safe."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 67.86364, 439.5, 92.0, 20.0 ],
									"text" : "loadmess reset"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-52",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 476.5, 7.0, 457.0, 21.0 ],
									"text" : "Three methods to directly jump at a given label given its position in the list :"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-50",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 757.356384, 203.0, 160.0, 63.0 ],
									"text" : "labelswitch N sends the Nth label of the list and makes labelnext point to label N + 1."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-48",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 757.356384, 105.0, 155.0, 77.0 ],
									"text" : "labelreplace N sends the Nth label of the list to Mage and makes labelnext jump to its next label,"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-45",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 757.356384, 43.0, 164.0, 49.0 ],
									"text" : "labelinsert N sends the Nth label of the list to Mage, "
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd-Regular",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-43",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 678.5, 280.0, 219.0, 35.0 ],
									"text" : "If a command reaches the end of the list, it loops back to the start."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-42",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 659.0, 186.5, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 659.0, 43.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 659.0, 117.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-37",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 659.0, 69.0, 82.0, 18.0 ],
									"text" : "labelinsert $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-36",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 659.0, 144.0, 92.0, 18.0 ],
									"text" : "labelreplace $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 659.0, 212.5, 86.0, 18.0 ],
									"text" : "labelswitch $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-32",
									"ignoreclick" : 1,
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 783.217102, 501.0, 50.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 783.217102, 475.0, 65.0, 20.0 ],
									"text" : "r labelsize"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-28",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 638.356384, 570.5, 328.0, 120.0 ],
									"text" : "If you use labelfill or labelfilluntilend and your label file contains more than 512 labels or if you try filling the queue with more than 512 elements, it will freeze once it reaches the 512th label. Once the queue has read that 512th element which is frozen, the queue is empty ; therefore you can refill it with the rest of the labels list using labelnext, labelnextvowel or labelfilluntilend."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-16",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 767.717102, 346.0, 124.0, 35.0 ],
									"text" : "empties the queue, all at once"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-14",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 714.717102, 389.0, 62.0, 18.0 ],
									"text" : "labelclear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 423.212769, 632.818176, 89.0, 18.0 ],
									"text" : "labelfilluntilend"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-12",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 453.212769, 580.5, 168.0, 49.0 ],
									"text" : "fills label queue from your current position in the label list to the very end"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 423.212769, 559.5, 89.0, 18.0 ],
									"text" : "labelnextvowel"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-9",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 453.212769, 506.0, 138.0, 49.0 ],
									"text" : "fills label queue until the next vowel or silence label"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 423.212769, 480.0, 59.0, 18.0 ],
									"text" : "labelnext"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-5",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 453.212769, 441.5, 133.0, 35.0 ],
									"text" : "fills label queue with only the next label"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 423.212769, 397.5, 47.0, 18.0 ],
									"text" : "labelfill"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 452.212769, 359.5, 136.0, 35.0 ],
									"text" : "fills label queue with everything at once"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-33",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 164.0, 50.0, 41.712784, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-51",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 599.359741, 48.0, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "7",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-25",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 729.146973, 359.5, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "6",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-13",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 41.51059, 424.636353, 22.706104, 22.858788 ],
									"presentation_rect" : [ 90.0, 90.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "0",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-24",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 426.0, 604.0, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "5",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-23",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 426.0, 527.5, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "4",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-22",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 426.0, 448.5, 21.853052, 22.0 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-110",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 426.0, 367.454529, 21.790001, 21.0 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-94",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 253.718628, 116.897827, 21.790001, 21.0 ],
									"presentation_rect" : [ 75.0, 75.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 432.712769, 651.0, 288.0, 651.0, 288.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 432.712769, 424.0, 192.0, 424.0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 724.217102, 424.0, 633.0, 424.0, 633.0, 342.0, 400.0, 342.0, 400.0, 424.0, 192.0, 424.0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-18", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-205", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-198", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-204", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 288.0, 277.397827, 267.75, 277.397827, 267.75, 238.397827, 288.0, 238.397827 ],
									"source" : [ "obj-205", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 432.712769, 498.0, 288.0, 498.0, 288.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 432.712769, 579.0, 288.0, 579.0, 288.0, 423.0, 192.0, 423.0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-198", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 328.0, 423.25, 192.0, 423.25 ],
									"source" : [ "obj-91", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 186.0, 86.0, 159.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p \"labels queue commands\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 3,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 967.0, 693.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 224.0, 92.5, 150.0, 20.0 ],
									"text" : "step-by-step tutorial"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 1,
											"revision" : 3,
											"architecture" : "x86"
										}
,
										"rect" : [ 564.0, 150.0, 372.0, 473.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 10.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-15",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 1.0, 444.0, 363.0, 20.0 ],
													"text" : "/* ----------------------------------------------------------------------------- */"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-14",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 124.0, 418.0, 206.5, 20.0 ],
													"text" : "Nicolas d'Alessandro, Thierry Dutoit"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-13",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 175.0, 326.0, 130.0, 21.0 ],
													"text" : "( www.numediart.org )\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-11",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 65.5, 398.0, 265.0, 20.0 ],
													"text" : "Maria Astrinaki, Alexis Moinet, Geoffrey Wilfart, "
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-10",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.0, 377.0, 265.0, 21.0 ],
													"text" : "Developed by :\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-9",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 64.0, 344.0, 268.0, 21.0 ],
													"text" : "Acapela Group ( www.acapela-group.com )\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-8",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 64.0, 310.0, 212.0, 20.0 ],
													"text" : "Numediart Institute for New Media Art "
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-7",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.0, 290.0, 268.0, 20.0 ],
													"text" : "Copyright 2011 University of Mons :"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-6",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.0, 233.0, 298.0, 47.0 ],
													"text" : "You should have received a copy of the GNU General Public License along with MAGE / pHTS. If not, see http://www.gnu.org/licenses\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-5",
													"linecount" : 6,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.0, 144.0, 298.0, 87.0 ],
													"text" : "MAGE / pHTS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-4",
													"linecount" : 5,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.0, 69.0, 301.0, 74.0 ],
													"text" : "MAGE / pHTS is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the license, or any later version.\n"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-3",
													"linecount" : 2,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.0, 28.0, 298.0, 33.0 ],
													"text" : "This file is part of MAGE / pHTS (the performative HMM-based speech synthesis system)"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"frgb" : 0.0,
													"id" : "obj-2",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 1.0, 8.0, 363.0, 20.0 ],
													"text" : "/* ----------------------------------------------------------------------------- */"
												}

											}
 ],
										"lines" : [  ]
									}
,
									"patching_rect" : [ 783.0, 81.0, 50.0, 18.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 10.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 10.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p licence"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-39",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 850.0, 565.0, 55.0, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 850.0, 565.0, 66.0, 21.0 ],
									"prototypename" : "magefont",
									"text" : "glossary",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-18",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 682.0, 565.0, 239.0, 35.0 ],
									"text" : "Confused by a word ? try the             , and get even more confused !"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 741.0, 600.0, 92.0, 20.0 ],
									"text" : "mage_glossary"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 196.0, 462.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 34.36364, 376.5, 60.0, 18.0 ],
									"text" : "delete $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 292.683319, 623.725769, 49.0, 20.0 ],
									"text" : "zl nth 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 292.683319, 650.725769, 47.0, 20.0 ],
									"text" : "s siglvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 145.856384, 495.266846, 38.0, 20.0 ],
									"text" : "r ctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 233.0, 650.725769, 57.0, 20.0 ],
									"text" : "s outctlvl"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 342.403381, 411.0, 62.0, 18.0 ],
									"text" : "labelclear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 246.0, 462.0, 67.0, 20.0 ],
									"text" : "s labelsize"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 196.0, 411.0, 71.0, 20.0 ],
									"text" : "r magehelp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-90",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 339.58136, 581.407593, 116.710724, 33.0 ],
									"text" : "mage works better at 48000 Hz."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-317",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 494.973755, 527.912476, 30.0, 20.0 ],
									"text" : "s sr"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.825288,
									"hidden" : 1,
									"id" : "obj-162",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 281.829742, 495.266846, 57.853584, 20.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.352581,
									"id" : "obj-161",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 291.067413, 522.5849, 30.254025, 17.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"fontname" : "Arial",
									"fontsize" : 11.96198,
									"frgb" : 0.0,
									"id" : "obj-131",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 409.487305, 550.766846, 151.0, 24.0 ],
									"text" : "choose a sampling rate"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"fontname" : "Arial",
									"fontsize" : 11.96198,
									"frgb" : 0.0,
									"id" : "obj-134",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 360.675842, 495.266846, 191.62294, 24.0 ],
									"text" : "report sampling rate choices"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.825288,
									"id" : "obj-135",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 443.774628, 527.912476, 51.19912, 20.0 ],
									"presentation_rect" : [ 315.0, 315.0, 50.0, 20.0 ],
									"triangle" : 0,
									"triscale" : 0.9
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-136",
									"items" : [ 44100, ",", 48000, ",", 88200, ",", 96000 ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 339.58136, 550.766846, 64.588486, 21.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-137",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 339.58136, 495.266846, 19.191378, 19.191378 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.825288,
									"id" : "obj-138",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "int" ],
									"patching_rect" : [ 339.58136, 527.912476, 102.398239, 20.0 ],
									"text" : "adstatus sr"
								}

							}
, 							{
								"box" : 								{
									"handoff" : "",
									"id" : "obj-22",
									"maxclass" : "ubutton",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "", "int" ],
									"patching_rect" : [ 504.0, 99.0, 150.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-21",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 504.0, 128.5, 255.0, 32.0 ],
									"text" : ";\rmax launchbrowser http://mage.numediart.org"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-17",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 504.0, 99.0, 150.0, 20.0 ],
									"text" : "http://mage.numediart.org/",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"underline" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 27.600929,
									"frgb" : 0.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 193.0, 6.5, 100.0, 39.0 ],
									"text" : "mage~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "int" ],
									"patching_rect" : [ 314.5, 210.0, 130.0, 20.0 ],
									"text" : "conformpath max boot"
								}

							}
, 							{
								"box" : 								{
									"border" : 1.0,
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"id" : "obj-95",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 314.5, 156.5, 42.712784, 43.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-91",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 314.5, 240.0, 53.0, 18.0 ],
									"text" : "label $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 68.220032, 415.0, 78.0, 21.0 ],
									"text" : "play it safe."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 68.220032, 439.5, 92.0, 20.0 ],
									"text" : "loadmess reset"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 436.356384, 412.0, 47.0, 18.0 ],
									"text" : "labelfill"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-116",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 504.0, 79.0, 264.0, 20.0 ],
									"text" : "numediart | University of Mons | Acapela Group"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 14.315886,
									"frgb" : 0.0,
									"id" : "obj-114",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 152.0, 71.5, 161.0, 23.0 ],
									"text" : "as a MaxMSP external"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 19.240288,
									"frgb" : 0.0,
									"id" : "obj-113",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 145.856384, 45.5, 488.0, 29.0 ],
									"text" : "hmm-based performative speech synthesis toolkit"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"linecount" : 8,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 491.0, 334.636353, 176.0, 120.0 ],
									"text" : "fill mage's label queue with this message - as soon as there is something in the label queue, mage will synthesize it and remove it - \"labelfill\" fills the queue with the whole label list currently loaded"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-108",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 366.5, 146.5, 122.0, 35.0 ],
									"text" : "drop a .lab (labels list) file here"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-107",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 196.0, 361.5, 75.0, 33.0 ],
									"text" : "print engine @popup 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-105",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 182.5, 210.681824, 100.0, 20.0 ],
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-104",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 271.0, 100.0, 20.0 ],
									"text" : "pack l l"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-102",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 34.36364, 239.681824, 37.0, 18.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 34.36364, 271.0, 103.000008, 20.0 ],
									"text" : "prepend append"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595187,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 163.5, 239.681824, 95.0, 19.0 ],
									"text" : "regexp .+/(.*)\\\\..*"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-96",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 34.36364, 303.454529, 61.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-89",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 95.36364, 295.954529, 103.000008, 35.0 ],
									"text" : "you can revoke it any time here"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-86",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 55.36364, 334.636353, 103.0, 18.0 ],
									"text" : "engineremove $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "AdobeKaitiStd",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-79",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 59.36364, 146.5, 119.0, 63.0 ],
									"text" : "drop a .slt (engine configuration informations) file here"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 9240, "png", "IBkSG0fBZn....PCIgDQRA...rG...fdHX....vmaxh1....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cdGkjcUem+y89dUrSS2S2STwQgQn.BoAgD1qPFA3EzhAQPBSxlCAkVXcPXu1m0qw9v4fLdMgEyAVhBgjHHIPfwDDAIDf.EXzLZDLAoQStSSGpt5J+B269Gu6q5ppt5tqp5pCy.e6yzRcUuv889du+t+R2eWAmjfGh+73cQrd8Q0mMxM.hsIv5rz3sdMpA7P1uMh0.zsMhn9nc7QWDz4EHSCbDKj61B1u.0ylA2g8QO5KgaerU5ms1EDqzMfVE6jasCE4uXP+xjHddBzazGNUfSIF1wz.fFs43q8ugJe3EHL+sv7+W.OWfmwBwdllhClG2mb.54GOJxItF92Ksz+D19wILj8ugqKZQ58RDXcwBzWoF8KIBx0YgU7HXgBE9nwGcMTZqAABrQfERTno.tZAhLEvavnX+y.8uJCYejWJ209aCOdKKXUMY+PbU1qgKXqZTuVAbsBDmWRh1kBEdnPQsiUW5P3ndIBrQhFHOtCVD2mxG8WZbx9nuN95GcYowzhXUIY+T79NEebdC1X8p7QcUwIRbMfOJTKSjai.KjHQfBM4nzn.euonz2IME9tWO2qyJc6qVrphreJtospP7N.dGQvZC1HwwHXd0NrPRDjjGWuR3c.A5Oywn3c8F3tN9JcaKDqJH6mja77A4sXi70GEqM5gOpUwTrn7uCZiyzN0kEyagf73r2z374OLo9R+47slXko0NCVQI6Gma5BsgaUf3MFG6NCTvRsR1jlEBeA4anTABJhKdnIJRhSDhXFUKQRI7HGNTBerQRDrnDt6eLx8Y+A7Te5OE6N6J8yxxJ1A+EqAJ8dDH9qSPjM3XFIuZCFkvJOZEzrA5jDXil.h2xnzVnBbgcXCedjHn.dLJYwA+cNN49fCx99N2Ha2c494YYmr2A27+MM7OEG6WnZU1HYAB7vG.bQQRroChhMR5kDXivzZqTvc8tNy9SjHPilTTPKQ7iyh2e24vG+IWRdPlCrrQ1OEu6SwkH+CVv6JN11NlWpqzP.nL1m6fOcPD5hXzOIA.Kyqn1kjGKDDAKlhBSMN4usGlC8IuQ9Oy2Vt3K.VVH6eM2vebDr+3ww94UZUl10kvCEZ5jnrN5fjDor4TKkHvrMHEEd3QH6e0Kf+e6XI8FxRLYq4pr2Im+sZg7evFQmtqBDYKfxdZyFA8Pb5k3DEKil0KecDE.wvloozXSR1+hylO4Wco99sjfsy67zkD8iFE6WuB8pFEvBm9X.RxZIIVl4RWIacQvh73nGi7ereHC+AdubuKIZrujP1ON2zkDCwWNFQtvR3sTbKZZ3abuZ2Fw0QwZUSGPfxZ7OLY+wOKC81d470FsceOZ6j814VdY1vWLJVm1pAkvzFQ1cQTVKIMlMsZRqgYPnX8QI6NOJS9VuBt8c2tu9sMrCt4q0Bwm0FqAbWEPzdnHFVL.IoShAr7Nmbqh3XSJJ9LGhwe6WFegGucccaaj8ula5lif7+iMxN7VAUDKTALG7oeRx5HY4vTdhDhgMoo3vGfIuoWDet+i1w0rsP16fa9FrQ7IEHh3uB9RU.TBejH3TnK5hXmvQxUhXXwTTL0NYz2xqf63GrXudKZxdGbiuNIV2gEhtVIIZMAhs6fHrY5BKjmPHxdgPTrXJJcr8wHW2Uxc7nKlq0hhreRtwWgMxuhEV8uRJ5VYh1z.jjdH1IATb0HFVjhhGXeL1q+J41epV85zxj8ula3xiRj62FwFWIcVhOJhfEmJcSDrNoXzb8PbrYHl9Y9Mb7W10vcerV4ZX0JmziyMepQw59hh0YtRRzN3S2DiMS2DwjpPmrBOTzKIVqK9WxVYs2+Of82zI8XSS1OCuuXd3+ERf8UtRZGcdbY.RxFoSSDkN4G9nYcj7LSPrt+L7q+dM64Ka1Sn.t2ZLhbsqTDsFvEe1HcxFnqZxTjStgFMdnYKzyM+37dd6M642TireBtwqQh7SI.6UhWvZzXgfMQ2zGINg1rpVEZfXXKrQdUWAm4O4d4oGtQO2Flr2A23YXi7qDEq0sRXhUPTpjrY5ljD4jVEwZDnPyZHdBaDmeZJdO6hQanrdogH6O.e.44R9OVRhb0K2huC7HlBar3ToKhYBE4I5nx7Pu1eZDij7QSej3z1Hcouc1wC1n2yEDama90aC2CHZIs2aUH.bPQTjbZzyIrlVU4xJB.EPQbws7DQUmkpQQRLrw1zUPOGgH1BISRgB+bdtq9Ok6eAc3xBR1OIuuAD38Shi8EsbOp1EehfEmIqwD24SLP3nUeTFBUyDjmb3hkYIEkGGJVQV6nIP7bXju5fHlzQ1idHF8SGHIH12vLoIUbrYeLwO8cw25ZdTNVg4qcsfiTuI11eaBru9kShNTz8IJD8LibC9IEEXRJPJJvAIEiRNbvGW7wAEgw32xDC6v+ElRxPfODJhOdnn.dLLYHso6gBMIHBXReptH5YbNrlCcm7zyaBLNuj814le9VH9TZHwx4KaezDEKN8U4Ds.vFIt3SNbYDxxwHMooHonHtlPrFwLVWVwbzK70VT0b5gNMZJJxTTjzThnXQLrHdPVqewqine8GjiLmY4xbR12CWm0ZI4skjHu3kSujoL4F1oPOqZ8JVnSbJfKGfo33jiQHKgwGPhfnkyl71KBWeYdnXBxSVbwFAajNWiChh2EO0bpr1b1Z1N271rP+KjXEe4ToHEZNUi4UqlritxEAvTTfwo.SSQrLK0mUBIPB.OSd2rY5lR3MwCxQdg2Le6CUuiutdPSiVHP+WFiHKqDsCJ1fIcdWMQzVHnD9LDSydYLNLSQQbIA1lk8yJyTMZlYd+iRZ.V6oSWuu453qqX7WCGeaQP9gzPrkqGhh3wlnK5k3qJHZAAhicQwQHMGkoICNHHPT5RgH5ECrLq30R3tksxZu+GhCkp1iotirEvMDE6tWtdo6X70ceqRHZIBbPwfLM+FNNon.1HIFVq5H4JgFMCPGqeizyatde+rFY+TbSaUi3ixxjF39noahx5oyUbGlHMyIOJ43HjloMZ7FLR9DCXgfB3bNNn9x6kwqxt6YMx1A8aLNV8tbLBKbQ8sd5fUxXWMi8wE4YYBFgoAzDq0B2+JJ7Py5oqMeorw2PseWUj8CvaqCaju5kCQUg4t8YPOkqQIqDPhfrThmgI3.LINFu1IVEae+7Acv5VStU5+0tM1VjJ+tpH60QGWfDwKb4vaYdnXSzEwMq04kaDtDZODSw9XBJfCQMBrOQjjqDASMF6pesz8Vp7ykUePh2TTrrWpaLkvm0Pb5YEHUeC0xdJJxdYblf7DyLu7IKvGECPx38SxquxOu7S3uj2Ue1vqZoVIoPEx1DctrSzAddRyQHMGfT3ihnm.Nubi.IB5iNd0mODclOyfXXcIBjm8RYkPHbIwtA5bYWToDAooH6liyDjur+pOYEZftHxE7GvkdogeVYxVf8KHIQhrT5EbO7YSzU40B8xABcy4PjgmiTnMY7xI6PgldIQGWHq6BB+LIDjIJRzW8RY.ObPQ2DitWFmmNzCXGhoXXxPDjmTM277AEZRRD5jnWMlXfHA3Ogg6Si9EsTIBWglXHYSzIKW1SGXRkC6mIIMEOoct44CJTzMwupafsk.JKFWdEBDqYohF7PwFnSjKC1SGNK7XjiCPJ7vubQv420fOZFfj82KwuTvP1B3phgsc6VSbAAkXpf0Gczkbw2BSlabHlhgHS44q+cUnQSBrisVR9J.vN3WhyJXtr1qyTBS+20tLji2RDjCGNDSgK9+NybyyGzDjyZcS7yE.6GhaoSE5MtTLesGJNc5YI2qTRjLN43njtbHH+8H.RDzKw1.fkcW30mOxSq0S7+5edt3SuDmNHZEQypwpGfMy8QhfwHCGkzUk5sAcuZrbvdgtGMFlu6SXhB2pSor3lJxF6y3UvyOtsGt8lf3aP0BirEQrvpujfn1FiFo.VuaWDDkMe.KDqqSPJmo86oPOQdP4Qf5C06gRiHVDnuDyhKD.SPdFEIIouZ9RA5Rd3MYVC4O2i103i.IxDwPDs0zZWkyAsW8lFTiUWIP1YLP2Zcl7lHGZWOZEROHKcEmxUyoF0NNQNqHXIaVar03ShK7T4z+FuGjIiDPhhJ+dHhO38vGD2a6mQj+lqDqW9YUkabPoQORFb+nOBd20N.+Z68qQrgtH929sg3zWCHEk6XEdTqGeV+bnFl1WQle9yxQ9quWJczwqKgqEZ560borg+pWAwNm0gvpIlBPCnTnc84f23cQpG3oPhcEesGccEmKa4NeWX0cbDBQSwWZsFTZxs8Cyy8V973mNOMKgqA5l31QYzj1RjWZqp7jHpE1arGjwswepBncC5YKQfTHf0DC6q+hv5ke1H5KATvEc1vBruFrDHe9afXewWOD0BuO2iQ04SgBwYsVjW7FgXVnmpHXtGNnV.gzZr5LF88F2FBKI6+M+YPWxupyPiOIO+Sgy5te2H6HF9SWDsupwdepAgkDqtiCJMxDQoVQOZTDeqaf3m8.fVi2j4QnloTVW4QFdlhxeBXEMBhdhSmuvyfnanGxmNKhlzeAg4XdQXs1tvoFcgOm5CcvubO1T7bW4GEuT4wSp3z08PLgMxKayD61eCH1TWndjiPo2+2G8dG2TW10PLI12vkSzOvKkn+ueo3801Ejod61BZzGNMEu5u.pIxwvxbk8u8b1z78I4kb5bt2+sP2uryinqaMT7niOqWxcd4aAYGwX5exd4f2xchtfWclVp9O6VcDky99tIRb9arrHZQs+174S9M2AG3luSJ55fqHbONQahBmbVEDWsRQhyZ8bY+n+mfVSk5TEd0aTSksQfCxtsUnVeKV.FBtkBApLEv4PigaP0AfX3hFG7+g6C+evyf86ba3dW6D+G8YQXpGYAPi6+xCSj+rW.hynWjm2.ndhiPUsGo.rjPlR3efw4nLc4bBa9pchZTjeWGCmASQhKXSPTKpmBX1CzE.jamGg7OyQPVU6agfF2gSShKXSkSneWTTBeSZ95PLBJPBSbvg3nicLzlJqnxj9FUtZRpdqoRQrC5iyT4HRWIXBJvjjlnDktIJBDjvjlEKjj4fk4qHosBV2h1rHg.soJ6tV5H7CAjPnX6BNl4LqbTi.b8Pmp.hszGhthW6EF8HYfzkv6no3Pl7Bytg5bJBl+UHZHkrEVRBKU7MvU1Pl9nMG9jTfiQFrHBEMcCE3QulatvRh1blVMfvXMBrsrBlmmftARS8baRJhGpxoxb2l0DRP2k5e0hhLtMn6cgeUrPO7AlZETSPqo.yEJRbNEMNiRWyVaUI7rSP9W0WhCO1vFhtQTfxrtGc8aYMfqoEZtpAHiovUmGGNC7nGBz50GEBStqoA7Whx3mfUbhEdls7pLjgNHBqg3DqN0jUyB3OlsEhdVrAmvCMwwdIIUf0.G4IdZljhDg5kDMgqBRU4+YQThzWWj7hNEr5sCzpVTATCMGtmfj1PxgEj9vM4sviMLGTaauAVfKTX6KBBJZ1ZJ5fnziIom0UcrD0VhrqESiSatoqkDl4OZePhfCQZljRDAazn.CgFrULDAYrHH6LNw255IwEtIR771DwOq9I5YzOwNy9wpyXnJ13aGGgEVdezjkRTDOJEHvlHXUVQp4SnYcgPP39IXi.MJzJEBYiYpUXGsooD4vgMPmkWqbZf3XGw1B4hNmyhhkIN0sOHQvfLMSPNhh.MdDoudH1Y1OQO09H9V5mDWzlI4EsYhctqGqNiWsc9t93OUdnyFSgqPpaJJRI7IKNkW7+VFqmWLCJ13qYa3mqHpRMn19JMwOkdIwotVJMVlF6bHXUkpPywIGCXlVEBVRWskjKrcGWIKDLHYXXxRLDD6LWGa9e5OgNewmEQ2TOH6XFBTUxCuwyPo8ebJrmgovtFj7+lAo3gFCqDw4btuajHat9pkToc54vkAIiofdHJG+aQaRzbGaYcr0+WutV6jc8wOeiW1yBWrCGmrrN5fXXiC99K4YRZyBIRNFSaHZIhn1blew2Ac+GctfRQg8NB4e5AovucHJs+iSoCMINGdBbFJE5JTHRilHqoa7yTjn0HJLz+44virDHhOzTn4y18ECxr6iwgt8eJZG+.yIaBjcuCQgiNAxlvD4voiFiBrY5DeztKJxNb23pcMxVBLDYXDxQbyNmahydcz4kel3MQV1207uSgcOHp7tnTt.JioRgKy8JebTHrspx8pgK41B3PFbvEGFnhNHKkQ9dzGXWr2+s6qgLsa1PfEMuquBFgqHMN3gp0I6PEMZeufDLIEYHxPThTVGaqd6.gk.2gRS1Ge+keYIqql4yMbPwDTfRnMYuhrbGfkKXQzl1cmU66rlGRDjgRjGmRsrLKeB1djjsIwdZTLIEl2kPWvKpFKrk0544iSNxgCJiBWmH.MZ557NU56RNKVLZMXRri7szScnn6dI9hpQTKZ1nOOWPZr6bRJfC9DrwmKOgJSw0nIRWI3R+b2.uvux6k3arOiImMGBJuX9jGx1zjcn2xVqY6XXwfPmSDFd0EKQDr8JpXTxxnji73UVYrS7fFY7Hj3zVKwFnGhzSxV54PX53KwahldNaEAo8SOMU.CpWiHfnO.o3LwiXKDUqAEdTOIIg0VjooDooX4Begnj+BJ3QqLczDBT3RyT6dEnaX2wpUJy0uwFcpQgpnGZ+.mqrXb6afG.sS2BjshtHFwvFsvz.lOdRvbdLGkoIGNXIjy4wf.zJHxF6l9u9q.uIyV0AJHP+gIHOIA5xHpVghNN0AH9l6Es+b8hRP9CNF.rt+qWLm109GgW1BMjvdMfcxXzwYsg42crlKUeWw4vldkWNJO+FRBlFEIOs0Q702CdYJ1.mQ8gEBJh+DOKiTpoH6JSMXEZjk7gXVySmUcPx..f2LuPjHXXxZBUo.TJPFjFQ0x3ZGejQjHGnKN6u9MzLM2ZZ7y9Ur.Ii+K1KSuqiP2O+Siq39u0V5Rqbm6.dD1Qas+gak+fu+eWKc88y6Ly6wlDZ.W7GbO35zTjsGZVCwKuWRq1yX39g+YndlIn9ITmFu642hHQD7ejCClTBbBxyPLsYMeoXjO9CRGa6zI+SMXU1gJPRwe6fLxm7gH9Y1eUO.EvsgU2R43ge1hyp8IPRgQljG6M9w3LdOWMIOiAPFKR8uH0BMXkHB8+Rddfc8E8KwhI9U6ii7k+YDo2NZYcYm5IOHElizppAZljCuQNLG1Q7TbKMbSv0T5pprVeqK+Ret523yLyzaQFJwyxjDoBcuCJY5JjlRzXsMWM9HDA91pH9LN4wGUyUoSlmmRM93iafcvh5mjC065IhH4Jen+QV6e3V4Qu1OBC9s+UlmgJOr.eyIEst20UZWieEZNUXCcmziyw9T2F+7+6M7HaMAptzSMgwTvBMRvhvcgZG74HlT9s5Fk87ZcsDazZESRIllRDjVDMYTmV.62CRHBcfBBMHTtdKXD0B2lzalqasn1NPMJDHHKNpTj+Qf4d33rfFMcG3s5V1TliPZbvuoVxrBD3XFM2rmayiVXjSUtic1I5PqbcaWP.LNExNAE9EPCR1BD3heKatk.AGloZ5USoffrBYRJZlnX40yW0qjxpYlflnPEjtuDLEWQ7JWP7jTYgos5ye4xteABljB69dY2CAMHYGluSIZgsqgfUrQdRQgFlnCe4LFEHONF6la+n5B9d.4oLYhhOA1mVBe7LAKIzIRgofjBE9wC9rIEE3XLM1DsbME21j0npJdqEEK5xHgr5raocunJETJHpdOLDjTbMnX7fE1sEhlxs7A9j0kiQ5F1aaAhs8LAsn8H1tVcvgfWt4wEGSxAVBW76LFVcGCgNLDgA0P0vVPn8FVZv1VvVd0uX5+h2RfiO77JOJVYT4K7ZW4ar7HJW2viiMcRLrQXRyf12F2t.XZJ4OBo+Uge1BR1AdmRQ+jroHZAPI734XxF1mzAQnwgIHOg9ydwfvQMkLoCjK9jAGbvGIAOWtnPgGa9h2Jux63ugncmbguvZMBKK59zWG.TX7zLwtORUwadV4OdMvxL033jCIfko1guFRTtrYtXncIBFmBGZPl9wB+rEjrCrsNA1z7qDyiPZSTlZLgvSRAlhRsbBDTYtW6hhzTBEJJfKdUYpl1DdDHBxf8kWMDIYLRtt0T1EpyKzPoTYI09Ghm3195j5.C1TIWPHBe23ihblzgpChPmDitHFsp.dMPJx+vOLGdjvOadIagoQjD6lpmljfBVSXs+b9uGBTn33TfR31zDc3XGEZxEHLlzTrrhTgsmp6vUcmOKrYrccP9JW1+CrhEorRWMB7J3PorYaIht1miP4e4wkb3PVbXsjfXX2TYsaXkgJCktmJ+74krCpEJVzcSjhvRDLMkXTx1.DcfnzQHaSGm4vQwNnHKkHGtTBuJrAGZV05JlNSSc7gsjEKQWKBSqh73PAboeRR2DuoFrMJYe1syvOQke9BJFOnTRsvKwDXlvedXlZAEcKHvaXiQNiCaZLhITBiI6KHKtkU4ZwV6TZsTFZoCgEwfwHGt3SeMPA8MLjlGjz+vGkiMYke27R19nYyzUSMqwgXJ7PMuJWIHHUYRYretQH5v8EirThonnI+2zUbtmnjVBMGBEuG7LCCv7q.oEBNHoyNDY9x09cyIYGNecipQrERFgrjEmEjnmjBjgRMjX6PRNEEHqQS5vR79IN4cxhGASOVjHHmy8gzvoEGlbe+uE69wq86mSx1CMcQrFppAGpPvwH87NOsf.MtSu.ZbGRg9nYZyVaTvxtoVEs9cKDVfcSRj5tMUFD53bkNJY+b067mSxNb4j1HNRwif8QiERS5wMiniLOcHBW1qYMYcRnISm3TK+W5PngkiQN1LcW2i3Xj9WtK14CWuyeNIaIBVGcrfJlIBtAlhx9rI6POJMN4IOdyIQGp3UvlTVAbQYV.s+dRtRD5rpooDqoBqjrPvwIGGio+L6FpWEMXtIaWTKXAkMT78TTXNH5f4aGm7TBu5NWdncxEvkTTnbRI76xhqaDjCG5th.SoANHS9id.F46LWmScIaeTrNRvBEw3v3SWOEkpLzjdnpqxXgQSaJi3cn4sM92EgDAELqtz3XiERNDSUXeL0GbXFN+bcdyhrCyyL6Ev+rAqxxL00LqfDUviQmCanCutoL65cU6JyeOZTT.ORPDSLHRcOeCd5e97c7yhrU.IIBII5bNpNz7oII+rz9Nbz5njCndDMT.GSTsBxq61MQ2JWsSzxrbAPVbX.RxdH0D6gI9WVnyYVjcPP4wrv5lKa4B1pBqcd5vvSNJ4K+2U9cA0CjBjlhPUNDo0Ps1ZGDiYJGlvJkJUSUHnp1U30wt7eMS8bX0bm.IPJJxAXhOwOjmYuKzwWWw3KjsxGkoMh5qLSPEkEcG92U9cEwkwIGkBhwDMy3uJCTXkDYPUQvu7FRtG9lTWLLM+XNslXlzHRXLwLXG4al0CpEwwhnl7ialNVqN5.D91a2L9C9XL3GoQNmYQ1dn4Tn9K0DQYsuKV0n5PkwNN4oRZNTAuTTjTjmFczrnl+OG7vAeSouv0TYSBSMnZWQoUqt37c2pbzuG9UTkin7zKg+zoIScrQRbiLfYF+u7CKDLBYScHl58uKFMWibNUQ1giNmK2PpHX+ozpF5HfnyYbDinpq0XjiB3YNm4KCOmQTuKJbvmooDdljNv03ZmZyKr1kaSq20QQXEIARgGSRQrQRTrJWRphgrbo5Z4ZLuYimSODY+m+ZrqcznmWUjsBEqkjDkYWw+Cz9NKEqvwHgZtO1rHZXJJPJJfddhFUkhEyiO4oDkLIavLdsaFJdkTe8v6uBMEviB.SiC1HHIQnKhRGDshw6KUsi.2HeLx7s9ILwmoYN2pHaWTzkIQ4ps7IV.OFmbU4ALeimw7MhmCePGi7LMEKKFr1Fa3H3B3RA7JWxoBq44UmFSq9LIqxVjOAkLqrlc7udHNcWNexVJt2BNLSsuiPo2+g4vM0h.qJxNbi2tdyVOLYLiAm4QcLxiSEt0rDdLF4o.tyZzbXM9vAkIVzdFmhpK2k3DUasCI1h3SQxRZhPeDmNayizsPvnjezQH2636xSefl87qhrCp57UmUJRDjhBLIEHtw8oBBRy2.Q5Aknxr3vXjCkg7gpSX9LThr3xz3TVe5kBarWIQ3ScQ7XHxPODm9HQcmVrYgEBlhRNCR1a8d3oezV4ZTEY6T1rHLM6.Q6CQ1xM3v7.OKkHJ1lfWD3fkJmYUZzPOGtLEEwwjtAyHh9jGRtVD97klhjCWVOcPWDoEpaBAHHFDk3fj9e9N3Iu6VscUlr0.qwrj3C6EJPXrM1yT7zDLN4IiY9IEZFkrT.mplm0EEonHYM4kcshoqbDek+25AcM+tRs.Vs2cILPPCQF1.cQOsvNfT39S1gYp+suD63CuXZOkIaW7oK5fPqiCGUebxV1l5oonQQj.E3FhoMIxevqcOS56lxjD70NObkN6HvgGpY43iJ6.Le9kuRGhDl8nqF21ECe5GgrHnS5tIH7v.dbHR++8KvN96YQt8LYG1f7Ylhcd3HniSlxY8YI7Hkop.6fOiPVbMwvNH8cKQZSp7FpWtGAE1ovZAZkD3LROZdnpnKQkWGqxjtU4TWZ0BBS5f3Fazajr+Ifnm5S74Y6ueXdKu5MDrgffezIQIgY4tH.JhGGmbDAoIceygEAwc93jyLxUX7NVAypt.iITy3xx4BsKhnVyf7MZ7GVRJWppXgMKBc9zjTj0u.YIZ3Ji4vj9197r8+QZCDMXH6PSpBC9gDAiPVBpPdvvjEIAQYYBxi1zvCTTKP0qfZeckystxBeiyO7Ld7Z0PxPX77E8Sh4zJDKDLFEJMHo+P2N67CRazGMFxNXzc37eYvkon.VHYLSfMBR82B3ilTTjwMYURk9lNDq7uVmAtlNhwvZUwluZXUcp1LDMTGjgI2XCR522cxt95s66sMDPvCT9lKXTxf.ISSIJZlOdJic0CSViZYqFh8SigPGd.yeD8VdZKyT22BQn1EGgoe5ixTu66sNoAb6.Wc9lA..v.CmDQAQE1AtB0kDlpbRVbHigjSQQxgCoHOSQIFjLlPTN6.RT8CT0+0pktEEMcQishS3y.KDjGOFho+d6kodu+HdlCtTceKOxFBHvQIaY6jKfKiSdFgrLNELi609ZHkFxnQ4BxhfNi.gRftKEhjfNp.hB5XfHoMxDg9Ce4ZiRetPX7zWoUbKv6gvHjOywI2GZmLzmX6yS9i0NfsOZ5mjDAI4vkooDSQIxPINN43vjlIovn.eeM7jBTOmB49U3Nz8xtyVumi2IasyLn51lXcIgAbQe1f57DvKQCWrDQhv8vhUBx2w3afUBiyDFqDJgOGio+oiPw+16gc9DK7Y1Ft2ON2nd.RvlnKNLo44XRNN44.Lg+fj6AmlheUItOvWi8MLKRMCuNN+Nih0ZDHtbEhqQ.+WjHN2fPGt7JvON1DqM3y5lAgYDSTrxlEmO9SyA+W+kLQqrzQas6+14lzCPGzGwYmLB6kIXOb7GYHl9C8U427.zt2Tsq.+obIaRf6KBrd6RzuDKj8ubMZ2hf3PubM11rRWbcv+a6h2G4tawfYrXfXWbKtagdsmf77cXetOCS9guWdzaaXXIc9iZwahy6bsHxaUf75DHddRBqJQKcnKSHHWpPn4T9nnD9+xh3+Q+prquwR3sb9aO6jaYjym9W+8xuM6OjCbK2A63NWoZL.7V3h5E3kCh2MvUFAqDAtZs8S6IwdIwe5g9qvEMkvamN38omlwuq+ykXEvVv10g3uZrLTZseZ19e4mhG6SrR1XpEuYtvWrEVuIE5q2B4FCGkztP6lrCCPSI7K5g5gcw+yoI+O5tY+S21tIKBHRweu99XOes2Ceq2FKgyOuXv0x4s1jD6OCzuRA7xjHsfEeAjqyx6fksNBIXiO4G2E+GPg5KdWrqeJMZwEeYBhcxMc3ODOxapUy9gkSbCrsHYovEnv9MJgWJvEFAqt0UD5zFEspBZUFZ0fLgUOTI72gB08kGmG5axdNbSdIW1f8XT39uGd5kE67Vr3yx1cA1o4e7V4EbYkv+hrP7GqPe0RDcKPDKzFdc4elMhPvVYyB0AIz4GgSg3hpnGpI.8uvC+ueN79keS1yy1VePWhf8nj4axpTw2KDt6.mQ7D.290w42aDrtPMhKSi3r0n2DH1BvYXgnSXFhML2ugYVHCgnxrnQA3iWVAh86ided3uCeTObFb9s+GrurzFiH0xABTbbU1bKsK7lYa8Ck5WfXc.aUiXsRDaLJxSW.8og0Hfd.5BDcnQ6oPuGM5GSC6Dz6wC03SiXzuKOcpU5mmEK9+mg+Gdbbf6pa.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-41",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.5, 17.5, 122.0, 123.0 ],
									"pic" : "mage.png"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 182.5, 334.636353, 100.0, 18.0 ],
									"text" : "engineadd $1 $2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 643.725769, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 182.5, 495.266846, 67.0, 131.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~[1]",
											"parameter_shortname" : "output level",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"varname" : "live.gain~"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "signal", "bang", "int", "int" ],
									"patching_rect" : [ 182.5, 436.5, 59.5, 20.0 ],
									"text" : "mage~"
								}

							}
, 							{
								"box" : 								{
									"border" : 1.0,
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"id" : "obj-47",
									"maxclass" : "dropfile",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 182.5, 156.5, 42.712784, 43.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-4",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 41.5, 425.0, 22.706104, 22.858788 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "0",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-93",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 193.0, 167.5, 21.792936, 21.0 ],
									"presentation_rect" : [ 15.0, 15.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "1",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-110",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 450.5, 382.5, 21.853052, 22.0 ],
									"presentation_rect" : [ 45.0, 45.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "3",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.698039, 0.698039, 0.698039, 1.0 ],
									"bordercolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"borderoncolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"fontname" : "Arial Bold",
									"fontsize" : 12.0,
									"hint" : "",
									"id" : "obj-94",
									"ignoreclick" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 324.961395, 167.5, 21.790001, 21.0 ],
									"presentation_rect" : [ 60.0, 60.0, 27.123047, 30.34375 ],
									"rounded" : 60.0,
									"text" : "2",
									"textcolor" : [ 0.901961, 0.227451, 0.47451, 1.0 ],
									"textovercolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 43.86364, 258.0, 21.0, 258.0, 21.0, 300.0, 43.86364, 300.0 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 43.86364, 396.0, 21.0, 396.0, 21.0, 300.0, 43.86364, 300.0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 349.08136, 579.983459, 325.85022, 579.983459, 325.85022, 526.516602, 349.08136, 526.516602 ],
									"source" : [ "obj-136", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-137", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-138", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-136", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-317", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-138", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-161", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-98", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-2", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-107", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 324.0, 432.75, 192.0, 432.75 ],
									"source" : [ "obj-91", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-96", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-96", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-98", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 9.0, 86.0, 47.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p main",
					"varname" : "main"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-2::obj-25" : [ "live.gain~[4]", "output level", 0 ],
			"obj-15::obj-7" : [ "live.gain~[6]", "output level", 0 ],
			"obj-120::obj-2" : [ "live.gain~[1]", "output level", 0 ],
			"obj-124::obj-14" : [ "live.gain~[2]", "output level", 0 ],
			"obj-123::obj-18" : [ "live.gain~[3]", "output level", 0 ],
			"obj-5::obj-26" : [ "live.gain~[5]", "output level", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "mage_glossary.maxpat",
				"bootpath" : "/Users/vichug/Documents/_STAGE_NUMEDIART_MAGE",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mage~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
