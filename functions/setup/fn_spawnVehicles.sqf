/* Spawns cars around the map
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

_vehicles = [
    "C_Hatchback_01_F",
    "C_Offroad_02_unarmed_F",
    "C_Offroad_01_F",
    "C_Offroad_01_repair_F",
    "C_Quadbike_01_F",
    "C_SUV_01_F",
    "C_Van_01_transport_F",
    "C_Truck_02_transport_F",
    "B_LSV_01_unarmed_F",

    "RHS_Ural_Civ_01",
    "RHS_Ural_Open_Civ_03",
    "rhs_uaz_vdv",
    "rhs_uaz_open_vdv",
    "rhsusf_m998_w_2dr"
];

_armedVehicles = [
    "rhsusf_m1025_w_m2",
    "rhsgref_ins_g_uaz_dshkm_chdkz",
    "I_G_Offroad_01_armed_F"
];

if (ARMED_VEHICLES) then {_vehicles = _vehicles + _armedVehicles};

private ["_vehicleAmount","_min","_max", "_spawnPos", "_vehicle", "_spawnedVehicle", "_spawnFound", "_spawnPositions", "_searchCounter", "_tooCloseFound"];
_min = MINMAX_CARS select 0;
_max = MINMAX_CARS select 1;
_vehicleAmount = round ((random (_max-_min)) + _min);
_spawnPositions = [];
_searchCounter = 0;

diag_log format ["Spawning %1 vehicles.", _vehicleAmount];

for [{_i = 0},{_i < _vehicleAmount},{_i = _i + 1}] do {
	_vehicle = selectRandom _vehicles;

    for [{_j=0}, {_j<100}, {_j=_j+1}] do {

        _spawnPos = [PLAYAREACENTER,[0,ISLAND_PLAYAREASIZE],[0,360],0] call koka_fnc_randomPos;
        _road = [_spawnPos,300,[]] call BIS_fnc_nearestRoad;
        _spawnPos = if (isNull _road) then {_spawnPos} else {getPos _road};

        //are there any other cars too close by?
        _tooCloseFound = false;
        {
            if ((_x distance2D _spawnPos) < CARMINDISTANCE) exitWith {_tooCloseFound = true; diag_log "Vehicle spawn - too close to other vehicle."};
        } forEach _spawnPositions;

        if !(_tooCloseFound) exitWith {};
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

missionNamespace setVariable ["koka_init_spawnVehiclesDone",true,true];
