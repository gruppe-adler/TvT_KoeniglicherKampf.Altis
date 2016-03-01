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

/*
//Generate circlesizes based on game length
_timeMidgame = GAME_TIME - TIME_UNTIL_FIRST_CIRCLE - TIME_UNTIL_GETIN_FIRST - ((count CIRCLESIZES_LASTFEW) * CIRCLE_INTERVAL_LASTFEW);
_numberOfCircles = _timeMidgame / CIRCLE_INTERVAL;
_firstOfTheLast = CIRCLESIZES_LASTFEW select ((count CIRCLESIZES_LASTFEW) -1);
CIRCLESIZES = CIRCLESIZES_LASTFEW;

for [{_i=1},{_i<=_numberOfCircles},{_i=_i+1}] do {

  CIRCLESIZES pushBack (CIRCLE_STEP * _i + _firstOfTheLast);
};

//from big to small
reverse CIRCLESIZES;
diag_log format ["Circlesizes are: %1", CIRCLESIZES];
*/

//whole island?
if (ISLAND_USEWHOLE) then {
	PLAYAREACENTER = ISLAND_CENTER;
  ISLAND_PLAYAREASIZE = ISLAND_SPAWNSEARCHRADIUS + 500;
	diag_log "Using whole island as play area.";
  
} else {

  ISLAND_PLAYAREASIZE = (((ISLAND_CONFIG select (ISLANDS find worldName)) select 4) select 0) + 700;
  //ISLAND_PLAYAREASIZE = ISLAND_SPAWNSEARCHRADIUS + 500;

  //if you use "find closest land" instead of this, center will be more likely to be near coast
 	_isWater = true;
	_towns = true;
	while {_isWater || _towns} do {
		PLAYAREACENTER = [ISLAND_CENTER, [0,ISLAND_PLAYAREASEARCHRADIUS], [0,360], 1] call SHK_pos;
    _isWater = surfaceIsWater PLAYAREACENTER;
		_townsnum  = count nearestLocations [PLAYAREACENTER, ["NameVillage", "NameCity", "NameCityCapital"], ISLAND_PLAYAREASIZE];

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
