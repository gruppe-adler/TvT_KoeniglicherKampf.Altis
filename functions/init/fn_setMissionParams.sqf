if (!isServer) exitWith {};

DEBUG_MODE = ("debugmode" call BIS_fnc_getParamValue) == 1;
RANDOM_TEAMS = ("randomteams" call BIS_fnc_getParamValue) == 1;
TEAM_SIZE = "teamsize" call BIS_fnc_getParamValue;
CIRCLE_INTERVAL = "circleInterval" call BIS_fnc_getParamValue;
SCOPES_ALLOWED = ("scopes" call BIS_fnc_getParamValue) == 1;
WEATHER_SETTING = "WeatherSetting" call BIS_fnc_getParamValue;
TIME_OF_DAY = "TimeOfDay" call BIS_fnc_getParamValue;
LOOT_PROBABILITY = "lootamount" call BIS_fnc_getParamValue;
CAR_AMOUNT = "vehicleamount" call BIS_fnc_getParamValue;
ARMED_VEHICLES = ("armedvehicles" call BIS_fnc_getParamValue) == 1;

switch (CAR_AMOUNT) do {
	case 0: {MINMAX_CARS = [6,15]};
	case 1: {MINMAX_CARS = [10,25]};
	case 2: {MINMAX_CARS = [15,35]};
};

publicVariable "DEBUG_MODE";
publicVariable "RANDOM_TEAMS";
publicVariable "TEAM_SIZE";
publicVariable "CIRCLE_INTERVAL";
publicVariable "SCOPES_ALLOWED";
publicVariable "WEATHER_SETTING";
publicVariable "TIME_OF_DAY";
publicVariable "LOOT_PROBABILITY";
publicVariable "CAR_AMOUNT";
publicVariable "ARMED_VEHICLES";
publicVariable "MINMAX_CARS";

missionNamespace setVariable ["koka_init_missionParamsDone",true,true];
