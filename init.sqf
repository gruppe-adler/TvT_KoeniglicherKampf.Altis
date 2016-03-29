call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFile "islandConfig.sqf";

//Misc
disableRemoteSensors true;
CIRCLESSTARTED = false;
FIRSTCIRCLE = true;

//Settings ======================================================================================================================
TIME_UNTIL_ROUND_START = 10;				//how long until the round starts after setup\startround.sqf is executed
TIME_UNTIL_FIRST_CIRCLE = 300;				//how long until the first circle spawns
TIME_UNTIL_GETIN_FIRST = 420;				//how long you have to get into the first circle
TIME_UNTIL_GETIN = 180;						//how long you have to get into the circles
TIME_UNTIL_FIRST_CAREPACKAGE = 180;			//how long until the first carepackage spawns
TIME_KILL_UNCONSCIOUS = 120;				//4 times as fast if player is outside circle

//CIRCLE_STEP = 250;
CIRCLE_INTERVAL_LASTFEW = 180;				//see below
NUMBER_OF_FAST_CIRCLES = 5;					//the last x circles will spawn in the circle_interval_lastfew interval
CIRCLE_MOVEFACTOR = 0.75;					//how much a new blue circle may change center - 1 = oldradius - newradius, 0 = no movement

JUMP_HEIGHT = 1000;							//height the players are dropped from at round start
STARTPOSMINDIST = 400;						//how far away from each other the start positions have to be at least
LOOTSPAWN_TICKRATE = 0.18;					//the less the tickrate, the faster, but the more buggy loot
CAREPACKAGE_INTERVAL = [250,500];			//carepackages spawn between select 0 and select 1 seconds after another
CAREPACKAGE_DROPHEIGHT = 700;				//the z-coord ATL carepackages are spawned at
CAREPACKAGE_LOOTAMOUNT = 6;					//how much loot spawns around a single carepackage

CARMINDISTANCE = 100;						//minimum distance of cars to each other
BOATMINDISTANCE = 100;						//minimum distance of boats to each other
BOATMAXCOASTDISTANCE = 35;					//maximum distance from coast that boats may spawn
BOATMAX = 70;								//max number of boats thats theoretically possible (real amount depends on how much of playzone is water)

//Read Islandconfig
ISLAND_CENTER = (ISLAND_CONFIG select (ISLANDS find worldName)) select 1;
ISLAND_SPAWNSEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 2;
ISLAND_USEWHOLE = (ISLAND_CONFIG select (ISLANDS find worldName)) select 5;
ISLAND_PLAYAREASEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 6;

//Parameters
DEBUG_MODE = (paramsArray select 0) == 1;
RANDOM_TEAMS = (paramsArray select 1) == 1;
TEAM_SIZE = paramsArray select 2;
CIRCLE_INTERVAL = paramsArray select 3;
//GAME_TIME = paramsArray select 3;
SCOPES_ALLOWED = (paramsArray select 4) == 1;
WEATHER_SETTING = paramsArray select 5;
TIME_OF_DAY = paramsArray select 6;
LOOT_PROBABILITY = paramsArray select 7;
CAR_AMOUNT = paramsArray select 8;
ARMED_VEHICLES = (paramsArray select 9) == 1;

switch (CAR_AMOUNT) do {
	case 0: {MINMAX_CARS = [6,15]};
	case 1: {MINMAX_CARS = [10,25]};
	case 2: {MINMAX_CARS = [15,35]};
};

setViewDistance 3500;

setCustomWeather = {
	// skipTime -24;
	10 setOvercast (_this select 0);
	10 setRain 0;
	if ((_this select 0) > 0.5) then {
		_fogDensity = 0.2;
		_fogFalloff = 0;
		10 setFog [_fogDensity, _fogFalloff, 0];
	};
	if (_this select 1 && (_this select 0) > 0.7) then {
		10 setRain 1;
		_fogDensity = 0.4;
		_fogFalloff = 0;
		10 setFog [_fogDensity, _fogFalloff, 1];
	};

	forceWeatherChange;
	// skipTime 24;
};

//SERVER ONLY ===================================================================================================================
if (isServer) then {

	switch (WEATHER_SETTING) do {
		case 0: {[0,false] call setCustomWeather;};
		case 1: {[0.65,false] call setCustomWeather;};
		case 2: {[1,true] call setCustomWeather;};
		case 3: {[random 1,true] call setCustomWeather;};
		default {[0,false] call setCustomWeather;};
  };

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
	_boathndl = [] execVM "setup\spawnBoats.sqf";
	_loothndl = [] execVM "loot\lootInit.sqf";
	waitUntil {scriptDone _vehhndl};
	waitUntil {scriptDone _boathndl};
	waitUntil {scriptDone _loothndl};

	TEAMSETUPSTARTED = true;
	publicVariable "TEAMSETUPSTARTED";

	_teamshdnl = [] execVM "setup\randomTeams.sqf";
	waitUntil {scriptDone _teamshdnl};

	_genSWhndl = [] execVM "setup\generateSWfreq.sqf";
	waitUntil {scriptDone _genSWhndl};

	//Manual gamestart in debug mode
	DEBUG_START = false;
	if (!DEBUG_MODE) then {DEBUG_START = true};
	waitUntil {DEBUG_START};

	_startrndhndl = [] execVM "setup\startRound.sqf";
	waitUntil {scriptDone _startrndhndl};

	//Game
	[] execVM "server\blueCircles.sqf";
	[] execVM "server\carePackages.sqf";
	[] execVM "server\winCondition.sqf";

};


//PLAYERS ONLY
if (hasInterface) then {

	if (DEBUG_MODE) then {[] execVM "debug\trigger.sqf"};

	TELEPORTEDTOCHUTE = false;

	//Damage
	player allowDamage false;
	"GAMESTARTED" addPublicVariableEventHandler {
		if (GAMESTARTED) then {
			player allowDamage true;
			diag_log "Player allowed damage";
		};
	};

	waitUntil {!isNull player};
	waitUntil {player == player};

	//Setup
	[] execVM "player\killJIP.sqf";
	[] execVM "player\startPosition.sqf";
	[] execVM "player\startEquipment.sqf";
	[] execVM "player\punishPlayer.sqf";
	[] execVM "player\briefing.sqf";
	[] execVM "player\killMessages.sqf";

	//Intro
	if (!didJIP) then {
		[] execVM "intro.sqf";

	};
};
