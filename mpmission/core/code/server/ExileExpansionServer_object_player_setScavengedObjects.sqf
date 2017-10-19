/**
 * ExileExpansionServer_object_player_setScavengedObjects
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private _objectsList = _this select 0;
private _player = _this select 1;
private _playerUID = getPlayerUID _player;
private _varName = format ["SavengeObjects_%1", _playerUID];

missionNamespace setVariable [_varName, _objectsList];
