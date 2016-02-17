/* Spawns loot on the map
* 
* executed via init.sqf on server
*/

private ["_houseList", "_bPosCounter", "_type","_cleanUpCounter", "_lootSpawnCounter", "_lootSpawnTotalCounter", "_startTime", "_lootSpawned"];

//Load config and loot spawn function
mcd_fnc_spawnLoot = compile preprocessFileLineNumbers "loot\spawnLoot.sqf";
call compile preprocessFileLineNumbers "loot\lootConfig.sqf";
sleep 2;

//Read settings
_startTime = serverTime;
diag_log format ["Loot spawning initialized around %1 with a search radius of %2", PLAYAREACENTER, ISLAND_PLAYAREASIZE];

//Find buildings, save into house list
_houseList =  PLAYAREACENTER nearObjects ["House",ISLAND_PLAYAREASIZE];
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
				[_buildingPos] spawn mcd_fnc_spawnLoot;
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

	//If this runs too fast, loot will spawn at [0,0,0]
	if (_lootSpawned) then {sleep LOOTSPAWN_TICKRATE};	
}foreach _houseList;

diag_log format ["Loot spawning completed in %1 seconds. Spawned loot in %2 positions.", (serverTime - _startTime), _lootSpawnTotalCounter];
if (DEBUG_MODE) then {diag_log format ["Buggy loot spawns: %1", BUGGEDLOOTCOUNTER]};







//Original and or modified, but trashed stuff below
/*
				
{
	_type = typeOf _x;
	diag_log _type;

	if (!(_type in exclusionList)) then {
		diag_log "Not excluded.";

		//buildingpos ID 0
		_buildingPos = _x buildingpos _bPosCounter;

		//As long as the buildingpos exists, do:
		while {((str _buildingPos) != "[0,0,0]")} do {
			
			if (LOOT_PROBABILITY > random 100) then {
				diag_log format ["Loot spawning in %2 at %1", _buildingPos, (str _x)];
				[_buildingPos] spawn mcd_fnc_spawnLoot;
			};	
			
			//Next buildingpos
			_bPosCounter = _bPosCounter +1;
			_buildingPos = _x buildingPos _bPosCounter;
		};
	}
	else
	{
		diag_log "Is excluded.";
	};		

	sleep 0.5;	
}foreach _houseList;

/*
		for "_n" from 0 to 50 do {
	 
			_buildingPos = _x buildingpos _n;
			if (str _buildingPos  ==  "[0,0,0]") exitwith {};
						
			if (LOOT_PROBABILITY > random 100) then {
				diag_log format ["Loot spawning at %1", _buildingPos];
				[_buildingPos] spawn mcd_fnc_spawnLoot;
			};	
		};