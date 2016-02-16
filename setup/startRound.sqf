diag_log "Round setup starting...";

private ["_teamleadpos", "_parachuteposition", "_positions", "_unit"];

{
	PARACHUTEPOSITIONS = [];

	//find position
	_isWater = true;
	while {_isWater} do {
		_teamleadpos = [PLAYAREACENTER, [0, ISLAND_SPAWNSEARCHRADIUS], [0,360], 1] call SHK_pos;
		_isWater = surfaceIsWater _teamleadpos;
	};
	_teamleadpos = _teamleadpos vectorAdd [0,0,JUMP_HEIGHT];

	//in debug mode, add marker
	if (DEBUG_MODE) then {
		_marker = createMarker [name _x, _teamleadpos];
		_marker setMarkerType "respawn_para";
		_marker setMarkerColor "ColorGreen";
	};

	//Positions for teammembers
	for [{_i = 0},{_i < (count (units group _x))},{_i = _i + 1}] do {
		_parachuteposition = _teamleadpos vectorAdd [_i*30,0,0];
		PARACHUTEPOSITIONS = PARACHUTEPOSITIONS + [_parachuteposition];
	};

	//Save positions in teamleader
	_x setVariable ["POSITIONS", PARACHUTEPOSITIONS, false];
	diag_log format ["Positions for %1's team: %2", name _x, _x getVariable "POSITIONS"];

} forEach TEAMLEADERS;

sleep 2;
_messageText = format ["Game starting in %1 seconds.",TIME_UNTIL_ROUND_START];
[_messageText,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
sleep TIME_UNTIL_ROUND_START;
["Game starting!",0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
sleep 4;

//Fade Out
[0, ["", "BLACK FADED", 3, true]] remoteExec ["cutText", 0, false];
sleep 2;

//Teleport players
{
	_positions = _x getVariable "POSITIONS";
	for [{_i = 0},{_i < (count (units group _x))},{_i = _i + 1}] do {
		_unit = (units group _x) select _i;
		_unit setPos (_positions select _i);
		_unit addBackpackGlobal "B_Parachute";
	};
} forEach TEAMLEADERS;

//Allow damage for players
GAMESTARTED = true;
publicVariable "GAMESTARTED";

//Fade In
sleep 2;
[0, ["", "BLACK IN", 4]] remoteExec ["cutText", 0, false];
