/**
 * ExileClient_system_scavenge_initialize
 *
 */

ExileClient_gui_holdActionAdd = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_gui_holdActionAdd.sqf";
ExileClient_system_scavenge_getCraftingRecipes = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_system_scavenge_getCraftingRecipes.sqf";
ExileClient_system_scavenge_checkCraftConditions = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_system_scavenge_checkCraftConditions.sqf";
ExileClient_system_scavenge_action_craftItem = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_system_scavenge_action_craftItem.sqf";
ExileClient_system_scavenge_action_conditionEvents = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_system_scavenge_action_conditionEvents.sqf";
ExileClient_system_scavenge_createLoot = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_system_scavenge_createLoot.sqf";
ExileClient_object_player_playScavengeEvent = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_object_player_playScavengeEvent.sqf";
ExileClient_object_player_scavenge_addAction = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_object_player_scavenge_addAction.sqf";

player setVariable ["CanScavenge", true];
player setVariable ["ScavangedObjects", []];
player setVariable ["ExileScavangeActionIDs", Nil];

ScavangeActionMonitor = {
  [] spawn {
    ScavangeActionMonitoring = true;
  	sleep 1;
  	while {ScavangeActionMonitoring} do	{
  		sleep 0.5;
  		if (isNil {player getVariable "ExileScavangeActionIDs"} && player getVariable "CanScavenge") then	{
  			[] call ExileClient_object_player_scavenge_AddAction;
  		};
  		sleep 0.5;
  		if (count (player getVariable "ExileScavangeActionIDs") > 0 && !(player getVariable "CanScavenge")) then {
  			{
  				_id = _x;
  				_target = player;
  				[_target,_id] call BIS_fnc_holdActionRemove;
  			} forEach (player getVariable "ExileScavangeActionIDs");
  			private _null = Nil;
  			player setVariable ["ExileScavangeActionIDs", Nil];
  		};
  	};
  };
};

[] call ScavangeActionMonitor;
