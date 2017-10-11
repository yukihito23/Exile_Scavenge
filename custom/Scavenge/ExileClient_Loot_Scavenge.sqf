/**
By Kurewe @ CantankerousOldGoats.com
For use with LordRampantHump's "Items Pack for Arma 3"
http://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
Based on Larrow's Epoch looting script
https://forums.bistudio.com/forums/topic/184456-looting-trash-piles-bins/?do=findComment&comment=2942397
Expanded by Old Mte Choc
*/ 
private ["_configReference"];

_configReference = missionConfigFile >> "CfgExileScavange";
Loot_wrecks = getArray (_configReference >> "Wrecks" >> "models");
Apple_Trees = getArray (_configReference >> "Apples" >> "models");
Fruit_Trees = getArray (_configReference >> "Fruit" >> "models");
Water_Source = getArray (_configReference >> "Water" >> "models");
Pumpkin_Patch = getArray (_configReference >> "Pumpkins" >> "models");
Wood_Stock = getArray (_configReference >> "Woodlogs" >> "models");

player setVariable["canloot",true];
//player addAction["Scavenge Wreck","Custom\Scavenge\ScavengeWrecks.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Loot_wrecks && player distance cursorObject < 5"];
player addAction["Scavenge for Apples","Custom\Scavenge\ScavengeApples.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Apple_Trees && player distance cursorObject < 5"];
player addAction["Scavenge for Fruit","Custom\Scavenge\ScavengeFruit.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Fruit_Trees && player distance cursorObject < 5"];
player addAction["Scavenge for Water","Custom\Scavenge\ScavengeWater.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Water_Source && player distance cursorObject < 5"];
player addAction["Harvest Pumpkin","Custom\Scavenge\ScavengePumpkin.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Pumpkin_Patch && player distance cursorObject < 5"];
player addAction["Scavenge Woodlogs","Custom\Scavenge\ScavengeWoodlogs.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Wood_Stock && player distance cursorObject < 5"];

[		player,
		"Scavenge Wreck",
		"Exile_HA_Icon_Wreck",
		"Exile_HA_Icon_Wreck",
		"getModelInfo cursorObject select 0 in Loot_wrecks && _caller distance cursorObject < 5",
		"_caller distance _target < 5",
		{},
		{
			private _progressTick = _this select 4;
			if (_progressTick % 2 == 0) exitwith {};
			playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
		},
		{
			_this call ExileClient_object_scavenge_wrecks;
		},
		{},
		[player],
		0.5,
		0,
		false
] call ExileClient_gui_holdActionAdd;