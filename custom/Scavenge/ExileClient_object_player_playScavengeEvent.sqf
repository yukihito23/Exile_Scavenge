/**
 * ExileClient_object_player_playScavengeEvent
 *
 */
 params 
[
	"_configName",
	"_recipe",
	"_possibleCraftQuantity"
];

private _clutter = objNull;
player setVariable ["CanScavange",false];
private _configReference = missionConfigFile >> "CfgExileScavange";
private _chance = getNumber (_configReference >> _configName >> "chance");
private _currentObject = cursorObject;

_objectsList pushBack _currentObject;
player setVariable ["ScavangedObjects", _objectsList];

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 6;

if (random 100 > _chance) then 
{
	["SuccessTitleOnly", ["You've found something!"]] call ExileClient_gui_toaster_addTemplateToast;
	uiSleep 3;
	
	[_recipe, _possibleCraftQuantity] call ExileClient_system_scavenge_action_craftItem;

	uiSleep 3;
	player setVariable ["CanScavange",true];
} 
else 
{
	["ErrorTitleOnly", ["Could not find anything."]] call ExileClient_gui_toaster_addTemplateToast;
	player setVariable ["CanScavange",true];
};
