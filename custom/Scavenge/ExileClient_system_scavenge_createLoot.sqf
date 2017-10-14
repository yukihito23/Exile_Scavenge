/**
 * ExileClient_system_scavenge_createLoot
 *
 */
params [
  ["_configName", "", [""]]
];

private _clutter = objNull;
player setVariable ["CanScavange",false];
private _configReference = missionConfigFile >> "CfgExileScavange";
private _loot = getArray (_configReference >>_configName >> "items");
private _chance = getNumber (_configReference >> _configName >> "chance");
private _maxloot = getNumber (_configReference >> _configName >> "maxitems");

_objectsList pushBack _currentObject;
player setVariable ["ScavangedObjects", _objectsList];

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 6;

if (random 100 > _chance) then 
{
	private _posPlayer = getPosATL player;
	_clutter = createVehicle ["Land_ClutterCutter_medium_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_clutter setPosATL _posPlayer;
	private _lootHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "CAN_COLLIDE"];
	_lootHolder setPosATL _posPlayer;
	["SuccessTitleOnly", ["You've found something!"]] call ExileClient_gui_toaster_addTemplateToast;

	for "_i" from 0 to floor(random _maxloot) do 
	{
		_lootHolder addItemCargoGlobal [(selectRandom _loot), 1];
	};

	uiSleep 3;
	player setVariable ["CanScavange",true];
} 
else 
{
	["ErrorTitleOnly", ["Could not find anything."]] call ExileClient_gui_toaster_addTemplateToast;
	player setVariable ["CanScavange",true];
};

if !(isNull _clutter) then 
{
	waitUntil {uiSleep 1;player distance2D _clutter > 50};
	deleteVehicle _clutter;
};
true