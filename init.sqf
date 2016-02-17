call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFile "islandConfig.sqf";

//Misc
disableRemoteSensors true;
CIRCLESSTARTED = false;

//Settings
TIME_UNTIL_ROUND_START = 30;
TIME_UNTIL_FIRST_CIRCLE = 300;
TIME_UNTIL_GETIN_FIRST = 300;
TIME_UNTIL_GETIN = 120;
TIME_UNTIL_FIRST_CAREPACKAGE = 180;

JUMP_HEIGHT = 1000;
MINMAX_CARS = [10,25];
LOOT_PROBABILITY = 65;
LOOTSPAWN_TICKRATE = 0.2;
CAREPACKAGE_INTERVAL = [120,300];
CAREPACKAGE_DROPHEIGHT = 500;
CAREPACKAGE_LOOTAMOUNT = 6;

//Read Islandconfig
ISLAND_CENTER = (ISLAND_CONFIG select (ISLANDS find worldName)) select 1;
ISLAND_SPAWNSEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 2;
ISLAND_USEWHOLE = (ISLAND_CONFIG select (ISLANDS find worldName)) select 5;
ISLAND_PLAYAREASEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 6;

//Parameters
DEBUG_MODE = (paramsArray select 0) == 1;
RANDOM_TEAMS = (paramsArray select 1) == 1;
TEAM_SIZE = paramsArray select 2;
GAME_TIME = paramsArray select 3;
SCOPES_ALLOWED = (paramsArray select 4) == 1;
WEATHER_SETTING = paramsArray select 5;
TIME_OF_DAY = paramsArray select 6;

//Weather
setCustomWeather = {
	// skipTime -24; 
	0 setOvercast (_this select 0); 
	setViewDistance 6000;
	// skipTime 24;
};

switch (WEATHER_SETTING) do {
	case 0: {[0] call setCustomWeather;};
	case 1: {[0.4] call setCustomWeather;};
	case 2: {[1] call setCustomWeather;};
	case 3: {[random 1] call setCustomWeather;};
	default {[0] call setCustomWeather;};
};


//SERVER ONLY
if (isServer) then {

	// set to full moon date
	if (TIME_OF_DAY == 1000) then {
		TIME_OF_DAY = (random 10.5) + 6.5;
		diag_log "Random time of day.";
	};
	diag_log format ["Setting time of day to %1.", TIME_OF_DAY];
	setDate [2015, 2, 2, TIME_OF_DAY, 1];

	GAMESTARTED = false;
	publicVariable "GAMESTARTED";
	TEAMSETUPSTARTED = false;
	publicVariable "TEAMSETUPSTARTED";

	//TFAR
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	
	//Setup
	_areahndl = [] execVM "setup\playArea.sqf";
	waitUntil {scriptDone _areahndl};

	_vehhndl = [] execVM "setup\spawnVehicles.sqf";
	_loothndl = [] execVM "loot\lootInit.sqf";
	waitUntil {scriptDone _vehhndl};
	waitUntil {scriptDone _loothndl};

	TEAMSETUPSTARTED = true;
	publicVariable "TEAMSETUPSTARTED";

	_teamshdnl = [] execVM "setup\randomTeams.sqf";
	waitUntil {scriptDone _teamshdnl};

	_startrndhndl = [] execVM "setup\startRound.sqf";
	waitUntil {scriptDone _startrndhndl};

	//Game
	[] execVM "server\blueCircles.sqf";
	[] execVM "server\killMessages.sqf";
	[] execVM "server\carePackages.sqf";
	[] execVM "server\winCondition.sqf";

};

//PLAYERS ONLY
if (hasInterface) then {

	waitUntil {!isNil "TEAMSETUPSTARTED"};

	if (didJIP && TEAMSETUPSTARTED) then {
		player setDamage 1;
	}
	else {
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
		[] execVM "player\briefing.sqf";

		//Intro
		if (!didJIP) then {
			[] execVM "intro.sqf";
		};
	};
};