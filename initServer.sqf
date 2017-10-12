/*
    File: initServer.sqf
    Author: Salutesh
    
    Description:
	Main mission Server initialzation file.
    
*/

private ["_time"];
_time = 3600;
_cleanup = 
{
	{
		_position = position _x; 
		if ((typeOf _x) in ["GroundWeaponHolder"]) then 
		{
			if([_position, 100] call ExileClient_util_world_isAlivePlayerInRange) exitwith {};
			deleteVehicle _x;
		};
	} forEach vehicles;
};

[_time, _cleanup, [], true] call ExileServer_system_thread_addTask;