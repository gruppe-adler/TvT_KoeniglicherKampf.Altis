/* Spawns boats around the map
*
* executed via init.sqf on server
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
	_randomPos = [PLAYAREACENTER, [0,ISLAND_PLAYAREASIZE], [0,360]] call koka_fnc_randomPos;

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
	_discardPos = true;
	for [{_i=0}, {_i<10}, {_i=_i+1}] do {
		_coastPos = [_x, 500, 4] call koka_fnc_nearestCoast;
		_tooCloseFound = false;
		{
			if ((_x distance2D _coastPos) < BOATMINDISTANCE) exitWith {_tooCloseFound = true};
		} forEach _coastPositions;

		//if repeated x times, discard position
		if (str _coastPos != "[0,0,0]" && !_tooCloseFound) exitWith {_discardPos = false};
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
	for [{_i=0}, {_i<10}, {_i=_i+1}] do {
		_closeWaterPos = [_x, [7, BOATMAXCOASTDISTANCE], [0,360], 2] call koka_fnc_randomPos;
		if !(surfaceIsWater _closeWaterPos) exitWith {};
	};

	if !(surfaceIsWater _closeWaterPos) then {
		_closeWaterPositions pushBack _closeWaterPos;
	};
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

missionNamespace setVariable ["koka_init_spawnBoatsDone",true,true];
