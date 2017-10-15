/**
 * ExileClient_system_scavenge_getCraftingRecipes
 *
 */
 
private["_forItemClassName", "_foundItems", "_availableRecipes", "_recipeConfig", "_recipeClassName", "_components", "_tools"];
_forItemClassName = _this select 0;
_foundItems = [];
_availableRecipes = (missionConfigFile >> "CfgScavengeRecipes") call Bis_fnc_getCfgSubClasses;
{
	_recipeConfig = (missionConfigFile >> "CfgScavengeRecipes" >> _x);
	_recipeClassName = _x;
	_components = getArray(_recipeConfig >> "components");
	_tools = getArray(_recipeConfig >> "tools");
	{
		if( _x select 1 == _forItemClassName ) exitWith 
		{
			_foundItems pushBack _recipeClassName;
		};
	} forEach _components;
	{
		if( _x == _forItemClassName ) exitWith
		{
			_foundItems pushBack _recipeClassName;
		};
	} forEach _tools;
} forEach _availableRecipes;
_foundItems