//End mission function

	
sleep 5;

if ((count PLAYINGGROUPS) == 1) then {
	_leader = leader (PLAYINGGROUPS select 0);
	_message = format ["%1's group won!", (name _leader)];
	[_message,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

	sleep 7;
	["Won"] call BIS_fnc_endMissionServer;
}
else {
	if ((count PLAYINGGROUPS) == 0) then {
		_message = "No one left alive! Game ending in a draw.";
		[_message,0,0,4,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

		sleep 7;
		["Won"] call BIS_fnc_endMissionServer;
	}
	else {
		diag_log format ["Tried ending the round, but there are still %1 groups left.", (count PLAYINGGROUPS)];
		PLAYINGGROUPS = allGroups;
	};
};

