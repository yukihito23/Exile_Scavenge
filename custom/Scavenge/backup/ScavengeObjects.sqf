params [
  ["_configName", "", [""]]
];

if (_configName isEqualTo "") exitWith {};
if (ExileClientPlayerIsInCombat) exitWith {["ErrorTitleOnly", ["Its not safe to scavenge."]] call ExileClient_gui_toaster_addTemplateToast;};
if (player call ExileClient_util_world_isInTraderZone) exitWith {["ErrorTitleOnly", ["You cannot scavenge inside a trader."]] call ExileClient_gui_toaster_addTemplateToast;};
if !(player getVariable "CanScavenge") exitWith {["ErrorTitleOnly", ["You cannot search just yet."]] call ExileClient_gui_toaster_addTemplateToast;};
if !(alive player) exitWith {};

private _currentObject = cursorObject;
private _objectsList = player getVariable ["ScavangedObjects",[]];
private _posPlayer = getPosATL player;

if (_currentObject in _objectsList) exitWith {};

private _config = missionConfigFile >> "CfgExileScavange" >> _configName;

if !(isClass _config) exitWith {};

private _playerScavengedObjects = [];
private _lootHolder = objNull;
private _clutter = objNull;

player setVariable ["CanScavenge",false];

private _loot = getArray (_config >> "items");
private _chance = getNumber (_config >> "chance");
private _maxloot = getNumber (_config >> "maxitems");

_playerScavengedObjects pushBack _objectsList;
_playerScavengedObjects pushBack _currentObject;
player setVariable ["ScavangedObjects", _playerScavengedObjects];

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 6;

if (random 100 > _chance) then {
    _clutter = createVehicle ["Land_ClutterCutter_medium_F", [0,0,0], [], 0, "CAN_COLLIDE"];
    _clutter setPosATL _posPlayer;
    _lootHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "CAN_COLLIDE"];
    _lootHolder setPosATL _posPlayer;
    ["SuccessTitleOnly", ["You've found something!"]] call ExileClient_gui_toaster_addTemplateToast;

    for "_i" from 0 to floor(random _maxloot) do {
      _lootHolder addItemCargoGlobal [(selectRandom _loot), 1];
    };

    uiSleep 3;
    player setVariable ["CanScavenge",true];
} else {
    ["ErrorTitleOnly", ["Could not find anything."]] call ExileClient_gui_toaster_addTemplateToast;
    player setVariable ["CanScavenge",true];
};

if !(isNull _clutter) then {
  waitUntil {uiSleep 1;player distance2D _clutter > 50};
  deleteVehicle _clutter;
};
