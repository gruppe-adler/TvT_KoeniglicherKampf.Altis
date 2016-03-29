/* Checks if anyone has won yet
*
* executed via init.sqf on server
*/

waitUntil {GAMESTARTED};
private ["_group", "_playersAlive", "_groupUnits"];
mcd_fnc_endRound = compile preprocessFileLineNumbers "functions\fn_endRound.sqf";

PLAYINGGROUPS = allGroups;

//Main
while {true} do {
	//Check what groups still have players
	{
		_group = _x;
		_groupUnits = units _group;

		_playersAlive = false;
		{
			if (alive _x) then {
				_playersAlive = true;
			};
		} forEach _groupUnits;


		if (!_playersAlive) then {
			PLAYINGGROUPS = PLAYINGGROUPS - [_group];
			diag_log format ["No more players in group %1", _group];
		};

	} forEach PLAYINGGROUPS;

	//Check if less than 2 groups have players
	if ((count PLAYINGGROUPS) < 2) then {
		diag_log "Less than 2 groups left. Ending the game. winCondition.sqf halting.";
		_endrndhndl = [] spawn mcd_fnc_endRound;
		waitUntil {scriptDone _endrndhndl};

		diag_log "winCondition.sqf resuming.";
	};

	sleep 5;
};

diag_log "Win condition initialized.";
