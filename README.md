![ArmA 1.74](https://img.shields.io/badge/Arma-1.74-blue.svg) ![Exile 1.0.3](https://img.shields.io/badge/Exile-1.0.3-C72651.svg) ![Exile Scavange 0.7](https://img.shields.io/badge/Exile%20Scavange-0.7%20Beta-orange.svg) ![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)

# General Information:
Please note that this is a project in its development stage and there might be some bugs.
Feel free to give feedback and suggestions to this work.

# Information:
Basicly this system will allow players to interact with terrain/map objects.<br />
If the object has a entry in a scavenge class within the configurations the player can loot this object<br />
and has a chance to get a item from that depending on the class.<br />

> ### So far the player can:
>
> - Scavenge through trash-bins/piles. (enabled by default)
> - Scavenge through wrecks. (enabled by default)
> - Scavenge through abandoned tents. (maybe only used in CHR, disabled by default)
> - Scavenge through furniture inside houses. (enabled by default)
> - Get water from different sources if  player has empty bottle/container to fill. (enabled by default)
> - Get fuel from different sources if player has empty fuel canister to fill. (enabled by default)
> - Get log from stocks of wood (enabled by default)
> - Get leaves and sticks from bushes and lower height trees (still WIP, disabled by default)
> - Get cement from concrete slabs (disabled by default, use with care as game balance breaking if set incorrectly)
> - Get wood planks from wood plank objects (disabled by default, use with care as game balance breaking if set incorrectly)
> - Get Metal Poles from metal pole objects (disabled by default, use with care as game balance breaking if set incorrectly)
> - Get Cinderblocks from Cinder Block pack objects if sledgehammer equipped (disabled by default, Requires Exile Extended Items Mod).
> - Get pumpkins from pumpkin patch if shovel equiped (disabled by default, Requires Exile Extended Items Mod).
> - Pickup apples from apple trees (disabled by default, Requires LordRampantHumps Items Pack Mod).
> - Pickup fruit from various trees and bushes (disabled by default, Requires LordRampantHumps Items Pack Mod).

This framework is simply customizable and you can add new interaction classes easily just by adding the required information to the configfiles.

> ### CfgExileHoldActions.hpp
>
> This file contains the information for each holdaction icon.
> If you want to create your own icon you can add a new class to this file
> and add the required information to get your icon working with the scavange system.
> You can find more information and examples in the file.

> ### CfgExileScavenge.hpp
>
> This file contains the information for each scavange class.
> If you want to create your own interaction to terrain/map objects you can do that by
> adding a new class for your interaction and fill it with the required information.
> You can find more information and examples in the file.

> ### CfgScavengeRecipes.hpp
>
> This file comes in action if you create a crafting scavange class that will require a item/weapon/tool
> to get a item back from the source.
> Take a look at the Waters and Cinderblocks classes within CfgExileScavenge.hpp to get a example for creating such a class.
> In short words this file contains crafting recipes that will be used for crafting scavange classes.
> You can find more information and examples in the file.

## Requirements:
Exile Mod 1.0.3: http://www.exilemod.com/downloads/
Base Exile Mod.

## Optionals:
LordRampantHumps Items Pack : https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693
New Exile cusumables.

Exile Extended Items: https://steamcommunity.com/sharedfiles/filedetails/?id=897168981
New Exile Items.

Uncomment the classes on the end of the CfgExileScavenge.hpp files to get some actions that use these mod items if you use these Mods!


> ## Installation:
>
> 1.	Drop the bootstrap, core, holdactions, dialogs and Exile_Client_Overrides folders + the >  CfgFunctions.hpp, CfgExileScavange.hpp, CfgScavengeRecipes.hpp, CfgExileHoldActions.hpp files into the root of your mission directory.
> 2.	Merge the content of the provided description.ext with your Exile missions description.ext.
>
> So it looks like this for example:
>
>	  // Add this on the end of your missions description.ext
>	  #include "CfgFunctions.hpp"
>	  #include "CfgRemoteExec.hpp"
>	  #include "CfgScavengeRecipes.hpp"
>	  #include "CfgExileScavenge.hpp"
>	  #include "CfgExileHoldActions.hpp"
>
>	  // Just add this if you dont have already a RscTitles class within your mission!
>	  #include "CfgDialogs.hpp"
>
>	  // If you dont have any ExileCustommCode entrys yet
>	  #include "CfgExileCustomCode.hpp"
>
>
> 3.   Merge the content of the provided CfgDialogs.hpp with your missions RscTitles class.
>
> So it looks like this for example:
>
>	  class RscTitles
>	  {
>	       class Default
>	       {
>	           idd = -1;
>	           fadein = 0;
>	           fadeout = 0;
>	           duration = 0;
>	       };
>	       // Scavenge system
>	       #include "dialogs\ExileScavengeUI.hpp"
>	   };
>
>      If you dont have any RscTitles class within your mission then just include the provided CfgDialogs.hpp in your missions description.ext.
>
>
> 4.   Merge the content of the provided CfgRemoteExec.hpp with your missions CfgRemoteExec class. Normaly this class is inside your missions description.ext.
>
> So it looks like this for example:
>
>	  class CfgRemoteExec
>	  {
>		class Functions
>		{
>			mode = 2;
>			jip = 0;
>			class fnc_AdminReq 												{ allowedTargets=2; };
>			class ExileServer_system_network_dispatchIncomingMessage 		{ allowedTargets=2; };
>			class ExileExpansionServer_system_scavenge_spawnLoot			{ allowedTargets=0; };
>		};
>		class Commands
>		{
>			mode=0;
>			jip=0;
>		};
>	  };
>
>
> 5.	Open your mission config.cpp find the class CfgExileCustomCode and add this into the class:
>
> So it looks like this for example:
>
>	  ////////////////////////////////////
>	  //	Exile Client Overrides
>	  ///////////////////////////////////
>	  // Custom player client init
>	  ExileClient_object_player_initialize = "Exile_Client_Overrides\ExileClient_object_player_initialize.sqf";
>
>     If you dont have any CfgExileCustomCode entrys yet within your mission then you can also just include the provided CfgExileCustomCode.hpp in your missions description.ext.
>	  Delete the CfgExileCustomCode class in the main exile confip.hpp if you do so then!
>
>
> 6.	Edit the CfgExileScavange.hpp to suit your server.
>
>	  Enjoy :)
>

> ## Thanks and Credits:
> Thanks and Credits:<br />
> Credits to Salutesh for all structure design and creations of the framework and system<br />
> Credits to Larrow for the base script: https://forums.bistudio.com/forums/topic/184456-looting-trash-piles-bins/?do=findComment&comment=2942397<br />
> Credits to Kurewe for the first port and rewrite for the exile mod.<br />
> Credits to oldmatechoc for a base rewrite and port for the exile mod.<br />
> Credits to yukihito23 for plenty amount of help, expansions and additions of the system.<br />
> Credits to NiiRoZz for plenty amount of help, expansions, additions and optimizations of the system.<br />
