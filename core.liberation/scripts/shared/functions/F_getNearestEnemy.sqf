params ["_unit"];

private _vehicle = objectParent _unit;
private _vehicle_class = typeOf _vehicle;

if (_unit getVariable ["last_engage_time", 0] > time) exitWith {};
if (isNull _vehicle) exitWith {};

// Default for HMG, GMG
private _kind = ["CAManBase"];
private _dist = 1000;

// Default for AA, AC
if (_vehicle_class isKindOf "AT_01_base_F") then {_dist = 1500; _kind = ["Car", "Wheeled_APC_F", "Tank"]};
if (_vehicle_class isKindOf "AA_01_base_F") then {_dist = 2000; _kind = ["Air"]};

// Default Mortar
if (_vehicle_class isKindOf "StaticMortar") then {_dist = 1800; _kind = ["CAManBase", "Car"]};

private _scan_target = [ ((getPosATL _vehicle) nearEntities [ _kind, _dist]), {
    alive _x &&
    side group _x == GRLIB_side_friendly &&
    !(_x getVariable ['R3F_LOG_disabled', false])
} ] call BIS_fnc_conditionalSelect;

if (count (_scan_target) > 0) then {
    // closest first
    private _target_list = _scan_target apply {[_x distance2D _vehicle, _x]};
    _target_list sort true;
    private _next_target = _target_list select 0 select 1;

    private _enemy_dir = _vehicle getDir _next_target;
    private _rel_diff = abs (_enemy_dir - (getDir _vehicle));
    if (_rel_diff > 30) then {
        _vehicle setDir _enemy_dir;
    };

    _unit doWatch _next_target;
    _unit doTarget _next_target;
    if (_vehicle_class isKindOf "StaticMortar") then {
        _vehicle fireAtTarget [_next_target, currentWeapon _vehicle];
        sleep 5;
        _vehicle fireAtTarget [_next_target, currentWeapon _vehicle];
    };
    _unit setVariable ["last_engage_time", round (time + (3 * 60))];
} else {
    _unit doTarget objNull;
    _unit doWatch objNull;
};
