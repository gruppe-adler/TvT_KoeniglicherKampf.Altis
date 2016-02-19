/* Adds killed EH to player to play kill message
*
* executed via init.sqf on player
*/

waitUntil {GAMESTARTED};
mcd_fnc_killMessage = compile preprocessFileLineNumbers "functions\fn_killMessage.sqf";

//Add event handler
player addEventHandler ["killed", {[_this] spawn mcd_fnc_killMessage}];

