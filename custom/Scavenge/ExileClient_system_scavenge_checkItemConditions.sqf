/**
 * ExileClient_player_system_scavenge_checkItemConditions
 *
 */
params
[
	["_requiredItems", "", [""]],
	["_recipeClassName", "", ""]
];

private _equippedMagazines = magazines player;
private _conditionItems = getArray (missionConfigFile >> "CfgExileScavange" >> "Waters" >> "conditions" >> "items");
private _recipeConfig = missionConfigFile >> "CfgScavengeRecipes" >> _recipeClassName;
private _components = getArray(_recipeConfig >> "components");
private _canCraftItem = true;
private _possibleCraftQuantity = 99999;
private _returnedItems = getArray(_recipeConfig >> "returnedItems");
private _tools = getArray(_recipeConfig >> "tools");
if ({_x in _requiredItems} count _equippedMagazines > 0) then
{
	{
		private _componentQuantity = _x select 0;
		private _componentItemClassName = _x select 1;
		private _equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
		private _possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedComponentQuantity / _componentQuantity));
		if (_equippedComponentQuantity < _componentQuantity ) then
		{
			_canCraftItem = false;
		}
		else
		{
			_canCraftItem = true;
		};
	} forEach _components;
	if !([_components, _returnedItems] call ExileClient_util_inventory_canExchangeItems) then
	{
		_canCraftItem = false;
		_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", "Your inventory is full."];
	};
};
[_canCraftItem, _recipeClassName]
