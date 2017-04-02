if(isServer) then {

	private			["_complete","_president_himself","_crate_type","_mission","_position","_crate","_rndnum","_baserunover","_president","_firstlady"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;

	_position		= [50] call find_position;
	[_mission,_position,"Extreme","Presidents in Town","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Obama and Harper are in Town]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),.1], [], 0, "CAN_COLLIDE"];
	
	//Hotel
	_baserunover 	= createVehicle ["Land_A_Office01",[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],4,"Extreme",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	//The President Himself
	_president = [[((_position select 0) + 5), _position select 1, 4.1],1,"Extreme","Random",4,"none","Special","Random",["Bandit",750],_mission] call spawn_group;
	_firstlady = [[((_position select 0) + 5), _position select 1, 4.1],1,"Extreme","Unarmed",4,"none","Secretary1","Random",["Bandit",250],_mission] call spawn_group;

	_president_himself = (units _president) select 0;
	_president_himself disableAI "MOVE";

	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","Random","Bandit","Bandit",_mission] call vehicle_patrol;

	//Heli Paradrop
	[[(_position select 0),(_position select 1),0],[0,0,0],800,"UH60M_EP1_DZE",6,"Random","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para;
	[[(_position select 0) + 50,(_position select 1),0],[50,50,0],800,"UH60M_EP1_DZE",6,"Random","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para;
	[[(_position select 0) + 100,(_position select 1),0],[100,0,0],800,"UH60M_EP1_DZE",6,"Random","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para;
	
	//Static guns
	[[
		[(_position select 0) - 13.135, (_position select 1) + 5.025, 5.27],
		[(_position select 0) + 14.225, (_position select 1) + 5.025, 5.27],
		[(_position select 0) + 1.97, (_position select 1) - 2.368, 10.54]
	],"M2StaticMG","Extreme","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],			// mission number and crate
		["assassinate",_president], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 			// cleanup objects
		"Obama and Harper are in town for a press conference, Now is your chance, ASSASSINATE THEM!!!",	// mission announcement
		"Obama and Harper have been assassinated, great job Heroes",							// mission success
		"Obama and harper managed to get away from the assassination attempt"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,0,0,[40,crate_items_president],2] call dynamic_crate;
	};

	diag_log format["WAI: [Hero] presidents_mansion ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};
