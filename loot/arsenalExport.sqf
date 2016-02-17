/* This lets you list equipment to use in lootConfig.sqf by choosing it in the arsenal
*
* not used in game
*/

backpackList = [];
uniformList = [];
vestList = [];
helmList = [];
listthem = true;

while {listthem} do {

	_bp = backpack player;
	_alreadyin = backpackList find _bp;
	if (_alreadyin == -1) then {
		backpackList = backpackList + [_bp];
		player sideChat format ["%1 added to backpacks.", _bp];
	};

	_uf = uniform player;
	_alreadyin = uniformList find _uf;
	if (_alreadyin == -1) then {
		uniformList = uniformList + [_uf];
		player sideChat format ["%1 added to uniforms.", _uf];
	};

	_vst = vest player;
	_alreadyin = vestList find _vst;
	if (_alreadyin == -1) then {
		vestList = vestList + [_vst];
		player sideChat format ["%1 added to uniforms.", _vst];
	};

	_hlm = headgear player;
	_alreadyin = helmList find _hlm;
	if (_alreadyin == -1) then {
		helmList = helmList + [_hlm];
		player sideChat format ["%1 added to uniforms.", _hlm];
	};

	sleep 0.2;

};