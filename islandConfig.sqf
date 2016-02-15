
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
	'Stratis'
];


ISLAND_CONFIG = [
	[[14745,16677,0],							// initial startposition
	[15297,16502,0],							// island center
	2500, 										// parachute spawnradius from center
	1000, 										// initial searchradius for blue circle
	[2000,1500,1000,600,400,200,100,50],		// circlesizes
	false,										// use whole island as play area?
	9000,										// play area search radius (only if not whole island)
	'Altis'],									// name

	[[1688,5133,0],								// initial startposition
	[3839,4672,0],								// island center
	2500, 										// parachute spawnradius from center
	1000, 										// initial searchradius for blue circle
	[2000,1500,1000,600,400,200,100,50],		// circlesizes
	true,										// use whole island as play area?
	0,											// play area search radius (only if not whole island)
	'Stratis']									// name
];