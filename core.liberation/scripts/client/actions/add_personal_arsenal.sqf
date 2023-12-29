// Add content to the Arsenal box
params ["_vehicle"];
if (isNil "_vehicle") exitWith {};

private _cargo = [_vehicle, true] call F_getCargo;
[_vehicle] call F_clearCargo;
[GRLIB_personal_box, _cargo] call F_setCargo;

GRLIB_personal_arsenal = [GRLIB_personal_box, true] call F_getCargo;
profileNamespace setVariable ["GRLIB_personal_arsenal", GRLIB_personal_arsenal]; 
saveProfileNamespace;

hintSilent format ["Transfer %1 cargo,\nto your Arsenal.", [_vehicle] call F_getLRXName];
