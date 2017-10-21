/**
 * CfgExileScavenge
 *
 * Author: Steve aka Salutesh
 *
 * Description:
 * These configurations are used within the scavange system to configure the different scavange classes.
 */

class Exile_ScavengeClass
{
	animations[] = 						          // List of animations the player unit can play in the scavenge action. Only one animation in this list will be executed.
	{
		"AinvPknlMstpSnonWnonDnon_medic_1"
	};
	type = "ScavengeClass";				      // This is the definition of the scavenge class, there are currently 2 classes (ScavengeClass = Player dont need any requirements,
										                  // he can just loot the object | CraftingClass = Player needs a special item/tool/weapon to get a item back from the source).
	chance = 100;						            // % Chance of geting a item from this class/source.
	searchtime = 5;						          // Searchtime in seconds the player will need to scavenge a object.
	maxitems = 0;						            // Max items to get from a single scavange.
	icon = "";							            // Action icon ClassName (Configure your own classes within the provided CfgExileHoldActions.cpp)
	text = "My Scavenge Interaction";	  // Action text that gets displayed with the icon.
	models[] = {};						          // Interaction models (has to be a p3d) that will work with this scavange class.
	recipes[] = {};						          // Recipes that are used in this class.
	items[] = {};						            // Items that the player with get from this scavange class.

  // In case of a scavange class that needs a item/model/object/surface this part gets in action.
	// So far this is used for the water class that requires a empty bottle/canister in the players inventory to "fill" it with water and the
  // Cinderblock class where the player needs a weapon (hammer) on his body to get a item back from the source.
	class conditions
	{
		items[] = {};				// Item conditions (the player needs this item in his inventory or he cant scavanged sucsessful from this source).
		weapons[] = {};				// Weapon conditions (the player needs this weapon in his inventory/body or he cant scavanged sucsessful from this source).
	};
};

