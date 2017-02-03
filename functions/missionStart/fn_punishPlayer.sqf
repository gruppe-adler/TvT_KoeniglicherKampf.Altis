if (!hasInterface) exitWith {};

private ["_messageSent", "_tick"];
diag_log "punishPlayer starting...";

if (!ISLAND_USEWHOLE) then {
	OLDCENTER = NEWCIRCLEPOS;
	OLDSIZE = NEWCIRCLESIZE;
};

BODYPARTS = ["body", "hand_l", "hand_r"];
_messageSent = false;
_tick = 4;

//Do this shit on playerhost
if (isServer) then {
	[_tick] spawn {
		private ["_tick", "_arrayDiff"];
		_tick = _this select 0;

		while {alive player} do {
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
else {
	updateVariables = {
		if (FIRSTCIRCLE) then {sleep TIME_UNTIL_GETIN_FIRST} else {sleep TIME_UNTIL_GETIN};
		OLDCENTER = NEWCIRCLEPOS;
		OLDSIZE = NEWCIRCLESIZE;

		["Play is now restricted to the area inside the blue circle!",0,0,3,1] call BIS_fnc_dynamicText;
	};
	"NEWCIRCLEPOS" addPublicVariableEventHandler {[] spawn updateVariables};
};

//Main loop ========================================================================================================================================
while {alive player} do {
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
			_bodyPart = selectRandom BODYPARTS;
			[player, 0.35, _bodyPart, "bullet"] call ace_medical_fnc_addDamageToUnit;
			[] spawn koka_fnc_paineffect;
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
