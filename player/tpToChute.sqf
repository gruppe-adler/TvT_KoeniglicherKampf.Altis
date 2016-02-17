/* Teleports player to parachute position
*
* executed via startRound.sqf remoteExec
*/

if (!hasInterface) exitWith{};

0 cutText ["", "BLACK FADED", 3, true];
sleep 2;

_pos = player getVariable "PARACHUTEPOSITION";
diag_log format ["Teleporting player to %1", _pos];

player setPos _pos;
player addBackpackGlobal "B_Parachute";

sleep 2;
0 cutText ["", "BLACK IN", 4];

TELEPORTEDTOCHUTE = true;