class CfgExileScavenge
{
	// Able to scavenge from garbage bags, Trask Cans, basically clutter on the map
	class Trash: Exile_ScavengeClass
	{
		animations[] = {
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "ScavengeClass";
		chance = 50;
		searchtime = 5;
		maxitems = 2;
		icon = "Default";
		text = "Search through garbage";
		models[] = {
			// Trashpiles
			"garbagewashingmachine_f.p3d",
			"garbagepallet_f.p3d",
			"garbagebags_f.p3d",
			// Trashbins
			"kontejner.p3d",
			"paperbox_closed.p3d",
			"garbagebin_02_f.p3d",
			"drevena_bedna.p3d",
			"junkpile_f.p3d",
			"garbagecontainer_open_f.p3d",
			"garbagecontainer_closed_f.p3d",
			"luggageheap_01_f.p3d",
			"luggageheap_02_f.p3d",
			"luggageheap_03_f.p3d",
			"luggageheap_04_f.p3d",
			"luggageheap_05_f.p3d",	
			"popelnice.p3d",
			"box_c.p3d",
			"garbagebarrel_01_f.p3d"
		};
		items[] = {
			"Exile_Item_CanOpener",
			"Exile_Item_Can_Empty",
			"Exile_Item_WaterCanisterEmpty",
			"Exile_Item_PlasticBottleEmpty"
		};
	};
	// Able to scavenge from wrecks within map, some vehicles still have problems but are noted below.
	class Wrecks: Exile_ScavengeClass
	{
		animations[] = {
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "ScavengeClass";
		chance = 50;
		searchtime = 5;
		maxitems = 2;
		icon = "Exile_HA_Icon_Wreck";
		text = "Scavenge Wreck";
		models[] = {
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
		items[] = {
			// Extras
			"Exile_Item_InstaDoc",
			"Exile_Item_Bandage",
			"Exile_Item_DuctTape"
		};
	};
	// Able to get dirty water from map object pumps
	class Waters: Exile_ScavengeClass
	{
		animations[] = {
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "CraftingClass";
		chance = 70;
		searchtime = 5;
		icon = "Exile_HA_Icon_Water";
		text = "Scavenge for Water";
		models[] =	{
			"pumpa.p3d",
			"misc_well.p3d",
			"misc_wellpump.p3d",
			"watertank_f.p3d",
			"toilet_b_02.p3d",
			"reservoir_ep1.p3d",
			"basin_a.p3d",
			"barrel_water.p3d"
		};
		recipes[] =	{
			"ScavengeFillEmptyPlasticBottleWithDirtyWater",
			"ScavengeFillEmptyWaterCanisterWithDirtyWater",
			"ScavengeFillEmptyWaterCanteenWithDirtyWater"
		};
		class conditions {
			items[] = {
				"Exile_Item_PlasticBottleEmpty",
				"Exile_Item_WaterCanisterEmpty",
				"Exitem_canteen"
			};
		};
	};
	// Able to get Fuel from Pumps, Fuel Containers, Fuel Tanks, barrells around the map
	class Fuel: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "CraftingClass";
		chance = 10;
		searchtime = 5;
		maxitems = 1;
		icon = "Default";
		text = "Get Fuel";
		models[] = {
			"a_fuelstation_feed.p3d",
			"fuel_tank_stairs.p3d",
			"fuel_tank_small.p3d",
			"ind_tanksmall.p3d",
			"ind_tanksmall2.p3d",
			"barels.p3d",
			"barel1.p3d",
			"barel2.p3d",
			"barel3.p3d",
			"barel4.p3d",
			"barel5.p3d"
		};
		recipes[] =	{
			"ScavengeFillEmptyFuelCanisterWithFuel"
		};
		class conditions {
			items[] =	{
				"Exile_Item_FuelCanisterEmpty"
			};
		};
	};
	// Able to get woodlogs from stocks of wood, pile of wood, fallen logs around the map
	class Woodlogs: Exile_ScavengeClass
	{
		animations[] = {
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "ScavengeClass";
		chance = 50;
		searchtime = 5;
		maxitems = 3;
		icon = "Exile_HA_Icon_Woodlogs";
		text = "Scavenge Woodlogs";
		models[] = {
			"drevo_hromada.p3d",
			"misc_fallentree1.p3d",
			"misc_burnspruce_pmc.p3d",
			"ind_timbers.p3d",
			"misc_woodpile.p3d",
			"kmen_1_buk.p3d"
		};
		items[] =
		{
			"Exile_Item_WoodLog"
		};
	};
	/*
	// Uses vanilla Exile items but not available in Vanilla Exile setup, thus disabling by default.
	class Trees: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "ScavengeClass";
		chance = 20;
		searchtime = 2;
		maxitems = 2;
		icon = "Exile_HA_Icon_Woodlogs";
		text = "Scavenge Sticks and Leaves";
		models[] = {
			// Trees on CHR
			"t_fraxinus2w.p3d",
			"t_betula2w.p3d",
			"t_betula2s.p3d",
			"t_betula2f.p3d",
			"t_fagus2f.p3d",
			"t_fagus2w.p3d",
			"t_fagus2s.p3d",
			"t_ficusb2s_ep1.p3d",
			"t_quercus2f.p3d",
			"t_quercus3f.p3d",
			"t_picea1s.p3d",
			"t_picea2s.p3d",
			"t_picea3f.p3d",
			"t_pinusn1s.p3d",
			"t_pinusn2s.p3d",
			"t_alnus2s.p3d",
			"t_salix2s.p3d",
			"t_malus1s.p3d",
			"t_juniperusc2s_ep1.p3d",
			"dd_borovice.p3d",
			"strlipa.p3d",
			//Bushes on CHR
			"b_betula2w_summer.p3d",
			"b_salix2s.p3d",
			"b_craet1.p3d",
			"b_hrusen2.p3d",
			"b_corylus.p3d",
			"b_corylus2s.p3d",
			"b_sambucus.p3d",
			"krovi_long.p3d"
		};
		items[] = {
          		"Exile_Item_WoodSticks",
          		"Exile_Item_Leaves"
		};
	};
	// Disabled because if not setup correctly, will break game balance.
	// Server owners think before enabling.
	class Concrete: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "CraftingClass";
		chance = 5;
		searchtime = 5;
		maxitems = 1;
		icon = "Default";
		text = "Get Concrete";
		models[] = {
			"misc_concrete_high.p3d"
		};
		recipes[] =	{
			"ScavengeDestroyConcrete"
		};
		class conditions {
			weapons[] =	{
				"Exile_Melee_SledgeHammer"
			};
		};
	};
	// Disabled because if not setup correctly, will break game balance.
	// Server owners think before enabling.
	class WoodPlanks: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "CraftingClass";
		chance = 20;
		searchtime = 5;
		maxitems = 2;
		icon = "Default";
		text = "Get WoodPlanks";
		models[] = {
			"woodenplanks_01_messy_pine_f.p3d",
			"ind_boardspack1.p3d"
		};
		recipes[] =	{
			"ScavengeWoodplanks"
		};
		class conditions {
			tools[] =	{
				"Exile_Item_Handsaw"
			};
		};
	};
	// Disabled because if not setup correctly, will break game balance.
	// Server owners think before enabling.
	class MetalPoles: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "CraftingClass";
		chance = 5;
		searchtime = 5;
		maxitems = 1;
		icon = "Default";
		text = "Get MetalPoles";
		models[] = {
			"misc_g_pipes.p3d"
		};
		recipes[] =	{
			"ScavengeMetalPoles"
		};
		class conditions {
			tools[] =	{
				"Exile_Item_Grinder"
			};
		};
	};
	// Extended_Items_Exile
	// https://steamcommunity.com/sharedfiles/filedetails/?id=897168981
	class Pumpkins: Exile_ScavengeClass
	{
		animations[] = {
			"AinvPknlMstpSnonWnonDnon_medic_1"
    		};
    		type = "CraftingClass";
   		chance = 50;
    		searchtime = 5;
    		maxitems = 1;
    		icon = "Exile_HA_Icon_Pumpkin";
    		text = "Harvest Pumpkin";
    		models[] = {
       			"bodlak_group.p3d"
    		};
    		recipes[] = {
        		"ScavengePumpkins"
    		};
		class conditions {
			weapons[] =  {
				"Exile_Melee_Shovel"
			};
		};
	};
	// Extended_Items_Exile
	// https://steamcommunity.com/sharedfiles/filedetails/?id=897168981
	class Cinderblocks: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "CraftingClass";
		chance = 50;
		searchtime = 5;
		maxitems = 2;
		icon = "Default";
		text = "Get Cinderblocks";
		models[] = {
			"cinderblocks_f.p3d",
			"cinderblocks_01_f.p3d"
		};
		recipes[] =	{
			"ScavengeDestroyCinderblock"
		};
		class conditions {
			weapons[] =	{
				"Exile_Melee_SledgeHammer"
			};
		};
	};
	// LordRampantHumps Items Pack
	// https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
	class Apples: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "ScavengeClass";
		chance = 50;
		searchtime = 5;
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
	// LordRampantHumps Items Pack
	// https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
	class Fruits: Exile_ScavengeClass
	{
		animations[] =	{
			"AinvPknlMstpSnonWnonDnon_medic_1"
		};
		type = "ScavengeClass";
		chance = 50;
		searchtime = 5;
		maxitems = 2;
		icon = "Exile_HA_Icon_Fruit";
		text = "Scavenge for Fruit";
		models[] =	{
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
		items[] = {
			"items_pack_pear",
			"items_pack_banana"
		};
	};
	*/
};
