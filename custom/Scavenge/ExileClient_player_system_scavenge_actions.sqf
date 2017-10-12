/**
 * ExileClient_player_system_scavenge_actions
 * 
 */
private _configReference = missionConfigFile >> "CfgExileScavange";
Loot_Wrecks = getArray (_configReference >> "Wrecks" >> "models");
Apple_Trees = getArray (_configReference >> "Apples" >> "models");
Fruit_Trees = getArray (_configReference >> "Fruits" >> "models");
Water_Source = getArray (_configReference >> "Waters" >> "models");
Pumpkin_Patch = getArray (_configReference >> "Pumpkins" >> "models");
Wood_Stock = getArray (_configReference >> "Woodlogs" >> "models");

player setVariable["CanScavenge",true];
player setVariable ["ScavangedObjects", []];

switch (true) do 
{
	case ((getModelInfo cursorObject select 0) in Pumpkin_Patch):
	{
		private _configReference = missionConfigFile >> "CfgExileScavange";
		private _text = getText (_configReference >> "Pumpkins" >> "text");
		private _actionIcon = getText (_configReference >> "Pumpkins" >> "icon");
		private _progressIcon = getText (_configReference >> "Pumpkins" >> "icon");
		[
			player,
			_text,
			_actionIcon,
			_progressIcon,
			"{((getModelInfo cursorObject) select 0) in _x} count [Loot_Wrecks,Apple_Trees,Fruit_Trees,Pumpkin_Patch,Water_Source,Wood_Stock] > 0",
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
	};
	
	case ((getModelInfo cursorObject select 0) in Loot_Wrecks): 
	{
		private _configReference = missionConfigFile >> "CfgExileScavange";
		private _text = getText (_configReference >> "Wrecks" >> "text");
		private _actionIcon = getText (_configReference >> "Wrecks" >> "icon");
		private _progressIcon = getText (_configReference >> "Wrecks" >> "icon");
		[	
			player,
			_text,
			_actionIcon,
			_progressIcon,
			"{((getModelInfo cursorObject) select 0) in _x} count [Loot_Wrecks,Apple_Trees,Fruit_Trees,Pumpkin_Patch,Water_Source,Wood_Stock] > 0",
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
	};
	
	case ((getModelInfo cursorObject select 0) in Apple_Trees): 
	{
		private _configReference = missionConfigFile >> "CfgExileScavange";
		private _text = getText (_configReference >> "Apples" >> "text");
		private _actionIcon = getText (_configReference >> "Apples" >> "icon");
		private _progressIcon = getText (_configReference >> "Apples" >> "icon");
		[	
			player,
			_text,
			_actionIcon,
			_progressIcon,
			"{((getModelInfo cursorObject) select 0) in _x} count [Loot_Wrecks,Apple_Trees,Fruit_Trees,Pumpkin_Patch,Water_Source,Wood_Stock] > 0",
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
	};
	
	case ((getModelInfo cursorObject select 0) in Fruit_Trees): 
	{
		private _configReference = missionConfigFile >> "CfgExileScavange";
		private _text = getText (_configReference >> "Fruits" >> "text");
		private _actionIcon = getText (_configReference >> "Fruits" >> "icon");
		private _progressIcon = getText (_configReference >> "Fruits" >> "icon");
		[	
			player,
			_text,
			_actionIcon,
			_progressIcon,
			"{((getModelInfo cursorObject) select 0) in _x} count [Loot_Wrecks,Apple_Trees,Fruit_Trees,Pumpkin_Patch,Water_Source,Wood_Stock] > 0",
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
	};
	
	case ((getModelInfo cursorObject select 0) in Water_Source): 
	{
		private _configReference = missionConfigFile >> "CfgExileScavange";
		private _text = getText (_configReference >> "Waters" >> "text");
		private _actionIcon = getText (_configReference >> "Waters" >> "icon");
		private _progressIcon = getText (_configReference >> "Waters" >> "icon");
		[	
			player,
			_text,
			_actionIcon,
			_progressIcon,
			"{((getModelInfo cursorObject) select 0) in _x} count [Loot_Wrecks,Apple_Trees,Fruit_Trees,Pumpkin_Patch,Water_Source,Wood_Stock] > 0",
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
	};
	
	case ((getModelInfo cursorObject select 0) in Wood_Stock): 
	{
		private _configReference = missionConfigFile >> "CfgExileScavange";
		private _text = getText (_configReference >> "Woodlogs" >> "text");
		private _actionIcon = getText (_configReference >> "Woodlogs" >> "icon");
		private _progressIcon = getText (_configReference >> "Woodlogs" >> "icon");
		[	
			player,
			_text,
			_actionIcon,
			_progressIcon,
			"{((getModelInfo cursorObject) select 0) in _x} count [Loot_Wrecks,Apple_Trees,Fruit_Trees,Pumpkin_Patch,Water_Source,Wood_Stock] > 0",
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
	};
};