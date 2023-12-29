private  ["_vehicle", "_distvehclose"];
waitUntil {sleep 1; !isNil "build_confirmed" };
waituntil {sleep 1; GRLIB_player_spawned; (player getVariable ["GRLIB_score_set", 0] == 1)};

while { true } do {
	private _nearfob = [player, "FOB", GRLIB_fob_range] call F_check_near;
	if (_nearfob) then {
		private _nearrecycl = [nearestObjects [player, GRLIB_recycleable_classnames + GRLIB_vehicle_whitelist, 30], {
			(_x distance2D lhd > GRLIB_fob_range) &&
			([player, _x] call is_owner) &&
			isNil {_x getVariable "GRLIB_recycle_action"}
		}] call BIS_fnc_conditionalSelect;

		{
			_vehicle = _x;
			_distvehclose = 5;
			if (typeOf _vehicle in vehicle_big_units) then {
				_distvehclose = _distvehclose * 3;
			};
			_vehicle addAction ["<t color='#FFFF00'>" + localize "STR_RECYCLE_MANAGER" + "</t> <img size='1' image='res\ui_recycle.paa'/>","scripts\client\actions\do_recycle.sqf","",-505,false,true,"","[] call is_menuok && [_target] call is_recyclable",_distvehclose];
			_vehicle setVariable ["GRLIB_recycle_action", true];
		} forEach _nearrecycl;
	};
	sleep 5;
};
