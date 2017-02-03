[{!isNull player || isDedicated},{

    //init
    [] call koka_fnc_setMissionParams;
    [] call koka_fnc_pubVars;
    [] call koka_fnc_initIsland;
    [] call koka_fnc_startEquipment;

    //setup
    [{missionNamespace getVariable ["koka_init_missionParamsDone", false]}, {[] call koka_fnc_setTimeDate}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_setTimeDone", false]}, {[] call koka_fnc_setWeather}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_initIslandDone", false]}, {[] call koka_fnc_setupPlayArea}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_initIslandDone", false]}, {[] call koka_fnc_moveToStartPosition}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_setupPlayAreaDone", false]}, {[] call koka_fnc_spawnVehicles}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_setupPlayAreaDone", false]}, {[] call koka_fnc_spawnBoats}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_setupPlayAreaDone", false]}, {[] call koka_fnc_lootInit}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_setupPlayAreaDone", false]}, {[] call koka_fnc_randomTeams}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_randomTeamsDone", false]}, {[] call koka_fnc_generateSWfreq}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["koka_init_generateSWfreqDone", false]}, {[] call koka_fnc_startRound}, []] call CBA_fnc_waitUntilAndExecute;

    //game start
    [{missionNamespace getVariable ["GAMESTARTED", false]}, {[] spawn koka_fnc_blueCircles}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["GAMESTARTED", false]}, {[] call koka_fnc_carePackages}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["GAMESTARTED", false]}, {[] call koka_fnc_winCondition}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["GAMESTARTED", false] && !isNil "NEWCIRCLEPOS" && !isNil "NEWCIRCLESIZE"}, {[] spawn koka_fnc_punishPlayer}, []] call CBA_fnc_waitUntilAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;
