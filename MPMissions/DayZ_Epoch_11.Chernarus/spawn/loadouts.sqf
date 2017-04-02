find_suitable_ammunition = {

	private["_weapon","_result","_ammoArray"];

	_result 	= false;
	_weapon 	= _this;
	_ammoArray 	= getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");

	if (count _ammoArray > 0) then {
		_result = _ammoArray select 0;
	};

	_result

};

loadout_fnc_selectRandom = {
    _this select (floor random (count _this))
};

_primary = ["m8_compact","M4A1_DZ","Crossbow_DZ","Winchester1866_DZ","LeeEnfield_DZ","RedRyder","Mosin_DZ","G36C_DZ","M16A4_DZ","AK74_DZ","SA58_DZ"] call loadout_fnc_selectRandom;
_secondary = ["M9_DZ","G17_DZ","Makarov_DZ","M1911_DZ"
				
			 ] call loadout_fnc_selectRandom;
_ammo = _primary call find_suitable_ammunition;
_ammos = _secondary call find_suitable_ammunition;
_food = ["FoodPistachio"] call loadout_fnc_selectRandom;
_drink = ["ItemWaterbottle"] call loadout_fnc_selectRandom;
_backpack = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Pouch"] call loadout_fnc_selectRandom;

DefaultMagazines = ["ItemBandage","ItemPainkiller",_ammos,_ammo ,_food,_drink]; 
DefaultWeapons = ["ItemToolbox","Binocular","ItemRadio","ItemMap",_primary,_secondary]; 
DefaultBackpack = _backpack; 
DefaultBackpackItems = [];
DZE_defaultSkin = [
					["Haris_Press_EP1_DZ","Survivor2_DZ","Skin_INS_Lopotev_DZ","Skin_INS_Worker2_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ","Skin_Rocker1_DZ","Skin_Rocker3_DZ","Skin_Rocket_DZ"],
				    ["Skin_SurvivorW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_SurvivorWpink_DZ"]
				  ];
