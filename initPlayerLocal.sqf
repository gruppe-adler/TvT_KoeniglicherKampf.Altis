player allowDamage false;
TELEPORTEDTOCHUTE = false;

[{missionNamespace getVariable ["GAMESTARTED",false]}, {player allowDamage true}, []] call CBA_fnc_waitUntilAndExecute;
[{!isNull player}, {[] execVM "player\intro.sqf";}, []] call CBA_fnc_waitUntilAndExecute;

[] execVM "player\briefing.sqf";
[] execVM "player\killJIP.sqf";
