/**
 * ExileExpansionClient_object_player_scavenge_AddAction
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private _holdActionID =  0;
private _holdActionIDs = [];
Scavenge_Client_Objects = [];

{
	private _textInfo = getText (_x >> "text");
	private _actioniconInfo = getText (_x >> "icon");
	private _idleiconInfo = getText (_x >> "icon");
	private _modelInfo = getArray (_x >> "models");
	private _conditionToShow = [
    "[",str _modelInfo,"] call {
		if (!(player getVariable [""CanScavenge"", true]) || !(isNull objectParent player)) exitWith { false };
		lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0], AGLToASL positionCameraToWorld [0,0,5], player, objNull, true, 1, ""GEOM"", ""NONE""] select 0 params ["""","""",""_object"",""""];
  	if ((isNil ""_object"") || (isNull _object)) exitWith	{ false	};
  	_conditionToShow = false;
  	{
			if (_x isEqualType objNull && {_x isEqualTo _object}) then {
				_conditionToShow = true;
			} else {
				if (_x distance2D player < 2) then {
					_conditionToShow = true;
				};
			};
			if (_conditionToShow) exitWith {};
  	} forEach (missionNamespace getVariable [""ExileClientSavengedObjects"", []]);
  	if (_conditionToShow) exitWith { false };
  	_strObject = str _object;
  	({_strObject find _x > -1} count (_this select 0)) > 0 };"
	] joinString "";
	private _conditionToExecute = "lineIntersectsSurfaces[AGLToASL positionCameraToWorld [0,0,0], AGLToASL positionCameraToWorld [0,0,5], player, objNull,	true,	1, ""GEOM"", ""NONE""] select 0 params ["""","""",""_object"",""""]; !(Scavenge_Client_Objects isEqualTo []) && {_object isEqualTo (Scavenge_Client_Objects select 0)}";
	private _configClassName = configName _x;
	private _codeExecutedOnStart =
	{
		lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0], AGLToASL positionCameraToWorld [0,0,5], player, objNull, true, 1, "GEOM", "NONE"] select 0 params ["_pos1","","_object","_parentObject"];
		Scavenge_Client_Objects = [_object,_pos1,_parentObject];
	};
	private _codeExecutedOnProgress =
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playSound3D [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0, ""]) + ".wss", player, false, getposasl player, 1, 0.9 + 0.2 * _progressTick / 24];
	};
	private _codeExecutedOnCompetion =
	{
		_configClassName = (_this select 3) select 0;
		[_configClassName, Scavenge_Client_Objects select 0, Scavenge_Client_Objects select 1, Scavenge_Client_Objects select 2] call ExileExpansionClient_system_scavenge_action_conditionEvents;
		Scavenge_Client_Objects = [];
	};
	private _codeExecutedOnInterrupt =
	{
		Scavenge_Client_Objects = [];
	};
	_holdActionID = [
		player,
		_textInfo,
		_actioniconInfo,
		_idleiconInfo,
		_conditionToShow,
		_conditionToExecute,
		_codeExecutedOnStart,
		_codeExecutedOnProgress,
		_codeExecutedOnCompetion,
		_codeExecutedOnInterrupt,
		[_configClassName],
		0.5,
		0,
		false
	] call ExileExpansionClient_gui_holdActionAdd;
	_holdActionIDs pushBack _holdActionID;
} forEach ("true" configClasses (missionConfigFile >> "CfgExileScavenge"));
player setVariable ["ExileScavangeActionIDs", _holdActionIDs];
