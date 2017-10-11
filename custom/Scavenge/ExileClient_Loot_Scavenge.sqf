/**
By Kurewe @ CantankerousOldGoats.com
For use with LordRampantHump's "Items Pack for Arma 3"
http://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
Based on Larrow's Epoch looting script
https://forums.bistudio.com/forums/topic/184456-looting-trash-piles-bins/?do=findComment&comment=2942397
Expanded by Old Mte Choc 
*/ 
 
 Loot_wrecks =[
"wreck_brdm2_f.p3d","wreck_van_f.p3d","wreck_truck_dropside_f.p3d","wreck_truck_f.p3d","wreck_car2_f.p3d","wreck_offroad_f.p3d","wreck_car_f.p3d","wreck_bmp2_f.p3d","wreck_truck_f.p3d",
"wreck_car3_f.p3d",	"hiluxt.p3d","hmmwv_wrecked.p3d","wreck_hmmwv_f.p3d","wreck_offroad2_f.p3d","wreck_hunter_f.p3d","uaz_wrecked.p3d","wreck_ural_f.p3d","wreck_uaz_f.p3d",
"wreck_cardismantled_f.p3d","m113t.p3d","uaz_wrecked.p3d","wreck_skodovka_f.p3d","skodovka_wrecked.p3d","lada_wrecked.p3d","ural_wrecked.p3d","brdm2_wrecked.p3d","jeept.p3d",
"datsun01t.p3d","datsun02t.p3d","bmp2_wrecked.p3d","wreck_heli_attack_02_f.p3d","wreck_heli_attack_01_f.p3d",	//	Cups & Arma
"chz_kamaz_korpus2.p3d","chz_avtobus2.p3d","chz_kamaz_fura.p3d","chz_kamaz_pricep.p3d" 		//	Some Redux (Dont Seem to work)
];
Apple_Trees = ["t_malus1s.p3d","jablon.p3d","t_malus1s_summer.p3d"];

Fruit_Trees = [
"b_corylus.p3d","b_canina2s.p3d","b_amygdalusn1s_ep1.p3d","jerabina.p3d","b_elderberry2s_pmc.p3d",		// Random small trees and bushes
"banana_3.p3d","banana_2.p3d","banana_1.p3d","banana_4.p3d",																		// Banana trees
"c_blueberry_summer.p3d","c_blueberry.p3d","b_hrusen2.p3d","t_betula2w.p3d"												// Chernarus Redux

];

player setVariable["canloot",true];
player addAction["Scavenge Wreck","Custom\Scavenge\ScavengeWrecks.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Loot_wrecks && player distance cursorObject < 5"];
player addAction["Scavenge for Apples","Custom\Scavenge\ScavengeApples.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Apple_Trees && player distance cursorObject < 5"];
player addAction["Scavenge for Fruit","Custom\Scavenge\ScavengeFruit.sqf",[],0,false,true,"","getModelInfo cursorObject select 0 in Fruit_Trees && player distance cursorObject < 5"];
 

