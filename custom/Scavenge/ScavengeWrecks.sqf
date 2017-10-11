private["_loot","_maxloot","_chance","_lootfound","_randomloot","_pos"];
//--------------------------------------------------------------------------//
_loot = [
// Rifles
	"CUP_arifle_AK74","CUP_arifle_AK107","CUP_arifle_AKS74","CUP_arifle_AKS74U","CUP_arifle_AKM","CUP_arifle_AKS",
	"CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M",
	"CUP_muzzle_PBS4","CUP_optic_PSO_1","CUP_optic_Kobra",
// Smgs
	"CUP_smg_bizon","CUP_smg_EVO","CUP_smg_MP5SD6","CUP_smg_MP5A5",
	"CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_UZI","CUP_30Rnd_9x19_MP5",
	"CUP_muzzle_Bizon",	
// Pistols	
	"CUP_hgun_Colt1911","CUP_hgun_Compact","CUP_hgun_glock17_flashlight_snds","CUP_hgun_M9","CUP_hgun_Makarov","CUP_hgun_PB6P9","CUP_hgun_MicroUzi",
	"CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_MakarovSD_M",	"CUP_15Rnd_9x19_M9","CUP_18Rnd_9x19_Phantom","CUP_6Rnd_45ACP_M","CUP_17Rnd_9x19_glock17","CUP_7Rnd_45ACP_1911",
	"CUP_muzzle_snds_M9","CUP_muzzle_snds_MicroUzi",
// Extras
	"Exile_Item_InstaDoc","Exile_Item_Bandage",
	"Exile_Item_DuctTape","Exile_Item_ExtensionCord"
/*		addItemCargoGlobal only works with items, weapons and magazines.		*/	
];
_chance = 50;			//	Chance to find
_maxloot = 3;			//	Max items per drop
//--------------------------------------------------------------------------//
	_pos = getPosATL player;
	if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;};
	if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(player getVariable "canloot") exitWith {["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(alive player) exitWith {};
	player setVariable [ "canloot",false];
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	uiSleep 6;

if (random 100 > _chance) then {
	createVehicle ["Land_ClutterCutter_medium_F", _pos, [], 0, "CAN_COLLIDE"];		// LawnMower
    _lootfound = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
    ["SuccessTitleOnly", ["You've found something!"]] call ExileClient_gui_toaster_addTemplateToast;
	
for "_i" from 0 to floor(random _maxloot) do { 	
	_randomloot = _loot call BIS_fnc_selectRandom;
	_lootfound addItemCargoGlobal [ _randomloot, 1];
};
	uiSleep 3;
    player setVariable ["canloot",true];
} else {
	["ErrorTitleOnly", ["Could not find anything."]] call ExileClient_gui_toaster_addTemplateToast;
	player setVariable ["canloot",true];
};
