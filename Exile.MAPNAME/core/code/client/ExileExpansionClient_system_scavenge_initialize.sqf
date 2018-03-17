/**
 * ExileExpansionClient_system_scavenge_initialize
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

waitUntil {!isNull (findDisplay 46)};
// Set default system  client vars to player.
player setVariable ["CanScavenge", true];
player setVariable ["ExileScavangeActionIDs", Nil];

ScavangeActionMonitor = {
  [] spawn {
    ScavangeActionMonitoring = true;
  	sleep 1;
  	while {ScavangeActionMonitoring} do	{
  		sleep 0.5;
  		if (isNil {player getVariable "ExileScavangeActionIDs"} && player getVariable "CanScavenge") then {
  			[] call ExileExpansionClient_object_player_scavenge_AddAction;
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
