/* Sets SW frequency per team to a random value
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

private ["_swFrequencies", "_freq", "_alreadyIn", "_freqString", "_teamlead"];
_swFrequencies = [];

_radioMin = 30 * 10;
_radioMax = 512 * 10;

//generate
{
	_alreadyIn = 1000;
	while {_alreadyIn != -1} do {
		_freq = (floor ((random (_radioMax - _radioMin)) + _radioMin)) / 10;
		_alreadyIn = _swFrequencies find _freq;

		if (_alreadyIn == -1) then {
			_swFrequencies = _swFrequencies + [_freq];
		};
	};
} forEach TEAMLEADERS;

//save in TLs
{
	_freqString = str (_swFrequencies select _forEachIndex);
	_x setVariable ["swfreq", _freqString, true];

	if (DEBUG_MODE) then {
		diag_log format ["Frequency %1 saved for %2", _freqString, (name _teamlead)];
	};
} forEach TEAMLEADERS;

[] remoteExec ["koka_fnc_setSWfreq",0,false];

missionNamespace getVariable ["koka_init_generateSWfreqDone",true,true];
