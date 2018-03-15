/**
 * ExileExpansionClient_system_scavenge_checkCraftConditions
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 params [
   ["_configName", "", [""]],
   ["_pos", [], [[]]],
   ["_object", objNull, [objNull]],
   ["_pobject", objNull, [objNull]]
 ];

 if (_pos isEqualTo [] || {_configName isEqualTo ""} || {isNull _object} || {isNull _object}) exitWith {};

_equippedMagazines = magazines player;
_equippedWeapons = weapons player;
private _canCraftItem = true;
private _matchingRecipes = [];
private _recipe = "";
private _recipeConfig = "";
private _itemClassName = "";
private _components = [];
private _tools = [];
private _weapons = [];
private _returnedItems = [];
private _possibleCraftQuantity = 99999;
private _equippedComponentQuantity = 0;
private _equippedToolQuantity = 0;
private _equippedWeaponQuantity = 0;
private _scavengeConfig = missionConfigFile >> "CfgExileScavenge";
private _requiredItems = getArray (_scavengeConfig >> _configName >> "conditions" >> "items");
private _requiredTools = getArray (_scavengeConfig >> _configName >> "conditions" >> "tools");
private _requiredWeapons = getArray (_scavengeConfig >> _configName >> "conditions" >> "weapons");
private _classRecipes = getArray (_scavengeConfig >> _configName >> "recipes");
player setVariable ["CanScavenge", false];

{
	_recipe = _x;
	_recipeConfig = missionConfigFile >> "CfgScavengeRecipes" >> _recipe;

	// Compare all player inventory items with our scavange components list
	// and if there is a match get the recipes classnames that useing these items.
	if ( !isNil {getArray(_recipeConfig >> "components")} ) then {
		{
			_itemClassName = _x;
			if ( _itemClassName in _requiredItems ) then {
				// This function takes a item className and checks if this item is part of a scavange recipe.
				// If true then it returs a list of all recipes classnames that are useing these items.
				_matchingRecipes = [_itemClassName] call ExileExpansionClient_system_scavenge_getCraftingRecipes;
			};
		} forEach _equippedMagazines;
	};

	// Compare all player inventory items with our scavange tools list
	// and if there is a match get the recipes classnames that useing these items.
	if ( !isNil {getArray(_recipeConfig >> "tools")} ) then	{
		{
			_itemClassName = _x;
			if ( _itemClassName in _requiredTools ) then {
				// This function takes a tool className and checks if this item is part of a scavange recipe.
				// If true then it returs a list of all recipes classnames that are useing these items.
				_matchingRecipes = [_itemClassName] call ExileExpansionClient_system_scavenge_getCraftingRecipes;
			};
		} forEach _equippedMagazines;
	};

	// Compare all player inventory items with our scavange tools list
	// and if there is a match get the recipes classnames that useing these items.
	if ( !isNil {getArray(_recipeConfig >> "weapons")} ) then	{
		{
			_itemClassName = _x;
			if ( _itemClassName in _requiredWeapons ) then {
				// This function takes a tool className and checks if this item is part of a scavange recipe.
				// If true then it returs a list of all recipes classnames that are useing these items.
				_matchingRecipes = [_itemClassName] call ExileExpansionClient_system_scavenge_getCraftingRecipes;
			};
		} forEach _equippedWeapons;
	};
} forEach _classRecipes;

// This checks if the player has the needed items for each _matchingRecipes and checks how may of these items he can craft.
{
	_recipe = _x;
	_recipeConfig = missionConfigFile >> "CfgScavengeRecipes" >> _recipe;
	_components = getArray(_recipeConfig >> "components");
	_tools = getArray(_recipeConfig >> "tools");
	_weapons = getArray(_recipeConfig >> "weapons");
	_returnedItems = getArray(_recipeConfig >> "returnedItems");

	// If scavange class needs a item to get a item check if player has the needet item.
	if ( !isNil {getArray(_recipeConfig >> "components")} ) then {
		{
				_componentQuantity = _x select 0;
				_componentItemClassName = _x select 1;
				_equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
				_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedComponentQuantity / _componentQuantity));

				// Check if play has all component items for the recipe in inventory.
				// If true then he can craft item, false he can not craft.
				if ( _equippedComponentQuantity < _componentQuantity ) then	{
					_canCraftItem = false;
				}	else {
					_canCraftItem = true;
				};
		} forEach _components;
	};

	// If scavange class needs a tool to get a item check if player has the needet tools.
	if ( !isNil {getArray(_recipeConfig >> "tools")} ) then {
		{
			_toolItemClassName = _x;
			_equippedToolQuantity = { _x == _toolItemClassName } count _equippedMagazines;
			_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedToolQuantity / 1));
			if (_equippedToolQuantity == 0 ) then	{
				_canCraftItem = false;
			}	else {
				_canCraftItem = true;
			};
		} forEach _tools;
	};

	// If scavange class needs a kind of weapon to get a item check if player has the needet weapon.
	if ( !isNil {getArray(_recipeConfig >> "weapons")} ) then	{
		{
			_weaponItemClassName = _x;
			_equippedWeaponQuantity = { _x == _weaponItemClassName } count _equippedWeapons;
			_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedWeaponQuantity / 1));
			if (_equippedWeaponQuantity == 0 ) then	{
				_canCraftItem = false;
			} else {
				_canCraftItem = true;
			};
		} forEach _weapons;
	};

} forEach _matchingRecipes;

// If player has not a single component item in his invetory he can not craft any items when the class need a item.
if ( _equippedComponentQuantity == 0 && _configName in ["Waters","Fuel"]) then {
	_canCraftItem = false;
	switch (_configName) do	{
		case "Waters":
		{
			["ErrorTitleOnly", ["You don't have any EMPTY bottle or canister in your inventory to fill it with water."]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		case "Fuel":
		{
			["ErrorTitleOnly", ["You don't have any EMPTY Fuel Canister in your inventory to fill it with fuel."]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		default
		{
			["ErrorTitleOnly", ["You dont have the required items to get something from this source!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
	};
};

// If player has not a single tool in his invetory he can not craft any items when the class need a tool.
if ( _equippedToolQuantity == 0 && _configName in ["WoodPlanks","MetalPoles"]) then {
	_canCraftItem = false;
	switch (_configName) do	{
		case "WoodPlanks":
		{
			["ErrorTitleOnly", ["You dont have a Handsaw with you!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		case "MetalPoles":
		{
			["ErrorTitleOnly", ["You dont have a Grinder with you!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		default
		{
			["ErrorTitleOnly", ["You dont have the required tools to get something from this source!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
	};
};

// If player has not a single tool in his invetory he can not craft any items when the class need a tool.
if ( _equippedWeaponQuantity == 0 && _configName in ["Cinderblocks","Pumpkins","Concrete"]) then {
	_canCraftItem = false;
	switch (_configName) do	{
		case "Cinderblocks":
		{
			["ErrorTitleOnly", ["You dont have a Sledge Hammer with you!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		case "Concrete":
		{
			["ErrorTitleOnly", ["You dont have a Sledge Hammer with you!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		case "Pumpkins":
		{
			["ErrorTitleOnly", ["You dont have a Shovel with you!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
		default
		{
			["ErrorTitleOnly", ["You dont have the required weapon to get something from this source!"]] call ExileClient_gui_toaster_addTemplateToast;
			player setVariable ["CanScavenge", true];
		};
	};
};

// If player has no space in his inventory for the item then he can not craft.
if !([_components, _returnedItems] call ExileClient_util_inventory_canExchangeItems) then {
	["ErrorTitleOnly", ["Your inventory is full."]] call ExileClient_gui_toaster_addTemplateToast;
	_canCraftItem = false;
	player setVariable ["CanScavenge", true];
};

// If player can craft item then fire the scavenge event.
if ( _canCraftItem ) then {
	[_configName, _recipe, _possibleCraftQuantity, _pos, _object, _pobject] call ExileExpansionClient_object_player_playScavengeEvent;
};
