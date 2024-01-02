//PARAMS
params ["_vic"];

//EXIT IF NOT LOCAL
if !(local _vic) exitWith {};

private _vicType = typeOf _vic;

private _ehFnc = {
    _this addEventHandler [ 'Killed', {
        params ['_vic'];
        {
            detach _x;
            deleteVehicle _x;
        } forEach (attachedObjects _vic);
    }];
    _this addEventHandler [ 'Deleted', {
        params ['_vic'];
        {
            detach _x;
            deleteVehicle _x;
        } forEach (attachedObjects _vic);
    }];
};

// TAYLOR VEHICLES
if (_vicType == "FP_GOR_B_Truck_03_repair_F") exitWith {
    private _ugvrepairwrench = "Land_Wrench_F" createVehicle getPos _vic;
    hideObjectGlobal _vic;
    _vic attachTo [_ugvrepairwrench, [0,0,0]];
    _vic enableSimulationGlobal false;
    private _ugvrepair = "B_T_UGV_01_olive_F" createVehicle getPos _ugvrepairwrench;
	createVehicleCrew _ugvrepair;
    _ugvrepairwrench attachto [_ugvrepair, [0,0,0]];
    private _ugvrepairdepot = "Land_RepairDepot_01_green_F" createVehicle [0,0,0];
    _ugvrepairdepot attachto [_ugvrepair, [0,-2,0.8]];
    _ugvrepair call _ehFnc;
    _vic call _ehFnc;
	_ugvrepairwrench enableSimulationGlobal false;
	_ugvrepairdepot enableSimulationGlobal false;
    _vic removeAction ConverttoUGV;
};

if (_vicType == "FP_GOR_B_Truck_03_ammo_F") exitWith {
    private _ugvammobox = "Land_Ammobox_rounds_F" createVehicle getPos _vic;
    hideObjectGlobal _vic;
    _vic attachTo [_ugvammobox, [0,0,0]];
    _vic enableSimulationGlobal false;
    private _ugvammo = "B_T_UGV_01_olive_F" createVehicle getPos _ugvammobox;
	createVehicleCrew _ugvammo;
    _ugvammobox attachto [_ugvammo, [0,-1,-0.5]];
    private _ugvammo2 = "AmmoCrates_NoInteractive_Small" createVehicle [0,0,0];
    _ugvammo2 attachto [_ugvammo, [0.4,1,0]];
    private _ugvammo3 = "AmmoCrates_NoInteractive_Large" createVehicle [0,0,0];
    _ugvammo3 attachto [_ugvammo, [0.5,0,0.1]];
    _ugvammo call _ehFnc;
    _vic call _ehFnc;
	_ugvammobox enableSimulationGlobal false;
	_ugvammo2 enableSimulationGlobal false;
	_ugvammo3 enableSimulationGlobal false;
    _vic removeAction ConverttoUGV;
};

if (_vicType == "FP_GOR_B_Truck_03_fuel_F") exitWith {
    private _ugvfuelcan = "Land_CanisterFuel_F" createVehicle getPos _vic;
    hideObjectGlobal _vic;
    _vic attachTo [_ugvfuelcan, [0,0,0]];
    _vic enableSimulationGlobal false;
    private _ugvfuel = "B_T_UGV_01_olive_F" createVehicle getPos _ugvfuelcan;
	createVehicleCrew _ugvfuel;
    _ugvfuelcan attachto [_ugvfuel, [0,0,0]];
	private _ugvfueltank = "Land_fuel_tank_small" createVehicle [0,0,0];
    _ugvfueltank attachto [_ugvfuel, [0.3,-1,-0.35]];
    _ugvfuel call _ehFnc;
    _vic call _ehFnc;
	_ugvfuelcan enableSimulationGlobal false;
	_ugvfueltank enableSimulationGlobal false;
    _vic removeAction ConverttoUGV;
};

