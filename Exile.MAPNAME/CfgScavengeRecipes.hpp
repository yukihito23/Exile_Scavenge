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
	weapons[] = {}; // Required weapons (Sledge Hammer)
	requiresOcean = 0; // isSurfaceWater test
	requiresFire = 0; // inflamed object nearby
	requiresConcreteMixer = 0; // Check if concrete mixer is nearby
};

class CfgScavengeRecipes
{
	class ScavengeFillEmptyPlasticBottleWithDirtyWater: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleDirtyWater"}
		};
		components[] =
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
	};
	class ScavengeFillEmptyWaterCanisterWithDirtyWater: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exile_Item_WaterCanisterDirtyWater"}
		};
		components[] =
		{
			{1, "Exile_Item_WaterCanisterEmpty"}
		};
	};
	class ScavengeFillEmptyWaterCanteenWithDirtyWater: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exitem_canteen_dirty"}
		};
		components[] =
		{
			{1, "Exitem_canteen"}
		};
	};
	class ScavengeFillEmptyFuelCanisterWithFuel: Exile_ScavengeCraftingRecipe
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
	class ScavengeDestroyConcrete: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exile_Item_Cement"}
		};
		weapons[] =
		{
			"Exile_Melee_SledgeHammer"
		};
	};
	class ScavengeWoodplanks: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exile_Item_WoodPlank"}
		};
		tools[] =
		{
			"Exile_Item_Handsaw"
		};
	};
	class ScavengeMetalPoles: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exile_Item_MetalPole"}
		};
		tools[] =
		{
			"Exile_Item_Grinder"
		};
	};
	class ScavengeDestroyCinderblock: Exile_ScavengeCraftingRecipe
	{
		returnedItems[] =
		{
			{1, "Exitem_cinderblock"}
		};
		weapons[] =
		{
			"Exile_Melee_SledgeHammer"
		};
	};
	class ScavengePumpkins: Exile_ScavengeCraftingRecipe
  	{
  		returnedItems[] =
    		{
     			{1, "Exitem_pumpkin"}
   		 };
   		 weapons[] =
    		{
     			"Exile_Melee_Shovel"
    		};
  	};
};
