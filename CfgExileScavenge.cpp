/**
 * CfgExileHoldActions
 *
 * Author: Steve aka Salutesh
 *
 * Description:
 * These configurations are used within the scavange system to configure the different scavange classes.
 */
 
 class Exile_ScavengeClass
{
		chance = 100;						// Chance of getting a item from a scavange.
		maxitems = 0;						// Max items to get from a single scavange.
		icon = "";							// Action icon ClassName (Configure your own classes within the provided CfgExileHoldActions.cpp)
		text = "My Scavenge Interaction";	// Action text that gets displayed with the icon.
		models[] = {};						// Interaction models (has to be a p3d) that will work with this scavange class.
		recipes[] = {};						// Recipes that are used in this class.
		items[] = {};						// Items that the player with get from this scavange class.
		// In case of a scavange class that needs a item/model/object/surface this part gets in action.
		// So far this is used for the water class that requires a empty bottle/canister in the players inventory to "fill" it with water.
		class conditions
		{
			items[] = {};					// Item conditions (the player needs this item in his inventory or he cant scavanged sucsessful from this source).
		};
};

class CfgExileScavenge
{
	
	// LordRampantHumps Items Pack 
	// https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
	class Apples: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 2;
		icon = "Exile_HA_Icon_Apple";
		text = "Scavenge for Apples";
		models[] = 
		{
			"t_malus1s.p3d",
			"jablon.p3d",
			"t_malus1s_summer.p3d"
		};
		items[] =
		{
			"items_pack_apple_red", 
			"items_pack_apple"
		};
	};
	
	class Fruits: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 2;
		icon = "Exile_HA_Icon_Fruit";
		text = "Scavenge for Fruit";
		models[] = 
		{
			// Random small trees and bushes
			"b_corylus.p3d",
			"b_canina2s.p3d",
			"b_amygdalusn1s_ep1.p3d",
			"jerabina.p3d",
			"b_elderberry2s_pmc.p3d",
			// Banana trees
			"banana_3.p3d",
			"banana_2.p3d",
			"banana_1.p3d",
			"banana_4.p3d",
			// Chernarus Redux
			"c_blueberry_summer.p3d",
			"c_blueberry.p3d",
			"b_hrusen2.p3d",
			"t_betula2w.p3d"
		};
		items[] =
		{
			"items_pack_pear", 
			"items_pack_banana"
		};
	};
	
	class Trash: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 2;
		icon = "Default";
		text = "Search through garbage";
		models[] = 
		{
			// Trashpiles
			"garbagewashingmachine_f.p3d",
			"garbagepallet_f.p3d",
			"garbagebags_f.p3d",
			// Trashbins
			"kontejner.p3d"
		};
		items[] = 
		{
			"Exile_Item_CanOpener",
			"Exile_Item_Can_Empty",
			"Exile_Item_WaterCanisterEmpty",
			"Exile_Item_PlasticBottleEmpty"
		};
	};
	/*
		Not Working so far
	/*
	class Cinderblogs: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 2;
		icon = "Default";
		text = "Get Cinderblogs";
		models[] = 
		{
			"cinderblocks_f.p3d"
		};
		recipes[] = 
		{
			"ScavengeDestroyCinderblog"
		};
		class conditions
		{
			weapons[] = 
			{
				"Exile_Melee_SledgeHammer"
			};
		};
	};
	*/
	class Wrecks: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 2;
		icon = "Exile_HA_Icon_Wreck";
		text = "Scavenge Wreck";
		models[] = 
		{
			"wreck_brdm2_f.p3d",
			"wreck_van_f.p3d",
			"wreck_truck_dropside_f.p3d",
			"wreck_truck_f.p3d",
			"wreck_car2_f.p3d",
			"wreck_offroad_f.p3d",
			"wreck_car_f.p3d",
			"wreck_bmp2_f.p3d",
			"wreck_truck_f.p3d",
			"wreck_car3_f.p3d",
			"hiluxt.p3d",
			"hmmwv_wrecked.p3d",
			"wreck_hmmwv_f.p3d",
			"wreck_offroad2_f.p3d",
			"wreck_hunter_f.p3d",
			"uaz_wrecked.p3d",
			"wreck_ural_f.p3d",
			"wreck_uaz_f.p3d",
			"wreck_cardismantled_f.p3d",
			"m113t.p3d",
			"uaz_wrecked.p3d",
			"wreck_skodovka_f.p3d",
			"skodovka_wrecked.p3d",
			"lada_wrecked.p3d",
			"ural_wrecked.p3d",
			"brdm2_wrecked.p3d",
			"jeept.p3d",
			"mi8_crashed.p3d",
			// Cups & Arma
			"datsun01t.p3d",
			"datsun02t.p3d",
			"bmp2_wrecked.p3d",
			"wreck_heli_attack_02_f.p3d",
			"wreck_heli_attack_01_f.p3d"
			// Some Redux (Dont Seem to work)
			//"chz_kamaz_korpus2.p3d",
			//"chz_avtobus2.p3d",
			//"chz_kamaz_fura.p3d",
			//"chz_kamaz_pricep.p3d"
		};
		
		items[] =
		{
			// Extras
			"Exile_Item_InstaDoc",
			"Exile_Item_Bandage",
			"Exile_Item_DuctTape"
		};
	};
	
	class Waters: Exile_ScavengeClass
	{
		chance = 70;
		icon = "Exile_HA_Icon_Water";
		text = "Scavenge for Water";
		
		models[] =
		{
			"pumpa.p3d",
			"misc_well.p3d",
			"misc_wellpump.p3d",
			"watertank_f.p3d",
			"toilet_b_02.p3d"
		};
		recipes[] = 
		{
			"ScavengeFillEmptyPlasticBottleWithDirtyWater",
			"ScavengeFillEmptyWaterCanisterWithDirtyWater",
			"ScavengeFillEmptyWaterCanteenWithDirtyWater"
		};
		class conditions
		{
			items[] = 
			{
				"Exile_Item_PlasticBottleEmpty",
				"Exile_Item_WaterCanisterEmpty",
				"Exitem_canteen"
			};
		};
	};
	
	class Woodlogs: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 3;
		icon = "Exile_HA_Icon_Woodlogs";
		text = "Scavenge Woodlogs";
		models[] =
		{
			"drevo_hromada.p3d"
		};
		items[] =
		{
			"Exile_Item_WoodLog"
		};
	};
	
	// Extended_Items_Exile
	// https://steamcommunity.com/sharedfiles/filedetails/?id=897168981
	class Pumpkins: Exile_ScavengeClass
	{
		chance = 50;
		maxitems = 1;
		icon = "Exile_HA_Icon_Pumpkin";
		text = "Harvest Pumpkin";
		models[] =
		{
			"bodlak_group.p3d"
		};
		items[] =
		{
			"Exitem_pumpkin"
		};
	};
};