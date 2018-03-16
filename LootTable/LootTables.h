/*
	________   _______ _      ______    __  __  ____  _____  
	|  ____\ \ / /_   _| |    |  ____|  |  \/  |/ __ \|  __ \ 
	| |__   \ V /  | | | |    | |__     | \  / | |  | | |  | |
	|  __|   > <   | | | |    |  __|    | |\/| | |  | | |  | |
	| |____ / . \ _| |_| |____| |____   | |  | | |__| | |__| |
	|______/_/ \_\_____|______|______|  |_|  |_|\____/|_____/ 
                                                          
  	^ Leet ASCII art. For documentation, refer to:

  	http://www.exilemod.com/wiki/developer-toolbox/loot-table-compiler/
*/

///////////////////////////////////////////////////////////////////////////////
// Slums/Ghetto, Farms, Village Houses, Castle etc.
// Spawn Guerilla things :)
///////////////////////////////////////////////////////////////////////////////
> CivillianLowerClass
1, Restraints
3, PistolAttachments
3, ShotgunAmmo
3, SMGAmmo
3, SMGAttachments
4, Shotguns
4, SMG
5, CivilianVests
5, PistolAmmo
8, Pistols
10, Chemlights
10, CivilianItems
10, Drinks
10, RoadFlares
11, CivilianBackpacks
20, CivilianClothing
20, CivilianHeadgear
28, Food
30, Trash

///////////////////////////////////////////////////////////////////////////////
// Apartments, Offices etc.
///////////////////////////////////////////////////////////////////////////////
> CivillianUpperClass
1, Restraints
3, PistolAttachments
3, RifleAmmo
3, RifleAttachments
3, Rifles
3, ShotgunAmmo
3, SMGAmmo
3, SMGAttachments
4, Shotguns
4, SMG
5, CivilianVests
5, PistolAmmo
8, Pistols
10, Chemlights
10, CivilianItems
10, Drinks
10, RoadFlares
11, CivilianBackpacks
20, CivilianClothing
20, CivilianHeadgear
28, Food
30, Trash

///////////////////////////////////////////////////////////////////////////////
// Kiosks, Supermarkets etc.
///////////////////////////////////////////////////////////////////////////////
> Shop
1, CivilianClothing
1, CivilianVests
1, PistolAttachments
1, ShotgunAmmo
1, SMGAmmo
1, SMGAttachments
2, PistolAmmo
3, CivilianHeadgear
3, IndustrialItems
3, MedicalItems
3, Restraints
4, Shotguns
4, SmokeGrenades
5, Chemlights
5, CivilianBackpacks
5, RoadFlares
5, SMG
7, CivilianItems
10, Pistols
15, Drinks
15, Food
30, Trash

///////////////////////////////////////////////////////////////////////////////
// Construction Sites, Warehouses, Research etc.
///////////////////////////////////////////////////////////////////////////////
> Industrial
1, Restraints
3, RoadFlares
5, Vehicle
6, Trash
8, IndustrialItems

///////////////////////////////////////////////////////////////////////////////
// Factories
///////////////////////////////////////////////////////////////////////////////
> Factories
1, Electronics
4, Trash
5, IndustrialItems

///////////////////////////////////////////////////////////////////////////////
// Fuel Stations, Garages, Workshops etc.
///////////////////////////////////////////////////////////////////////////////
> VehicleService
1, Restraints
3, RoadFlares
5, IndustrialItems
6, Trash
8, Vehicle

