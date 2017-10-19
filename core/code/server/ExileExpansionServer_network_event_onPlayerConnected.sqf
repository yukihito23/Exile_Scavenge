/**
 * ExileExpansionServer_network_event_onPlayerConnected
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private _uid = _this select 0;
private _name = _this select 1;
private _owner = _this select 2;

// Scavenge onPlayerConnected event
private _varName = format ["SavengeObjects_%1",_uid];
private _objectsList = missionNamespace getVariable [_varName, []];
[_objectsList] remoteExecCall ["ExileExpansionClient_object_player_setScavengedObjects", _owner];
