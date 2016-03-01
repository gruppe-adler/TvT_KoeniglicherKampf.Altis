diag_log "Round setup starting...";

private ["_teamleadpos", "_parachuteposition", "_positions", "_unit", "_tooCloseFound", "_repetitions"];

{
	diag_log format ["Finding position for %1's team.", (name _x)];
	PARACHUTEPOSITIONS = [];

	//Position for teamleader
	_repetitions = 0;
	_tooCloseFound = true;
	while {_tooCloseFound} do {

		//find position that is not over water
		_isWater = true;
		while {_isWater} do {
			_teamleadpos = [PLAYAREACENTER, [0, ISLAND_SPAWNSEARCHRADIUS], [0,360], 1] call SHK_pos;
			_isWater = surfaceIsWater _teamleadpos;
		};
		_teamleadpos = _teamleadpos vectorAdd [0,0,JUMP_HEIGHT];

		//make sure position is at least STARTPOSMINDIST away from other positions
		_tooCloseFound = false;
		{
			if ((_x distance2D _teamleadpos) < STARTPOSMINDIST) exitWith {_tooCloseFound = true; diag_log "Parachute position to close to other position. Repeating."};
		} forEach PARACHUTEPOSITIONS;

		//unless this has been repeated too often -> use position anyway
		if (_repetitions >= 10) then {
			_tooCloseFound = false;
		};

		_repetitions = _repetitions +1;
	};

	//this is only used for distance calculations (?)
	PARACHUTEPOSITIONS pushBack _teamleadpos;


	//in debug mode, add marker
	if (DEBUG_MODE) then {
		_marker = createMarker [name _x, _teamleadpos];
		_marker setMarkerType "respawn_para";
		_marker setMarkerColor "ColorGreen";
	};
	
	for [{_i = 0},{_i < (count (units group _x))},{_i = _i + 1}] do {
		_parachuteposition = _teamleadpos vectorAdd [_i*30,0,0];
		_unit = (units group _x) select _i;
		_unit setVariable ["PARACHUTEPOSITION", _parachuteposition, true];
		
		if (DEBUG_MODE) then {diag_log format ["Parachuteposition for %1: %2", (name _unit), _parachuteposition]};
		sleep 0.2;
	};

	/* OLD
	//Positions for teammembers
	for [{_i = 0},{_i < (count (units group _x))},{_i = _i + 1}] do {
		_parachuteposition = _teamleadpos vectorAdd [_i*30,0,0];
		PARACHUTEPOSITIONS = PARACHUTEPOSITIONS + [_parachuteposition];
	};

	//Save positions in teamleader
	_x setVariable ["POSITION", PARACHUTEPOSITIONS, false];
	diag_log format ["Positions for %1's team: %2", name _x, _x getVariable "POSITIONS"];
	*/

} forEach TEAMLEADERS;

sleep 2;
_messageText = format ["Game starting in %1 seconds.",TIME_UNTIL_ROUND_START];
[_messageText,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
sleep TIME_UNTIL_ROUND_START;
["Game starting!",0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
sleep 4;

//Make players teleport themselves
[[], "player\tpToChute.sqf"] remoteExec ["execVM",0,false];



/*OLD
//Fade Out
[0, ["", "BLACK FADED", 3, true]] remoteExec ["cutText", 0, false];
sleep 2;

{
	_positions = _x getVariable "POSITIONS";

} forEach TEAMLEADERS;

//Teleport players
{
	_positions = _x getVariable "POSITIONS";
	for [{_i = 0},{_i < (count (units group _x))},{_i = _i + 1}] do {
		_unit = (units group _x) select _i;
		_unit setPos (_positions select _i);
		_unit addBackpackGlobal "B_Parachute";
	};
} forEach TEAMLEADERS;
*/


//Allow damage for players
GAMESTARTED = true;
publicVariable "GAMESTARTED";



/*OLD
//Fade In
sleep 2;
[0, ["", "BLACK IN", 4]] remoteExec ["cutText", 0, false];
