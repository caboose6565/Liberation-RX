LRX_Mission_Params = [
	["Introduction", 1],			// Introduction - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["DeploymentCinematic", 1],		// Deployment cimematic - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["Unitcap", 1],					// Maximum amount AI units - [default 1] - values = [0.5,0.75,1,1.25,1.5,2] - Text {50%,%75,%100,%125,%150,%200}
	["Difficulty", 1.25],			// Difficulty - [default 1] - values = [0.5,0.75,1,1.25,1.5,2,4,10] - Text {Tourist,Easy,Normal,Moderate,Hard,Extreme,Ludicrous,Oh god oh god we are all going to die}
	["Aggressivity",1],				// CSAT aggression - [default 1] - values = [0.25,0.5,1,2,4] - Text {Anemic,Weak,Normal,Strong,Extreme}
	["AdaptToPlayercount", 1],		// Hostile presence adapts to player count - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["SectorRadius", 0],			// The size of the sector - [default 0] - values = {0,300,400,500,600,700,800,900,1000,1200,1500};
	["DayDuration", 1],				// Day duration (multiplier) - [default 1] - values = [0.25, 0.5, 1, 1.5, 2, 2.5, 3, 5, 10, 20, 30, 60]
	["NightDuration", 1],			// Night duration (multiplier) - [default 1] - values = [0.25, 0.5, 1, 1.5, 2, 2.5, 3, 5, 10, 20, 30, 60]
	["Thermic", 1],					// Enable Thermal Equipment [default 1] - values = [2,1,0] - Text {Enabled,Only at night,Disabled}
	["EnableArsenal", 1],			// Enable the Arsenal [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["FilterArsenal", 1],			// Arsenal Filter Mode [default 1] - values = [0,1,2,3] - Text {Disabled,"Soft","Strict","Strict+MOD"}
	["ModPresetWest", 0],			// Select MOD Preset for Friendly side - value =  { 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 } Text = "A3_BLU", "A3_OPF",  etc...
	["ModPresetEast", 0],			// Select MOD Preset for Enemy side - values = { 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 } text "A3_OPF", "A3_BLU", "A3_IND",  etc...
	["Weather", 4],					// Weather - [default 4] - values = [1,2,3,4] - Text {Always Sunny,Random without rain,Random Cloudy,Random}
	["ResourcesMultiplier", 1],		// Resource multiplier - [default 1] - values = [0.25,0.5,0.75,1,1.25,1.5,2,3,5,10,20,50] - Text {x0.25,x0.5,x1,x1.25,x1.5,x2,x3,x5,x10,x20,x50}
	["Fatigue", 0],					// Stamina - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["Revive", 3],					// PAR revive - [default 3] - values = [3,2,1,0] - Text {Enabled - Everyone can revive,Enabled - Everyone can revive using Medikit/FAK,Enabled - Only medics can revive,Disabled}
	["TK_mode", 0],					// Teamkill Mode [default 0] - values = [0,1,2] - Text {Strict,Relax,Disabled}
	["TK_count", 4],				// Teamkill Warning Count [default 4] - values = [3, 4, 5, 6, 7, 8, 9, 10] - Text {3, 4, 5, 6, 7, 8, 9, 10}
	["Civilians", 1],				// Cilivilian activity - [default 1] - values = [0,0.5,1,2] - Text {None,Reduced,Normal,Increased}
	["Wildlife", 1],				// Wildlife Manager - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["TeamkillPenalty", 1],			// Teamkill Penalty - [default 0] - values = [1,0] - Text {Enabled,Disabled}
	["PassiveIncome", 0],			// Replace ammo box spawns with passive income - [default 0] - values = [1,0] - Text {Enabled,Disabled}
	["AmmoBounties", 1],			// Ammunition bounties - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["HaloJump", 1],				// HALO jump - [default 1] - values = [1,5,10,15,20,30,0] - Text {Enabled - no cooldown,Enabled - 5min cooldown,Enabled - 10min cooldown,Enabled - 15min cooldown,Enabled - 20min cooldown,Enabled - 30min cooldown,Disabled}
	["BluforDefenders", 1],			// BLUFOR defenders in owned sectors - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["MaximumFobs", 5],				// Maximum number of FOBs allowed - [default 26] - values = [3,5,7,10,15,20,26] - Text {3,5,7,10,15,20,26}
	["FobType", 0],					// The Startup Fob Vehicle - [default 0] - values = [1,0] - Text {Huron,Truck}
	["HuronType", 0],				// The type of Huron - [default 0] - values = [0,1,2,3] - Text {Disabled, "CH-67 Huron", "CH-49 Mohawk", "UH-80 Ghost Hawk"}
	["SquadSize", 2],				// AI per squad at startup [default 2]  - values = {0,1,2,3,4,5,6}
	["MaxSquadSize", 5],			// AI recruitment limit per squad [default 7] - values = {0,1,2,3,4,5,6,7}
	["MaxSpawnPoint", 2],			// Spawn Point limit per player. [default 2] - values = {0,1,2,4}
	["Permissions", 1],				// Permissions management - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["EnableLock", 1],				// Enable Vehicles Ownership - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["CleanupVehicles", 1800],		// Cleanup abandoned vehicles outside FOBs - values = {0,900,1800,3600,7200,14400}
	["AutoSave", 3600],				// LRX Game Auto Save Delay - values = {0,300,900,1800,3600,7200}
	["AdminMenu", 1],				// Enable the Admin Cheat Menu [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["HideOpfor", 1],				// Hide Opfor marker - [default 1] - values = [1,0] - Text {Enabled,Disabled}
	["ForcedLoadout", 0],			// Force player default equipment  [default 0] - values = [0,1,2] - Text {Disabled,Preset1,Preset2}
	["DeathChat", 0],				// Disable chat/voice if wounded  [default 0] - values = [1,0] - Text {Enabled,Disabled}
	["FancyInfo", 1],				// Enable colorfull, fancy Informations [default 2] - values = [2,1,0] - Text {Enabled,Info,Disabled}
	["KeepScore", 0]				// Keep the Players datas (score/permissions) - [default 0] - values = [0,1] - Text {Disabled,Enabled}
];

