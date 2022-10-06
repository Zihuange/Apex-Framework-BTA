/*/
File: QS_data_vehicles.sqf
Author:

	Quiksilver
	
Last modified:

	22/07/2019 A3 1.94 by Quiksilver
	
Description:

	Vehicle Data
	
Editing Notes:

	[
		objnull,				// --- [DO NOT EDIT] the vehicle object stored here once it spawns
		30,						// --- [CAN EDIT] vehicle respawn delay
		false,					// --- [CAN EDIT] randomized vehicle
		{},						// --- [CAN EDIT] custom init code
		'B_Quadbike_01_F',		// --- [CAN EDIT] vehicle type
		[0,0,0],				// --- [CAN EDIT] vehicle spawn position
		0,						// --- [CAN EDIT] vehicle spawn direction
		false,					// --- [DO NOT EDIT] is vehicle respawning now
		0,						// --- [DO NOT EDIT] when can vehicle respawn
		-1,						// --- [CAN EDIT] FOB vehicle ID (-1 if not a FOB vehicle, -2 if a terrain vehicle (like boat))
		50,						// --- [CAN EDIT] vehicle abandonment distance (at base)
		500,					// --- [CAN EDIT] vehicle abandonment distance (away from base)
		-1,						// --- [CAN EDIT] respawn tickets
		5,						// --- [CAN EDIT] required safe respawn radius
		true,					// --- [CAN EDIT] is a dynamic "Activate" vehicle (performance saving)
		0						// --- [CAN EDIT] is spawned on an aircraft carrier deck
	]
__________________________________________________________________________/*/

