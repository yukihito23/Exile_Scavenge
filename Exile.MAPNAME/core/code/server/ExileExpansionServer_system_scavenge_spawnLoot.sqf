/**
 * ExileExpansionServer_system_scavenge_spawnLoot
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 params ["_lootPosition", "_numberOfItemsToSpawn", "_lootTableName"];

 private _lootWeaponHolderNetIDs = [];
 private _lootHolder = objNull;
 private _spawnedItemClassNames = [];

	if (isNull _lootHolder) then {
      _lootHolder = createVehicle ["LootWeaponHolder", _lootPosition, [], 0, "CAN_COLLIDE"];
      _lootHolder setDir (random 360);
      _lootHolder setPosATL _lootPosition;
      _lootHolder setVariable ["ExileSpawnedAt", time];
      _lootWeaponHolderNetIDs pushBack (netId _lootHolder);
    };

    for "_n" from 1 to _numberOfItemsToSpawn do {
      _itemClassName = _lootTableName call ExileServer_system_lootManager_dropItem;
      if !(_itemClassName in _spawnedItemClassNames) then {
        private _cargoType = _itemClassName call ExileClient_util_cargo_getType;
  			switch (_cargoType) do {
  				case 1:	{
  					if (_itemClassName isEqualTo "Exile_Item_MountainDupe") then {
  						_lootHolder addMagazineCargoGlobal [_itemClassName, 2];
  					}	else {
  						_lootHolder addMagazineCargoGlobal [_itemClassName, 1];
  					};
  				};
  				case 3:	{
  					_lootHolder addBackpackCargoGlobal [_itemClassName, 1];
  				};
  				case 2:	{
  					_lootHolder addWeaponCargoGlobal [_itemClassName, 1];
  					if !(_itemClassName isKindOf ["Exile_Melee_Abstract", configFile >> "CfgWeapons"]) then	{
  						_magazineClassNames = getArray(configFile >> "CfgWeapons" >> _itemClassName >> "magazines");
  						if (count(_magazineClassNames) > 0) then {
  							_magazineClassName = selectRandom _magazineClassNames;
  							_numberOfMagazines = 2 + floor(random 3);
  							_lootHolder addMagazineCargoGlobal [_magazineClassName, _numberOfMagazines];
  							_spawnedItemClassNames pushBack _magazineClassName;
  						};
  					};
  					_numberOfItemsToSpawn = -1;
  				};
  				default	{
  					_lootHolder addItemCargoGlobal [_itemClassName, 1];
  				};
  			};
  			_spawnedItemClassNames pushBack _itemClassName;
		};
  };