LRX_Mission_Params_Def = [
	["Introduction", localize "STR_PARAMS_INTRO", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["DeploymentCinematic", localize "STR_PARAMS_DEPLOYMENTCAMERA", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Unitcap", localize "STR_PARAMS_UNITCAP", [
		localize "STR_PARAMS_UNITCAP1",
		localize "STR_PARAMS_UNITCAP2",
		localize "STR_PARAMS_UNITCAP3",
		localize "STR_PARAMS_UNITCAP4",
		localize "STR_PARAMS_UNITCAP5",
		localize "STR_PARAMS_UNITCAP6"
		],
		[0.5, 0.75, 1, 1.25, 1.5, 2]
	],
	["Difficulty", localize "STR_PARAMS_DIFFICULTY", [
		localize "STR_PARAMS_DIFFICULTY1",
		localize "STR_PARAMS_DIFFICULTY2",
		localize "STR_PARAMS_DIFFICULTY3",
		localize "STR_PARAMS_DIFFICULTY4",
		localize "STR_PARAMS_DIFFICULTY5",
		localize "STR_PARAMS_DIFFICULTY6",
		localize "STR_PARAMS_DIFFICULTY7",
		localize "STR_PARAMS_DIFFICULTY8"
		],
		[0.5, 0.75, 1, 1.25, 1.5, 2, 4, 10]
	],
	["Aggressivity", localize "STR_AGGRESSIVITY_PARAM", [
		localize "STR_AGGRESSIVITY_PARAM1",
		localize "STR_AGGRESSIVITY_PARAM2",
		localize "STR_AGGRESSIVITY_PARAM3",
		localize "STR_AGGRESSIVITY_PARAM4"
		],
		[0.25, 0.5, 1, 2, 4]
	],
	["AdaptToPlayercount", localize "STR_PARAM_ADAPT_TO_PLAYERCOUNT", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["SectorRadius", localize "STR_PARAM_SECTOR_RADIUS", [
		localize "STR_PARAMS_DISABLED",
		"300",
		"400",
		"600",
		"800",
		"1000",
		"1200",
		"1500"
		],
		[0, 300, 400, 600, 800, 1000, 1200, 1500]
	],
	["DayDuration", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["NightDuration", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Thermic", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["EnableArsenal", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["FilterArsenal", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["ModPresetWest", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["ModPresetEast", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Weather", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["ResourcesMultiplier", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Fatigue", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Revive", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["TK_mode", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["TK_count", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Civilians", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Wildlife", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["TeamkillPenalty", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["PassiveIncome", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["AmmoBounties", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["HaloJump", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["BluforDefenders", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["MaximumFobs", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["FobType", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["HuronType", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["SquadSize", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["MaxSquadSize", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["MaxSpawnPoint", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["Permissions", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["EnableLock", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["CleanupVehicles", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["AutoSave", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["AdminMenu", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["HideOpfor", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["ForcedLoadout", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["DeathChat", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["FancyInfo", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]],
	["KeepScore", localize "", [localize "STR_PARAMS_DISABLED",localize "STR_PARAMS_ENABLED"]]
];
