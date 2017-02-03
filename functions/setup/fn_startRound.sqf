if (!isServer) exitWith {};

diag_log "Round setup starting...";

private ["_teamleadpos", "_parachuteposition", "_positions", "_unit", "_tooCloseFound", "_repetitions"];

{
	diag_log format ["Finding position for %1's team.", (name _x)];
	PARACHUTEPOSITIONS = [];

	//Position for teamleader
	_repetitions = 0;
	_tooCloseFound = true;
	while {_tooCloseFound} do {

		for [{_i=0}, {_i<100}, {_i=_i+1}] do {
			_teamleadpos = [PLAYAREACENTER, [0, ISLAND_SPAWNSEARCHRADIUS], [0,360]] call koka_fnc_randomPos;
			if !(surfaceIsWater _teamleadpos) exitWith {};
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
	};
} forEach TEAMLEADERS;

_messageText = format ["Game starting in %1 seconds.",TIME_UNTIL_ROUND_START];
[_messageText,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

[{
	[] remoteExec ["koka_fnc_tpToChute",0,false];
	GAMESTARTED = true;
	publicVariable "GAMESTARTED";
}, [], TIME_UNTIL_ROUND_START] call CBA_fnc_waitAndExecute;
