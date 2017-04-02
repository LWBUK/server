If(DZE_VIEWDISTANCE_ENABLE)then{
BINOCULAR = [
	["Binocular_Vector","View Distance:","systemChat('Change View Distance Locally. Click on one of the distance options');","true"],
    ["Binocular_Vector","400 Meters","setViewDistance 400; systemChat('ViewDistance: 400'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","500 Meters","setViewDistance 500; systemChat('ViewDistance: 500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","1000 Meters","setViewDistance 1000; systemChat('ViewDistance: 1000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","1500 Meters","setViewDistance 1500; systemChat('ViewDistance: 1500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","2000 Meters","setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","2500 Meters","setViewDistance 2500; systemChat('ViewDistance: 2500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","3000 Meters","setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","3500 Meters","setViewDistance 3500; systemChat('ViewDistance: 3500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","4000 Meters","setViewDistance 3600; systemChat('ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular_Vector","5000 Meters","setViewDistance 3700; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","View Distance:","systemChat('Change View Distance Locally. Click on one of the distance options');","true"],
    ["Binocular","400 Meters","setViewDistance 400; systemChat('ViewDistance: 400'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","500 Meters","setViewDistance 500; systemChat('ViewDistance: 500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","1000 Meters","setViewDistance 1000; systemChat('ViewDistance: 1000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","1500 Meters","setViewDistance 1500; systemChat('ViewDistance: 1500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","2000 Meters","setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","2500 Meters","setViewDistance 2500; systemChat('ViewDistance: 2500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","3000 Meters","setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","3500 Meters","setViewDistance 3500; systemChat('ViewDistance: 3500'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","4000 Meters","setViewDistance 3600; systemChat('ViewDistance: 4000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"],
	["Binocular","5000 Meters","setViewDistance 3700; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');","true"]
	];
} else {
	BINOCULAR = [];
};

GPS = [	
    ["ItemGPS","Scan Nearby","if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_ZOMBIE_COUNT = count ((position player) nearEntities ['zZombie_Base',DZE_CLICK_ACTIONS_GPS_RANGE]); DZE_CLICK_ACTIONS_MAN_COUNT = count ((position player) nearEntities ['CAManBase',DZE_CLICK_ACTIONS_GPS_RANGE]);cutText[format['Within %1 Meters: %2 AI/players, %3 zombies, %4 vehicles',DZE_CLICK_ACTIONS_GPS_RANGE,DZE_CLICK_ACTIONS_MAN_COUNT - DZE_CLICK_ACTIONS_ZOMBIE_COUNT,count ((position player) nearEntities ['zZombie_Base',DZE_CLICK_ACTIONS_GPS_RANGE]),count ((position player) nearEntities ['allVehicles',DZE_CLICK_ACTIONS_GPS_RANGE]) - DZE_CLICK_ACTIONS_MAN_COUNT],'PLAIN DOWN'];","true"],
    ["ItemGPS","Range Up"   ,"if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_GPS_RANGE = (DZE_CLICK_ACTIONS_GPS_RANGE + 100) min 2500; cutText[format['GPS RANGE: %1',DZE_CLICK_ACTIONS_GPS_RANGE],'PLAIN DOWN'];","true"],
    ["ItemGPS","Range Down" ,"if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_GPS_RANGE = (DZE_CLICK_ACTIONS_GPS_RANGE - 100) max 1000;  cutText[format['GPS RANGE: %1',DZE_CLICK_ACTIONS_GPS_RANGE],'PLAIN DOWN'];","true"]
	];
	
	MAP = [
	["ItemMap","Locate Vehicle","execVM 'SD\locate_vehicle.sqf'","true"],
	["ItemMap","Grass Off","SetTerrainGrid 50; systemChat ('GRASS OFF');","true"],
	["ItemMap","Grass On","SetTerrainGrid 25; systemChat ('GRASS ON');","true"]
	];
	
	RADIO =[
	
	["ItemRadio","Radio ON/OFF", "execVM 'scripts\radio\switch_on_off.sqf'","true"]
	];
	
DZE_CLICK_ACTIONS = BINOCULAR + GPS + MAP + RADIO;
