uiSleep 0.1;
private ["_known","_list","_count","_i","_object"];

_known = [];
while {true} do{
	if !(isNull player) then {
		_list = ((position player) nearEntities [["LandVehicle","Air","Ship"], 80]) - _known;
		_count = count _list;
		if (_count > 0) then {
			for [{_i = 0}, {_i < _count}, {_i = _i + 1}] do {
				_object = _list select _i;
				if (_object isKindOf "LandVehicle" || {_object isKindOf "Air"} || {_object isKindOf "Ship"}) then {[_object] spawn LOG_OBJ_INIT;};
				if (_object isKindOf "Air") then {[_object] spawn LOG_LIFT_INIT;};
				if (_object isKindOf "LandVehicle" || {_object isKindOf "Ship"}) then {[_object] spawn LOG_TOW_INIT;};
				uiSleep (18/_count);
			};
			_known = _known + _list;
		} else {
			uiSleep 18;
		};
	} else {
		uiSleep 2;
	};
};