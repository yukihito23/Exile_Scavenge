/**
 * ExileClient_player_system_scavenge_actions
 * 
 */
private _configReference = missionConfigFile >> "CfgExileScavange";
player setVariable["CanScavenge",true];
player setVariable ["ScavangedObjects", []];


[
	player,
	getText (_configReference >> "Pumpkins" >> "text"),
	getText (_configReference >> "Pumpkins" >> "icon"),
	getText (_configReference >> "Pumpkins" >> "icon"),
	"((getModelInfo cursorObject) select 0) in Pumpkin_Patch && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		["Pumpkins"] call ExileClient_player_system_scavenge_event;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

[	
	player,
	getText (_configReference >> "Wrecks" >> "text"),
	getText (_configReference >> "Wrecks" >> "icon"),
	getText (_configReference >> "Wrecks" >> "icon"),
	"((getModelInfo cursorObject) select 0) in Loot_Wrecks && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		["Wrecks"] call ExileClient_player_system_scavenge_event;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

[	
	player,
	getText (_configReference >> "Apples" >> "text"),
	getText (_configReference >> "Apples" >> "icon"),
	getText (_configReference >> "Apples" >> "icon"),
	"((getModelInfo cursorObject) select 0) in Apple_Trees && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		["Apples"] call ExileClient_player_system_scavenge_event;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;
	
[	
	player,
	getText (_configReference >> "Fruits" >> "text"),
	getText (_configReference >> "Fruits" >> "icon"),
	getText (_configReference >> "Fruits" >> "icon"),
	"((getModelInfo cursorObject) select 0) in Fruit_Trees && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		["Fruits"] call ExileClient_player_system_scavenge_event;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

[	
	player,
	getText (_configReference >> "Waters" >> "text"),
	getText (_configReference >> "Waters" >> "icon"),
	getText (_configReference >> "Waters" >> "icon"),
	"((getModelInfo cursorObject) select 0) in Water_Source && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		["Waters"] call ExileClient_player_system_scavenge_event;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

[	
	player,
	getText (_configReference >> "Woodlogs" >> "text"),
	getText (_configReference >> "Woodlogs" >> "icon"),
	getText (_configReference >> "Woodlogs" >> "icon"),
	"((getModelInfo cursorObject) select 0) in Wood_Stock && {player distance cursorObject < 5} && {!(cursorObject in (player getVariable ['ScavangedObjects',[]]))}",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		["Woodlogs"] call ExileClient_player_system_scavenge_event;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;