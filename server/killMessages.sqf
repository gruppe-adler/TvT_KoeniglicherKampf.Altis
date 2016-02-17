/* Adds killed EH to all players to play kill message
*
* executed via init.sqf on server
*/

waitUntil {GAMESTARTED};

//Function
mcd_fnc_killMessage = {
	_unit = (_this select 0) select 0;
	_killer = (_this select 0) select 1;

	//15 second delay, so you don't get an instant confirmation if you hit someone
	sleep 15;

	//broadcast message
	_message = format ["%1 was killed by %2!", (name _unit), (name _killer)];
	[_message,0,0,2,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
};


//Add event handler
{
	_x addEventHandler ["killed", {[_this] spawn mcd_fnc_killMessage}];
} forEach playableUnits;

