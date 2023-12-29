waitUntil { sleep 1; !isNil "blufor_sectors" };
private [
	"_unitList", "_my_squad", "_static_ai",
	"_near_arsenal", "_primary_weapon", "_needammo1", "_needammo2", "_maxpri", "_minpri",
	"_near_medic", "_needmedic",
	"_near_repair", "_list_vehicles", "_vehicle_need_repair", "_vehicle_hitpoints", "_vehicle_damage"
];

private _distarsenal = 30;           // minimal distance from source (ammo/repair)
private _maxpri_def = 8;            // maximum magazines unit can take (primary weapon)
private _minpri_def = 3;             // minimal magazines before unit need to reload
private _maxsec_def = 3;             // maximum magazines unit can take (secondary weapon)
private _minsec_def = 1;             // minimal magazines before unit need to reload
private _added_pri = 0;
private _added_sec = 0;

private _artillery = [
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F"
];

private _vehicle_enabled = true;
if (GRLIB_ACE_enabled) then { _vehicle_enabled = false };

while { true } do {
	waitUntil {sleep 1; GRLIB_player_spawned};
	waitUntil {sleep 1; (player getVariable ["GRLIB_squad_context_loaded", false])};

	if (count(units group player) >= 1) then {
		_needammo1 = false;
		_needammo2 = false;
		_needmedic = false;
		_unitList = units group player;
		_my_squad = player getVariable ["my_squad", nil];
		if (!isNil "_my_squad") then { { _unitList pushBack _x } forEach units _my_squad };
		{_unitList append units _x} foreach hcAllGroups player;
		_static_ai =  [vehicles, {
			typeOf _x in static_vehicles_AI &&
			_x getVariable ["GRLIB_vehicle_owner", ""] == PAR_Grp_ID
		}] call BIS_fnc_conditionalSelect;
		{_unitList append crew _x} foreach _static_ai;

		{
			// Out vehicle
			if ( isNull objectParent _x && _x != player && lifeState _x != 'INCAPACITATED' ) then {
				_needammo1 = false;
				_needammo2 = false;
				_needmedic = false;
				_near_arsenal = [_x, "REAMMO_AI", _distarsenal] call F_check_near;
				_primary_weapon = primaryWeapon _x;
				if (_near_arsenal && _primary_weapon != "")  then {
					_maxpri = _maxpri_def;
					_minpri = _minpri_def;

					// check secondary Weapon if backpack present
					if (!isNull (unitBackpack _x)) then {
						_needammo2 = [_x, secondaryWeapon _x, _minsec_def] call F_UnitNeedAmmo;
						if (_needammo2) then {
							//clearAllItemsFromBackpack _x;
							_x groupchat "Rearming Secondary Weapon.";
							_added_sec = [_x, secondaryWeapon _x, _maxsec_def] call F_UnitAddAmmo;
						};
					};

					// check primary Weapon
					if ( _primary_weapon find "LMG" >= 0 || _primary_weapon find "MMG" >= 0 || _primary_weapon find "RPK12" >= 0 ) then { _minpri = 1; _maxpri = 3 };
					_needammo1 = [_x, _primary_weapon, _minpri] call F_UnitNeedAmmo;
					if (_needammo1) then {
						_x groupchat "Rearming Primary Weapon.";
						_added_pri = [_x, _primary_weapon, _maxpri] call F_UnitAddAmmo;
					};
				};

				// Medic
				_near_medic = [_x, "MEDIC", _distarsenal] call F_check_near;
				if (_near_medic) then {
					if (damage _x > 0.1 && (behaviour _x) != "COMBAT") then {
						_needmedic = true;
						_x groupchat format ["Healing myself."];
					};
				};

				// Animation
				if (_needammo1 || _needammo2 || _needmedic ) then {
					if ((_added_pri + _added_sec) == 0) then {
						_x groupchat "Cannot Rearm! my Inventory is full!";
					} else {
						[_x, _needmedic] spawn {
							params ["_target", "_needmedic"];
							_target setVariable ['PAR_heal', true];
							_target playMove "AinvPknlMstpSlayWrflDnon_medic";
							sleep 6;
							if (_needmedic && lifeState _target != 'INCAPACITATED') then {
								_target setDamage 0;
							};
							sleep 4;
							_target setVariable ['PAR_heal', nil];
						};
					};
				};

			};

			// In vehicle
			if (_vehicle_enabled) then {
				if (!(isNull objectParent _x) && lifeState _x != 'INCAPACITATED' &&
					!((typeOf _x) isKindOf "Steerable_Parachute_F") &&
					(((gunner vehicle _x) == _x) || ((driver vehicle _x) == _x) || ((commander vehicle _x) == _x))
				) then {
					_unit = _x;
					_vehicle = vehicle _unit;
					_vehicle_class = typeOf _vehicle;
					_vehicle_name = [_vehicle_class] call F_getLRXName;

					// REAMMO
					_near_arsenal = [_vehicle, "REAMMO", _distarsenal] call F_check_near;
					_is_enabled = !(_vehicle getVariable ["R3F_LOG_disabled", false]);
					_vehicle_need_ammo = (([_vehicle] call F_getVehicleAmmoDef) <= 0.85);

					if (!isNil "GRLIB_LRX_debug") then {
						diag_log format ["DBG: %1: need Ammo:%2 - near Ammo source:%3", _vehicle_class, _vehicle_need_ammo, _near_arsenal];
					};

					if (_near_arsenal && _is_enabled && _vehicle_need_ammo) then {
						_timer = _vehicle getVariable ["GREUH_rearm_timer", 0];
						if (_timer <= time) then {
							_max_ammo = 3;
							_vehicle setVehicleAmmo 1;
							_is_arty = ([_vehicle_class, _artillery] call F_itemIsInClass);
							_cooldown = 5 * 60;
							if (_is_arty) then { _cooldown = _cooldown * 2 };
							_vehicle setVariable ["GREUH_rearm_timer", round (time + _cooldown)];  // min cooldown
							_screenmsg = format [ "%1\n%2 - %3", _vehicle_name, localize "STR_REARMING", "100%" ];
							titleText [ _screenmsg, "PLAIN DOWN" ];
							hintSilent _screenmsg;
						} else {
							if ( _unit == player || ((uavControl _vehicle select 0) == player) ) then {
								_screenmsg = format [ "%1\nRearming Cooldown (%2 sec), Please Wait...", _vehicle_name, round (_timer - time) ];
								titleText [ _screenmsg, "PLAIN DOWN" ];
							};
						};
					};

					// REPAIR
					_near_repair = [_vehicle, "REPAIR_AI", _distarsenal] call F_check_near;
					_is_enabled = !(_vehicle getVariable ["R3F_LOG_disabled", false]);
					_vehicle_need_repair = false;
					_vehicle_hitpoints = getAllHitPointsDamage _vehicle;
					_vehicle_damage = 0;
					if (count _vehicle_hitpoints == 3) then {
						{ _vehicle_damage = _vehicle_damage + _x } forEach (_vehicle_hitpoints select 2);
					};
					if (_vehicle_damage >= 0.2 || damage _vehicle >= 0.2) then { _vehicle_need_repair = true };
					if (!isNil "GRLIB_LRX_debug") then {
						diag_log format ["DBG: %1: need Repair:%2 - near Repair source:%3", _vehicle_class, _vehicle_need_repair, _near_repair];
					};

					if (_near_repair && _is_enabled && _vehicle_need_repair) then {
						_timer = _vehicle getVariable ["GREUH_repair_timer", 0];
						if (_timer <= time) then {
							_vehicle setDamage 0;
							_vehicle setVariable ["GREUH_repair_timer", round (time + (5*60))];  // min cooldown
							_screenmsg = format [ "%1\n%2 - %3", _vehicle_name, localize "STR_REPAIRING", "100%" ];
							titleText [ _screenmsg, "PLAIN DOWN" ];
							hintSilent _screenmsg;
						} else {
							if ( _unit == player || ((uavControl _vehicle select 0) == player) ) then {
								_screenmsg = format [ "%1\nRepairing Cooldown (%2 sec), Please Wait...", _vehicle_name, round (_timer - time) ];
								titleText [ _screenmsg, "PLAIN DOWN" ];
							};
						};
					};
				};
			};
		} forEach _unitList;
	};

	// Show Hint
	private _neartower = ((sectors_allSectors select {_x select [0,6] == "tower_" && !(_x in blufor_sectors) && player distance2D (markerPos  _x) <= 20})) select 0;
	if (!isNil "_neartower") then {
		_msg = format ["Use <t color='#FF0000'>Explosives</t> to destroy<br/>the <t color='#0000FF'>Radio Tower</t>."];
		[_msg, 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
	};

	sleep 15;
};