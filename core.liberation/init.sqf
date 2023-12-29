diag_log "--- Liberation RX: FPARMA Edition by pSiKO/caboose ---";
[] call compileFinal preprocessFileLineNUmbers "build_info.sqf";
diag_log "--- Init start ---";
if (!isNil "startup") then { deleteVehicle startup }; // remove logic sound
if (!isNil "endgame") then { deleteVehicle endgame }; // remove logic sound

profileNamespace setVariable ["BIS_SupportDevelopment", nil];
enableSaving [false, false];
disableMapIndicators [false,true,false,false];
setGroupIconsVisible [false,false];
disableRemoteSensors true;

abort_loading = false;
abort_loading_msg = "Unkwon Error";
GRLIB_ACE_enabled = false;

[] call compileFinal preprocessFileLineNUmbers "whitelist.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

if (!abort_loading) then {
	[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";
	[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
	if (!GRLIB_ACE_enabled) then {
		[] execVM "R3F_LOG\init.sqf";
	} else {
		[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_ace.sqf";
	};

	if (isServer) then {
		[] execVM "scripts\server\init_server.sqf";
	};

	if (!isDedicated && !hasInterface && isMultiplayer) then {
		[] execVM "scripts\server\offloading\hc_manager.sqf";
	};
} else {
	GRLIB_init_server = false;
	publicVariable "GRLIB_init_server";
	publicVariable "abort_loading";
	publicVariable "abort_loading_msg";
	diag_log "--- LRX Startup Error ---";
	diag_log abort_loading_msg;
};

if (!isDedicated && hasInterface) then {
	titleText ["-- Liberation RX: FPARMA Edition --","BLACK FADED", 100];
	waitUntil { sleep 1; !isNil "GRLIB_init_server" };
	[] execVM "scripts\client\init_client.sqf";
};

diag_log "--- Init stop ---";
