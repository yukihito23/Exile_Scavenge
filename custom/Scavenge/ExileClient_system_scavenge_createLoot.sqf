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
private _currentObject = cursorObject;
private _animationToPlay = "AinvPknlMstpSnonWnonDnon_medic_1";
private _player = player;
private _playerHasLooted = true;

( ["ExileScavengeUI"] call BIS_fnc_rscLayer ) cutRsc [ "ExileScavengeUI", "PLAIN", 1, false ];
								
if (_animationToPlay != "") then 
{
	_startAnimTime = time;
	_player playMove _animationToPlay;
	waitUntil {animationState _player != _animationToPlay};
}
else
{
	_player playAction "Crouch";
};

_searchtime = 6;
_searchradius = 1.5;
_searchPos = getPosATL _player;

_playerInSearchArea = [_player, _searchPos, _searchradius] spawn 
{
	params["_player", "_searchPos", "_searchradius", "_playerHasLooted"]; 
	waitUntil 
	{ 
		_player distanceSqr _searchPos >  ( _searchradius^2 ) 
	}
};

for "_sleep" from _searchtime to 0 step -0.01 do 
{
	_progress = linearConversion [0, _searchtime, _sleep, 0, 1];
	(uiNamespace getVariable "ExileScavengeUI" displayCtrl 2000);
	(uiNamespace getVariable "ExileScavengeUI" displayCtrl 2001) ctrlSetTextColor [1, 0.706, 0.094, _sleep % 1];
	(uiNamespace getVariable "ExileScavengeUI" displayCtrl 2002) progressSetPosition _progress;
	sleep 0.01;
	if (scriptDone _playerInSearchArea) exitWith 
	{
		_playerHasLooted = true;
	};
};

(["ExileScavengeUI"] call BIS_fnc_rscLayer) cutRsc ["Default", "PLAIN", 1, false];
if (scriptDone _playerInSearchArea) then 
{
	["ErrorTitleOnly", ["Scavange interrupted!"]] call ExileClient_gui_toaster_addTemplateToast;
	_playerHasLooted = false;
	player setVariable ["CanScavange",true];
};
terminate _playerInSearchArea;

if ( _playerHasLooted ) then 
{
	if (random 100 > _chance) then 
	{
		_objectsList pushBack _currentObject;
		player setVariable ["ScavangedObjects", _objectsList];
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
		player setVariable ["CanScavange",true];
	} 
	else 
	{
		_objectsList pushBack _currentObject;
		player setVariable ["ScavangedObjects", _objectsList];
		["ErrorTitleOnly", ["Could not find anything."]] call ExileClient_gui_toaster_addTemplateToast;
		player setVariable ["CanScavange",true];
	};
};

if !(isNull _clutter) then 
{
	waitUntil {uiSleep 1;player distance2D _clutter > 50};
	deleteVehicle _clutter;
};