/* Spawns boats around the map
*
* executed via init.sqf on server
*/

/*
Required Parameters:
  0 Object or Position  Anchor point from where the relative position is calculated from.
  1 Array or Number     Distance from anchor.

Optional Parameters:
  2 Array of Number     Direction from anchor. Default is random between 0 and 360.
  3 Number              Water position. Default is only land positions allowed.
                          0   Find closest land. Search outwards 360 degrees (20 degree steps) and 20m steps.
                          1   Allow water positions.
                          2   Find only water positions.
  4 Array               Road positions.
                          0  Number  Road position forcing. Default is 0.
                               0    Do not search for road positions.
                               1    Find closest road position. Return the generated random position if none found.
                               2    Find closest road position. Return empty array if none found.
                          1  Number   Road search range. Default is 200m.
  5 Array, Number, Object or Vehicle Type         Force finding large enough empty position.
                          0   Max range from the selection position to look for empty space. Default is 200.
                          1   Vehicle or vehicle type to fit into an empty space.

                          Examples:
                            [...,[300,heli]]       Array with distance and vehicle object.
                            [...,350]              Only distance given
                            [...,(typeof heli)]    Only vehicle type given
                            [...,heli]             Only vehicle object given
*/

if (!isServer) exitWith {};

_boats = [
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_rescue_F",
	"C_Boat_Civil_01_police_F",
	"B_Boat_Transport_01_F",
	"B_Lifeboat",
	"O_Boat_Transport_01_F"
];

_armedBoats = [
	"B_Boat_Armed_01_minigun_F"
];

if (ARMED_VEHICLES) then {_boats = _boats + _armedBoats};

private ["_randomPos", "_waterPositions", "_coastPos", "_coastPositions", "_discardPos", "_tooCloseFound", "_tooCloseCounter", "_closeWaterPositions", "_closeWaterPos", "_isWater"];


diag_log "spawnBoats starting...";

//find water positions in BOATMAX number of random positions -> number of boats is dependent on water to land ratio of playarea
_waterPositions = [];
for "_i" from 0 to BOATMAX do {

	//find position in playarea
	_randomPos = [PLAYAREACENTER, [0,ISLAND_PLAYAREASIZE], [0,360], 1] call SHK_pos;

	//if position is water, add to _waterPositions
	if (surfaceIsWater _randomPos) then {_waterPositions pushBack _randomPos};
};

diag_log format ["%1 water positions found.", (count _waterPositions)];


//add markers if debug mode
if (DEBUG_MODE) then {
	for "_i" from 0 to count _waterPositions -1 do {
		_pos = _waterPositions select _i;
		_markername = format ["waterposmarker_%1", _i];
		_marker = createMarker [_markername, _pos];
		_marker setMarkerColor "COLORPINK";
		_marker setMarkerType "mil_circle";
	};
};


//find closest coast
_coastPositions = [];
{
	_tooCloseFound = true;
	_tooCloseCounter = 0;
	_discardPos = false;

	while {_tooCloseFound} do {
		_coastPos = [_x, [0,1], [0,360], 0] call SHK_pos;

		_tooCloseFound = false;
		{
			if ((_x distance2D _coastPos) < BOATMINDISTANCE) exitWith {_tooCloseFound = true};
		} forEach _coastPositions;

		//if repeated x times, discard position
		if (_tooCloseCounter >= 6) then {
			_tooCloseFound = false;
			_discardPos = true;
		};
		_tooCloseCounter = _tooCloseCounter +1;
	};


	if (_discardPos) then {
		diag_log "No position with min distance found. Discarding position.";
	} else {
		_coastPositions pushBack _coastPos;
	};

} forEach _waterPositions;


//add markers if debug mode
if (DEBUG_MODE) then {
	for "_i" from 0 to count _coastPositions -1 do {
		_pos = _coastPositions select _i;
		_markername = format ["coastposmarker_%1", _i];
		_marker = createMarker [_markername, _pos];
		_marker setMarkerColor "COLORGREEN";
		_marker setMarkerType "mil_circle";
	};
};


//find water position close to coast positions
_closeWaterPositions = [];
{
	_isWater = false;
	while {!_isWater} do {
		_closeWaterPos = [_x, [7, BOATMAXCOASTDISTANCE], [0,360], 2] call SHK_pos;
		_isWater = surfaceIsWater _closeWaterPos
	};

	_closeWaterPositions pushBack _closeWaterPos;
} forEach _coastPositions;

//add markers if debug mode
if (DEBUG_MODE) then {
	for "_i" from 0 to count _closeWaterPositions -1 do {
		_pos = _closeWaterPositions select _i;
		_markername = format ["closewaterposmarker_%1", _i];
		_marker = createMarker [_markername, _pos];
		_marker setMarkerColor "COLORBLUE";
		_marker setMarkerType "mil_dot";
	};
};


//spawn boats
{
	_boatType = selectRandom _boats;
	_spawnedBoat = _boatType createVehicle _x;
	_spawnedBoat setDir (random 360);

	diag_log format ["%1 spawned at %2", _boatType, _x];

} forEach _closeWaterPositions;
