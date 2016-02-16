0 = ["ChromAberration", 200, [0.05, 0.05, true]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 5;
	waitUntil {ppEffectCommitted _handle};

	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};