private ["_vehicle","_inVehicle"];

_vehicle = _this select 0;
_inVehicle = (_vehicle != player);

if (_inVehicle) then {
	systemChat ("Bike Mode activated. Press Space for Hand Brake!");
	waituntil {!isnull (finddisplay 46)};
	hbreakkey = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call hbreakFNC;false;"];
	
	hbreakFNC = 
	{
		private ["_vehicle"];
		_vehicle = vehicle player;
		if(_vehicle == player)exitwith{};
		if ((typeOf(_vehicle) == "MMT_Civ") and speed _vehicle >= 15) then
		{
			switch (_this) do 
			{
				case 57:
				{
					_vehicle SetVelocity [(velocity _vehicle select 0) * 0.95, (velocity _vehicle select 1) *0.95, (velocity _vehicle select 2) * 0.98];
				};
			};
		};
	};
}else{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", hbreakkey];
};