/* Spawns cars around the map
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

//whole island?
if (ISLAND_USEWHOLE) then {
	PLAYAREACENTER = ISLAND_CENTER;
  ISLAND_PLAYAREASIZE = ISLAND_SPAWNSEARCHRADIUS + 2000;
	diag_log "Using whole island as play area.";
}
else {

  ISLAND_PLAYAREASIZE = ISLAND_SPAWNSEARCHRADIUS + 500;

  //if you use "find closest land" instead of this, center will be more likely to be near coast
 	_isWater = true;
	_towns = true;
	while {_isWater && _towns} do {
		_towns = true;
		PLAYAREACENTER = [ISLAND_CENTER, ISLAND_PLAYAREASEARCHRADIUS, [0,360], 1] call SHK_pos;
		_isWater = surfaceIsWater PLAYAREACENTER;

		_townsnum  = count nearestLocations [PLAYAREACENTER, ["NameVillage", "NameCity", "NameCityCapital"], 3500];

		if (_townsnum >= 3) then {
		    _towns = false;
		} else {
		    _isWater = true;
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
