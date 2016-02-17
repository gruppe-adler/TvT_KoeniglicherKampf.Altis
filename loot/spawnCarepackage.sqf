/* Function that spawns carepackages
*
* executed in server\carePackages.sqf on server
*/

params ["_carepackagePos"];
private ["_inTheAir", "_box","_chute","_smoke", "_lootPos", "_fallSpeed", "_weaponType"];

diag_log format ["Spawning carepackage at %1", _carepackagePos];

//Add marker if in debug mode
if (DEBUG_MODE) then {
	_markername = "cpmarker_" + (str floor time);
	_marker = createMarker [_markername, _carepackagePos];
	_marker setMarkerColor "COLORORANGE";
	_marker setMarkerType "hd_destroy";
};

//Spawn carepackage
_box = "Land_CargoBox_V1_F" createVehicle _carepackagePos;
_chute = createVehicle ["B_Parachute_02_F", _carepackagePos, [], 0, "FLY"];
_smoke = createVehicle ["SmokeshellRed", _carepackagePos, [], 0, "FORM"];

_smoke attachTo [_box, [0,0,0]];
_box attachTo [_chute, [0, 0, -0.5]];

//Play aircraft sound
[_box, "BattlefieldJet2"] remoteExec ["say3D", 0, false];

//Wait until box is on the ground
_oldHeight = (getPos _box) select 2;
sleep 3;
_inTheAir = true;
while {_inTheAir} do {
	sleep 1;

	if ((typeOf _smoke) == "") then {
		_smoke = createVehicle ["SmokeshellRed", getPos _box, [], 0, "FORM"];
		_smoke attachTo [_box, [0,0,0]];
	};

	//check if box is still falling
	_newHeight = (getPos _box) select 2;
	_fallSpeed = (_oldHeight - _newHeight);

	if (_fallSpeed < 0.2) then {
		diag_log format ["Carepackage has stopped falling. Fall speed was %1 m/s.", _fallSpeed];

		//delete parachute in case it gets stuck in a tree
		[_chute] spawn 	{
							_chute = _this select 0; 
							sleep 3;
							if ((typeOf _chute) != "") then {
								diag_log "Deleting parachute.";
								deleteVehicle _chute;
							};
						};

		_inTheAir = false;
	};

	_oldHeight = _newHeight;
};

//Spawn loot
for "_i" from 0 to CAREPACKAGE_LOOTAMOUNT do {

	//Find position
	_angle = 360 / CAREPACKAGE_LOOTAMOUNT;
	_relDir = (random _angle) + (_i * _angle);
	_distance = (random 2) + 1.5;
	_lootPos = (getPos _box) vectorAdd [(cos _relDir) * _distance, (sin _relDir) * _distance, 0];
	//Replace this shit with this in 1.55:
	//_lootPos = _box getRelPos [_distance, _relDir];
	_lootPos set [2, 0];
	_holder = createVehicle ["groundweaponholder", _lootPos, [], 0, "can_Collide"];

	//Add contents to weaponholder
	_type = floor (random 3.99);

	//Weapon
	if (_type == 0) then {
		_weaponType = floor random 1.99;

		//Any other weapon
		if (_weaponType == 0) then {			
			_weapon = CPWEAPONS call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

			_holder addWeaponCargoGlobal [_weapon, 1];
			_holder addMagazineCargoGlobal [_magazineClass, (floor random 4) max 1];

		//Sniper
		} else {		
			_weapon = CPSNIPERS call bis_fnc_selectRandom; 
			_scope = CPSCOPES call bis_fnc_selectRandom;
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

			_holder addWeaponCargoGlobal [_weapon, 1];
			_holder addItemCargoGlobal [_scope, 1];
			_holder addMagazineCargoGlobal [_magazineClass, (floor random 4) max 1];
		};
	};

	//Ammo type items
	if (_type == 1) then {
		_ammo = CPAMMO call bis_fnc_selectRandom; 
		_holder addMagazineCargoGlobal [_ammo, (floor random 3) max 1];
		_holder addItemCargoGlobal ["ACE_Clacker", 1];
	};	

	//Items
	if (_type == 2) then {
		_item = CPMEDICAL call bis_fnc_selectRandom;
		_holder addItemCargoGlobal [_item, (floor random 5) max 1];
	};	

	//Vest and Uniforms 
	if (_type == 3) then {
		_item = CPVESTSANDUNIFORMS call bis_fnc_selectRandom;
		_holder addItemCargoGlobal [_item, 1];
	};
};





