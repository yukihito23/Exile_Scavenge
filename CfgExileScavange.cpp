/**
 * CfgExileScavange
 *
 * Author: Steve aka Slautesh
 */

class CfgExileScavange
{
	// LordRampantHumps Items Pack 
	// https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
	class Apples
	{
		chance = 50;
		maxitems = 5;
		
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
	
	class Fruit
	{
		chance = 50;
		maxitems = 5;
		
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
	
	class Wrecks
	{
		chance = 50;
		maxitems = 5;
		
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
			// Cups & Arma
			"datsun01t.p3d",
			"datsun02t.p3d",
			"bmp2_wrecked.p3d",
			"wreck_heli_attack_02_f.p3d",
			"wreck_heli_attack_01_f.p3d",
			// Some Redux (Dont Seem to work)
			"chz_kamaz_korpus2.p3d",
			"chz_avtobus2.p3d",
			"chz_kamaz_fura.p3d",
			"chz_kamaz_pricep.p3d"
		};
		
		items[] =
		{
			// Rifles
			"CUP_arifle_AK74",
			"CUP_arifle_AK107",
			"CUP_arifle_AKS74",
			"CUP_arifle_AKS74U",
			"CUP_arifle_AKM",
			"CUP_arifle_AKS",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_muzzle_PBS4",
			"CUP_optic_PSO_1",
			"CUP_optic_Kobra",
			// Smgs
			"CUP_smg_bizon",
			"CUP_smg_EVO",
			"CUP_smg_MP5SD6",
			"CUP_smg_MP5A5",
			"CUP_30Rnd_9x19_EVO",
			"CUP_30Rnd_9x19_UZI",
			"CUP_30Rnd_9x19_MP5",
			"CUP_muzzle_Bizon",	
			// Pistols	
			"CUP_hgun_Colt1911",
			"CUP_hgun_Compact",
			"CUP_hgun_glock17_flashlight_snds",
			"CUP_hgun_M9",
			"CUP_hgun_Makarov",
			"CUP_hgun_PB6P9",
			"CUP_hgun_MicroUzi",
			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_MakarovSD_M",
			"CUP_15Rnd_9x19_M9",
			"CUP_18Rnd_9x19_Phantom",
			"CUP_6Rnd_45ACP_M",
			"CUP_17Rnd_9x19_glock17",
			"CUP_7Rnd_45ACP_1911",
			"CUP_muzzle_snds_M9",
			"CUP_muzzle_snds_MicroUzi",
			// Extras
			"Exile_Item_InstaDoc",
			"Exile_Item_Bandage",
			"Exile_Item_DuctTape",
			"Exile_Item_ExtensionCord"
			/*	addItemCargoGlobal only works with items, weapons and magazines.*/
		};
	};
	
	class Waters
	{
		chance = 70;
		maxitems = 1;
		
		models[] =
		{
			"pumpa.p3d",
			"misc_well.p3d",
			"misc_wellpump.p3d",
			"watertank_f.p3d",
			"toilet_b_02.p3d"
		};
		
		items[] =
		{
			"Exile_Item_PlasticBottleDirtyWater"
		};
	};
	
	class Woodlogs
	{
		chance = 50;
		maxitems = 3;
		
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
	class Pumpkins
	{
		chance = 50;
		maxitems = 1;
		
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