if(isServer)exitwith{};

waitUntil {sleep 1; !isNil ("PVDZ_plr_LoginRecord") };

while {true} do {
	
private ["_vehicle","_inVehicle","_vehicleDZAI"];
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_vehicleDZAI = vehicle player getVariable ["DZAI",0];
	
if (!(_vehicle == player ) && (_vehicleDZAI == 1)) then {
	systemChat ("Temporary vehicle. (It wont be saved on server restart)");  //If he is in a mission vehicle
};

if (_inVehicle and (typeOf(_vehicle) == "MMT_Civ")) then {
	_null = [_vehicle] execVM "SD\bikefix\bikefix.sqf";
};

// He is not in a vehicle
while {!(vehicle player == player)} do {
	sleep 3;
};

sleep 2;
};