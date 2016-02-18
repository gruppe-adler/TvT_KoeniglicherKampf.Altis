/* Some additional functions in debug mode
*
* executed via init.sqf on client
*/

mcd_fnc_blueCircleTest = preprocessFileLineNumbers "server\blueCircles.sqf"; 

//Start game manually
_trggr = createTrigger ["EmptyDetector", [0,0,0], true];
_trggr setTriggerActivation ["ALPHA", "PRESENT", true];
_trggr setTriggerStatements ["true", "DEBUG_START = true; publicVariable 'DEBUG_START'", ""];
_trggr setTriggerText "Start Game";
