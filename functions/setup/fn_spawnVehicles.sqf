/* Spawns cars around the map
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

_vehicles = [
    "C_Van_01_transport_F",
    "C_Van_01_box_F",
    "C_SUV_01_F",
    "C_Hatchback_01_sport_red_F",
    "C_Hatchback_01_green_F",
    "C_Quadbike_01_F",
    "C_Offroad_01_F",

    "RDS_Gaz24_Civ_01",

    "RHS_UAZ_MSV_01"
];

_armedVehicles = [
    "I_G_Offroad_01_armed_F",
    "rhs_uaz_dshkm_chdkz"
];

if (ARMED_VEHICLES) then {_vehicles = _vehicles + _armedVehicles};

private ["_vehicleAmount","_min","_max", "_spawnPos", "_vehicle", "_spawnedVehicle", "_spawnFound", "_spawnPositions", "_searchCounter", "_tooCloseFound"];
_min = MINMAX_CARS select 0;
_max = MINMAX_CARS select 1;
_vehicleAmount = round ((random _max-_min) + _min);
_spawnPositions = [];
_searchCounter = 0;

diag_log format ["Spawning %1 vehicles.", _vehicleAmount];

for [{_i = 0},{_i < _vehicleAmount},{_i = _i + 1}] do {
	_vehicle = selectRandom _vehicles;

    _tooCloseFound = true;
    while {_tooCloseFound} do {

        //find spawn position
        _spawnFound = false;
        while {!_spawnFound} do {
            _spawnPos = [PLAYAREACENTER, [0, ISLAND_PLAYAREASIZE], [0,360], 0, [2,200],_vehicle] call SHK_pos;
            if ((count _spawnPos) != 0) then {_spawnFound = true} else {diag_log "Vehicle spawn - Road not found. Repeating."};
        };

        //are there any other cars too close by?
        _tooCloseFound = false;
        {
            if ((_x distance2D _spawnPos) < CARMINDISTANCE) exitWith {_tooCloseFound = true; diag_log "Vehicle spawn - too close to other vehicle."};
        } forEach _spawnPositions;
    };

    _spawnPositions pushBack _spawnPos;
    _spawnedVehicle = _vehicle createVehicle _spawnPos;
    _spawnedVehicle setDir (random 360);

    diag_log format ["%1 spawned at %2", _vehicle, _spawnPos];

	if (DEBUG_MODE) then {
        _markername = format ["vehiclemarker_%1", _i];
		_marker = createMarker [_markername, _spawnPos];
		_marker setMarkerColor "COLORCIV";
		_marker setMarkerType "mil_triangle";
	};
};
