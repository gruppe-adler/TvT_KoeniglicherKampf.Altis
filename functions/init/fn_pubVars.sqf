if (!isServer) exitWith {};

TIME_UNTIL_ROUND_START          = 10;           //how long until the round starts after setup\startround.sqf is executed
TIME_UNTIL_FIRST_CIRCLE         = 300;          //how long until the first circle spawns
TIME_UNTIL_GETIN_FIRST          = 420;          //how long you have to get into the first circle
TIME_UNTIL_GETIN                = 180;          //how long you have to get into the circles
TIME_UNTIL_FIRST_CAREPACKAGE    = 180;          //how long until the first carepackage spawns
TIME_KILL_UNCONSCIOUS           = 120;          //4 times as fast if player is outside circle

//CIRCLE_STEP = 250;
CIRCLE_INTERVAL_LASTFEW         = 180;          //see below
NUMBER_OF_FAST_CIRCLES          = 5;            //the last x circles will spawn in the circle_interval_lastfew interval
CIRCLE_MOVEFACTOR               = 0.75;         //how much a new blue circle may change center - 1 = oldradius - newradius, 0 = no movement

JUMP_HEIGHT                     = 1000;         //height the players are dropped from at round start
STARTPOSMINDIST                 = 400;          //how far away from each other the start positions have to be at least
LOOTSPAWN_TICKRATE              = 0.18;         //the less the tickrate, the faster, but the more buggy loot
CAREPACKAGE_INTERVAL            = [250,500];    //carepackages spawn between select 0 and select 1 seconds after another
CAREPACKAGE_DROPHEIGHT          = 700;          //the z-coord ATL carepackages are spawned at
CAREPACKAGE_LOOTAMOUNT          = 6;            //how much loot spawns around a single carepackage

CARMINDISTANCE                  = 100;          //minimum distance of cars to each other
BOATMINDISTANCE                 = 100;          //minimum distance of boats to each other
BOATMAXCOASTDISTANCE            = 35;           //maximum distance from coast that boats may spawn
BOATMAX                         = 70;           //max number of boats thats theoretically possible (real amount depends on how much of playzone is water)

GAMESTARTED = false;
CIRCLESSTARTED = false;
FIRSTCIRCLE = true;

publicVariable "TIME_UNTIL_ROUND_START";
publicVariable "TIME_UNTIL_FIRST_CIRCLE";
publicVariable "TIME_UNTIL_GETIN_FIRST";
publicVariable "TIME_UNTIL_GETIN";
publicVariable "TIME_UNTIL_FIRST_CAREPACKAGE";
publicVariable "TIME_KILL_UNCONSCIOUS";
publicVariable "CIRCLE_INTERVAL_LASTFEW";
publicVariable "NUMBER_OF_FAST_CIRCLES";
publicVariable "CIRCLE_MOVEFACTOR";
publicVariable "JUMP_HEIGHT";
publicVariable "STARTPOSMINDIST";
publicVariable "LOOTSPAWN_TICKRATE";
publicVariable "CAREPACKAGE_INTERVAL";
publicVariable "CAREPACKAGE_DROPHEIGHT";
publicVariable "CAREPACKAGE_LOOTAMOUNT";
publicVariable "CARMINDISTANCE";
publicVariable "BOATMINDISTANCE";
publicVariable "BOATMAXCOASTDISTANCE";
publicVariable "BOATMAX";
publicVariable "GAMESTARTED";
publicVariable "CIRCLESSTARTED";
publicVariable "FIRSTCIRCLE";

missionNamespace setVariable ["koka_init_pubVarsDone",true,true];
