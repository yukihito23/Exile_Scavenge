/**
 * ExileClient_system_scavenge_action_conditionEvents
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
		["Apples"] call ExileClient_system_scavenge_createLoot;
	};
	case "Fruits":
	{
	    ["Fruits"] call ExileClient_system_scavenge_createLoot;
	};
	case "Pumpkins":
	{
		["Pumpkins"] call ExileClient_system_scavenge_createLoot;
	};
	case "Waters":
	{
		private _equippedMagazines = magazines player;
		private _conditionCeck = [];
		private _canCraftItem = true;
		private _preConditions = true;
		private _components = [];
		private _componentsArray = [];
		private _recipeClassName = "";
		private _requiredItems = getArray (missionConfigFile >> "CfgExileScavange" >> "Waters" >> "conditions" >> "items");
		private _recipes = (missionConfigFile >> "CfgScavengeRecipes") call BIS_fnc_getCfgSubClasses;
		private _waterRecipes = ["ScavengeFillEmptyPlasticBottleWithDirtyWater", "ScavengeFillEmptyWaterCanisterWithDirtyWater"];
		private _itemComponets = ScavengeItemComponents;
		
		if ({_x in _itemComponets} count _equippedMagazines > 0) then 
		{
			_recipes select 
			{ 
				if (_x in _waterRecipes) then 
				{ 
					_recipeClassName = _x;
					_preConditions = true;
				}; 
			};
		}
		else
		{
			["ErrorTitleOnly", ["You dont have any empty bottle or canister in your inventory."]] call ExileClient_gui_toaster_addTemplateToast;
			_preConditions = false;
		};
		
		if (_preConditions) then 
		{
			if ( {_x in _requiredItems} count _equippedMagazines > 0 ) then 
			{
				_conditionCeck = [_requiredItems, _recipeClassName] call ExileClient_system_scavenge_checkItemConditions;
				_canCraftItem = _conditionCeck select 0;
				_recipeClassName = _conditionCeck select 1;
			};
			if( _canCraftItem ) then 
			{
				[_recipeClassName, 1] call ExileClient_system_scavenge_action_craftItem;
			}
			else 
			{
				["ErrorTitleOnly", ["You cannot scavenge for water just yet."]] call ExileClient_gui_toaster_addTemplateToast;
			};
		};
	};
	case "Wrecks":
	{
	    ["Wrecks"] call ExileClient_system_scavenge_createLoot;
	};
	case "Woodlogs":
	{
	    ["Woodlogs"] call ExileClient_system_scavenge_createLoot;
	};
	default
	{
		throw ["ErrorTitleOnly", ["Something went realy wrong! Please report this action failure to your server admin."]] call ExileClient_gui_toaster_addTemplateToast;
	    diag_log format["EXILE SCAVENGE ERROR :: Attempting to call scavenge event with unsupported scavenge className %1", _className];
	};
};