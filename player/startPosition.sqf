/* Teleportiert Spieler zur mapspezifischen Startposition
*
* Ausgeführt durch init.sqf auf clients
*/

waitUntil {player==player};

_spawnPositionCenter = (ISLAND_CONFIG select (ISLANDS find worldName)) select 0;
_teleportPosition = [_spawnPositionCenter,[0,15], [0,360]] call SHK_pos;

diag_log format ["Startposition read - Moving player to: %1", _teleportPosition];

player setPos _teleportPosition;
player switchmove "AmovPercMstpSnonWnonDnon";

sleep 1;
diag_log format ["Player moved to: %1", (position player)];