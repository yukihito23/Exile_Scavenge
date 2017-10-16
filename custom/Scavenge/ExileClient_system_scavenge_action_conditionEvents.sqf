/**
 * ExileClient_system_scavenge_action_conditionEvents
 *
 */
params 
[
  ["_className", "", [""]]
];

if (_className isEqualTo "") exitWith {};
if (ExileClientPlayerIsInCombat) exitWith 
{
	["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;
};
if (player call ExileClient_util_world_isInTraderZone) exitWith 
{
	["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(player getVariable "CanScavenge") exitWith 
{
	["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;
};
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
		["Apples"] call ExileClient_system_scavenge_createLoot;
	};
	case "Cinderblogs":
	{
		private _configName = "Cinderblogs";
		private _craftConditionsCheck = [_configName] call ExileClient_system_scavenge_checkCraftConditions;
	};
	case "Fruits":
	{
	    ["Fruits"] call ExileClient_system_scavenge_createLoot;
	};
	case "Pumpkins":
	{
		["Pumpkins"] call ExileClient_system_scavenge_createLoot;
	};
	case "Waters":
	{
		private _configName = "Waters";
		private _craftConditionsCheck = [_configName] call ExileClient_system_scavenge_checkCraftConditions;
	};
	case "Wrecks":
	{
	    ["Wrecks"] call ExileClient_system_scavenge_createLoot;
	};
	case "Woodlogs":
	{
	    ["Woodlogs"] call ExileClient_system_scavenge_createLoot;
	};
	default
	{
		throw ["ErrorTitleOnly", ["Something went realy wrong! Please report this action failure to your server admin."]] call ExileClient_gui_toaster_addTemplateToast;
	    diag_log format["EXILE SCAVENGE ERROR :: Attempting to call scavenge event with unsupported scavenge className %1", _className];
	};
};