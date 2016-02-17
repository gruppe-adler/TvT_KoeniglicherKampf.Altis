/* Spawns the actual loot
*
* executed as function in loot\lootInit.sqf
*/

private ["_markerPos", "_totalDistPower", "_type", "_checkedDistPower", "_checkID"];

_pos =	(_this select 0);
_pos0 =	(_pos select 0);
_pos1 =	(_pos select 1);
_pos2 =	(_pos select 2);


//Spawn invisible container ========================================================================================================================
_BARREL = createVehicle ["Land_BarrelEmpty_F",[_pos0,_pos1,_pos2+0.1], [], 0, "can_Collide"];
sleep 0.5;

_holder = createVehicle ["groundweaponholder",[_pos0,_pos1,(getposATL _BARREL select 2)], [], 0, "can_Collide"];
sleep 0.5;
deletevehicle _BARREL;

//Random loot type =================================================================================================================================
//Generate random number based on distribution table
_totalDistPower = 0;
{
	_totalDistPower = _totalDistPower + _x;
} forEach LOOT_DISTRIBUTION;
_randomNumber = random _totalDistPower;

//Choose type based on generated number
_checkedDistPower = 0;
_type = 1000;
_checkID = 0;
while {_type == 1000} do {
	_checkedDistPower = _checkedDistPower + (LOOT_DISTRIBUTION select _checkID);

	if (_randomNumber < _checkedDistPower) then {
		_type = _checkID;
	};
	_checkID = _checkID + 1;
};


//Mark on map if DEBUG =============================================================================================================================
if (DEBUG_MODE) then {		
	_markerPos = GETPOS _holder;
	if ((str _markerPos) == "[0,0,0]") then {
		BUGGEDLOOTCOUNTER = BUGGEDLOOTCOUNTER +1;
	}
	else
	{
		_id=format ["%1",_pos];
		_debug=createMarker [_id,_markerPos];
		_debug setMarkerShape "ICON";
		_debug setMarkerType "hd_dot";
		_debug setMarkerColor "ColorRed";
		_txt=format ["%1",_type];
		_debug setMarkerText _txt;	
	};
};


//Add items to weapon holder =======================================================================================================================

// Spawn Weapon
if (_type == 0) then {
	_loot= weaponsLoot call bis_fnc_selectRandom; 

	_magazines = getArray (configFile / "CfgWeapons" / _loot / "magazines");

	if ((count _magazines) > 0) then {
		_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_loot, 1];
		_holder addMagazineCargoGlobal [_magazineClass, (floor random 3.99)];
	} else {
		diag_log format ["Could not find magazines for weapon %1", _loot];
	};
};


// Spawn Magazines
if (_type == 1) then {
	_weapon= weaponsLoot call bis_fnc_selectRandom; 
	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");

	if ((count _magazines) > 0) then {
		_loot = _magazines call bis_fnc_selectRandom; 

		_amount = (floor (random 4.99)) max 1;
		_holder addMagazineCargoGlobal [_loot, _amount];
	} else {
		diag_log format ["Could not find magazines for weapon %1", _weapon];
	};

};	


// Spawn Clothing
if (_type == 2) then {
	_loot= itemsLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, 1];

	_loot= clothesLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, 1];
};	


// Spawn Vests
if (_type == 3) then {
	_loot= vestsLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, 1];
};


// Spawn Backpacks
if (_type == 4) then {
	_loot= backpacksLoot call bis_fnc_selectRandom;
	_holder addBackpackCargoGlobal [_loot, 1];
};


// Spawn Medical
if (_type == 5) then {
	_amount = (floor (random 4.99)) max 1;
	_loot= medicalLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, _amount];
};


//Spawn Grenades
if (_type == 6) then {
	_amount = (floor (random 2.99)) max 1;
	_loot= grenadeLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, _amount];
};

//Spawn Weapon Accessories
if (_type == 7) then {
	_loot= weaponAccessoryLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, 1];
};

//Spawn Sights
if (_type == 8) then {
	_loot= sightsLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, 1];
};

//Spawn Scopes
if (_type == 9) then {
	_loot= scopesLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_loot, 1];
};
