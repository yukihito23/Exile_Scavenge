/**
 * ExileClient_player_system_scavenge_info
 * 
 */
 
private _configReference = missionConfigFile >> "CfgExileScavange";
private _classes = (missionConfigFile >> "CfgExileScavange") call BIS_fnc_getCfgSubClasses;

{
	private _chance = getNumber (_configReference >> _x >> "chance");
	private _maxItems = getNumber (_configReference >> _x >> "maxitems");
	private _textInfo = getText (_configReference >> _x >> "text");
	private _iconInfo = getText (_configReference >> _x >> "icon");
	private _modelInfo = getArray (_configReference >> _x >> "models");
	private _itemInfo = getArray (_configReference >> _x >> "items");
} forEach _classes;


Loot_Wrecks = getArray (_configReference >> "Wrecks" >> "models");
Apple_Trees = getArray (_configReference >> "Apples" >> "models");
Fruit_Trees = getArray (_configReference >> "Fruits" >> "models");
Water_Source = getArray (_configReference >> "Waters" >> "models");
Pumpkin_Patch = getArray (_configReference >> "Pumpkins" >> "models");
Wood_Stock = getArray (_configReference >> "Woodlogs" >> "models");