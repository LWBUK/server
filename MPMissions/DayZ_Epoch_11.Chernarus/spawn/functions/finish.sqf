if (player distance respawn_west_original < 100) then {
	// Ground spawn
	player setPosATL [_grid select 0,_grid select 1,(_grid select 2)+.1]; //Prevents swimming in ground glitch
	
	_nearestCity = nearestLocations [_grid, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000];
	Dayz_logonTown = "Wilderness";
	if (count _nearestCity > 0) then {Dayz_logonTown = text (_nearestCity select 0)};
	[toUpper worldName,Dayz_logonTown,format[localize "str_player_06",dayz_Survived]] spawn {
		uiSleep 3;
		BIS_fnc_infoText = compile preprocessFileLineNumbers "ca\modules_e\functions\GUI\fn_infoText.sqf";
		_this spawn BIS_fnc_infoText;
		["<t size='1.0' shadow ='0.6' color='#B22222'>This is a PVP server<br/> There are NO banks in traders<br/>View the map for rules and info<br/>Be sure to read it BEFORE asking questions or complaining</t>",0,(safezoneY + safezoneH * 0.35),15,1,0,32] spawn bis_fnc_dynamicText;
	};
};
spawn_camera cameraEffect ["terminate","back"];
camDestroy spawn_camera;

dayz_enableRules = dayz_enableRulesOriginal;
dayz_maxGlobalAnimals = dayz_maxGlobalAnimalsOriginal;
fnc_usec_damageHandler = fnc_usec_damageHandlerOriginal;
if (dayz_enableRules && (profileNamespace getVariable ["streamerMode",0] == 0)) then { dayz_rulesHandle = execVM "rules.sqf"; };