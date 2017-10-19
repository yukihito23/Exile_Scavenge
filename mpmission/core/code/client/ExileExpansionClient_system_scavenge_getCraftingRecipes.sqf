/**
 * ExileExpansionClient_system_scavenge_getCraftingRecipes
 *
 * Exile Expansion Mod
 * www.reality-gaming.eu
 * © 2017 Exile Expansion Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
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
		if( _x select 1 == _forItemClassName ) exitWith {
			_foundItems pushBack _recipeClassName;
		};
	} forEach _components;
	{
		if( _x == _forItemClassName ) exitWith {
			_foundItems pushBack _recipeClassName;
		};
	} forEach _tools;
	{
		if( _x == _forItemClassName ) exitWith {
			_foundItems pushBack _recipeClassName;
		};
	} forEach _weapons;
} forEach _availableRecipes;
_foundItems
