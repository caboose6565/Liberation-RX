params [ "_vehicle" ];

private _grp = GRLIB_side_enemy createVehicleCrew _vehicle;
sleep 0.2;
(crew _vehicle) joinSilent _grp;
{
	_x addEventHandler ["HandleDamage", { _this call damage_manager_enemy }];
	_x addMPEventHandler ["MPKilled", { _this spawn kill_manager }];
	_x setSkill 0.65;
	_x allowFleeing 0;
} foreach (units _grp);

_vehicle allowCrewInImmobile [true, false];
_vehicle setUnloadInCombat [true, false];

_grp setCombatMode "WHITE";
_grp setBehaviour "AWARE";
