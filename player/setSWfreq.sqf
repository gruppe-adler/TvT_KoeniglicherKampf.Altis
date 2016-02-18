/* Sets SW frequency to what the server generated for their team
*
* executed on clients by setup\generateSWfreq.sqf
*/

if (!hasInterface) exitWith {};

private ["_teamlead"];

_teamlead = leader player;
_freq = _teamlead getVariable "swfreq";

[(call TFAR_fnc_activeSwRadio), _freq] call TFAR_fnc_setSwFrequency;

diag_log format ["SW frequency set to %1.", _freq];