_worldName = worldName;
if (_worldName isEqualTo 'Altis') exitWith {
	[
		[objNull,1800,false,{},"B_T_VTOL_01_infantry_olive_F",[14807.2,16890.7,0.00701141],181.951,false,0,-1,150,500,-1,8,true,0],
		[objNull,900,false,{},"B_T_VTOL_01_vehicle_blue_F",[14848.8,16849.5,0.0284901],182.292,false,0,-1,150,500,-1,8,true,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[14760.3,16827.1,-0.000232697],181.183,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,TRUE,{},"B_Heli_Light_01_F",[14791.5,16795.6,-0.000232697],178.31,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[14780.6,16849.3,-0.000883102],177.929,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"I_Heli_Transport_02_F",[14811.9,16820.5,0.0110245],179.804,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[14841.2,16790.5,-0.000883102],180.323,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_03_unarmed_F",[14868.5,16763.4,-0.134476],180.013,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_APC_Tracked_01_CRV_F",[14732.5,16834.2,-0.0807819],134.694,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[14754.6,16848.2,0.200075],137.235,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[14756.8,16850.3,0.200077],137.235,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Truck_01_mover_F",[14735.7,16587.6,0.114967],312.76,false,0,-1,50,500,-1,4,true,0],
		[objNull,300,TRUE,{},"B_MBT_01_TUSK_F",[14486.1,16809.5,-0.0748405],317.304,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_ammo_F",[14581.2,16909.6,0.114983],270.288,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_box_F",[14585.8,16904,0.115004],270.854,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_fuel_F",[14590.7,16899,0.115023],269.65,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_medical_F",[14595.8,16894.4,0.114977],269.825,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_Repair_F",[14601.1,16889.1,0.114975],269.544,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_covered_F",[14567.6,16891.5,0.115034],313.828,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_cargo_F",[14618.6,16905.1,0.1],313.976,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_flatbed_F",[14600.2,16922.8,0.1],315.151,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[14555,16858.5,0.149036],43.8663,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[14559.9,16853.6,0.149197],43.8657,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_MRAP_03_F",[14544,16867.8,0.227306],45.0761,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_gmg_F",[14566.3,16875.4,0.148956],43.2917,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_hmg_F",[14571.3,16869.8,0.14884],44.7365,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_MRAP_03_F",[14549.1,16862.7,0.227106],45.0773,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_LSV_01_armed_F",[14532.4,16850.4,0.0998878],46.2143,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_LSV_01_armed_F",[14537.8,16845.2,0.100147],46.2134,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_LSV_01_armed_F",[14531.3,16843.8,0.0999527],223.843,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_LSV_01_armed_F",[14536.1,16838.8,0.103872],223.84,false,0,-1,50,500,-1,4,true,0],
		[objNull,90,TRUE,{},"B_APC_Wheeled_01_cannon_F",[14518.3,16837.4,0.112261],315.423,false,0,-1,50,500,-1,4,true,0],
		[objNull,90,false,{},"B_APC_Wheeled_01_cannon_F",[14528,16827.4,0.1173],315.425,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_APC_Tracked_01_rcws_F",[14512.5,16813.9,-0.079525],315.071,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[14609.1,16825,0.200708],311.747,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[14611.6,16827.7,0.200708],311.747,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[14570.8,16787.1,0.200708],311.747,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[14568.3,16784.3,0.200708],311.747,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_G_Van_02_vehicle_F",[14527.5,16737.7,0.101021],134.732,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_G_Offroad_01_repair_F",[14545.9,16838.4,0.0631886],47.0526,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"I_E_Van_02_medevac_F",[14532.1,16742.7,0.176844],134.467,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[14537.1,16747.4,0.0999756],134.072,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_GEN_Offroad_01_gen_F",[14550.6,16739.5,0.0628548],44.7664,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_GEN_Van_02_vehicle_F",[14542.1,16730.9,0.101021],45.7592,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[15345,15821,0],104.048,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[15331.5,15779.9,0],168.951,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[15335.7,15760.5,0],167.087,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[15347.2,15813.2,0],105.477,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE;(_this # 0);},"C_Scooter_Transport_01_F",[15399.7,15832.9,0.3],180.183,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE;(_this # 0);},"C_Scooter_Transport_01_F",[15401.7,15833.2,0.3],180.871,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Civil_01_police_F",[15404.9,15831.8,0],180.625,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_SDV_01_F",[15356,15768.8,0],164.931,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[14518.1,16771.5,1.90735e-006],132.649,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[14519.1,16772.5,5.72205e-006],132.651,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[14520.1,16773.6,0],132.65,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[14521,16774.5,0],132.65,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[14521.8,16775.2,3.8147e-006],45.7252,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[14522.4,16775.8,0.000139236],45.7252,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[14747.9,16619.3,0],221.312,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[14736.4,16637.3,0],3.31171,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[14743.2,16631.9,0],0,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[14729.8,16643.6,0],0,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_black_F",[14720.2,16634.6,-0.0750008],264.335,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[14734.4,16620.7,-0.0750008],260.001,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[14720.6,16642.1,0],0,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[14720.6,16642.1,0],0,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_supplyCrate_F",[14765.1,16643,0],225.409,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_supplyCrate_F",[14765.1,16643,0],225.409,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[14758,16636.2,0],274.657,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[14758,16636.2,0],274.657,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_black_F",[14728.1,16628,-0.0750008],260.001,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[16750.5,20509.4,0],131.562,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[9741.65,22346.4,0],0,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[3347.64,12946.1,0],244.878,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[5064.69,9920.25,0],324.237,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[10630.5,10967.9,0],232.065,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[12526,12777.4,0],337.855,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[16610.7,12276.1,0],270.943,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[22224.4,8555.64,0],315.63,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[22738.4,13829.1,0],310.942,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[27945.6,23757,0],336.937,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[23257,24202.7,0],277.103,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[20617.4,19509.5,0],305.684,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[17811.4,18174.1,0],270,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[17796.5,18186.9,0],270,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[17781.1,18202,0],270,false,0,-2,50,500,-1,4,true,0]
	]
};
if (_worldName isEqualTo 'Tanoa') exitWith {
	[
		[objNull,1800,false,{},"B_T_VTOL_01_infantry_olive_F",[6986.09,7231.91,0.00295281],316.646,false,0,-1,150,250,-1,8,TRUE,0],
		[objNull,900,false,{},"B_T_VTOL_01_vehicle_blue_F",[6929.84,7230.63,0.0327709],38.9913,false,0,-1,150,250,-1,8,TRUE,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[7066.74,7280.26,-0.000231743],30.3855,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_03_unarmed_F",[7130.8,7207.77,-0.134476],24.6675,false,0,-1,150,500,-1,6,false,0],
		[objNull,30,false,{},"I_Heli_Transport_02_F",[7123.42,7247.66,0.0199199],30.4196,false,0,-1,150,500,-1,6,false,0],
		[objNull,30,TRUE,{},"I_Heli_light_03_unarmed_F",[7117.48,7288.92,5.8651e-005],32.558,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_CTRG_Heli_Transport_01_tropic_F",[7075.4,7241.55,-0.000883102],34.2673,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_CTRG_Heli_Transport_01_tropic_F",[7082.38,7200.88,-0.000883102],36.5012,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,TRUE,{},"B_GEN_Offroad_01_gen_F",[6878.51,7382.73,0.0628552],349.209,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"I_E_Van_02_medevac_F",[6880.1,7372.95,0.176844],350.992,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_G_Offroad_01_repair_F",[6905.62,7321.74,0.0628548],352.266,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[6898.91,7320,0.0999765],353.765,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_G_Van_02_vehicle_F",[6888.98,7321.72,0.101022],308.255,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_covered_F",[6878.33,7330.15,0.114967],308.938,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_MBT_01_TUSK_F",[6834.67,7446.91,-0.0749998],171.196,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_APC_Wheeled_01_cannon_F",[6817.11,7422.7,0.112231],285.993,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_APC_Wheeled_01_cannon_F",[6820.73,7400.72,0.112127],284.799,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_mover_F",[7046.4,7452.16,0.114967],262.274,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[7081.05,7304.93,0.200708],348.738,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[6830.1,7395.05,0.149013],170.656,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_MRAP_03_F",[6827.25,7411.72,0.226772],169.934,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_MRAP_03_F",[6824.72,7424.78,0.226771],169.385,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6841.14,7399.97,0.0994039],351.045,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_LSV_01_armed_F",[6838.12,7416.07,0.0994039],351.045,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6835.59,7429.26,0.0994039],351.045,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_LSV_01_armed_F",[6841.72,7422.98,0.0994039],169.336,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6844.42,7407.23,0.0994039],171.375,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6861.32,7394.52,0.0994039],287.749,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[6863.63,7383.39,0.0999765],288.992,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6798.55,7399.95,2.38419e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6799.59,7400.2,4.76837e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6799.34,7401.5,2.38419e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[6798.31,7401.34,0],79.0383,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[6800.51,7400.49,2.38419e-007],79.0383,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6800.33,7401.74,2.38419e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7045.13,7416.95,0],257.975,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7045.13,7416.95,0],257.975,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[7059.27,7394.7,-4.76837e-007],323.624,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[7071.69,7390.64,0],347.394,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[7041.43,7390.54,0],324.825,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[7050.54,7392.73,0],325.348,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_black_F",[7043.59,7378.01,-0.0750003],208.2,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_black_F",[7062.99,7380.99,-0.0750003],210.899,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[7052.97,7379.72,-0.0750003],210.899,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[7036.48,7382.93,0],263.05,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_T_supplyCrate_F",[7052.9,7418.59,0],259.075,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_T_supplyCrate_F",[7052.9,7418.59,0],259.075,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_T_APC_Tracked_01_CRV_F",[6939.45,7272.17,-0.0749998],37.8546,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[6894.77,7383.64,0.166946],259.344,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[6895.36,7380.79,0.174071],259.344,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[6893.75,7400.2,0.200709],259.344,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_ammo_F",[6766.39,7504.12,0.112837],293.452,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_box_F",[6769.41,7511.14,0.126696],296.545,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_fuel_F",[6763.11,7496.67,0.106696],292.8,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_medical_F",[6760.39,7490.35,0.15124],295.132,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_Repair_F",[6757.87,7483.75,0.123316],294.161,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_cargo_F",[6882.53,7493.8,0.1],176.608,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_flatbed_F",[6890.86,7493.93,0.1],177.016,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE; (_this # 0);},"C_Scooter_Transport_01_F",[6631.79,6925.49,0.3],154.353,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE; (_this # 0);},"C_Scooter_Transport_01_F",[6634.67,6929.22,0.3],154.353,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[6624.27,6917.04,0],217.862,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[6617.16,6909.77,0],226.21,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Boat_Armed_01_minigun_F",[6605.38,6903.29,0],224.704,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Boat_Armed_01_minigun_F",[6591.08,6902.12,0],224.704,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_SDV_01_F",[6581.72,6905.7,0],196.077,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Civil_01_police_F",[6580.56,6916.18,0],287.649,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4958.3,11315.8,0],225.186,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4226.92,11642.8,0],82.6999,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[11062.6,13376.4,0],31.5238,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[13249.2,13666.4,0],193.904,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[2216.72,8643.08,0],359.678,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4529.2,5215.22,0],291.975,false,0,-2,50,500,-1,4,TRUE,0]
	]
};
if (_worldName isEqualTo 'Malden') exitWith {
	[
		[objNull,1800,false,{},"B_T_VTOL_01_infantry_olive_F",[8097.4,10500.7,0.000347137],232.913,false,0,-1,150,500,-1,8,true,0],
		[objNull,900,false,{},"B_T_VTOL_01_vehicle_blue_F",[8101.2,10448.1,0.000274658],306.993,false,0,-1,150,500,-1,8,true,0],
		[objNull,30,TRUE,{},"B_MBT_01_TUSK_F",[8223.27,10165.8,0.81424],270.102,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_covered_F",[8222.68,10173.7,-0.0965805],268.15,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_G_Van_02_vehicle_F",[8209.44,10186.3,0.08498],180.484,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_fuel_F",[8248.52,10122.5,-0.122568],0.017425,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_medical_F",[8243.58,10122.4,-0.0799007],0.0022742,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_box_F",[8253.85,10122.2,-0.121305],359.999,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_ammo_F",[8258.69,10122.5,-0.122662],0.0111568,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_cargo_F",[8288.63,10142.2,0.1],268.167,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_flatbed_F",[8288.47,10149.1,0.1],269.319,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[8214.12,10187.7,-0.00201035],180.187,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[8098.44,10350.6,0.0519638],267.924,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Heli_Transport_03_unarmed_F",[8037.49,10365.4,-0.175064],86.3504,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"I_Heli_Transport_02_F",[8036.67,10312.9,-0.057415],87.2739,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,TRUE,{},"B_Heli_Light_01_F",[8098.42,10316.3,0.00629807],266.558,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8064.35,10288.3,-0.00919914],91.8921,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"I_E_Van_02_medevac_F",[8204.15,10186.5,-0.0730209],180.765,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[8039.4,10265.6,0.0600834],87.4031,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[8099.26,10287.2,0.00625801],269.299,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8064.28,10285.1,-0.00842857],85.3704,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,TRUE,{},"B_GEN_Offroad_01_gen_F",[8199.06,10187,-0.0543118],179.834,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_APC_Wheeled_01_cannon_F",[8178.6,10190.2,0.0389576],180.545,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_APC_Tracked_01_rcws_F",[8186.48,10190.5,-0.0569782],183.55,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_Repair_F",[8238.29,10122.1,-0.121326],359.999,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_armed_F",[8189.74,10109.7,-0.0225105],245.986,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[8167.06,10106.8,-0.003088],31.5844,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_LSV_01_armed_F",[8186.24,10117.3,-0.0225277],248.055,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_armed_F",[8183,10125.1,-0.0225582],245.347,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_MRAP_03_F",[8177.89,10095.7,-0.00323486],1.03303,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[8160.07,10107.7,-0.00309563],212.221,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8152.05,10122.3,-0.0100136],89.237,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8151.78,10119.1,-0.0100117],89.237,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[8154.47,10111.4,-0.0032959],227.404,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_APC_Tracked_01_CRV_F",[8061.54,10243.7,-0.0749588],140.647,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8255.05,10157.7,7.62939e-006],90.2609,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8256.16,10155.5,5.72205e-006],90.3031,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8256.19,10157.7,5.72205e-006],90.3064,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8256.13,10156.6,7.62939e-006],90.2491,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[8255.08,10155.5,-0.00138283],359.998,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[8255.19,10156.6,-0.00138283],359.999,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[7983.13,10135,0.0305672],0.0108218,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[7983.13,10135,0.0305672],0.0108218,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[7978.25,10129.4,5.53131e-005],151.764,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[7970.74,10129.4,0.00122261],154.65,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_black_F",[7978.02,10140.6,-0.0753078],35.14,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[7952.3,10133.2,4.76837e-005],359.999,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[7962.72,10129.1,6.10352e-005],153.106,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[7967.59,10140.7,-0.0640469],29.5116,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_black_F",[7958.76,10140.9,-0.120647],34.9285,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Truck_01_mover_F",[7959.24,10036.6,-0.108738],268.953,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7966.66,10050.1,-1.33514e-005],0.00236241,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7966.66,10050.1,-1.33514e-005],0.00236241,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_supplyCrate_F",[7977.93,10050.1,-9.53674e-006],94.7007,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_supplyCrate_F",[7977.93,10050.1,-9.53674e-006],94.7007,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[8565.54,10109.7,0],91.8578,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[8556.07,10115.9,0],91.8578,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_SDV_01_F",[8565.27,10101.6,0],128.789,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Civil_01_police_F",[8557.6,10102.1,0],178.398,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE;(_this # 0);},"C_Scooter_Transport_01_F",[8553.51,10106.7,0.3],186.618,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE;(_this # 0);},"C_Scooter_Transport_01_F",[8551.06,10108.5,0.3],185.031,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[8547.54,10108.3,0],173.447,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[8542.26,10111.8,0],173.447,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[8496.87,3797.07,0],178.204,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[9285.57,3719.64,0],267.934,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[3667.66,3045.14,0],261.82,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[5495.98,11691.9,0],331.305,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[893.722,11858.7,0],277.775,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[927.442,11827.1,0],201.613,false,0,-2,50,500,-1,4,true,0]
	]
};
if (_worldName isEqualTo 'Enoch') exitWith {
	[
		[objNull,30,false,{},"B_T_Truck_01_ammo_F",[4309.38,10479.3,0.114975],314.231,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_box_F",[4313.35,10483.9,0.114998],314.32,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_fuel_F",[4305.47,10475.2,0.11499],315.527,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_medical_F",[4301.5,10470.8,0.114967],314.13,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_Repair_F",[4296.34,10466.3,0.114975],313.81,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_cargo_F",[4006.72,10311.7,0.1],225.155,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_flatbed_F",[4002.09,10316.5,0.1],224.507,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MBT_01_cannon_F",[4243.87,10416.8,0.110123],135.078,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_AFV_Wheeled_01_cannon_F",[4232.78,10397,0.12059],45.7343,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_APC_Wheeled_01_cannon_F",[4237.6,10392.1,0.151443],46.7498,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[4256.27,10409.8,0.111977],133.843,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[4263.41,10403,0.120964],133.198,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[4265.4,10388.8,0.153732],44.5967,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[4268.98,10385.1,0.150978],44.6062,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[4272.3,10381.6,0.150993],44.6062,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4275.16,10400.8,0.217789],118.597,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4277.87,10404,0.217804],114.535,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4278.47,10409.2,0.248398],44.8188,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4276.13,10411.7,0.248489],44.8188,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Truck_01_mover_F",[4028.46,10293.2,0.119087],223.578,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[3879.68,10153.7,-6.10352e-005],11.0235,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[3885.16,10190,0.00582123],11.2232,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[3844.55,10150.9,0.00763702],10.4954,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_03_F",[3838.95,10116.4,-0.151215],11.534,false,0,-1,50,500,-1,4,false,0],
		[objNull,600,false,{},"B_T_VTOL_01_infantry_olive_F",[3753.3,10044.6,0.0175247],0,false,0,-1,50,500,-1,10,true,0],
		[objNull,1200,false,{},"B_T_VTOL_01_vehicle_blue_F",[3793.56,10083,0.000328064],0,false,0,-1,50,500,-1,10,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[3871.39,10132,0.205505],141.162,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[3970.81,10250.6,5.34058e-005],134.44,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[3981.56,10274.6,-0.000946045],200.087,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[3978.05,10287.3,0.000366211],223.844,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[3994.85,10262.1,0.000724792],201.281,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[3988.01,10268.5,0.000411987],201.806,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_F",[4004.1,10270.7,-0.078949],84.6543,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_F",[3990.94,10285.4,-0.0748062],87.3602,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_F",[3997.51,10277.6,-0.0749207],87.3253,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[4003.91,10262.2,-0.000297546],139.52,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_T_supplyCrate_F",[3965.15,10256.2,0.000137329],135.543,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[4317.78,10454,0],223.947,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[4318.91,10455.1,0],223.947,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[4320.01,10456.3,0],135.72,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[4320.98,10457.1,0],135.72,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[734.012,7631.77,-0.743812],322.692,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[4170.48,8830.4,-0.787694],233.285,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[4174.83,8824.71,-0.743812],233.285,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[9515.68,11716,-0.743813],171.333,false,0,-1,50,500,-1,4,true,0]
	]
};