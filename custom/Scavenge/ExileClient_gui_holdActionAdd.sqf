private _holdAction = objNull;

try
{
	if !(params [["_object", player], ["_label", "Search"], ["_idleIcon", "default"], ["_progressIcon", "default"], ["_conditionShow", "nil"], ["_conditionAction", "nil"], ["_startCode", {}], ["_tickCode", {}], ["_completeCode", {}], ["_interruptCode", {}], ["_arguments",[],[[]]], ["_duration", 0.5], ["_priority", 0], ["_remove", true]]) then
	{
		throw (format ["Invalid parameters: %1", _this]);
	};
	
	_holdActionConfig = missionConfigFile >> "CfgExileHoldActions";
	_idleIconSelection = getText (_holdActionConfig >> _idleIcon >> "icon");
	_progressIconSelection = getText (_holdActionConfig >> _progressIcon >> "icon");
	_holdAction = [_object,	_label,	_idleIconSelection,	_progressIconSelection,	_conditionShow,	_conditionAction, _startCode, _tickCode, _completeCode, _interruptCode,	_arguments,	_duration, _priority, _remove, false] call BIS_fnc_holdActionAdd;
}
catch
{
	diag_log format ["Exile ERROR :: Calling ExileClient_gui_holdActionAdd with %1!", _exception];
};

_holdAction