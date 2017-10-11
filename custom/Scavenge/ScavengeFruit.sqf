private["_fruitsConfig","_fruits","_maxfruit","_chance","_fruitsfound","_fruit","_pos"];
//--------------------------------------------------------------------------//
_fruitsConfig = missionConfigFile >> "CfgExileScavange";					// Fruit config reference
_fruits = getArray (_fruitsConfig >> "Fruit" >> "items");					// Items array config config
_chance = getNumber (_fruitsConfig >> "Fruit" >> "chance");					//	Chance to find config
_maxfruit = getNumber (_fruitsConfig >> "Fruit" >> "maxitems");				//	Max items per drop config
//--------------------------------------------------------------------------//
	_pos = getPosATL player;
	if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to pick fruit."]] call ExileClient_gui_toaster_addTemplateToast;};
	if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["No stealing the Trader's fruit!"]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(player getVariable "canloot") exitWith {["ErrorTitleOnly", ["You cannot look for fruit just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(alive player) exitWith {};
	player setVariable [ "canloot",false];
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	uiSleep 6;

if (random 100 > _chance) then {
	createVehicle ["Land_ClutterCutter_medium_F", _pos, [], 0, "CAN_COLLIDE"];		// LawnMower
    _fruitsfound = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
    ["SuccessTitleOnly", ["You've found something!"]] call ExileClient_gui_toaster_addTemplateToast;
	
for "_i" from 0 to floor(random _maxfruit) do { 	
	_fruit = _fruits call BIS_fnc_selectRandom;
	_fruitsfound addItemCargoGlobal [ _fruit, 1];
};
	uiSleep 3;
    player setVariable ["canloot",true];
} else {
	["ErrorTitleOnly", ["Nope, No fruit here."]] call ExileClient_gui_toaster_addTemplateToast;
	player setVariable ["canloot",true];
};
