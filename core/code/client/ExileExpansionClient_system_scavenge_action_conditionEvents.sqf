/**
 * ExileExpansionClient_system_scavenge_action_conditionEvents
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params [
  ["_className", "", [""]],
  ["_object", objNull, [objNull]],
  ["_pos", [], [[]]],
  ["_pobject", objNull, [objNull]]
];

if (_className isEqualTo "" || {isNull _object} || {isNull _pobject}) exitWith {};
if (ExileClientPlayerIsInCombat) exitWith {
	["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;
};
if (player call ExileClient_util_world_isInTraderZone) exitWith {
	["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(player getVariable "CanScavenge") exitWith {
	["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(alive player) exitWith {};

private _config = missionConfigFile >> "CfgExileScavenge" >> _className;
if !(isClass _config) exitWith {};

if (getText(_config >> "type") == "CraftingClass" ) then {
	[_className,_pos,_object,_pobject] call ExileExpansionClient_system_scavenge_checkCraftConditions;
};
if (getText(_config >> "type") == "ScavengeClass" ) then {
	[_className,_pos,_object,_pobject] call ExileExpansionClient_system_scavenge_createLoot;
};
