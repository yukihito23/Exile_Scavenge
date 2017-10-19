/**
 * ExileExpansionClient_system_scavenge_action_craftItem
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params ["_recipeClassName", "_quantityToCraft"];

private _quantityCrafted = 0;
private _metSideConditions = true;
private _canCraftItem = true;
private _recipeConfig = missionConfigFile >> "CfgScavengeRecipes" >> _recipeClassName;
private _returnedItems = getArray(_recipeConfig >> "returnedItems");
private _interactionModelGroupClassName = getText(_recipeConfig >> "requiredInteractionModelGroup");
private _components = getArray(_recipeConfig >> "components");
private _tools = getArray(_recipeConfig >> "tools");
private _equippedMagazines = magazines player;
private _addedItems = [];
private _concreteMixer = objNull;
player setVariable ["CanScavenge", false];

{
	private _toolItemClassName = _x;
	private _equippedToolQuantity = { _x == _toolItemClassName } count _equippedMagazines;
	if (_equippedToolQuantity == 0 ) then	{
		_metSideConditions = false;
	};
} forEach _tools;
if ( getNumber(_recipeConfig >> "requiresOcean") == 1 ) then {
	if !(surfaceIsWater getPos player) then	{
		_metSideConditions = false;
	};
};
if ( getNumber(_recipeConfig >> "requiresFire") == 1 ) then {
	if !([player, 4] call ExileClient_util_world_isFireInRange) then {
		_metSideConditions = false;
	};
};
if ( getNumber(_recipeConfig >> "requiresConcreteMixer") == 1 ) then {
	_concreteMixer = (ASLtoAGL (getPosASL player)) call ExileClient_util_world_getNearestConcreteMixer;
	if (isNull _concreteMixer) then	{
		_metSideConditions = false;
	};
};
if( _interactionModelGroupClassName != "" ) then {
	private _interactionModelGroupModels = getArray(missionConfigFile >> "CfgExileScavenge" >> _interactionModelGroupClassName >> "models");
	private _foundObject = false;
	if ([ASLtoAGL (getPosASL player), 10, _interactionModelGroupModels] call ExileClient_util_model_isNearby) then {
		_foundObject = true;
	}	else {
		if ( _interactionModelGroupModels call ExileClient_util_model_isLookingAt ) then {
			_foundObject = true;
		};
	};
	if !(_foundObject) then	{
		_metSideConditions = false;
	};
};

if (_metSideConditions) then {
	for "_i" from 1 to _quantityToCraft do {
		private _hasAllComponents = true;
		{
			private _componentQuantity = _x select 0;
			private _componentItemClassName = _x select 1;
			private _equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
			if (_equippedComponentQuantity < _componentQuantity ) then {
				_hasAllComponents = false;
			};
		} forEach _components;
		if (_hasAllComponents) then	{
			if !(isNull _concreteMixer) then
			{
				["concreteMixerStartRequest", [netId _concreteMixer, _recipeClassName]] call ExileClient_system_network_send;
				_quantityCrafted = -1;
			}	else {
				if ([_components, _returnedItems] call ExileClient_util_inventory_canExchangeItems) then {
					{
						_componentQuantity = _x select 0;
						_componentItemClassName = _x select 1;
						for "_i" from 1 to _componentQuantity do {
							player removeItem _componentItemClassName;
						};
					} forEach _components;
					{
						private _returnedItemQuantity = _x select 0;
						private _returnedItemClassName = _x select 1;
						_addedItems = [_addedItems, _returnedItemClassName, _returnedItemQuantity] call BIS_fnc_addToPairs;
						for "_i" from 1 to _returnedItemQuantity do
						{
							player addItem _returnedItemClassName;
						};
					} forEach _returnedItems;
					_quantityCrafted = _quantityCrafted + 1;
				};
			};
		};
	};
};
if (_quantityCrafted > -1) then {
	if (_quantityCrafted > 0) then {
		private _feedbackMessage = "";
		{
			_returnedItemClassName = _x select 0;
			_returnedItemQuantity = _x select 1;
			private _returnedItemName = getText(configFile >> "CfgMagazines" >> _returnedItemClassName >> "displayName");
			if (_feedbackMessage != "") then {
				_feedbackMessage = _feedbackMessage + "<br/>";
			};
			_feedbackMessage = _feedbackMessage + format ["+%1x %2", _returnedItemQuantity, _returnedItemName];
		} forEach _addedItems;
		["SuccessTitleAndText", ["Scavenge completed!", _feedbackMessage]] call ExileClient_gui_toaster_addTemplateToast;
		player setVariable ["CanScavenge", true];
	};
};
true
