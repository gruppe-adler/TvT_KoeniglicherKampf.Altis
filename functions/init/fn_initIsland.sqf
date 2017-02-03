call compile preprocessFile "islandConfig.sqf";

if (!isServer) exitWith {};

ISLAND_CENTER = (ISLAND_CONFIG select (ISLANDS find worldName)) select 1;
ISLAND_SPAWNSEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 2;
ISLAND_USEWHOLE = (ISLAND_CONFIG select (ISLANDS find worldName)) select 5;
ISLAND_PLAYAREASEARCHRADIUS = (ISLAND_CONFIG select (ISLANDS find worldName)) select 6;

publicVariable "ISLAND_CENTER";
publicVariable "ISLAND_SPAWNSEARCHRADIUS";
publicVariable "ISLAND_USEWHOLE";
publicVariable "ISLAND_PLAYAREASEARCHRADIUS";

missionNamespace setVariable ["koka_init_initIslandDone",true,true];
