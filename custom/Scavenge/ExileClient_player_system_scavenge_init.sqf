/**
 * ExileClient_player_system_scavenge_init
 * 
 */

player setVariable["CanScavenge",true];
player setVariable ["ScavangedObjects", []];

private _classes = (missionConfigFile >> "CfgExileScavange") call BIS_fnc_getCfgSubClasses;
{
	private _configReference = missionConfigFile >> "CfgExileScavange";
	private _chance = getNumber (_configReference >> _x >> "chance");
	private _maxItems = getNumber (_configReference >> _x >> "maxitems");
	private _textInfo = getText (_configReference >> _x >> "text");
	private _actioniconInfo = getText (_configReference >> _x >> "icon");
	private _idleiconInfo = getText (_configReference >> _x >> "icon");
	private _modelInfo = getArray (_configReference >> _x >> "models");
	private _itemInfo = getArray (_configReference >> _x >> "items");
	
	private _chanceVarName = format ["ExileScavangeMaxItems%1", _x];
	missionNamespace setVariable [_chanceVarName, _chance, true];
	publicVariable _chanceVarName;
	
	private _maxitemsVarName = format ["ExileScavangeMaxItems%1", _x];
	missionNamespace setVariable [_maxitemsVarName, _maxItems, true];
	publicVariable _maxitemsVarName;
	
	private _textVarName = format ["ExileScavangeText%1", _x];
	missionNamespace setVariable [_textVarName, _textInfo, true];
	publicVariable _textVarName;
	
	private _actioniconVarName = format ["ExileScavangeActionIcon%1", _x];
	missionNamespace setVariable [_actioniconVarName, _actioniconInfo, true];
	publicVariable _actioniconVarName;
	
	private _idleiconVarName = format ["ExileScavangeActionIcon%1", _x];
	missionNamespace setVariable [_idleiconVarName, _idleiconInfo, true];
	publicVariable _idleiconVarName;
	
	private _modelVarName = format ["ExileScavangeModels%1", _x];
	missionNamespace setVariable [_modelVarName, _modelInfo, true];
	publicVariable _modelVarName;
	
	private _itemsVarName = format ["ExileScavangeItems%1", _x];
	missionNamespace setVariable [_itemsVarName, _itemInfo, true];
	publicVariable _itemsVarName;
	
	private _condition = format ["((getModelInfo cursorObject) select 0) in %1 && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}", _modelInfo];
	
	[
		player,
		_textInfo,
		_actioniconInfo,
		_idleiconInfo,
		_condition,
		"_caller distance _target < 5",
		{},
		{
			private _progressTick = _this select 4;
			if (_progressTick % 2 == 0) exitwith {};
			playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
		},
		{
			_class = (_this select 3)  select 0;
			[_class] call ExileClient_player_system_scavenge_event;
		},
		{},
		[_x],
		0.5,
		0,
		false
	] call ExileClient_gui_holdActionAdd;
} forEach _classes;