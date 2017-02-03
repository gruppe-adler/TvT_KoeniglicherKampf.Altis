magazineList = [];

{
	_weapon = _x;
	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	_magazinesNoBlanks = _magazines select {([configFile >> "CfgMagazines" >> _x >> "initSpeed", "number", 900] call CBA_fnc_getConfigEntry) < 15};
	magazineList = magazineList + _magazinesNoBlanks;
} forEach weaponsLoot;
