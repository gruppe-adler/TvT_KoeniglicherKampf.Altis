private ["_handle","_name","_priority","_effect"];
_name = "ChromAberration";
_priority = 200;
_effect = [0.03, 0.03, false];

_sounds = ["WoundedGuyB_01","WoundedGuyB_02","WoundedGuyB_03","WoundedGuyB_04","WoundedGuyB_05","WoundedGuyB_06","WoundedGuyB_07","WoundedGuyB_08"];
_sound = selectRandom _sounds;
player say3D _sound;

while {
	_handle = ppEffectCreate [_name, _priority];
	_handle < 0;
} do {
	_priority = _priority + 1;
};

_handle ppEffectEnable true;
_handle ppEffectAdjust _effect;
_handle ppEffectCommit 0.1;
waitUntil {ppEffectCommitted _handle};

_handle ppEffectAdjust [0, 0, false];
_handle ppEffectCommit 1.8;
waitUntil {ppEffectCommitted _handle};

_handle ppEffectEnable false;
ppEffectDestroy _handle;