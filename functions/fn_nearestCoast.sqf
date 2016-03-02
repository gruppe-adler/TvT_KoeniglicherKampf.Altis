/* 	Finds nearest coast within _maxDist
*
* 	Parameters:
*		0 - position from which to search
*		1 - maximum search distance
*		2 - minimum depth that water has to have near coast to avoid finding lakes (only relevant if start position is land)
*		3 - angle increase per search, lower is more accurate but slower
*		4 - distance increase per search, lower is more accurate but slower
*
*	Returns:
*		Coast position in format PositionASL
*		[0,0,0] if no coast found within search distance
*
*	Example:
*		[position player, 5000, 5] call mcd_fnc_nearestCoast
*/

params [["_startPos", [0,0,0]], ["_maxDist", 2000], ["_minDepth", 5], ["_angleStep", 10], ["_distStep", 20]];
private ["_searchDist", "_coastFound", "_newPos", "_newPosIsWater", "_coastFound"];

_coastFound = false;
_startPosIsWater = surfaceIsWater _startPos;
_newPosIsWater = _startPosIsWater;
_searchDist = 0;

while {_searchDist = _searchDist + _distStep; !_coastFound && _searchDist < _maxDist} do {
	for "_i" from 0 to 340 step _angleStep do {
		_newPos = _startPos vectorAdd [_searchDist * (sin _i), _searchDist * (cos _i), 0];
		_newPosIsWater = surfaceIsWater _newPos;

		if ((!_startPosIsWater && _newPosIsWater) || (_startPosIsWater && !_newPosIsWater)) then {
			if (!_startPosIsWater) then {
				if (getTerrainHeightASL _newPos < -_minDepth) then {_coastFound = true};
			} else {
				_coastFound = true;
			};
		};	
		if (_coastFound) exitWith {};
	};	
};


if (!_coastFound) then {_newPos = [0,0,0]};

//return
_newPos
