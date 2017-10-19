/**
 * ExileExpansionServer_network_scavenge_getScavengedObjects
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

 addMissionEventHandler ["PlayerConnected", {
  _this spawn {
    private _uid = _this select 1;
    private _varName = format ["SavengeObjects%1",_uid];
    private _objectsList = missionNamespace getVariable [_varName, []];

    if !(_objectsList isEqualTo []) then {
      _playerObject = objNull;
      waitUntil {
        {
          if ((getPlayerUID _x) isEqualTo _uid) exitWith {
            _playerObject = _x;
          };
        } forEach playableUnits;
        !(isNull _playerObject)
      };
      [_objectsList] remoteExecCall ["ExileExpansionClient_object_player_setScavengedObjects", _playerObject];
    };
  };
}];
