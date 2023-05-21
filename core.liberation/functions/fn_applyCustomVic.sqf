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

// CABOOSE VEHICLES
if (_vicType == "B_T_Truck_01_mover_F") exitWith {
    private _gun = "B_AAA_System_01_f" createVehicle [0,0,0];
    _gun attachto [_vic, [0,-3,2]];
    createVehicleCrew _gun;
    _vic call _ehFnc;
};


if (_vicType == "Land_Wrench_F") exitWith {
    private _ugvrepair = "B_T_UGV_01_olive_F" createVehicle getPos _vic;
	createVehicleCrew _ugvrepair;
    _vic attachto [_ugvrepair, [0,0,0]];
    private _ugvrepairdepot = "Land_RepairDepot_01_green_F" createVehicle [0,0,0];
    _ugvrepairdepot attachto [_ugvrepair, [0,-2,0.8]];
    _ugvrepair call _ehFnc;
	_vic enableSimulationGlobal false;
	_ugvrepairdepot enableSimulationGlobal false;
};

if (_vicType == "Land_Ammobox_rounds_F") exitWith {
    private _ugvammo = "B_T_UGV_01_olive_F" createVehicle getPos _vic;
	createVehicleCrew _ugvammo;
    _vic attachto [_ugvammo, [0,-1,-0.5]];
    private _ugvammo2 = "AmmoCrates_NoInteractive_Small" createVehicle [0,0,0];
    _ugvammo2 attachto [_ugvammo, [0.4,1,0]];
    private _ugvammo3 = "AmmoCrates_NoInteractive_Large" createVehicle [0,0,0];
    _ugvammo3 attachto [_ugvammo, [0.5,0,0.1]];
    _ugvammo call _ehFnc;
	_vic enableSimulationGlobal false;
	_ugvammo2 enableSimulationGlobal false;
	_ugvammo3 enableSimulationGlobal false;
};

if (_vicType == "Land_CanisterFuel_F") exitWith {
    private _ugvfuel = "B_T_UGV_01_olive_F" createVehicle getPos _vic;
	createVehicleCrew _ugvfuel;
    _vic attachto [_ugvfuel, [0,0,0]];
	private _ugvfueltank = "Land_fuel_tank_small" createVehicle [0,0,0];
    _ugvfueltank attachto [_ugvfuel, [0.3,-1,-0.35]];
    _ugvfuel call _ehFnc;
	_vic enableSimulationGlobal false;
	_ugvfueltank enableSimulationGlobal false;
};



if (_vicType == "Land_Axe_F") exitWith {
	_trees = nearestTerrainObjects [(getPos _vic), ["TREE", "SMALL TREE", "BUSH"], 10];
	{ _x hideObjectGlobal true } foreach _trees;
};

