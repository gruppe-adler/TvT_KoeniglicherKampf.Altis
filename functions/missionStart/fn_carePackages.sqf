/* Spawns random care packages that contain look
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

diag_log format ["Carepackages initialized - Waiting %1 seconds to spawn the first one.", TIME_UNTIL_FIRST_CAREPACKAGE];

[{
	koka_fnc_carePackages_spawn = {
		private ["_timeMin", "_timeMax"];
		_timeMin = CAREPACKAGE_INTERVAL select 0;
		_timeMax = CAREPACKAGE_INTERVAL select 1;
		[{
			private ["_carepackagePos"];
			_isWater = true;
			for [{_i=0}, {_i<100}, {_i=_i+1}] do {
			    _carepackagePos = [NEWCIRCLEPOS, [0,NEWCIRCLESIZE], [0,360]] call koka_fnc_randomPos;
				if !(surfaceIsWater _carepackagePos) exitWith {};
			};

			_carepackagePos = _carepackagePos vectorAdd [0,0,CAREPACKAGE_DROPHEIGHT];
			[_carepackagePos] spawn koka_fnc_spawnCarepackage;

			[] call koka_fnc_carePackages_spawn;
		}, [], (random (_timeMax - _timeMax)) + _timeMin] call CBA_fnc_waitAndExecute;
	};
	[] call koka_fnc_carePackages_spawn;
}, [], TIME_UNTIL_FIRST_CAREPACKAGE] call CBA_fnc_waitAndExecute;
