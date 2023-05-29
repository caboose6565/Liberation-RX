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

if (_vicType == "UK3CB_C_MMT") exitWith {
    private _vseat = "vurtual_seat" createVehicle getPos _vic;
    _vseat attachto [_vic, [0.1,-0.8,1]];
    _vic call _ehFnc;
	_vic enableSimulationGlobal true;
	_vseat enableSimulationGlobal true;
};

if (_vicType == "Land_Axe_F") exitWith {
	_trees = nearestTerrainObjects [(getPos _vic), ["TREE", "SMALL TREE", "BUSH"], 10];
	{ _x hideObjectGlobal true } foreach _trees;
};


if (_vicType == "UK3CB_C_Ikarus") exitWith {
    private _roadanchor = "CUP_Sidewalk_SidewalkCrossing" createVehicle getPos _vic; 
    _roadanchor attachto[_vic,[0,0.5,1.3]]; 
    private _roadback = "CUP_Sidewalk_SidewalkClear" createVehicle getPos _vic; 
    _roadback attachto[_roadanchor,[0,-3.5,0]]; 
    private _roadfront = "CUP_Sidewalk_SidewalkClear" createVehicle getPos _vic; 
    _roadfront attachto[_roadanchor,[0,3.5,0]];
    private _roadleft = "CUP_Sidewalk_SidewalkCrossingT" createVehicle getPos _vic; 
    _roadleft attachto[_roadanchor,[-3,0,0]];
    private _roadright = "CUP_Sidewalk_SidewalkCrossingT" createVehicle getPos _vic; 
    _roadright attachto[_roadanchor,[3,0,0]];
    private _ladder = "Land_ladder_half_EP1" createVehicle getPos _vic; 
    _ladder attachto[_roadanchor,[0,-6.4,-3.1]];
    private _shelter = "Land_WoodenShelter_01_F" createVehicle getPos _vic; 
    _shelter attachto[_roadanchor,[0,0,1.8]];
    private _bagbackleft = "Land_BagFence_Long_F" createVehicle getPos _vic; 
    _bagbackleft attachto[_roadanchor,[-1.5,-4,0.4]];
    _bagbackleft setDir 90;
    private _bagbackright = "Land_BagFence_Long_F" createVehicle getPos _vic; 
    _bagbackright attachto[_roadanchor,[1.5,-4,0.4]];
    _bagbackright setDir 90;
    private _bagbackleft2 = "Land_BagFence_Long_F" createVehicle getPos _vic; 
    _bagbackleft2 attachto[_roadanchor,[-1.5,-4,1]];
    _bagbackleft2 setDir 90;
    private _bagbackright2 = "Land_BagFence_Long_F" createVehicle getPos _vic; 
    _bagbackright2 attachto[_roadanchor,[1.5,-4,1]];
    _bagbackright2 setDir 90;
    private _bagfrontright = "Land_BagFence_Long_F" createVehicle getPos _vic; 
    _bagfrontright attachto[_roadanchor,[1.5,4,0.4]];
    _bagfrontright setDir 90;
    private _bagfrontleft = "Land_BagFence_Long_F" createVehicle getPos _vic; 
    _bagfrontleft attachto[_roadanchor,[-1.5,4,0.4]];
    _bagfrontleft setDir 90;
    private _bagfront = "Land_BagFence_Short_F" createVehicle getPos _vic; 
    _bagfront attachto[_roadanchor,[0,6,0.4]];
    private _bagcfrontright = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcfrontright attachto[_roadanchor,[1.2,5.7,0.4]];
    private _bagcfrontleft = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcfrontleft attachto[_roadanchor,[-1.2,5.7,0.4]];
    _bagcfrontleft setDir 270;
    private _bagcfrontmleft = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcfrontmleft attachto[_roadanchor,[-2,2,0.4]];
    _bagcfrontmleft setDir 90;
    private _bagcfrontmright = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcfrontmright attachto[_roadanchor,[2,2,0.4]];
    _bagcfrontmright setDir 180;
    private _bagcbackmright = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcbackmright attachto[_roadanchor,[2,-2,0.4]];
    _bagcbackmright setDir 270;
    private _bagcbackmleft = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcbackmleft attachto[_roadanchor,[-2,-2,0.4]];
    private _bagcbackright = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcbackright attachto[_roadanchor,[-1.2,-5.5,0.4]];
    _bagcbackright setDir 180;
    private _bagcbackright = "Land_BagFence_Corner_F" createVehicle getPos _vic; 
    _bagcbackright attachto[_roadanchor,[1.2,-5.5,0.4]];
    _bagcbackright setDir 90;
    private _metalfrontleft = "Land_TinWall_01_m_4m_v2_F" createVehicle getPos _vic; 
    _metalfrontleft attachto[_roadanchor,[-1.4,2,-1.2]];
    _metalfrontleft setDir 90;
    private _metalbackleft = "Land_TinWall_01_m_4m_v1_F" createVehicle getPos _vic; 
    _metalbackleft attachto[_roadanchor,[-1.4,-3,-1.2]];
    _metalbackleft setDir 90;
    private _metalbackright = "Land_TinWall_01_m_4m_v1_F" createVehicle getPos _vic; 
    _metalbackright attachto[_roadanchor,[1.2,-3,-1.2]];
    _metalbackright setDir 270;
    private _metalfrontright = "Land_TinWall_01_m_4m_v1_F" createVehicle getPos _vic; 
    _metalfrontright attachto[_roadanchor,[1.2,1,-1.2]];
    _metalfrontright setDir 270;
    private _metalfront = "Land_SlumWall_01_s_2m_F" createVehicle getPos _vic; 
    _metalfront attachto[_roadanchor,[0,4.6,-2.1]];
    private _gunleftfront = "B_GMG_01_F" createVehicle getPos _vic; 
    _gunleftfront attachto[_roadanchor,[-3,0.7,1.2]];
    _gunleftfront setDir 270;
    private _gunleftback = "B_GMG_01_F" createVehicle getPos _vic; 
    _gunleftback attachto[_roadanchor,[-3,-0.5,1.2]];
    _gunleftback setDir 270;
    private _gunright = "UK3CB_CHD_B_ZU23" createVehicle getPos _vic; 
    _gunright attachto[_roadanchor,[3,0,2]];
    _gunright setDir 90;
    _gunright addWeaponTurret ["mortar_82mm",[0]];  
    _gunright addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
    _gunright addMagazines ["8Rnd_82mm_Mo_Smoke_white", 4];
    private _gunfront = "UK3CB_ADA_B_M2_TriPod" createVehicle getPos _vic; 
    _gunfront attachto[_roadanchor,[0,5,1.8]];
    private _chairright1 = "Land_ChairPlastic_F" createVehicle getPos _vic; 
    _chairright1 attachto[_roadanchor,[0.9,-5,0.6]];
    _chairright1 setDir 180;
    private _chairright2 = "Land_ChairPlastic_F" createVehicle getPos _vic; 
    _chairright2 attachto[_roadanchor,[0.9,-4,0.6]];
    _chairright2 setDir 180;
    private _chairright3 = "Land_ChairPlastic_F" createVehicle getPos _vic; 
    _chairright3 attachto[_roadanchor,[0.9,-3,0.6]];
    _chairright3 setDir 180;
    private _chairleft1 = "Land_ChairPlastic_F" createVehicle getPos _vic; 
    _chairleft1 attachto[_roadanchor,[-0.9,-5,0.6]];
    private _chairleft2 = "Land_ChairPlastic_F" createVehicle getPos _vic; 
    _chairleft2 attachto[_roadanchor,[-0.9,-4,0.6]];
    private _chairleft3 = "Land_ChairPlastic_F" createVehicle getPos _vic; 
    _chairleft3 attachto[_roadanchor,[-0.9,-3,0.6]];
    _vic call _ehFnc;
    _roadanchor call _ehFnc;
	_vic enableSimulationGlobal true;
	_roadanchor enableSimulationGlobal false;
    _roadback enableSimulationGlobal false;
    _roadfront enableSimulationGlobal false;
    _roadleft enableSimulationGlobal false;
    _roadright enableSimulationGlobal false;
    _ladder enableSimulationGlobal false;
    _shelter enableSimulationGlobal false;
    _bagbackleft enableSimulationGlobal false;
    _bagbackright enableSimulationGlobal false;
    _bagbackleft2 enableSimulationGlobal false;
    _bagbackright2 enableSimulationGlobal false;
    _bagfrontright enableSimulationGlobal false;
    _bagfrontleft enableSimulationGlobal false;
    _bagfront enableSimulationGlobal false;
    _bagcfrontright enableSimulationGlobal false;
    _bagcfrontleft enableSimulationGlobal false;
    _bagcfrontmleft enableSimulationGlobal false;
    _bagcfrontmright enableSimulationGlobal false;
    _bagcbackmright enableSimulationGlobal false;
    _bagcbackmleft enableSimulationGlobal false;
    _bagcbackright enableSimulationGlobal false;
    _metalfrontleft enableSimulationGlobal false;
    _metalbackleft enableSimulationGlobal false;
    _metalbackright enableSimulationGlobal false;
    _metalfrontright enableSimulationGlobal false;
    _metalfront enableSimulationGlobal false;
    _gunleftfront enableSimulationGlobal true;
    _gunleftback enableSimulationGlobal true;
    _gunright enableSimulationGlobal true;
    _gunfront enableSimulationGlobal true;
    _chairright1 enableSimulationGlobal false;
    _chairright2 enableSimulationGlobal false;
    _chairright3 enableSimulationGlobal false;
    _chairleft1 enableSimulationGlobal false;
    _chairleft2 enableSimulationGlobal false;
    _chairleft3 enableSimulationGlobal false;
};

