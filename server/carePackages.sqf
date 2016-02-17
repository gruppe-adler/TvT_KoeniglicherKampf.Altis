/* Spawns random care packages that contain look
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

call compile preprocessFile "loot\carepackageConfig.sqf";
mcd_fnc_spawnCarepackage = compile preprocessFileLineNumbers "loot\spawnCarepackage.sqf";

private ["_timeMin", "_timeMax", "_carepackagePos"];

_timeMin = CAREPACKAGE_INTERVAL select 0;
_timeMax = CAREPACKAGE_INTERVAL select 1;


waitUntil {GAMESTARTED};
diag_log format ["Carepackages initialized - Waiting %1 seconds to spawn the first one.", TIME_UNTIL_FIRST_CAREPACKAGE];
sleep TIME_UNTIL_FIRST_CAREPACKAGE;



while {true} do {

	//Find position to drop package, repeat until not over water
	_isWater = true;
	while {_isWater} do {
		_carepackagePos = [NEWCIRCLEPOS, NEWCIRCLESIZE, [0,360], 1];
		_isWater = surfaceIsWater _carepackagePos;
	};
	//Add dropheight
	_carepackagePos = _carepackagePos vectorAdd [0,0,CAREPACKAGE_DROPHEIGHT];

	//Spawn carepackage
	[_carepackagePos] spawn mcd_fnc_spawnCarepackage;

	//Sleep random amount between interval limits
	sleep ((random (_timeMax - _timeMax)) + _timeMin);
};
