class CfgPatches
{
	class exile_expansion_scavenge
	{
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"exile_client",
			"exile_assets",
			"exile_server_config"
		};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};
class CfgFunctions
{
	class ExileExpansionScavenge
	{
		class Bootstrap
		{
			file="exile_expansion_scavenge\bootstrap";
			class preInit
			{
				preInit=1;
			};
			class postInit
			{
				postInit=1;
			};
		};
	};
};
