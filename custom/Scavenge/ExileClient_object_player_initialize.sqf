/**
 * ExileClient_object_player_initialize
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 private["_newPlayerObject", "_oldPlayerObject"];
_newPlayerObject = _this;
_oldPlayerObject = player;
player reveal [_newPlayerObject, 4];
selectPlayer _newPlayerObject;
if (_oldPlayerObject isKindOf "Exile_Unit_GhostPlayer") then 
{
    deleteVehicle _oldPlayerObject;
};
player setVariable ["ExileXM8IsOnline", (profileNamespace getVariable ["ExileEnable8GNetwork", false]), true];

ExileClient_gui_holdActionAdd = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_gui_holdActionAdd.sqf";
ExileClient_object_scavenge_wrecks = compileFinal preprocessFileLineNumbers "custom\Scavenge\ScavengeWrecks.sqf";
ExileClient_object_scavenge_woodlogs = compileFinal preprocessFileLineNumbers "custom\Scavenge\ScavengeWoodlogs.sqf";
ExileClient_object_scavenge_water = compileFinal preprocessFileLineNumbers "custom\Scavenge\ScavengeWater.sqf";
ExileClient_object_scavenge_pumpkins = compileFinal preprocessFileLineNumbers "custom\Scavenge\ScavengePumpkin.sqf";
ExileClient_object_scavenge_fruit = compileFinal preprocessFileLineNumbers "custom\Scavenge\ScavengeFruit.sqf";
ExileClient_object_scavenge_apples = compileFinal preprocessFileLineNumbers "custom\Scavenge\ScavengeApples.sqf";
#include "ExileClient_Loot_Scavenge.sqf"

enableSentences false;
enableRadio false;
player setVariable ["BIS_noCoreConversations", true];
player disableConversation true;
player setSpeaker "NoVoice";
showSubtitles false;
[] call ExileClient_object_player_event_hook;
ExileGasMaskNextSoundAt = diag_tickTime;
if (ExileClientGasMaskVisible) then 
{
    false call ExileClient_gui_gasMask_toggle;
};
[] call ExileClient_object_player_stats_reset;
[] call ExileClient_gui_postProcessing_reset;
[] call ExileClient_system_breathing_event_onPlayerSpawned;
[] call ExileClient_system_snow_event_onPlayerSpawned;
[] call ExileClient_system_radiation_event_onPlayerSpawned;
ExileClientIsWaitingForInventoryMoneyTransaction = false;
true
