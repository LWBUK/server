if (!isDedicated) then {
	LOG_READY = false;
	call compile preprocessFileLineNumbers "scripts\logistic\compiles.sqf";
	waitUntil {LOG_READY};
	[] spawn MONI_OBJECT;
	uisleep 0.1;
	[] spawn MONI_ACTION;
};

