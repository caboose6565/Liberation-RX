params ["_target", "_caller", "_actionId", "_killer_uid"];

private _killer = _killer_uid call BIS_fnc_getUnitByUID;
private _killer_name = name _killer;
if (_killer_name == "") then { _killer_name = _killer_uid };

private _msg = format ["<t align='center'>" + localize "STR_TK_ASK1" + "</t>", _killer_name];
private _result = [_msg, localize "STR_TK_COUNT", localize "STR_TK_PUNISH", localize "STR_TK_FORGIVE"] call BIS_fnc_guiMessage;
private _kill = 0;
if (_result) then {
	_kill = BTC_logic getVariable [_killer_uid, 0];
	BTC_logic setVariable [_killer_uid, (_kill + 1), true];
	_msg = format [localize "STR_TK_MSG1", name _target, _killer_name];
	[_killer, _target] remoteExec ["LRX_tk_actions", 0];
} else {
	_msg = format [localize "STR_TK_MSG2", name _target, _killer_name];
};

[gamelogic, _msg] remoteExec ["globalChat", 0];
player removeAction _actionId;
LRX_tk_player_action = LRX_tk_player_action - 1;
hintSilent "";