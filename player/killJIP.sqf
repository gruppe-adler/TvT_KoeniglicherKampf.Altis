if (didJIP && (missionNamespace getVariable ["TEAMSETUPSTARTED",false])) then {
	player allowDamage true;
	player setPos [0,0,0];
	player setDamage 1;
};
