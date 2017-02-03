/* Spawns random care packages that contain look
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

private ["_timeMin", "_timeMax", "_carepackagePos"];
diag_log format ["Carepackages initialized - Waiting %1 seconds to spawn the first one.", TIME_UNTIL_FIRST_CAREPACKAGE];

[{
	_spawn = {
		_timeMin = CAREPACKAGE_INTERVAL select 0;
		_timeMax = CAREPACKAGE_INTERVAL select 1;
		[{
			_isWater = true;
			while {_isWater} do {
				_carepackagePos = [NEWCIRCLEPOS, [0,NEWCIRCLESIZE], [0,360], 1] call SHK_pos;
				_isWater = surfaceIsWater _carepackagePos;
			};

			_carepackagePos = _carepackagePos vectorAdd [0,0,CAREPACKAGE_DROPHEIGHT];
			[_carepackagePos] spawn koka_fnc_spawnCarepackage;

			_this call _this;
		}, _this, (random (_timeMax - _timeMax)) + _timeMin] call CBA_fnc_waitAndExecute;
	};
	_spawn call _spawn;
}, [], TIME_UNTIL_FIRST_CAREPACKAGE] call CBA_fnc_waitAndExecute;
