call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFile "islandConfig.sqf";

//Misc
CIRCLESSTARTED = false;

//Settings
JUMP_HEIGHT = 1000;
TIME_UNTIL_ROUND_START = 30;
TIME_UNTIL_FIRST_CIRCLE = 300;
TIME_UNTIL_GETIN_FIRST = 300;
TIME_UNTIL_GETIN = 120;
MINMAX_CARS = [10,25];
LOOT_PROBABILITY = 75;
LOOTSPAWN_TICKRATE = 0.2;

//Read Islandconfig
ISLAND_CENTER = (ISLAND_CONFIG select (ISLANDS find worldName)) select 1;
ISLAND_SPAWNSEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 2;
ISLAND_USEWHOLE = (ISLAND_CONFIG select (ISLANDS find worldName)) select 5;
ISLAND_PLAYAREASEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 6;
ISLAND_PLAYAREASIZE = ISLAND_SPAWNSEARCHRADIUS + 500;

//Parameters
DEBUG_MODE = (paramsArray select 0) == 1;
RANDOM_TEAMS = (paramsArray select 1) == 1;
TEAM_SIZE = paramsArray select 2;
GAME_TIME = paramsArray select 3;

//PLAYERS ONLY
if (hasInterface) then {

	//Damage
	player allowDamage false;
	"GAMESTARTED" addPublicVariableEventHandler {
		player allowDamage true;
		diag_log "Player allowed damage";
	};

	//Setup
	[] execVM "player\startPosition.sqf";
	[] execVM "player\startEquipment.sqf";
	[] execVM "player\punishPlayer.sqf";

	//Intro
	if (!didJIP) then {
		//Intro
		[] execVM "intro.sqf";
	};
};

//SERVER ONLY
if (isServer) then {

	//TFAR
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	
	//Setup
	_areahndl = [] execVM "setup\playArea.sqf";
	waitUntil {scriptDone _areahndl};

	_vehhndl = [] execVM "setup\spawnVehicles.sqf";
	_loothndl = [] execVM "loot\lootInit.sqf";
	_teamshdnl = [] execVM "setup\randomTeams.sqf";
	waitUntil {scriptDone _teamshdnl};
	waitUntil {scriptDone _vehhndl};
	waitUntil {scriptDone _loothndl};

	_startrndhndl = [] execVM "setup\startRound.sqf";
	waitUntil {scriptDone _startrndhndl};

	//Game
	[] execVM "server\blueCircles.sqf";

};
