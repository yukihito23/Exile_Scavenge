class ExileScavengeUI
{
	idd = -1;
	duration = 1e10;
	fadein = 0;
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['ExileScavengeUI', _this select 0 ];";
	
	class Controls
	{
		class Background
		{
			type = 0;
			idc = 2000;
			x = safeZoneX + safeZoneW * 0.43652344;
			y = safeZoneY + safeZoneH * 0.22916667;
			w = safeZoneW * 0.13574219;
			h = safeZoneH * 0.05729167;
			style = 0;
			text = "images\respect_ca.paa";
			colorBackground[] = {0.302,0.302,0.302,0.4};
			colorText[] = {0,0,0,0};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Text
		{
			type = 0;
			idc = 2001;
			x = safeZoneX + safeZoneW * 0.44335938;
			y = safeZoneY + safeZoneH * 0.23958334;
			w = safeZoneW * 0.12207032;
			h = safeZoneH * 0.02256945;
			style = 2;
			text = "Search";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,0.706,0.094,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class ProgressBar
		{
			type = 8;
			idc = 2002;
			x = safeZoneX + safeZoneW * 0.44335938;
			y = safeZoneY + safeZoneH * 0.26041667;
			w = safeZoneW * 0.12207032;
			h = safeZoneH * 0.01041667;
			style = 0;
			colorBar[] = {0.78,0.149,0.318,1};
			colorFrame[] = {1,1,1,1};
			texture = "#(argb,8,8,3)color(1,1,1,1)";
		};
	};
};