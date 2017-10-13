/**
 * ExileClient_player_system_scavenge_info
 * 
 */
 
private _configReference = missionConfigFile >> "CfgExileScavange";
Loot_Wrecks = getArray (_configReference >> "Wrecks" >> "models");
Apple_Trees = getArray (_configReference >> "Apples" >> "models");
Fruit_Trees = getArray (_configReference >> "Fruits" >> "models");
Water_Source = getArray (_configReference >> "Waters" >> "models");
Pumpkin_Patch = getArray (_configReference >> "Pumpkins" >> "models");
Wood_Stock = getArray (_configReference >> "Woodlogs" >> "models");