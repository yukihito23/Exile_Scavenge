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

// Reset for players ScavangedObjects variable if amount of entrys hits 5.
// This basicly makes every object scavegeable for the player again.
if ( count (player getVariable ["ScavangedObjects", []]) > 5 ) then
{
	player setVariable ["ScavangedObjects", []];
};

// Action Monitor
// This removes the actions from the player if players CanScavenge boolean is false
// adds them back if the boolean is true.
[] spawn 
{
	ScavangeActionMonitoring = true;
	sleep 1;
	// while the condition is true (enemy is alive, task is not complete, etc)
	while {ScavangeActionMonitoring} do 
	{
		sleep 0.5;
		if (isNil {player getVariable "ExileScavangeActionIDs"} && player getVariable "CanScavenge") then 
		{
			[] call ExileClient_object_player_scavenge_AddAction;
		};
		sleep 0.5;
		if (count (player getVariable "ExileScavangeActionIDs") > 0 && !(player getVariable "CanScavenge")) then 
		{
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