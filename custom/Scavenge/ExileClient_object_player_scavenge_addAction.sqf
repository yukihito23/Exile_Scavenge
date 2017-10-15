/**
 * ExileClient_object_player_scavenge_AddAction
 * 
 */

player setVariable["CanScavenge",true];
player setVariable ["ScavangedObjects", []];

{
    private _textInfo = getText (_x >> "text");
    private _actioniconInfo = getText (_x >> "icon");
    private _idleiconInfo = getText (_x >> "icon");
    private _modelInfo = getArray (_x >> "models");
    private _itemInfo = getArray (_x >> "items");
    private _condition = format ["((getModelInfo cursorObject) select 0) in %1 && {player distance cursorObject < 5} && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))", _modelInfo];

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
            [((_this select 3) select 0)] call ExileClient_system_scavenge_action_conditionEvents;
        },
        {},
        [configName _x],
        0.5,
        0,
        false
    ] call ExileClient_gui_holdActionAdd;
} forEach ("true" configClasses (missionConfigFile >> "CfgExileScavange"));