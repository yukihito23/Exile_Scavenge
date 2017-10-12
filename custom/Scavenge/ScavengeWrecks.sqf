private["_wrecksConfig","_loot","_maxloot","_chance","_lootfound","_randomloot","_pos"];
//--------------------------------------------------------------------------//
_wrecksConfig = missionConfigFile >> "CfgExileScavange";					// Wrecks config reference
_loot = getArray (_wrecksConfig >> "Wrecks" >> "items");					// Items array config
_chance = getNumber (_wrecksConfig >> "Wrecks" >> "chance");				//	Chance to find config
_maxloot = getNumber (_wrecksConfig >> "Wrecks" >> "maxitems");				//	Max items per drop config
//--------------------------------------------------------------------------//
	_pos = getPosATL player;
	if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;};
	if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(player getVariable "canloot") exitWith {["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(alive player) exitWith {};
	player setVariable [ "canloot",false];
	
	// If players list of already scavenged objects is empty then add the current cursorobject to the list.
	_playerObjectInfo = player getVariable ["ScavangedObjects",[]];
	if (_playerObjectInfo isEqualTo []) then
	{
		private _playerScavengedObjects = [];
		private _currentObject = cursorObject;
		_playerScavengedObjects pushBack _currentObject;
		player setVariable ["ScavangedObjects", _playerScavengedObjects, true];
	}
	else
	// If players list of already scavenged objects is not empty then grab the array and add the curent cursorobject to the list.
	{
		private _playerScavengedObjects = [];
		private _objectsList = player getVariable ["ScavangedObjects",[]];
		_playerScavengedObjects pushBack _objectsList;
		private _currentObject = cursorObject;
		_playerScavengedObjects pushBack _currentObject;
		player setVariable ["ScavangedObjects", _playerScavengedObjects, true];
	};
	
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
