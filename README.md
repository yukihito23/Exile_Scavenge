![ArmA 1.74](https://img.shields.io/badge/Arma-1.74-blue.svg) ![Exile 1.0.3](https://img.shields.io/badge/Exile-1.0.3-C72651.svg) ![Exile Scavange 0.4](https://img.shields.io/badge/Exile%20Scavange-0.4%20Beta-orange.svg) ![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)

# General Information:
Please note that this is a project in its development stage and there might be some bugs.
Feel free to give feedback and suggestions to this work.

# Information:
Basicly this system will allow players to interact with terrain/map objects.</br>
If the object has a entry in a scavenge class within the configurations the player can loot this object</br>
and has a chance to get a item from that depending on the class.</br>

> ### So far the player can:
>
> - Pickup fruits and apples from trees.
> - Search throu wrecks.
> - Get woodstocks from trees.
> - Get water from different sources if he has a empty bottle/container to fill.
> - Search throu trash-bins/piles.
> - Get cinderblogs from different sources if he has a sledge hammer on his body.

This framework is simply customizable and you can add new interaction classes easily just by adding the required information to the configfiles.

> ### CfgExileHoldActions.cpp
> 
> This file contains the information for each holdaction icon.
> If you want to create your own icon you can add a new class to this file
> and add the required information to get your icon working with the scavange system.
> You can find more information and examples in the file.

> ### CfgExileScavenge.cpp
> 
> This file contains the information for each scavange class.
> If you want to create your own interaction to terrain/map objects you can do that by
> adding a new class for your interaction and fill it with the required information.
> You can find more information and examples in the file.

> ### CfgScavengeRecipes.cpp
> 
> This file comes in action if you create a crafting scavange class that will require a item/weapon/tool
> to get a item back from the source.
> Take a look at the Waters and Cinderblogs classes within CfgExileScavenge.cpp to get a example for creating such a class.
> In short words this file contains crafting recipes that will be used for crafting scavange classes.
> You can find more information and examples in the file.

## Requirements:
Exile Mod 1.0.3: http://www.exilemod.com/downloads/

Base Exile Mod.

LordRampantHumps Items Pack : https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693

New Exile cusumables.

Exile Extended Items: https://steamcommunity.com/sharedfiles/filedetails/?id=897168981

New Exile Items.


> ## Installation:
> 
> 1.	Drop the custom, the holdactions and the dialogs folder + the CfgExileScavange.cpp, CfgExileHoldActions.cpp files into the root of your       >       mission directory.
> 2.	Merge the content of the provided description.ext with your Exile missions description.ext.
>
> So it looks like this for example:
>
>	  #include "CfgExileScavange.cpp"
>	  #include "CfgExileHoldActions.cpp"
>
> 3.   Merge the content of the provided CfgDialogs.cpp with your missions RscTitles class.
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
>      If you dont have any RscTitles class within your mission then just include the provided CfgDialogs.cpp in your missions description.ext. 
>
>
> 4.	Open your mission config.cpp find the class CfgExileCustomCode and add this into the class:
>
> So it looks like this for example:
>
>	  // Scavenge
>     ExileClient_object_player_initialize = "Custom\Scavenge\ExileClient_object_player_initialize.sqf";	
>
>
> 5.	Edit the CfgExileScavange.cpp to suit your server.
>

## Thanks and Credits:
Credits to Kurewe for the orginal script.
http://www.exilemod.com/profile/18022-kurewe/

Credits to Cho for a rewrite and port for the exile mod.

Credits to yukihito23 for additons and expansions of the system.

Credits to NiiRoZz for plenty amount of help, expansions and optimizations of the system.

Credits to Salutesh for additons and expansions of the system.