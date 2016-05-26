
// Please insert new islands alphabetically by file name extension!

// Readable List:
// Altis,
// Bornholm,
// Chernarus
// Chernarus Summer,
// Clafghan,
// Desert,
// Esseker,
// Fatah,
// Gorgona
// Podagorsk,
// Capraia,
// Kunduz
// Namalsk
// N'Ziwasogo
// Sarahni,
// Sarugao,
// Shapur,
// Stratis,
// Takistan,
// Thirsk,
// Panthera,
// Bystrica,
// vt5
// X-Cam Prototype
// Zargabad


ISLANDS = [
	'Altis',
	'Chernarus',
	'Esseker',
	'fata',
	'IslaDuala3',
	'Kunduz',
	'namalsk',
	'Panthera3',
	'Porto',
	'Sara_dbe1',
	'Stratis',
	'SugarLake',
	'Takistan',
	'utes',
	'Zargabad'
];


ISLAND_CONFIG = [
	[[14745,16677,0],								// initial startposition
	[15297,16502,0],								// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	9000,											// play area search radius (only if not whole island)
	'Altis'],										// name

	[[4548,10235,0],								// initial startposition
	[6982,8788,0],									// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	3500,											// play area search radius (only if not whole island)
	'Chernarus'],									// name

	[[10372,4812,0],								// initial startposition
	[6357,6669,0],									// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	4000,											// play area search radius (only if not whole island)
	'Esseker'],										// name

	[[-155,1445,0],									// initial startposition
	[5131,5256,0],									// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[2000,1500,1000,600,400,200,100,50],			// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Fata'],										// name

	[[8624.87,4653.63,0],								// initial startposition
	[5295.73,5333.38,0],								// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	2000,											// play area search radius (only if not whole island)
	'Isla Duala'],										// name

	[[6450,2305,0],									// initial startposition
	[2819,2716,0],									// island center
	2500, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[2000,1500,1000,600,400,200,100,50],			// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Kunduz'],										// name

	[[6236,9430,0],									// initial startposition
	[6229,8371,0],									// island center
	2800, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[2000,1500,1000,600,400,200,100,50],			// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Namalsk'],										// name

	[[648.445,9271.38,0],								// initial startposition
	[5280.98,4852.43,0],								// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	1500,											// play area search radius (only if not whole island)
	'Panthera'],										// name

	[[1274,631,0],									// initial startposition
	[2717,2475,0],									// island center
	1000, 											// parachute spawnradius from center -> +500 = playareasize
	200, 											// initial searchradius for blue circle (only if whole island)
	[1500,1100,800,650,400,250,100,50],				// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Porto'],										// name

	[[9764,10080,0],								// initial startposition
	[12376,11521,0],								// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	7000,											// play area search radius (only if not whole island)
	'Sahrani'],										// name

	[[1688,5133,0],									// initial startposition
	[3839,4672,0],									// island center
	2500, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[2000,1500,1000,600,400,200,100,50],			// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Stratis'],										// name

	[[6451,7666,0],									// initial startposition
	[4155,4414,0],									// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	800, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	true,											// use whole island as play area?
	7000,											// play area search radius (only if not whole island)
	'SugarLake'],									// name

	[[5646,11401,0],								// initial startposition
	[6768,6844,0],									// island center
	3000, 											// parachute spawnradius from center -> +500 = playareasize
	1000, 											// initial searchradius for blue circle (only if whole island)
	[3000,2700,1400,1100,800,600,400,200,100,50],	// circlesizes
	false,											// use whole island as play area?
	3000,											// play area search radius (only if not whole island)
	'Takistan'],									// name

	[[3978,3608,0],									// initial startposition
	[3635,3757,0],									// island center
	650, 											// parachute spawnradius from center -> +500 = playareasize
	200, 											// initial searchradius for blue circle (only if whole island)
	[2000,1500,1000,600,400,200,100,50],			// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Utes'],										// name

	[[3393,4148,0],									// initial startposition
	[4167,4202,0],									// island center
	2000, 											// parachute spawnradius from center -> +500 = playareasize
	800, 											// initial searchradius for blue circle (only if whole island)
	[2000,1500,1000,600,400,200,100,50],			// circlesizes
	true,											// use whole island as play area?
	0,												// play area search radius (only if not whole island)
	'Zargabad']										// name
];
