
private ["_message", "_unit", "_killer"];

_unit = (_this select 0) select 0;
_killer = (_this select 0) select 1;

diag_log format ["%1 was killed by %2 - sending killmessage in 15 seconds.", (name _unit), (name _killer)];
//15 second delay, so you don't get an instant confirmation if you hit someone
sleep 15;


/* RE-ENABLE, WHEN KILLED EH's WORK CORRECTLY
//generate message
if (_unit == _killer) then {
	_message = format ["%1 killed himself.", (name _unit)];
} else {
	_message = format ["%1 was killed by %2!", (name _unit), (name _killer)];
};
*/

_message = format ["%1 was killed.", (name _unit)];


//broadcast message
[_message,0,0,2,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
