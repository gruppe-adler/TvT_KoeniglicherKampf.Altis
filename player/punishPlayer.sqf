/* Punishes players if they are outsize the blue circle for too long
*
* Executed after round start via init.sqf on player
* Player takes damage on every second tick
*/

waitUntil {player == player};

private ["_messageSent", "_tick"];
diag_log "punishPlayer initialized";


//Waituntil server has generated the first circle
waitUntil {CIRCLESSTARTED};
diag_log "punishPlayer starting...";


//Set initial circle center
OLDCENTER = NEWCIRCLEPOS;
OLDSIZE = NEWCIRCLESIZE;
_messageSent = false;
_tick = 4;


//Update variables with delay, so player has X minutes to get inside the new circle ================================================================
//Do this shit on playerhost
if (isServer) then {
	[_tick] spawn {
		private ["_tick", "_arrayDiff"];
		_tick = _this select 0;

		while {true} do {
			sleep _tick*2;
			_arrayDiff = OLDCENTER - NEWCIRCLEPOS;
			if ((count _arrayDiff) == 0) then {
				sleep TIME_UNTIL_GETIN;
				OLDCENTER = NEWCIRCLEPOS;
				OLDSIZE = NEWCIRCLESIZE;
				diag_log format ["Updated circle variables on client - Pos: %1 Size: %2", OLDCENTER, OLDSIZE];
				["Play is now restricted to the area inside the blue circle!",0,0,3,1] call BIS_fnc_dynamicText;
			};
		};
	};
}
//Do this if you are on dedicated
else
{
	//EH is non-scheduled, so this has to be spawned
	updateVariables = {		
		sleep TIME_UNTIL_GETIN;
		OLDCENTER = NEWCIRCLEPOS;
		OLDSIZE = NEWCIRCLESIZE;
		diag_log format ["Updated circle variables on client - Pos: %1 Size: %2", OLDCENTER, OLDSIZE];
		["Play is now restricted to the area inside the blue circle!",0,0,3,1] call BIS_fnc_dynamicText;
	};

	"NEWCIRCLEPOS" addPublicVariableEventHandler {[] spawn updateVariables};
};



//Main loop ========================================================================================================================================

while {true} do {
	//Outside playzone?
	if ((player distance2D OLDCENTER) > OLDSIZE) then {
		diag_log format ["Player outside the zone. Message sending: %1", (!_messageSent)];

		//First time? Send message.
		if (!_messageSent) then {
			sleep 3;
			_messageSent = true;
			["You are outside the play zone. Get back inside!",0,0,3,1] call BIS_fnc_dynamicText;
		}
		//Not first time -> punish player
		else
		{
			_messageSent = false;
			player setDamage ((damage player) + 0.2);
		};
	}
	else
	{
		//Did player move back inside? Send message.
		if (_messageSent) then {
			_messageSent = false;
			["You are back inside the zone!",0,0,3,1] call BIS_fnc_dynamicText;
		};
	};

	sleep _tick;
};