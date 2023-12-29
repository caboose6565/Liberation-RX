params ["_unit", ["_side", west]];

if (isNull _unit) exitWith {};
if (_unit getVariable ["GRLIB_mission_AI", false]) exitWith {};
if (_unit getVariable ["GRLIB_is_prisoner", false]) exitWith {};

sleep 3;
if (!alive _unit) exitWith {};

private _cloth = getText(configfile >> "CfgVehicles" >> selectRandom civilians >> "uniformClass");
private _targets = [];
private _target = objNull;

private _grp = createGroup [GRLIB_side_civilian, true];
[_unit] joinSilent _grp;
[_grp] call F_deleteWaypoints;
_unit setVariable ["GRLIB_is_kamikaze", true, true];

// Init bomber
removeAllWeapons _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeVest _unit;
removeGoggles _unit;
{ _unit unlinkItem _x } forEach (assignedItems _unit);

_unit forceAddUniform _cloth;
_unit setHitPointDamage ["hitLegs", 0];
{_unit disableAI _x} count ["TARGET","AUTOTARGET","AUTOCOMBAT","SUPPRESSION"];
if !(_unit getVariable ["GRLIB_in_building", false]) then {
	[_unit] call F_fixPosUnit;
};
_unit setUnitPos "UP";
_unit switchMove "";
sleep 1;

_grp setCombatMode "BLUE";
_grp setBehaviour "SAFE";

private ["_expl1","_expl2","_expl3"];
while {alive _unit} do {
	_targets = [getpos _unit , 150] call F_getNearbyPlayers;
	if (count _targets > 0) then {
		if (count waypoints _grp > 0) then { [_grp] call F_deleteWaypoints };
		_target = _targets select 0;
		_unit doMove (getPos _target);
		_unit setSpeedMode "FULL";
		if ((speed vehicle _unit) == 0) then { 
			_unit switchMove "AmovPercMwlkSrasWrflDf";
			_unit playMoveNow "AmovPercMwlkSrasWrflDf";
		};

		if (_unit distance2D _target < 20) then {
			_expl1 = "DemoCharge_Remote_Ammo" createVehicle (getPosATL _unit);
			_expl1 attachTo [_unit, [-0.1, 0.1, 0.15], "Pelvis"];
			_expl1 setVectorDirAndUp [[0.5, 0.5, 0], [-0.5, 0.5, 0]];
			_expl2 = "DemoCharge_Remote_Ammo" createVehicle (getPosATL _unit);
			_expl2 attachTo [_unit, [0, 0.15, 0.15], "Pelvis"];
			_expl2 setVectorDirAndUp [[1, 0, 0], [0, 1, 0]];
			_expl3 = "DemoCharge_Remote_Ammo" createVehicle (getPosATL _unit);
			_expl3 attachTo [_unit, [0.1, 0.1, 0.15], "Pelvis"];
			_expl3 setVectorDirAndUp [[0.5, -0.5, 0], [0.5, 0.5, 0]];

			sleep 2.5;
			playSound3D [getMissionPath "res\shout.ogg", _unit, false, getPosASL _unit, 5, 1, 500];
			sleep 0.5;
			if (alive _unit) then {
				{ 
					_x setDamage 1;
					"R_PG32V_F" createVehicle (getPos _unit);
					deleteVehicle _x;
				} forEach [_expl1,_expl2,_expl3];
				deleteVehicle _unit;
			};
		};
		sleep 2;
	} else {
		if (count waypoints _grp == 0) then {
			_unit setSpeedMode "NORMAL";
			[_grp, getPos _unit, 100] call BIS_fnc_taskPatrol;
		};
	};
	sleep 2;
};
