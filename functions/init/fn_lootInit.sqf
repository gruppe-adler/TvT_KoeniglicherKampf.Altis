/* Spawns loot on the map
*
* executed via init.sqf on server
*/

if (!isServer) exitWith {};

private ["_houseList", "_bPosCounter", "_type","_cleanUpCounter", "_lootSpawnCounter", "_lootSpawnTotalCounter", "_startTime", "_lootSpawned", "_searchAreaSize","_houseCounter","_halfNumberOfHouses"];

//Load config and loot spawn function
call compile preprocessFileLineNumbers "loot\lootConfig.sqf";
call compile preprocessFile "loot\carepackageConfig.sqf";
allWeaponsLoot = weaponsLoot + CPWEAPONS;


sleep 2;

//Read settings
_startTime = serverTime;

//Find buildings, save into house list
if (ISLAND_USEWHOLE) then {
	_searchAreaSize = ISLAND_PLAYAREASIZE + 2000;
} else {
	_searchAreaSize = ISLAND_PLAYAREASIZE;
};

diag_log format ["Loot spawning initialized around %1 with a search radius of %2", PLAYAREACENTER, _searchAreaSize];

_houseList =  PLAYAREACENTER nearObjects ["House",_searchAreaSize];
diag_log format ["%1 houses found:", (count _houseList)];

//Clean up house list (remove buildings that are unable to spawn loot)
_cleanUpCounter = 0;
{
	_buildingPos = _x buildingPos 0;
	if ((str _buildingPos) == "[0,0,0]") then {
			_houseList = _houseList - [_x];
			_cleanUpCounter = _cleanUpCounter + 1;
	};
}forEach _houseList;
diag_log format ["%1 houses unable to spawn loot and cleaned from list.", _cleanUpCounter];
diag_log format ["%1 houses remaining.", (count _houseList)];

//Save houselist for debug console
if (DEBUG_MODE) then {HOUSELIST = _houseList; BUGGEDLOOTCOUNTER = 0};



//Main loop - spawn loot in each house
_lootSpawnTotalCounter = 0;
_houseCounter = 0;
_halfNumberOfHouses = (count _houseList) / 2;
{
	_bPosCounter = 0;
	_lootSpawnCounter = 0;
	_lootSpawned = false;

	_type = typeOf _x;

	if (!(_type in exclusionList)) then {

		//buildingpos ID 0
		_buildingPos = _x buildingpos _bPosCounter;

		//As long as the buildingpos exists, do:
		while {((str _buildingPos) != "[0,0,0]")} do {

			if (LOOT_PROBABILITY > random 100) then {
				[_buildingPos] spawn koka_fnc_spawnLoot;
				_lootSpawnCounter = _lootSpawnCounter +1;
				_lootSpawned = true;
			};

			//Next buildingpos
			_bPosCounter = _bPosCounter +1;
			_buildingPos = _x buildingPos _bPosCounter;
		};
		//if (DEBUG_MODE) then {diag_log format ["%1 spawned loot in %2 positions.", (typeOf _x), _lootSpawnCounter]};
	}
	else
	{
		diag_log format ["%1 is excluded as per exclusionList", _type];
	};
	_lootSpawnTotalCounter = _lootSpawnTotalCounter + _lootSpawnCounter;

	/* //deactivated, since loot spawning is fast now
	_houseCounter = _houseCounter +1;
	if (_houseCounter == _halfNumberOfHouses) then {
		["Lootspawning halfway done.",0,0,2,0.3] remoteExec ["BIS_fnc_dynamicText",0,false];
	};
	*/

	//If this runs too fast, loot will spawn at [0,0,0]
}foreach _houseList;

diag_log format ["Loot spawning completed in %1 seconds. Spawned loot in %2 positions.", (serverTime - _startTime), _lootSpawnTotalCounter];
if (DEBUG_MODE) then {diag_log format ["Buggy loot spawns: %1", BUGGEDLOOTCOUNTER]};
