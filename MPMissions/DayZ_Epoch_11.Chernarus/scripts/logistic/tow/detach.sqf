if (LOG_INPROGRESS) then {
	STR_LOG_INPROGRESS call dayz_rollingMessages;
} else {
	LOG_INPROGRESS = true;
	private ["_tug","_object"];
	_object = _this select 0;
	_tug = _object getVariable "LOG_moves_by";
	if (_tug isKindOf "LandVehicle") then {
		_tug setVariable ["LOG_trailer", objNull, true];
		_object setVariable ["LOG_moves_by", objNull, true];
		[_object] call LOG_FNCT_DETACH_AND_SAVE;
		uiSleep 3;
		format [STR_LOG_UNTOWED, getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")] call dayz_rollingMessages;
	} else {
		STR_LOG_IMPOSSIBLE_VEHICLE call dayz_rollingMessages;
	};
	LOG_INPROGRESS = false;
};
