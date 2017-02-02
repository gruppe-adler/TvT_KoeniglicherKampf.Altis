
private ["_message", "_unit", "_killer"];

_unit = (_this select 0) select 0;
_killer = _unit getVariable ["ACE_medical_lastDamageSource", _victim];
_unitName = name _unit;
_killerName = name _killer;

diag_log format ["%1 was killed by %2 - sending killmessage in 15 seconds.", _unitName, _killerName];

[{
	params ["_unit","_killer","_unitName","_killerName"];

	//generate message
	if (_unitName == _killerName) then {
		_message = format ["%1 killed himself.", _unitName];
	} else {
		_message = format ["%1 was killed by %2!", _unitName, _killerName];
	};

	//broadcast message
	[_message,0,0,2,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];

}, [_unit,_killer,_unitName,_killerName], 15] call CBA_fnc_waitAndExecute;
