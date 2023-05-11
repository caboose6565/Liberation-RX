createDialog "liberation_params";

param_id = -1;
param_value = -1;
save_changes = 0;
fontsize = 0.017 * safezoneH;

disableSerialization;
waitUntil { dialog };

private _lrx_getParamName = {
	params ["_param"];
	private _def = "Unknown!";
	{
		if (_x select 0 == _param) exitWith { _def = _x select 1 };
	} forEach LRX_Mission_Params_Def;
	_def;
};
private _lrx_getParamValues = {
	params ["_param"];
	private _def = ["---"];
	{
		if (_x select 0 == _param) exitWith { _def = _x select 2 };
	} forEach LRX_Mission_Params_Def;
	_def;
};
private _params_save = profileNamespace getVariable format ["%1-config", GRLIB_save_key];
private _params_array = [];
{
	_name = [_x select 0] call _lrx_getParamName;
	_values =  [_x select 0] call _lrx_getParamValues;
	_params_array pushback [ _x select 0, _x select 1, _forEachIndex + 1, _name, _values ];
} foreach _params_save;

private _display = findDisplay 5119;
{
	_nextparam = _x;
	//diag_log _nextparam;
	_idx = _nextparam select 2;

	if ( _idx % 2 == 0 ) then {
		_control = _display ctrlCreate [ "RscBackground", -1, _display displayCtrl 9969 ];
		_control ctrlSetPosition [ 0, (_idx * 0.025) * safezoneH, 0.595 * safeZoneW, 0.025 * safezoneH];
		_control ctrlSetBackgroundColor [0.75,1,0.75,0.12];
		_control ctrlCommit 0;
	};

	_control = _display ctrlCreate [ "RscText", (100 + _idx), _display displayCtrl 9969 ];
	_control ctrlSetPosition [ 0,  (_idx * 0.025) * safezoneH, 0.1 * safeZoneW, 0.025  * safezoneH];
	_control ctrlSetText (_nextparam select 3);
	//_control ctrlSetFontHeight fontsize;
	_control ctrlCommit 0;

	_control = _display ctrlCreate [ "RscCombo", (100 + _idx) , _display displayCtrl 9969 ];
	_control ctrlSetPosition [ ((0.075 * 7) - 0.02) * safeZoneW, ((_idx * 0.025) * safezoneH) + 0.0025, (0.085 * safeZoneW), 0.022  * safezoneH];
	{ _control lbAdd _x } forEach (_nextparam select 4);

	_control lbSetCurSel 0;
	//_control ctrlSetFontHeight fontsize;

	_control ctrlAddEventHandler ["LBSelChanged", {
		params ["_control", "_lbCurSel", "_lbSelection"];
		diag_log str _this;
		param_id = _lbCurSel; 
		param_value = _lbSelection;
	}];
	_control ctrlCommit 0;
} foreach _params_array;

while { dialog && alive player } do {


	if ( save_changes == 1 ) then {
		save_changes = 0;
		diag_log _params_save;
		//profileNamespace setVariable [format ["%1-config", GRLIB_save_key], _params_save];
	};

	sleep 1;
};