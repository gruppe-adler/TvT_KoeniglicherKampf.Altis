if (!hasInterface) exitWith {};

[{!isNil {(leader player) getVariable "swfreq"}}, {
    _freq = (leader player) getVariable "swfreq";
    [(call TFAR_fnc_activeSwRadio), _freq] call TFAR_fnc_setSwFrequency;
    diag_log format ["SW frequency set to %1.", _freq];
}, []] call CBA_fnc_waitUntilAndExecute;
