/* Sets SW frequency per team to a random value
*
* executed via init.sqf on server
*/

private ["_swFrequencies", "_freq", "_alreadyIn", "_freqString", "_teamlead"];
_swFrequencies = [];

diag_log "SW Frequency setup starting.";
["Setting SW frequency...",0,0,2,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

//Frequencies for PRC-152
_radioMin = 30;
_radioMax = 512;

//Set x10 for random number generator
_radioMin = _radioMin * 10;
_radioMax = _radioMax * 10;


//Generate frequencies
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


//Save frequencies as public variable in teamleaders
for "_i" from 0 to count TEAMLEADERS -1 do {

	//Convert to string
	_freqString = str (_swFrequencies select _i);
	_teamlead = TEAMLEADERS select _i;

	//Save in teamleader and broadcast
	_teamlead setVariable ["swfreq", _freqString, true];

	//Write to log
	if (DEBUG_MODE) then {
		diag_log format ["Frequency %1 saved for %2", _freqString, (name _teamlead)];
	};

	sleep 0.1;
};

//Wait, so everyone has received their variables
sleep 2;

//Make players set their frequency
[[], "player\setSWfreq.sqf"] remoteExec ["execVM",0,false];