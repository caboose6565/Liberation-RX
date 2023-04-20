params ["_unit", "_vehicle"];

private _role = "";
private _conso = 0.003;  // fuel capacity = (((1/_conso) * 5) / 60) in sec

if (_vehicle isKindOf "APC") then { _conso = 0.005 };
if (_vehicle isKindOf "Tank") then { _conso = 0.006 };
if (_vehicle isKindOf "Air") then { _conso = 0.007 };

while {true} do {
    _role = (assignedVehicleRole _unit) select 0;
    if (isNil "_role") exitWith {};
    if (_role != "driver" || isNull objectParent _unit) exitWith {};

    if (speed _vehicle > 1) then {
        _vehicle setFuel ((fuel _vehicle) - _conso) max 0;
    };
    sleep 5;
};
