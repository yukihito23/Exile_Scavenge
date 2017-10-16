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

private _config = missionConfigFile >> "CfgExileScavenge" >> _className;
if !(isClass _config) exitWith {};

if (getText(_config >> "type") == "CraftingClass" ) then
{
	[_className] call ExileClient_system_scavenge_checkCraftConditions;
};

if (getText(_config >> "type") == "ScavengeClass" ) then
{
	[_className] call ExileClient_system_scavenge_createLoot;
};
