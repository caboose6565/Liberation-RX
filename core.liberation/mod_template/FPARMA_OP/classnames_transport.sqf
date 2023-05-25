// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries

box_transport_config = box_transport_config + [
	[ "O_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "O_G_Van_01_transport_F", -5.3, [0, -1.05, 0.2], [0, -2.6, 0.2] ],
    [ "O_G_Van_02_vehicle_F", -5, [0,0.5,0], [0,-1.75,0]],
	[ "O_G_Van_02_transport_F", -5, [0,-1.75,0]],
	[ "O_Truck_02_transport_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "O_Truck_02_covered_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "O_Truck_03_transport_F", -7, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "O_Truck_03_covered_F", -7, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "O_Heli_Transport_04_F", -7.5, [0, 0.8, -1.45], [0, -0.9, -1.45], [0, -2.6, -1.45], [0, -4.3, -1.45] ],
//	[ "O_T_VTOL_02_vehicle_dynamicLoadout_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1] ],
//	[ "O_T_VTOL_02_infantry_dynamicLoadout_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1] ],
	[ "rhs_gaz66_msv", -6.5, [0,-0.2,0.6], [0,-1.8,0.6] ],
	[ "rhs_kamaz5350_msv", -6.5, [0,0.8,0], [0,-0.8,0.0], [0,-2.5,0] ],
	[ "rhs_kamaz5350_open_msv", -6.5, [0,0.8,0], [0,-0.8,0.0], [0,-2.5,0] ],
	[ "RHS_Ural_Open_MSV_01", -6.5, [0,0.5,1.5], [0,-0.9,1.5], [0,-2.4,1.5] ],
	[ "rhs_kraz255b1_cargo_open_msv", -6.5, [0,0.5,1.5], [0,-0.9,1.5], [0,-2.4,1.5], [0,-3.8,1.5] ],
	[ "RHS_Mi8mt_vv", -7.5, [0,2,-1.8], [0,0.6,-1.8], [0,-1.2,-1.8], [0,-2.6,-1.8] ],
	[ "O_T_G_Offroad_01_F", -5, [0, -1.55, 0.2] ],
	[ "O_T_G_Van_01_transport_F", -5.3, [0, -1.05, 0.2], [0, -2.6, 0.2] ],
    [ "O_T_G_Van_02_vehicle_F", -5, [0,0.5,0], [0,-1.75,0]],
	[ "O_T_G_Van_02_transport_F", -5, [0,-1.75,0]],
	[ "O_T_Truck_02_transport_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "O_T_Truck_02_covered_F", -5.5, [0, 0.3, 0], [0, -1.25, 0], [0, -2.8, 0] ],
	[ "O_T_Truck_03_transport_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "O_T_Truck_03_covered_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4] ],
	[ "O_T_Heli_Transport_04_F", -7.5, [0, 0.8, -1.45], [0, -0.9, -1.45], [0, -2.6, -1.45], [0, -4.3, -1.45] ]
];

// Additional offset per object
// objects in this list can be loaded on vehicle position defined above

box_transport_offset = box_transport_offset + [
    // use default config
];
