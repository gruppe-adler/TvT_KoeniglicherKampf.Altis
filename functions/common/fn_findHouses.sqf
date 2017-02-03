params ["_searchAreaSize"];

_exclusionList = [(missionConfigFile >> "CfgHouses" >> "exclusionList"),"array",[]] call CBA_fnc_getConfigEntry;

_houseList =  PLAYAREACENTER nearObjects ["House",_searchAreaSize];

//Clean up house list (remove buildings that are unable to spawn loot)
_cleanUpCounter = 0;
{
	_buildingPos = _x buildingPos 0;
	if ((str _buildingPos) == "[0,0,0]" || (typeOf _x) in _exclusionList) then {
			_houseList = _houseList - [_x];
			_cleanUpCounter = _cleanUpCounter + 1;
	};
} forEach _houseList;

diag_log format ["%1 houses found:", (count _houseList)];

_houseList
