/*
*   0:  center search pos
*   1:  search radius (number/array)
*   2:  search direction (number/array)
*   3:  water
*           0: doesn't matter
*           1: don't find water pos
*           2: only find water pos
*/

params ["_center","_radius",["_angle",[0,360]],["_water",0]];

if (typeName _radius == "ARRAY") then {
    _min = selectMin _radius;
    _max = selectMax _radius;
    _radius = (random (_max - _min)) + _min;
};

if (typeName _angle == "ARRAY") then {
    _min = selectMin _angle;
    _max = selectMax _angle;
    _angle = (random (_max - _min)) + _min;
};

_searchPos = _center getPos [_radius,_angle];

_pos = switch (_water) do {
    case (0): {
        _searchPos
    };
    case (1): {
        _pos = _searchPos;
        for [{_i=0}, {_i<100}, {_i=_i+1}] do {
            if !(surfaceIsWater _pos) exitWith {};
            _pos = _searchPos getPos [_i*10,random 360];
        };
        _pos
    };
    case (2): {
        _pos = _searchPos;
        for [{_i=0}, {_i<100}, {_i=_i+1}] do {
            if (surfaceIsWater _pos) exitWith {};
            _pos = _searchPos getPos [_i*10,random 360];
        };
        _pos
    };
};

_pos
