private ["_target","_vehicle","_distance"];

while {true} do {
	LOG_OBJECT_ADDACTION = objNull;
	_target = cursorTarget;
	_vehicle = vehicle player;
	
	if (!(isNull _target) && {player distance _target < 13}) then {
		LOG_OBJECT_ADDACTION = _target;
		_distance = [0,0,0] distance velocity _target < 8;

		if (_target isKindOf "LandVehicle" || {_target isKindOf "Ship"}) then {
			LOG_OBJECT_TRAILER_VALID = (_vehicle == player && {alive _target} && {count crew _target == 0} &&
			{isNull LOG_OBJECT_MOVES} && {isNull (_target getVariable "LOG_moves_by")} &&
			(isNull (_target getVariable "LOG_moves_by") || (!alive (_target getVariable "LOG_moves_by"))) &&
			!(_target getVariable "LOG_disabled") && {!locked _target} && {[_target,2] call LOG_FNCT_CHAINING});
			
			LOG_DETACH_VALID = (_vehicle == player && (isNull LOG_OBJECT_MOVES) && !isNull (_target getVariable "LOG_moves_by") && !(_target getVariable "LOG_disabled"));
		};

		if (_target isKindOf "LandVehicle") then {
			LOG_TRAILER_MOVE_VALID = (_vehicle == player && {alive _target} && (!isNull LOG_OBJECT_MOVES) &&
			{alive LOG_OBJECT_MOVES} && !(LOG_OBJECT_MOVES getVariable "LOG_disabled") &&
			{LOG_OBJECT_MOVES isKindOf "LandVehicle"} &&
			{isNull (_target getVariable "LOG_trailer")} && {_distance} &&
			{getPos _target select 2 < 2} && !(_target getVariable "LOG_disabled"));

			LOG_TRAILER_SELECT_VALID = (_vehicle == player && {alive _target} && 
			{isNull LOG_OBJECT_MOVES} &&
			{!isNull LOG_OBJECT_SELECTION} && {LOG_OBJECT_SELECTION != _target} &&
			!(LOG_OBJECT_SELECTION getVariable "LOG_disabled") &&
			{LOG_OBJECT_SELECTION isKindOf "LandVehicle"} &&
			{isNull (_target getVariable "LOG_trailer")} && {_distance} &&
			{getPos _target select 2 < 2} && !(_target getVariable "LOG_disabled") && {!locked _target} && {[_target,1] call LOG_FNCT_CHAINING});
		};
	};
	if (_vehicle isKindOf "Air") then {
		LOG_OBJECT_ADDACTION = _vehicle;
		LOG_TRAILER_MOVE_VALID = false;
		LOG_TRAILER_SELECT_VALID = false;

		LOG_HELI_LIFT_VALID = (driver LOG_OBJECT_ADDACTION == player &&
		({_x != LOG_OBJECT_ADDACTION && !(_x getVariable "LOG_disabled") && {!locked _x}} count ((position player) nearEntities [["LandVehicle","Air","Ship"],10]) > 0) &&
		{isNull (LOG_OBJECT_ADDACTION getVariable "LOG_heliporte")} && {[0,0,0] distance velocity LOG_OBJECT_ADDACTION < 20} && {getPos LOG_OBJECT_ADDACTION select 2 > 1} &&
		!(LOG_OBJECT_ADDACTION getVariable "LOG_disabled"));

		LOG_HELI_DROP_VALID = (driver LOG_OBJECT_ADDACTION == player && {!isNull (LOG_OBJECT_ADDACTION getVariable "LOG_heliporte")} &&
		{[0,0,0] distance velocity LOG_OBJECT_ADDACTION <= 10} && {getPos LOG_OBJECT_ADDACTION select 2 <= 30} && !(LOG_OBJECT_ADDACTION getVariable "LOG_disabled"));
	};
	uiSleep 1;
};
