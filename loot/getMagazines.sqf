
magazineList = []; 

{
	_weapon = _x;
	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	magazineList = magazineList + _magazines;
} forEach weaponsLoot;
