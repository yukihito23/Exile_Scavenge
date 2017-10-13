/**
 * CfgScavengeRecipes
 *
 * Author: Steve aka Salutesh
 *
 * Description:
 * These configurations are used within the scavange system to configure the different scavange classes.
 */

class Exile_ScavengeCraftingRecipe
{
	returnedItems[] = {};
	components[] = {}; // Required components
	tools[] = {}; // Required tools (matches, gas cooker etc.)
	requiredInteractionModelGroup = "";
	requiresOcean = 0; // isSurfaceWater test
	requiresFire = 0; // inflamed object nearby
	requiresConcreteMixer = 0; // Check if concrete mixer is nearby
};
 
class CfgScavengeRecipes
{
	class ScavengeFillEmptyPlasticBottleWithDirtyWater: Exile_ScavengeCraftingRecipe
	{
		requiredInteractionModelGroup = "Waters";
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleDirtyWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
	};
	class ScavengeFillEmptyPlasticBottleWithFreshWater: Exile_ScavengeCraftingRecipe
	{
		requiredInteractionModelGroup = "Waters";
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleFreshWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
	};
	class ScavengeFillEmptyPlasticBottleWithSaltWater: Exile_ScavengeCraftingRecipe
	{
		requiresOcean = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_PlasticBottleSaltWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
	};
	class ScavengeFillEmptyWaterCanisterWithDirtyWater: Exile_ScavengeCraftingRecipe
	{
		requiredInteractionModelGroup = "Waters";
		returnedItems[] =
		{
			{1, "Exile_Item_WaterCanisterDirtyWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_WaterCanisterEmpty"}
		};
	};
	class ScavengeFillFuelCanister: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] = 
		{
			{1, "Exile_Item_FuelCanisterFull"}
		};
		components[] = 
		{
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
	};
};