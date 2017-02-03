if (!hasInterface) exitWith {};

[{!isNull player && !isNil {(leader player) getVariable "swfreq"}}, {
    _freq = (leader player) getVariable "swfreq";
    [(call TFAR_fnc_activeSwRadio), _freq] call TFAR_fnc_setSwFrequency;
    _settings = [0,7,[_freq,_freq,_freq,_freq,_freq,_freq,_freq,_freq],0,"_bluefor",-1,0,getplayerUID player,false];
    [(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
    diag_log format ["SW frequency set to %1.", _freq];
}, []] call CBA_fnc_waitUntilAndExecute;
