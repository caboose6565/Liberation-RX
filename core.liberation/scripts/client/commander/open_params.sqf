waitUntil { !isNil "GRLIB_permissions" };

private [ "_nextplayer", "_players_array", "_playername", "_idx", "_control", "_player_uid", "_player_idx", "_player_uids", "_player_permissions", "_modify_permissions" ];

createDialog "liberation_params";
save_changes = 0;
color_authorized = [0,0.9,0,1];
color_denied = [0.9,0,0,1];
fontsize = 0.017 * safezoneH;


waitUntil { dialog };



while { dialog && alive player } do {


	sleep 1;
};