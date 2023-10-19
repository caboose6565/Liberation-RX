params [ "_sector", "_radius", "_number" ];

if (_number == 0) exitWith {};
if (_number >= 1) then {
	sleep 2;	
	[ _sector, _radius, _number - 1 ] spawn ied_trap_manager;
};

private _activation_radius = 3;
private _infantry_trigger = 1;
private _hostilecount = 0;

private _ied_type = selectRandom GRLIB_ide_traps;
private _ied_power = selectRandom [
	"GrenadeHand",
	"mini_Grenade",
	"M_AT",
	"R_PG7_F",
	"R_PG32V_F",
	"R_MRAAWS_HE_F",
	"GrenadeHand",
	"mini_Grenade"
	//"Rocket_04_HE_F"
];

private _sector_pos = markerPos _sector;
private _ide_pos = ([_sector_pos, floor(random _radius), random(360)] call BIS_fnc_relPos) findEmptyPosition [0,20,"B_Quadbike_01_F"];
private _goes_boom = false;
private _false_trap = false;

if ( count _ide_pos > 0 ) then {
	private _ied_obj = createVehicle [_ied_type, _ide_pos, [], 3, "None"];
	_ied_obj allowDamage false;
	_ied_obj setVariable ["GRLIB_intel_search", true, true];
	_ied_obj setPos (getPos _ied_obj);
	_ied_obj enableSimulationGlobal false;

	if ((random 100) <= 50) then { _false_trap = true };

	private _timeout = time + (60 * 60);
	while {alive _ied_obj && time < _timeout && !_goes_boom } do {
		sleep 1;
		if (!_false_trap) then {
			_hostilecount = { _x distance2D _ied_obj < _activation_radius } count (allPlayers);
			if (_hostilecount >= _infantry_trigger) then {
				[_ied_obj] spawn {
					params ["_obj"];
					for "_i" from 1 to 5 do {
						playSound3D ["A3\Missions_F_Oldman\Data\sound\beep.ogg", _obj, false, ATLToASL (getPosATL _obj), 4, 1, 100];
						sleep 0.5;
					};
				};
				sleep 3;
				_round = _ied_power createVehicle (getPosATL _ied_obj);
				[_round, -90, 0] call BIS_fnc_setPitchBank;
				_round setVelocity [0,0,-100];
				stats_ieds_detonated = stats_ieds_detonated + 1; publicVariable "stats_ieds_detonated";
				_goes_boom = true;
			};
		};
	};
	deleteVehicle _ied_obj;
};
