private["_waterConfig","_water","_chance","_maxwater","_waterfound","_waters","_pos","_canAdd"];
//--------------------------------------------------------------------------//
_waterConfig = missionConfigFile >> "CfgExileScavange";					// Water config reference
_water = getArray (_waterConfig >> "Water" >> "items");					// Items array config
_chance = getNumber (_waterConfig >> "Water" >> "chance");				//	Chance to find config
_maxwater = getNumber (_waterConfig >> "Water" >> "maxitems");			//	Max items per drop config
//--------------------------------------------------------------------------//
	_pos = getPosATL player;
	if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to pump water."]] call ExileClient_gui_toaster_addTemplateToast;};
	if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["No stealing the Trader's water!"]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(player getVariable "canloot") exitWith {["ErrorTitleOnly", ["You cannot look for water just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !("Exile_Item_PlasticBottleEmpty" in (magazines player)) exitWith {["ErrorTitleOnly", ["You don't have any empty waterbottles."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(alive player) exitWith {};
	player setVariable [ "canloot",false];
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	uiSleep 6;

if (random 100 > _chance) then {
	createVehicle ["Land_ClutterCutter_medium_F", _pos, [], 0, "CAN_COLLIDE"];		// LawnMower
    _waterfound = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
    ["SuccessTitleOnly", ["You've filled your waterbottle."]] call ExileClient_gui_toaster_addTemplateToast;
	
for "_i" from 0 to floor(random _maxwater) do { 	
	_water = _waters call BIS_fnc_selectRandom;
        _canAdd = [player, _water] call ExileClient_util_playerCargo_canAdd;
        if (_canAdd) then {
            player addMagazine [ _water, 1 ];
        }
        else
        {
            _wh addItemCargoGlobal [ _water, 1];
        };
		player removeItem "Exile_Item_PlasticBottleEmpty";
};
	uiSleep 3;
    player setVariable ["canloot",true];
} else {
	["ErrorTitleOnly", ["Nope, No water source here."]] call ExileClient_gui_toaster_addTemplateToast;
	player setVariable ["canloot",true];
};
