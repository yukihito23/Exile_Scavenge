private["_woodlogsConfig","_woodlogs","_chance","_maxwoodlogs","_woodlogsfound","_woodlog","_pos"];
//--------------------------------------------------------------------------//
_woodlogsConfig = missionConfigFile >> "CfgExileScavange";					// Woodlogs config reference
_woodlogs = getArray (_woodlogsConfig >> "Woodlogs" >> "items");			// Items array config
_chance = getNumber (_woodlogsConfig >> "Woodlogs" >> "chance");			//	Chance to find config
_maxwoodlogs = getNumber (_woodlogsConfig >> "Woodlogs" >> "maxitems");		//	Max items per drop config
//--------------------------------------------------------------------------//
	_pos = getPosATL player;
	if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to collect woodlogs."]] call ExileClient_gui_toaster_addTemplateToast;};
	if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["No stealing the Trader's Wood!"]] call ExileClient_gui_toaster_addTemplateToast;};
	if !(player getVariable "canloot") exitWith {["ErrorTitleOnly", ["You cannot look for woodlogs just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
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
    _woodlogsfound = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"];
    ["SuccessTitleOnly", ["You found something!"]] call ExileClient_gui_toaster_addTemplateToast;
	
for "_i" from 0 to floor(random _maxwoodlogs) do { 	
	_woodlog = _woodlogs call BIS_fnc_selectRandom;
	_woodlogsfound addItemCargoGlobal [ _woodlog, 1];
};
	uiSleep 3;
    player setVariable ["canloot",true];
} else {
	["ErrorTitleOnly", ["Nope, No woodlogs here."]] call ExileClient_gui_toaster_addTemplateToast;
	player setVariable ["canloot",true];
};
