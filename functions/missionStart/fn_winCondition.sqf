if (!isServer) exitWith {};

PLAYINGGROUPS = allGroups;
[{
	params ["_args","_handle"];
	private ["_group", "_playersAlive"];

	{
		_group = _x;
		_playersAlive = false;
		{
			if (alive _x) then {
				_playersAlive = true;
			};
		} forEach (units _group);

		if (!_playersAlive) then {
			PLAYINGGROUPS = PLAYINGGROUPS - [_group];
			diag_log format ["No more players in group %1", _group];
		};
	} forEach PLAYINGGROUPS;

	if ((count PLAYINGGROUPS) < 2) then {
		[] call koka_fnc_endRound;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}, 5, []] call CBA_fnc_addPerFrameHandler;
