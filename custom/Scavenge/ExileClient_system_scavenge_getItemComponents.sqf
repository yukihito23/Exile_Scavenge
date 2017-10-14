/**
 * ExileClient_system_scavenge_getItemComponents
 *
 */

private _components = [];
private _componentsArray = [];
private _recipes = (missionConfigFile >> "CfgScavengeRecipes") call BIS_fnc_getCfgSubClasses;


{
	_components = getArray (missionConfigFile >> "CfgScavengeRecipes" >> _x >> "components");
	{
		private _ItemClassName = _x select 1;
		_componentsArray pushBack _ItemClassName;
	} forEach _components;
} forEach _recipes;
	
ScavengeItemComponents = _componentsArray;