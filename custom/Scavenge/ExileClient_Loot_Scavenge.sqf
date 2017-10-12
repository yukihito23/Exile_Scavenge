/**
By Kurewe @ CantankerousOldGoats.com
For use with LordRampantHump's "Items Pack for Arma 3"
http://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
Based on Larrow's Epoch looting script
https://forums.bistudio.com/forums/topic/184456-looting-trash-piles-bins/?do=findComment&comment=2942397
Expanded by Old Mte Choc
*/ 
private ["_configReference","_playerObjectInfo"];

_configReference = missionConfigFile >> "CfgExileScavange";
Loot_Wrecks = getArray (_configReference >> "Wrecks" >> "models");
Apple_Trees = getArray (_configReference >> "Apples" >> "models");
Fruit_Trees = getArray (_configReference >> "Fruits" >> "models");
Water_Source = getArray (_configReference >> "Waters" >> "models");
Pumpkin_Patch = getArray (_configReference >> "Pumpkins" >> "models");
Wood_Stock = getArray (_configReference >> "Woodlogs" >> "models");

player setVariable["canloot",true];
player setVariable ["ScavangedObjects", [], true];

// Wreck holdaction
[	
	player,
	"Scavenge Wreck",
	"Exile_HA_Icon_Wreck",
	"Exile_HA_Icon_Wreck",
	"getModelInfo cursorObject select 0 in Loot_Wrecks && player distance cursorObject < 5 && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		[] call ExileClient_object_scavenge_wrecks;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

// Apples holdaction
[	
	player,
	"Scavenge for Apples",
	"Exile_HA_Icon_Apple",
	"Exile_HA_Icon_Apple",
	"getModelInfo cursorObject select 0 in Apple_Trees && player distance cursorObject < 5 && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		[] call ExileClient_object_scavenge_apples;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

// Fruit holdaction
[	
	player,
	"Scavenge for Fruit",
	"Exile_HA_Icon_Fruit",
	"Exile_HA_Icon_Fruit",
	"getModelInfo cursorObject select 0 in Fruit_Trees && player distance cursorObject < 5 && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		[] call ExileClient_object_scavenge_fruit;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

// Pumpkins holdaction
[
	player,
	"Harvest Pumpkin",
	"Exile_HA_Icon_Pumpkin",
	"Exile_HA_Icon_Pumpkin",
	"getModelInfo cursorObject select 0 in Pumpkin_Patch && player distance cursorObject < 5 && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		[] call ExileClient_object_scavenge_pumpkins;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

// Water holdaction
[
	player,
	"Scavenge for Water",
	"Exile_HA_Icon_Water",
	"Exile_HA_Icon_Water",
	"getModelInfo cursorObject select 0 in Water_Source && player distance cursorObject < 5 && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		[] call ExileClient_object_scavenge_water;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;

// Woodlogs holdaction
[
	player,
	"Scavenge Woodlogs",
	"Exile_HA_Icon_Woodlogs",
	"Exile_HA_Icon_Woodlogs",
	"getModelInfo cursorObject select 0 in Wood_Stock && player distance cursorObject < 5 && !(cursorObject in (player getVariable ['ScavangedObjects',[]]))",
	"_caller distance _target < 5",
	{},
	{
		private _progressTick = _this select 4;
		if (_progressTick % 2 == 0) exitwith {};
		playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
	},
	{
		[] call ExileClient_object_scavenge_woodlogs;
	},
	{},
	[],
	0.5,
	0,
	false
] call ExileClient_gui_holdActionAdd;