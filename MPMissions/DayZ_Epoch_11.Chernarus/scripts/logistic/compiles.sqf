if (!isDedicated) then {

	call compile preprocessFileLineNumbers "scripts\logistic\config.sqf";

	MONI_OBJECT	= compile preprocessFileLineNumbers "scripts\logistic\monitor\monitor_object.sqf";
	MONI_ACTION	= compile preprocessFileLineNumbers "scripts\logistic\monitor\monitor_action.sqf";
	LOG_OBJ_INIT = compile preprocessFileLineNumbers "scripts\logistic\object\init.sqf";
	LOG_LIFT_INIT = compile preprocessFileLineNumbers "scripts\logistic\lift\init.sqf";
	LOG_TOW_INIT = compile preprocessFileLineNumbers "scripts\logistic\tow\init.sqf";
	
	LOG_FNCT_DETACH_AND_SAVE = {
		private ["_object","_origPos"];
		_object = (_this select 0);
		_object setVelocity [0,0,0];
		_origPos = [_object] call LOG_FNCT_GETPOS;
		detach _object;

		["Working",0,[100,15,10,0]] call dayz_NutritionSystem;
		uiSleep 0.5;
		_object setPos _origPos;
		diag_log format ["DEBUG: setPos %1 %2",typeOf _object,_origPos];
		PVDZ_veh_Save = [_object,"all"];
		publicVariableServer "PVDZ_veh_Save";

		player playActionNow "Medic";
		[player,"repair",0,false,20] call dayz_zombieSpeak;
		[player,20,true,(getPosATL player)] spawn player_alertZombies;
	};

	LOG_FNCT_CHAINING = { 
		private ["_return","_target"];
		_target = _this select 0;
		_return = true; 
		if !(LOG_CFG_ALLOW_CHAINING) then  {
			if (((_this select 1) == 1) && !(isNull (_target getVariable "LOG_moves_by") || (!alive (_target getVariable "LOG_moves_by")))) then {_return = false;};
			if ((_this select 1) == 2 && !isNull (_target getVariable "LOG_trailer")) then { _return = false;};
		};
		_return
	};

	LOG_FNCT_GETPOS = {
		private "_pos";
		if (isNil {_this select 0}) exitWith {[0,0,0]};
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if !(surfaceIsWater _pos) then {_pos = ASLToATL _pos;};
		_pos
	};

	LOG_OBJECT_MOVES = objNull;
	LOG_OBJECT_SELECTION = objNull;
	LOG_OBJECT_ADDACTION = objNull;
	LOG_INPROGRESS = false;
	LOG_LOAD_MOVES_VALID = false;
	LOG_LOAD_SELECTION_VALID = false;
	LOG_CONTENT_VALID = false;
	LOG_TRAILER_MOVE_VALID = false;
	LOG_TRAILER_SELECT_VALID = false;
	LOG_HELI_LIFT_VALID = false;
	LOG_HELI_DROP_VALID = false;
	LOG_OBJECT_TRAILER_VALID = false;
	LOG_DETACH_VALID = false;
	LOG_READY = true;
};