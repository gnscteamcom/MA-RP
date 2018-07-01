INTERIORS = {
    -- HOPITAL
    [1] = {id = 1, x = 360.08847045898, y = -585.16223144531, z = 28.820465087891,  name = "Exit EMS", destination = {2}},
	[2] = {id = 2, x = 251.32405090332, y = -1367.2664794922, z = 39.534370422363,  name = "Enter EMS", destination = {1}},
    


    -- FIB
    [4] = {id = 4, x = 138.18788146973, y = -764.86633300781, z = 45.75199508667,  name = "Exit FBI", destination = {5}},
    [5] = {id = 5, x = 136.36924743652, y = -749.36987304688, z = 258.15179443359,  name = "Enter FBI", destination = {4}},

    -- FIB GARAGE
    [6] = {id = 6, x = 142.06883239746, y = -768.97241210938, z = 45.752010345459, h = 72.884956359863, name = "FIB Building", destination = {7}},
    [7] = {id = 7, x = 176.67442321777, y = -728.77349853516, z = 39.403667449951, h = 248.2452545166, name = "Garage", destination = {6}},

    -- BAHMAS MAMAS
    [8] = {id = 8, x = -1388.9272460938, y = -586.08123779297, z = 30.219741821289, h = 35.407787322998, name = "Exit", destination = {9}},
    [9] = {id = 9, x = -1394.5030517578, y = -596.09210205078, z = 30.319562911987, h = 205.4248046875, name = "Enter", destination = {8}},

    -- HOPITAL Dead
    [12] = {id = 12, x = 240.50773620605, y = -1379.4248046875, z = 33.741641998291,  name = "Exit Morgue", destination = {13}},
    [13] = {id = 13,x = 285.69213867188, y = -1351.2567138672, z = 24.534639358521,  name = "Enter Morgue", destination = {12}},


-- Lawyer
    [16] = {id = 16, x = -1898.3725585938, y = -572.23272705078, z = 11.844171524048,  name = "Exit Lawyers office", destination = {17}},
    [17] = {id = 17,x = -1902.0192871094, y = -572.36346435547, z = 19.097213745117,  name = "Enter Lawyers office", destination = {16}},	
	
	-- New
    [18] = {id = 18, x =  3562.8259277344, y = 3690.3332519531, z = 28.121658325195,  name = "Enter Business", destination = {19}},
    [19] = {id = 19,x = 3526.3579101563, y = 3673.7409667969, z = 28.121139526367,  name = "Exit Business", destination = {18}},
	-- New
    [20] = {id = 20, x =  -1396.8383789063, y = -1008.8212280273, z = 24.70457649231,  name = "Enter Home", destination = {21}},
    [21] = {id = 21,x = -1370.9072265625, y = -1001.8865966797, z = 8.2923002243042,  name = "Exit Home", destination = {20}},
	-- New
    [22] = {id = 22, x =  -262.89254760742, y = -713.45825195313, z = 71.032730102539,  name = "Enter Home", destination = {23}},
    [23] = {id = 23,x = -271.89880371094, y = -693.51745605469, z = 34.276473999023,  name = "Exit Home", destination = {22}},	
		
	----police holding cell
		-- New
    [24] = {id = 24, x =  3562.8259277344, y = 3690.3332519531, z = 28.121658325195,  name = "Enter Business", destination = {19}},
    [25] = {id = 25,x = 3526.3579101563, y = 3673.7409667969, z = 28.121139526367,  name = "Exit Business", destination = {18}},
	
    [26] = {id = 26, x =  465.33612060547, y = -989.95324707031, z = 24.914859771729,  name = "Mission Row PD", destination = {30}},
    [27] = {id = 27,x = 1856.8465576172, y = 3689.5522460938, z = 34.267040252686,  name = "Sandy PD", destination = {30}},
	[30] = {id = 30,x = 1844.0, y = 3660.034, z = -116.789, h = 300,  name = "Holding Cells", destination = {26,27}},
	[31] = {id = 31,x = 452.37359619141, y = -993.58026123047, z = 25.999433517456,  name = "Garage", destination = {32}},
	[32] = {id = 32,x = 462.1770324707, y = -1009.7075805664, z = 25.562623977661,  name = "Booking", destination = {31}},
	
	
---court house
    [28] = {id = 28, x = 234.547, y = -413.567, z = -118.465 ,  name = "Enter Court House", destination = {29}},
    [29] = {id = 29,x = 237.8567199707, y = -412.88034057617, z = 48.111934661865,  name = "Exit Court House", destination = {28}},	
	
---VISITOR Enter
	[33] = {id = 33,x = 1690.7153320313, y = 2591.6220703125, z = 45.894424438477,  name = "Leave Visitor Center", destination = {34}},
	[34] = {id = 34,x = 1706.0289306641, y = 2581.1652832031, z =-69.421257019043,  name = "Enter Jail As Visitor", destination = {33}},
	
---Jail visit tp
	[35] = {id = 35,x = 1800.4964599609, y = 2483.1225585938, z = -122.69017791748,   name = "Back to D Block", destination = {36}},
	[36] = {id = 36,x =1699.955078125, y = 2574.5258789063, z = -69.402786254883,   name = "Visitor Area", destination = {35}},
	
---COKE CLEAN
	[37] = {id = 37,x = -324.62411499023, y = -1356.3118896484, z = 31.295709609985,   name = "Exit Cleaner" , destination = {38}},
	[38] = {id = 38,x = 1088.4797363281, y = -3187.81640625, z = -38.993461608887,   name = "Enter Cleaner" , destination = {37}},
---LSD Make
	[39] = {id = 39,x = -315.04876708984, y = -2698.25390625, z = 7.5502285957336,    name = "Exit" , destination = {40}},
	[40] = {id = 40,x = 1065.8288574219, y = -3183.4411621094, z = -39.16349029541,  name = "Enter Trimming", destination = {39}},
	
--------TEST BUNKER
	[41] = {id = 41,x = 253.1667175293, y = 222.45359802246, z = 101.68344116211,    name = "Enter Volt" , destination = {41}},
	[42] = {id = 42,x = 253.71437072754, y = 224.88063049316, z = 101.8756942749,    name = "Enter Volt" , destination = {41}}
	
	
	
	

}
