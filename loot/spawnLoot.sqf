/* Spawns the actual loot
*
* executed as function in loot\lootInit.sqf
*/
private ["_markerPos"];

_pos =	(_this select 0);
_pos0 =	(_pos select 0);
_pos1 =	(_pos select 1);
_pos2 =	(_pos select 2);


_BARREL = createVehicle ["Land_BarrelEmpty_F",[_pos0,_pos1,_pos2+0.1], [], 0, "can_Collide"];
sleep 0.5;

_holder = createVehicle ["groundweaponholder",[_pos0,_pos1,(getposATL _BARREL select 2)], [], 0, "can_Collide"];
sleep 0.5;
deletevehicle _BARREL;

_type=floor (random 5);

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

// Spawn Weapon
if (_type == 0) then {
	_weapon= weaponsLoot call bis_fnc_selectRandom; 

	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	_magazineClass = _magazines call bis_fnc_selectRandom; 

	_holder addWeaponCargoGlobal [_weapon, 1];
	_holder addMagazineCargoGlobal [_magazineClass, 2];
};


// Spawn Magazines
if (_type == 1) then {
	_weapon= weaponsLoot call bis_fnc_selectRandom; 
	_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
	_magazineClass = _magazines call bis_fnc_selectRandom; 

	_holder addMagazineCargoGlobal [_magazineClass, 2];
};	


// Spawn Items
if (_type == 2) then {
	_item= itemsLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_item, 1];

	_clothing= clothesLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_clothing, 1];
};	


// Spawn Vests
if (_type == 3) then {
	_vest= vestsLoot call bis_fnc_selectRandom;
	_holder addItemCargoGlobal [_vest, 1];
};


// Spawn Backpacks
if (_type == 4) then {
	_backpack= backpacksLoot call bis_fnc_selectRandom;
	_holder addBackpackCargoGlobal [_backpack, 1];
};
