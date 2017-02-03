/* Spawns the actual loot
*
* executed as function in loot\lootInit.sqf
*/

private ["_markerPos", "_totalDistPower", "_type", "_checkedDistPower", "_checkID"];

params ["_pos","_isLast"];
_pos params ["_pos0","_pos1","_pos2"];

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

//Spawn invisible container ========================================================================================================================
_BARREL = createVehicle ["Land_BarrelEmpty_F",[_pos0,_pos1,_pos2+0.1], [], 0, "can_Collide"];
waitUntil {!isNull _BARREL};
//wait until barrel falls
sleep 0.8;

_holder = createVehicle ["groundweaponholder",[_pos0,_pos1,(getposATL _BARREL select 2)], [], 0, "can_Collide"];
deletevehicle _BARREL;

//Add items to weapon holder =======================================================================================================================
switch (_type) do {
	//weapons
	case (0): {
		_loot= selectRandom weaponsLoot;

		_magazines = getArray (configFile / "CfgWeapons" / _loot / "magazines");

		if ((count _magazines) > 0) then {
			_magazineClass = selectRandom _magazines;

			_holder addWeaponCargoGlobal [_loot, 1];
			_holder addMagazineCargoGlobal [_magazineClass, ((round random 4) max 1)];
		} else {
			diag_log format ["Could not find magazines for weapon %1", _loot];
		};
	};

	//magazines
	case (1): {
		_weapon= selectRandom allWeaponsLoot;
		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");

		if ((count _magazines) > 0) then {
			_loot = selectRandom _magazines;

			_amount = (round random 4) max 1;
			_holder addMagazineCargoGlobal [_loot, _amount];
		} else {
			diag_log format ["Could not find magazines for weapon %1", _weapon];
		};
	};

	//clothing
    case (2): {
		_loot= selectRandom itemsLoot;
		_holder addItemCargoGlobal [_loot, 1];

		_loot= selectRandom clothesLoot;
		_holder addItemCargoGlobal [_loot, 1];
    };

	//vests
	case (3): {
		_loot= selectRandom vestsLoot;
		_holder addItemCargoGlobal [_loot, 1];
    };

	//backpacks
	case (4): {
		_loot= selectRandom backpacksLoot;
		_holder addBackpackCargoGlobal [_loot, 1];
    };

	//medical
	case (5): {
		_amount = (floor (random 4.99)) max 1;
		_loot= selectRandom medicalLoot;
		_holder addItemCargoGlobal [_loot, _amount];
    };

	//grenades
	case (6): {
		_amount = (floor (random 2.99)) max 1;
		_loot= selectRandom grenadeLoot;
		_holder addItemCargoGlobal [_loot, _amount];
    };

	//accessories
	case (7): {
		_loot= selectRandom weaponAccessoryLoot;
		_holder addItemCargoGlobal [_loot, 1];
    };

	//sights
	case (8): {
		_loot= selectRandom sightsLoot;
		_holder addItemCargoGlobal [_loot, 1];
    };

	//scopes
	case (9): {
		_loot= selectRandom scopesLoot;
		_holder addItemCargoGlobal [_loot, 1];
	};
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
		_debug = createMarker [_id,_markerPos];
		_debug setMarkerShape "ICON";
		_debug setMarkerType "hd_dot";
		_debug setMarkerColor "ColorRed";
	};
};

if (_isLast) then {
	missionNamespace setVariable ["koka_init_lootInitDone",true,true];
};
