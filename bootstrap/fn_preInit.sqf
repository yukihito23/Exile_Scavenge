/**
 * Pre-Initialization
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ['_code', '_function', '_file', '_fileContent'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _isLocked = _x select 2;

    if (_isLocked isEqualTo false) then
    {
        if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
        {
            _file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
        };
    };

    _fileContent = preprocessFileLineNumbers _file;

    if (_fileContent isEqualTo '') then
    {
        diag_log (format ['ERROR: Override of %1 in CfgExileCustomCode points to a non-existent file: %2. Defaulting to vanilla Exile code!', _function, _file]);

        _fileContent = preprocessFileLineNumbers (_x select 1);
    };

    _code = compileFinal _fileContent;

    missionNamespace setVariable [_function, _code];
}
forEach
[
	// Server
	['ExileExpansionServer_system_scavenge_spawnLoot', 'core\code\server\ExileExpansionServer_system_scavenge_spawnLoot.sqf', false],
	// Client
	['ExileExpansionClient_gui_holdActionAdd', 'core\code\client\ExileExpansionClient_gui_holdActionAdd.sqf', false],
	['ExileExpansionClient_object_player_playScavengeEvent', 'core\code\client\ExileExpansionClient_object_player_playScavengeEvent.sqf', false],
	['ExileExpansionClient_object_player_scavenge_addAction', 'core\code\client\ExileExpansionClient_object_player_scavenge_addAction.sqf', false],
	['ExileExpansionClient_system_scavenge_action_conditionEvents', 'core\code\client\ExileExpansionClient_system_scavenge_action_conditionEvents.sqf', false],
	['ExileExpansionClient_system_scavenge_action_craftItem', 'core\code\client\ExileExpansionClient_system_scavenge_action_craftItem.sqf', false],
	['ExileExpansionClient_system_scavenge_checkCraftConditions', 'core\code\client\ExileExpansionClient_system_scavenge_checkCraftConditions.sqf', false],
	['ExileExpansionClient_system_scavenge_createLoot', 'core\code\client\ExileExpansionClient_system_scavenge_createLoot.sqf', false],
	['ExileExpansionClient_system_scavenge_getCraftingRecipes', 'core\code\client\ExileExpansionClient_system_scavenge_getCraftingRecipes.sqf', false],
	['ExileExpansionClient_system_scavenge_initialize', 'core\code\client\ExileExpansionClient_system_scavenge_initialize.sqf', false]
];
true
