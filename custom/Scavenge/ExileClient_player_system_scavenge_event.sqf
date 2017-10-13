/**
 * ExileClient_player_system_scavenge_event
 *
 */
params [
  ["_className", "", [""]]
];

if (_className isEqualTo "") exitWith {};
if (ExileClientPlayerIsInCombat) exitWith 
{
	["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;
};
if (player call ExileClient_util_world_isInTraderZone) exitWith 
{
	["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(player getVariable "CanScavange") exitWith 
{
	["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(alive player) exitWith {};

private _currentObject = cursorObject;
private _objectsList = player getVariable ["ScavangedObjects",[]];

if (_currentObject in _objectsList) exitWith {};

private _config = missionConfigFile >> "CfgExileScavange" >> _className;

if !(isClass _config) exitWith {};

switch (_className) do
{
	case "Apples":
	{
		["Apples"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Fruits":
	{
	    ["Fruits"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Pumpkins":
	{
		["Pumpkins"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Waters":
	{
		_equippedMagazines = magazines player;
		_conditionItems = getArray (missionConfigFile >> "CfgExileScavange" >> "Waters" >> "conditions" >> "items");
		if (_conditionItems in _equippedMagazines) then 
		{
			{
				if (_x in (magazines player)) then
				{
					_canisterItem = _x;
					switch (_canisterItem) do
					{
						case "Exile_Item_PlasticBottleEmpty":
						{
							_recipeClassName = "ScavengeFillEmptyPlasticBottleWithDirtyWater";
						};
					};
				};
			} forEach _conditionItems;
			
			_recipeConfig = missionConfigFile >> "CfgScavengeRecipes" >> _recipeClassName;
			_components = getArray(_recipeConfig >> "components");
			{
				_componentQuantity = _x select 0;
				_componentItemClassName = _x select 1;
				_equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
				_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedComponentQuantity / _componentQuantity));
				if (_equippedComponentQuantity < _componentQuantity ) then
				{
					_Conditions = false;
					["ErrorTitleAndText", ["Failed to scavenge!", "You dont have the needed items in your inventory!"]] call ExileClient_gui_toaster_addTemplateToast;
				}
				else
				{ 
					_Conditions = true;
				};
			} forEach _components;
			if (_Conditions) then 
			{
				[_recipeClassName, 1] call ExileClient_player_system_scavenge_craft;
			};
		};
	};
	case "Wrecks":
	{
	    ["Wrecks"] call ExileClient_player_system_scavenge_createLoot;
	};
	case "Woodlogs":
	{
	    ["Woodlogs"] call ExileClient_player_system_scavenge_createLoot;
	};
	default
	{
		_className = _this select 0;
		throw ["ErrorTitleOnly", ["Something went realy wrong! Please report this action failure to your server admin."]] call ExileClient_gui_toaster_addTemplateToast;
	    diag_log format["EXILE SCAVENGE ERROR :: Attempting to call scavenge event with unsupported scavenge className %1", _className];
	};
};