///////////////////////////////////////////////////////////////////////////////
// Towers, Barracks, Hangars etc.
///////////////////////////////////////////////////////////////////////////////
> Military
1, DLCGhillies
1, Ghillies
1, Rebreathers
2, Bipods
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
2, LMGAmmo
2, MedicalItems
2, Restraints
2, SniperAmmo
2, SniperAttachments
3, DLCRifles
3, DLCVests
3, GuerillaHeadgear
3, GuerillaVests
3, HandGrenades
3, HEGrenades
3, MilitaryBackpacks
3, MilitaryHeadgear
3, MilitaryVests
3, RifleAmmo
3, RifleAttachments
3, SmokeGrenades
3, Snipers
3, UGLFlares
3, UGLSmokes
4, CivilianItems
4, GuerillaBackpacks
4, GuerillaItems
4, LMG
5, Explosives
5, GuerillaClothing
5, MilitaryClothing
5, Rifles
100, Trash

///////////////////////////////////////////////////////////////////////////////
// Hospital, Medevac etc. (Does not spawn on Altis!)
///////////////////////////////////////////////////////////////////////////////
> Medical
3, Trash
7, MedicalItems

///////////////////////////////////////////////////////////////////////////////
// Light Houses + Life Guard Towers + Castles
///////////////////////////////////////////////////////////////////////////////
> Tourist
1, DLCAmmo
1, DLCOptics
1, DLCSupressor
1, SniperAmmo
1, SniperAttachments
2, CivilianItems
2, Explosives
2, HandGrenades
2, MedicalItems
2, Restraints
3, DLCGhillies
3, Ghillies
4, MilitaryBackpacks
4, MilitaryHeadgear
8, DLCRifles
8, Snipers

///////////////////////////////////////////////////////////////////////////////
// Ghost Hotel Buildings
///////////////////////////////////////////////////////////////////////////////
> Radiation
1, DLCAmmo
1, DLCOptics
1, DLCSupressor
1, SniperAmmo
1, SniperAttachments
2, EpicWeapons
2, HandGrenades
2, MedicalItems
2, Restraints
3, DLCGhillies
3, Ghillies
5, Explosives
5, MilitaryBackpacks
5, MilitaryHeadgear
5, DLCRifles
5, Snipers

///////////////////////////////////////////////////////////////////////////////
// Furniture Common | Scavenge only! 
///////////////////////////////////////////////////////////////////////////////
> FurnitureCommon
1, Restraints
1, Electronics
3, PistolAttachments
3, RifleAmmo
3, RifleAttachments
3, Rifles
3, ShotgunAmmo
3, SMGAmmo
3, SMGAttachments
4, Shotguns
4, SMG
5, CivilianVests
5, PistolAmmo
8, Pistols
10, Chemlights
10, CivilianItems
10, Drinks
10, RoadFlares
11, CivilianBackpacks
20, CivilianClothing
20, CivilianHeadgear
28, Food
30, Trash

///////////////////////////////////////////////////////////////////////////////
// Furniture Food | Scavenge only! 
///////////////////////////////////////////////////////////////////////////////
> FurnitureFood
30, Food
30, Drinks
50, Trash

///////////////////////////////////////////////////////////////////////////////
// Wrecks | Scavenge only!
///////////////////////////////////////////////////////////////////////////////
> Wrecks
3, PistolAttachments
3, RifleAmmo
3, RifleAttachments
3, Rifles
3, ShotgunAmmo
3, SMGAmmo
3, SMGAttachments
4, Shotguns
4, SMG
5, Electronics
5, CivilianVests
5, PistolAmmo
8, Pistols
10, Chemlights
10, CivilianItems
10, RoadFlares
11, CivilianBackpacks
20, CivilianClothing
20, CivilianHeadgear
30, Trash

///////////////////////////////////////////////////////////////////////////////
// Sacks | Scavenge only!
///////////////////////////////////////////////////////////////////////////////
> Sacks
30, Food
50, Trash

///////////////////////////////////////////////////////////////////////////////
// Crates | Scavenge only!
///////////////////////////////////////////////////////////////////////////////
> Crates
5, CivilianVests
10, Chemlights
10, CivilianItems
10, RoadFlares
11, CivilianBackpacks
20, CivilianClothing
20, CivilianHeadgear
50, Trash