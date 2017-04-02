/*
	Chernarus static spawn configuration 
	
	Last updated: 3:37 PM 12/24/2013
	
*/

#include "spawn_markers\markers_chernarus.sqf"	//Load manual spawn point definitions file.

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	#include "spawn_areas\areas_chernarus.sqf"		//Load spawn area definitions file.
	
	//marker name, [minimum AI, max additional AI], [markers for manual spawn points] (leave as empty array to use nearby buildings as spawn points), equipType (optional, required if number of AI groups is defined), number of AI groups (optional)

	["DZAI_BalotaAirstrip",[1,1],['Balota1','Balota2','Balota3','Balota4','Balota5'],1] call DZAI_static_spawn;
	["DZAI_Cherno1",[1,2],[],1] call DZAI_static_spawn;
	["DZAI_Elektro1",[1,1],[],0] call DZAI_static_spawn;
	["DZAI_Skalisty",[0,1],['Skalisty1','Skalisty2','Skalisty3'],1] call DZAI_static_spawn;
	["DZAI_SolnichniyFactory",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Berezino4",[2,1],[],1] call DZAI_static_spawn;
	["DZAI_Dolina",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Zelenogorsk",[1,1],[],1,2] call DZAI_static_spawn;
	["DZAI_NWAF3",[3,0],[],2] call DZAI_static_spawn;
	
};

#include "custom_markers\cust_markers_chernarus.sqf"
#include "custom_spawns\cust_spawns_chernarus.sqf"
//----------------------------Do not edit anything below this line -----------------------------------------
DZAI_customSpawnsReady = true;
diag_log "Chernarus static spawn configuration loaded.";
