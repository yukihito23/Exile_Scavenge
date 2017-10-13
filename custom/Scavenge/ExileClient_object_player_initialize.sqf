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

// ----------Scavange system integration ----------------------------------------------------------------------------------------------------------------------
ExileClient_gui_holdActionAdd = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_gui_holdActionAdd.sqf";
ExileClient_player_system_scavenge_init = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_player_system_scavenge_init.sqf";
ExileClient_player_system_scavenge_event = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_player_system_scavenge_event.sqf";
ExileClient_player_system_scavenge_createLoot = compileFinal preprocessFileLineNumbers "custom\Scavenge\ExileClient_player_system_scavenge_createLoot.sqf";
[] call ExileClient_player_system_scavenge_init;
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

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
