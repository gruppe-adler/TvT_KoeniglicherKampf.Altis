/*  Adds killed EH to units
*
*   only necessary on server
*   executed on mission start via server\setup\teamSetup.sqf for all playable units
*/

params ["_unit"];

_unit addEventHandler ["killed", {[_this] spawn mcd_fnc_killMessage}];
diag_log format ["fnc_addKilledEH - Added killed EH to %1.", name _unit];
