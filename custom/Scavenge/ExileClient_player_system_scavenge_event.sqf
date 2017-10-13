/**
 * ExileClient_player_system_scavenge_event
 *
 */
params [
  ["_className", "", [""]]
];

if (_className isEqualTo "") exitWith {};
if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;};
if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;};
if !(player getVariable "CanScavange") exitWith {["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
if !(alive player) exitWith {};

private _currentObject = cursorObject;
private _objectsList = player getVariable ["ScavangedObjects",[]];

if (_currentObject in _objectsList) exitWith {};

private _config = missionConfigFile >> "CfgExileScavange" >> _className;

if !(isClass _config) exitWith {};

switch (_className) do
{
	case "Apples":
	{
		["Apples"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Fruits":
	{
	    ["Fruits"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Pumpkins":
	{
		["Pumpkins"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Waters":
    {
		private _playerItems = items player;
		if (ExileScavangeConditiontemsWaters in _playerItems) then 
		{
			["Waters"] call ExileClient_player_system_scavenge_createLoot;
		};
	};
	case "Wrecks":
	{
	    ["Wrecks"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Woodlogs":
	{
	    ["Woodlogs"] call ExileClient_player_system_scavenge_createLoot;
	};
	default
	{
		_className = _this select 0;
	    diag_log format["EXILE SCAVENGE ERROR :: Attempting to call scavenge event with unsupported scavenge className %1", _className];
	};
};