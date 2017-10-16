/**
 * ExileClient_system_scavenge_getCraftingRecipes
 *
 */
params ["_forItemClassName"];

private _foundItems = [];
private _availableRecipes = (missionConfigFile >> "CfgScavengeRecipes") call Bis_fnc_getCfgSubClasses;
{
	private _recipeConfig = (missionConfigFile >> "CfgScavengeRecipes" >> _x);
	private _recipeClassName = _x;
	private _components = getArray(_recipeConfig >> "components");
	private _tools = getArray(_recipeConfig >> "tools");
	private _weapons = getArray(_recipeConfig >> "weapons");
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
	{
		if( _x == _forItemClassName ) exitWith
		{
			_foundItems pushBack _recipeClassName;
		};
	} forEach _weapons;
} forEach _availableRecipes;
_foundItems
