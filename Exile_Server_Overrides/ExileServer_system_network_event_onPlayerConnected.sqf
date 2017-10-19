/**
 * ExileServer_system_network_event_onPlayerConnected
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ["_isKnownAccount"];
private _uid = _this select 0;
private _name = _this select 1;
private _owner = _this select 2;
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
 format["Player %1 (UID %2) connected!", _name, _uid] call ExileServer_util_log;
 private _isKnownAccount = format["isKnownAccount:%1", _uid] call ExileServer_system_database_query_selectSingleField;
 if (_isKnownAccount) then
 {
   format["startAccountSession:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;
 }
 else
 {
   format["createAccount:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;
 };
 // Custom onPlayerConnected Eventhandler additons.
 [_uid, _name, _owner] call ExileExpansionServer_network_event_onPlayerConnected;
};
true
