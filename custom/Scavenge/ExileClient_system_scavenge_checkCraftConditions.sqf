/**
 * ExileClient_system_scavenge_checkCraftConditions
 *
 */
params 
[
	"_equippedMagazines",
	"_configName"
];

private _canCraftItem = true;
private _components = [];
private _returnedItems = [];
private _matchingRecipes = [];
private _recipe = "";
private _possibleCraftQuantity = 99999;
private _equippedComponentQuantity = 0;
private _scavengeConfig = missionConfigFile >> "CfgExileScavange";
private _requiredItems = getArray (_scavengeConfig >> "Waters" >> "conditions" >> "items");

// Compare all player invetory items with our scavange components list 
// and if there is a match get the recipes classnames that useing these items.
{
	_itemClassName = _x;
	if ( _itemClassName in _requiredItems ) then 
	{
		// This function takes a item className and checks if this item is part of a scavange recipe.
		// If true then it returs a list of all recipes classnames that are useing these items.
		_matchingRecipes = [_itemClassName] call ExileClient_system_scavenge_getCraftingRecipes;
	};
} forEach _equippedMagazines;

// This checks if the player has the needed items for each _matchingRecipes and checks how may of these items he can craft.
{	
	_recipe = _x;
	_recipeConfig = missionConfigFile >> "CfgScavengeRecipes" >> _recipe;
	_components = getArray (_recipeConfig >> "components");
	_returnedItems = getArray(_recipeConfig >> "returnedItems");
	{
			private _componentQuantity = _x select 0;
			private _componentItemClassName = _x select 1;
			_equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
			_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedComponentQuantity / _componentQuantity));
			
			// Check if play has all component items for the recipe in inventory.
			// If true then he can craft item, false he can not craft.
			if ( _equippedComponentQuantity < _componentQuantity ) then
			{
				_canCraftItem = false;				
			}
			else
			{
				_canCraftItem = true;
			};
	} forEach _components;
} forEach _matchingRecipes;
		
// If player has not a single component item then no empty bottle or canister is in his invetory.
// He can not craft any items.
if (_equippedComponentQuantity == 0 ) then
{
	["ErrorTitleOnly", ["You don't have any EMPTY bottle or canister in your inventory to fill it with water."]] call ExileClient_gui_toaster_addTemplateToast;
	_canCraftItem = false;
}
else
{ 
	_canCraftItem = true;
};

// If player has no space in his inventory for the item then he can not craft. 
if !([_components, _returnedItems] call ExileClient_util_inventory_canExchangeItems) then
{
	["ErrorTitleOnly", ["Your inventory is full."]] call ExileClient_gui_toaster_addTemplateToast;
	_canCraftItem = false;
};

// If player can craft item then fire the scavenge event.
if ( _canCraftItem ) then 
{
	[_configName, _recipe, _possibleCraftQuantity] call ExileClient_object_player_playScavengeEvent;
}
else
{
	["ErrorTitleOnly", ["Your can not scavange this just yet!"]] call ExileClient_gui_toaster_addTemplateToast;
};