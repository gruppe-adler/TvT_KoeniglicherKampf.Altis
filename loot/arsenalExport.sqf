/* This lets you list equipment to use in lootConfig.sqf by choosing it in the arsenal
*
* not used in game
*/

backpackList = [];
uniformList = [];
vestList = [];
helmList = [];
weaponList = [];
accessoryList = [];
listthem = true;

while {listthem} do {

	_bp = backpack player;
	_id = backpackList pushBackUnique _bp;
	if (_id != -1) then {
		systemChat format ["%1 added to backpacks.", _bp];
	};

	_uf = uniform player;
	_id = uniformList pushBackUnique _uf;
	if (_id != -1) then {
		systemChat format ["%1 added to uniforms.", _uf];
	};

	_vst = vest player;
	_id = vestList pushBackUnique _vst;
	if (_id != -1) then {
		systemChat format ["%1 added to vests.", _vst];
	};

	_hlm = headgear player;
	_id = helmList pushBackUnique _hlm;
	if (_id != -1) then {
		systemChat format ["%1 added to helmets.", _hlm];
	};

	_wp = primaryWeapon player;
	_id = weaponList pushBackUnique _wp;
	if (_id != -1) then {
		systemChat format ["%1 added to weapons.", _wp];
	};

	_wp = secondaryWeapon player;
	_id = weaponList pushBackUnique _wp;
	if (_id != -1) then {
		systemChat format ["%1 added to weapons.", _wp];
	};

	_wp = handgunWeapon player;
	_id = weaponList pushBackUnique _wp;
	if (_id != -1) then {
		systemChat format ["%1 added to weapons.", _wp];
	};

	_accessories = primaryWeaponItems player;
	{
		if (_x != "") then {_id = accessoryList pushBackUnique _x} else {_id = -1};
		if (_id != -1) then {
			systemChat format ["%1 added to accessories.", _wp];
		};
	} forEach _accessories;

	_accessories = player weaponAccessories (handgunWeapon player);
	{
		if (_x != "") then {_id = accessoryList pushBackUnique _x} else {_id = -1};
		if (_id != -1) then {
			systemChat format ["%1 added to accessories.", _wp];
		};
	} forEach _accessories;

	sleep 0.2;
};
