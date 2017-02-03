if ((count PLAYINGGROUPS) == 1) then {
	_leader = leader (PLAYINGGROUPS select 0);
	_message = format ["%1's group won!", (name _leader)];
	[_message,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

	if (!DEBUG_MODE) then {[{["Won"] call BIS_fnc_endMissionServer}, [], 7] call CBA_fnc_waitAndExecute};

} else {
	if ((count PLAYINGGROUPS) == 0) then {
		_message = "No one left alive! Game ending in a draw.";
		[_message,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

		if (!DEBUG_MODE) then {[{["Won"] call BIS_fnc_endMissionServer}, [], 7] call CBA_fnc_waitAndExecute};
	}
	else {
		diag_log format ["Tried ending the round, but there are still %1 groups left.", (count PLAYINGGROUPS)];
		PLAYINGGROUPS = allGroups;
		[] call koka_fnc_winCondition;
	};
};
