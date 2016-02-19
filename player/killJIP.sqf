waitUntil {!isNil "TEAMSETUPSTARTED"};
if (didJIP && TEAMSETUPSTARTED) then {
	player allowDamage true;
	player setPos [0,0,0];
	player setDamage 1;
};