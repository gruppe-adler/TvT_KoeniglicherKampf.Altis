/* Spawns cars around the map
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

//whole island?
if (ISLAND_USEWHOLE) then {
	PLAYAREACENTER = ISLAND_CENTER;
    ISLAND_PLAYAREASIZE = ISLAND_SPAWNSEARCHRADIUS + 500;
	diag_log "Using whole island as play area.";

} else {

    ISLAND_PLAYAREASIZE = (((ISLAND_CONFIG select (ISLANDS find worldName)) select 4) select 0) + 700;

    //if you use "find closest land" instead of this, center will be more likely to be near coast
 	_isWater = true;
	_towns = true;
	while {_isWater || _towns} do {
		PLAYAREACENTER = ISLAND_CENTER getPos [random ISLAND_PLAYAREASEARCHRADIUS, random 360];
        _isWater = surfaceIsWater PLAYAREACENTER;
		_townsnum = count nearestLocations [PLAYAREACENTER, ["NameVillage", "NameCity", "NameCityCapital"], ISLAND_PLAYAREASIZE];

		if (_townsnum >= 2) then {
		        _towns = false;
		} else {
		        _towns = true;
		};
	};

	_marker = createMarker ["island_playareamarker", PLAYAREACENTER];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Border";
	_marker setMarkerColor "ColorBlack";
	_marker setMarkerSize [ISLAND_PLAYAREASIZE, ISLAND_PLAYAREASIZE];

	diag_log format ["Using circle around %1 with radius %2 as play area.", PLAYAREACENTER, ISLAND_PLAYAREASIZE];
    publicVariable "PLAYAREACENTER";
    publicVariable "ISLAND_PLAYAREASIZE";
};

missionNamespace setVariable ["koka_init_setupPlayAreaDone",true,true];
