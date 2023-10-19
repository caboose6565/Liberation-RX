params [ "_targetsector" ];

if ( GRLIB_endgame == 1 || GRLIB_global_stop == 1 || combat_readiness < 35 || GRLIB_csat_aggressivity < 1 || diag_fps < 30) exitWith {};

diag_log format ["Spawn Reinforcement on Sector %1 at %2", _targetsector, time];
//sleep (60 + floor(random 60));

private _targetsector_pos = markerPos _targetsector;
private _active_players = count ([_targetsector_pos, GRLIB_spawn_max] call F_getNearbyPlayers);
if (_active_players == 0) exitWith {};

if ( _targetsector in active_sectors ) then {
	// before attack
	private _nearestower = [_targetsector_pos, GRLIB_side_enemy] call F_getNearestTower;
	if ( _nearestower != "" ) then {
		diag_log format ["Spawn Patrol on Sector %1 at %2", _targetsector, time];
		[_targetsector, 1] spawn patrol_manager;
		stats_reinforcements_called = stats_reinforcements_called + 1;		
		sleep 60;
	
		if (_targetsector in sectors_bigtown) then {
			diag_log format ["Spawn Armored on Sector %1 at %2", _targetsector, time];
			[_targetsector, 2] spawn patrol_manager;
			sleep 60;
		};

		if ( _targetsector in (sectors_tower + sectors_military)) then {
			[_targetsector, 2] spawn static_manager;
			sleep 60;
		};
	};

	if ( combat_readiness >= 80 && _active_players > 1 ) then {
		diag_log format ["Spawn Paratroopers on Sector %1 at %2", _targetsector, time];
		["lib_reinforcements", [markertext _targetsector]] remoteExec ["bis_fnc_shownotification", 0];
		[ _targetsector_pos ] spawn send_paratroopers;
		stats_reinforcements_called = stats_reinforcements_called + 1;
		sleep 60;
	};

	if ( combat_readiness >= 70 && air_weight >= 60 ) then {
		[_targetsector_pos, GRLIB_side_enemy, 4] spawn spawn_air;
		sleep 60;
	};
} else {
	// after attack
	private _sector1 = "";
	private _sector2 = "";

	if ( combat_readiness > 45 ) then {
		_sector1 = [GRLIB_spawn_max, _targetsector_pos, (opfor_sectors - active_sectors)] call F_getNearestSector;
		if (_sector1 != "") then {
			diag_log format ["Spawn Defense on Sector %1 at %2", _sector1, time];
			[_sector1, 1] spawn patrol_manager;
			stats_reinforcements_called = stats_reinforcements_called + 1;
			sleep 60;
		};
	};

	if ( combat_readiness > 80 ) then {
		_sector2 = [GRLIB_spawn_max, _targetsector_pos, (opfor_sectors - active_sectors - [_sector1])] call F_getNearestSector;
		if (_sector2 != "" && _active_players > 1) then {
			diag_log format ["Spawn Defense on Sector %1 at %2", _sector2, time];
			if ( _sector2 in (sectors_tower + sectors_military)) then {
				[_sector2, 2] spawn static_manager;
			} else {
				[_sector2, 2] spawn patrol_manager;
			};
			stats_reinforcements_called = stats_reinforcements_called + 1;
			sleep 60;
		};
	};
};

publicVariable "stats_reinforcements_called";
