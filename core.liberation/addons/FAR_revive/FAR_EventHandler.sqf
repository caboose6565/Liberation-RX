params ["_unit"];
// Cleanup
{_unit removeAllEventHandlers _x} count ["GetInMan","GetOutMan","SeatSwitchedMan","InventoryOpened","InventoryClosed","FiredMan"];

// For all
// Check Veh perms
_unit addEventHandler ["GetInMan", {_this spawn vehicle_permissions}];
_unit addEventHandler ["SeatSwitchedMan", {_this spawn vehicle_permissions}];
_unit addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_veh"];
	if (_veh == getConnectedUAV player) then {
		objNull remoteControl _unit;
		player switchCamera cameraView;
	};
}];

_unit addEventHandler ["InventoryClosed", {
	params ["_unit"];
	[_unit] call F_filterLoadout;
	if (_unit == player) then {
		hintSilent format ["Your Loadout Price: %1.", ([_unit] call F_loadoutPrice)];
	};
}];
_unit addEventHandler ["InventoryOpened", {
	params ["_unit", "_container"];
	_ret = false;
	if (!([_unit, _container] call is_owner)) then {
		closeDialog 106;
		_ret = true;
	} else {
		playsound "ZoomIn";
	};
	_ret;
}];

// No mines in the base zone
_unit addEventHandler ["FiredMan",	{
	params ["_body"];
	if (isNil "GRLIB_all_fobs" || count GRLIB_all_fobs == 0) exitWith {};
	if (((_body distance2D ([] call F_getNearestFob) < GRLIB_fob_range) || (_body distance2D lhd < 500)) && (_this select 1) == "Put") then {deleteVehicle (_this select 6)};
}];

if (_unit == player && alive player && player isKindOf "Man") then {
	// only when ACE is not present
	if (!GRLIB_ACE_enabled) then {
		_unit removeAllEventHandlers "Killed";
		_unit addEventHandler ["Killed", {
			params ["_unit"];
			[_unit] spawn {
				waitUntil {sleep 1; alive player};
				hidebody (_this select 0);
				1 fadeSound 1;
				1 fadeRadio 1;
				NRE_EarplugsActive = 0;
			};
		}];
	};

	// Filter Layout
	[missionNamespace, "arsenalClosed", {
		[] spawn {
			[player] call F_filterLoadout;
			if (!([player] call F_payLoadout)) then {
				[player, GRLIB_backup_loadout] call F_setLoadout;
			};
		};
	}] call BIS_fnc_addScriptedEventHandler;

	missionNamespace setVariable [
	"BIS_fnc_addCommMenuItem_menu", [
		["Do it !", true],
		["Unblock unit.", [2], "", -5, [["expression", "[groupSelectedUnits player] spawn FAR_unblock_AI"]], "1", "1"]
	]];

	_unit removeAllEventHandlers "GetInMan";
	_unit addEventHandler ["GetInMan", {
		1 fadeSound ( NRE_vehvolume / 100.0 );
		NRE_EarplugsActive = 1;
		_this spawn vehicle_permissions;
		[player, "hide"] remoteExec ["dog_action_remote_call", 2];
	}];


	_unit removeAllEventHandlers "GetOutMan";
	_unit addEventHandler ["GetOutMan", {
		1 fadeSound 1;
		NRE_EarplugsActive = 0;
		player selectWeapon primaryWeapon player;
		[player, "show"] remoteExec ["dog_action_remote_call", 2];
	}];
};