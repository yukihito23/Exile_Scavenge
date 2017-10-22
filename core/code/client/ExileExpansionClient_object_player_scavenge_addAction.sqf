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
SCG_NiiRoZz_Is_The_Best = [];

{
	private _textInfo = getText (_x >> "text");
	private _actioniconInfo = getText (_x >> "icon");
	private _idleiconInfo = getText (_x >> "icon");
	private _modelInfo = getArray (_x >> "models");
  private _condition = ["[",str _modelInfo,"] call {
    lineIntersectsSurfaces [
    AGLToASL positionCameraToWorld [0,0,0],
    AGLToASL positionCameraToWorld [0,0,5],
      player,
      objNull,
      true,
      1,
      ""GEOM"",
      ""NONE""
    ] select 0 params ["""","""",""_object"",""""];
    if ((isNil ""_object"") || (isNull _object)) exitWith {
      false
    };
    if (!(player getVariable [""CanScavenge"", true]) || !(isNull objectParent player)) exitWith {
      false
    };
    _condition = false;
    {
      if (_x distance2D player < 5) exitWith {
        _condition = true;
      };
    } forEach (missionNamespace getVariable [""ExileClientSavengedObjects"", []]);
    if (_condition) exitWith {
      false
    };
    _strObject = str _object;
    {
      [false,true] select (_strObject find _x > -1);
    } count (_this select 0) > 0};"] joinString "";
	private _configClassName = configName _x;

	_holdActionID =
	[
		player, _textInfo,	_actioniconInfo, _idleiconInfo,	_condition,	"
    lineIntersectsSurfaces [
      AGLToASL positionCameraToWorld [0,0,0],
      AGLToASL positionCameraToWorld [0,0,5],
      player,
      objNull,
      true,
      1,
      ""GEOM"",
      ""NONE""
    ] select 0 params ["""","""",""_object"",""""];
    !(SCG_NiiRoZz_Is_The_Best isEqualTo []) && {_object isEqualTo (SCG_NiiRoZz_Is_The_Best select 0)}
    ",	{
      lineIntersectsSurfaces [
      AGLToASL positionCameraToWorld [0,0,0],
      AGLToASL positionCameraToWorld [0,0,5],
        player,
        objNull,
        true,
        1,
        "GEOM",
        "NONE"
      ] select 0 params ["_pos1","","_object",""];
      SCG_NiiRoZz_Is_The_Best = [_object,_pos1];
    },
		{
			private _progressTick = _this select 4;
			if (_progressTick % 2 == 0) exitwith {};
			playSound3D [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
		},
		{
			_configClassName = (_this select 3) select 0;
			[_configClassName,SCG_NiiRoZz_Is_The_Best select 0,SCG_NiiRoZz_Is_The_Best select 1] call ExileExpansionClient_system_scavenge_action_conditionEvents;
      SCG_NiiRoZz_Is_The_Best = [];
		},
		{
      SCG_NiiRoZz_Is_The_Best = [];
    },
		[_configClassName], 0.5, 0, false
	] call ExileExpansionClient_gui_holdActionAdd;

	_holdActionIDs pushBack _holdActionID;
} forEach ("true" configClasses (missionConfigFile >> "CfgExileScavenge"));

player setVariable ["ExileScavangeActionIDs", _holdActionIDs];