/**
 * ExileExpansionClient_object_player_setScavengedObjects
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private _objectsList = _this select 0;

// Set players client savenge objects list.
missionNamespace setVariable ["ExileClientSavengedObjects", _objectsList];
