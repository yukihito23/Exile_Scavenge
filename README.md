![ArmA 1.74](https://img.shields.io/badge/Arma-1.74-blue.svg) ![Exile 1.0.3](https://img.shields.io/badge/Exile-1.0.3-C72651.svg) ![Exile Scavange 0.01](https://img.shields.io/badge/Exile%20Scavange-0.01%20Alpha-orange.svg) ![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)

# General Information:
Please note that this is project is at its development stage and there might be some bugs.
Feel free to give feedback and suggestions to this work.

# Information:
This will allow players to search wrecks for weapons, ammo, and a few other items. </br>
Allow players to pick fruit from trees and bushes, and pick apples from apple trees.</br>
Not allowed to do these actions while in combat or in a trader.


# Requirements:
Exile Mod 1.0.3: http://www.exilemod.com/downloads/

Base Exile Mod.

LordRampantHumps Items Pack : https://steamcommunity.com/sharedfiles/filedetails/?id=1082756693

New Exile cusumables.

Exile Extended Items: https://steamcommunity.com/sharedfiles/filedetails/?id=897168981

New Exile Items.


> ## Installation:
> 
> 1.	Drop the custom folder the holdactions folder the CfgExileScavange.cpp and CfgExileHoldActions.cpp into the root of your mission directory.
> 2.	Merge the content of the provided description.ext with your Exile missions description.ext.
>
> So it looks like this for example:
>
>	  #include "CfgExileScavange.cpp"
>	  #include "CfgExileHoldActions.cpp"
>
> 3.	Open your mission config.cpp find the class CfgExileCustomCode and add this into the class:
>
> So it looks like this for example:
>
>	  // Scavenge
>     ExileClient_object_player_initialize = "Custom\Scavenge\ExileClient_object_player_initialize.sqf";	
>
>
> 4.	Edit the CfgExileScavange.cpp to suit your server.
>

# Thanks and Credits:
Credits to Kurewe for the orginal script.
http://www.exilemod.com/profile/18022-kurewe/

Credits to Cho for a rewrite and port for the exile mod.
Credits to yukihito23 for additons and expansions of the system.
Credits to Salutesh for additons and expansions of the system.