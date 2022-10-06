/*/
File: fn_getAIMotorPool.sqf
Author:

	Quiksilver
	
Last Modified:

	8/06/2022 A3 2.10 by Quiksilver
	
Description:

	AI Motor Pool
__________________________________________________/*/

params ['_case'];
private _return = [];
_allPlayersCount = count allPlayers;
_p_0 = 0.0;
_p_1 = 1.0;
_p_2 = 2.0;
_p_3 = 3.0;
_p_4 = 4.0;
private _tank_modifier = (missionNamespace getVariable ['QS_AI_targetsKnowledge_threat_armor',1]) max 1;
private _air_modifier = (missionNamespace getVariable ['QS_AI_targetsKnowledge_threat_air',0.5]) max 0.5;
if (_case isEqualTo -1) exitWith {
	// All armed
	_return = [
		[
			'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
			'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
			'b_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_afv_wheeled_01_cannon_f',_p_1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,			
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_apc_wheeled_01_cannon_f',_p_1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
			'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
			'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_t_afv_wheeled_01_cannon_f',_p_1,
			'i_apc_tracked_03_cannon_f',_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_t_apc_wheeled_01_cannon_f',_p_1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	_return;
};
if (_case isEqualTo 0) exitWith {
	// Classic AO - armed
	_return = [
		[
			'b_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_afv_wheeled_01_cannon_f',_p_1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_apc_wheeled_01_cannon_f',_p_1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_t_afv_wheeled_01_cannon_f',_p_1,
			'i_apc_tracked_03_cannon_f',_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_t_apc_wheeled_01_cannon_f',_p_1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	if (_allPlayersCount > 10) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_afv_wheeled_01_cannon_f',_p_1,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_apc_wheeled_01_cannon_f',_p_1,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_lsv_01_at_f',_tank_modifier * _p_2,
				'b_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_t_afv_wheeled_01_cannon_f',_p_1,
				'i_apc_tracked_03_cannon_f',_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_t_apc_wheeled_01_cannon_f',_p_1,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_t_lsv_01_at_f',_tank_modifier * _p_2,
				'b_t_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 20) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_afv_wheeled_01_cannon_f',_p_2,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_t_afv_wheeled_01_cannon_f',_p_2,
				'i_apc_tracked_03_cannon_f',_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 30) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_apc_wheeled_01_cannon_f',_p_3,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_t_apc_wheeled_01_cannon_f',_p_3,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 40) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	_return;
};
if (_case isEqualTo 1) exitWith {
	// SC AO - armed
	_return = [
		[
			'b_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_afv_wheeled_01_cannon_f',_p_1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_apc_wheeled_01_cannon_f',_p_1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_t_afv_wheeled_01_cannon_f',_p_1,
			'i_apc_tracked_03_cannon_f',_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_t_apc_wheeled_01_cannon_f',_p_1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	if (_allPlayersCount > 10) then {
		_return = [
			[
				'b_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_afv_wheeled_01_cannon_f',_p_1,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_apc_wheeled_01_cannon_f',_p_1,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_lsv_01_at_f',_tank_modifier * _p_2,
				'b_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_t_afv_wheeled_01_cannon_f',_p_1,
				'i_apc_tracked_03_cannon_f',_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_t_apc_wheeled_01_cannon_f',_p_1,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_t_lsv_01_at_f',_tank_modifier * _p_2,
				'b_t_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 20) then {
		_return = [
			[
				'b_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_1,
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_afv_wheeled_01_cannon_f',_p_2,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_t_afv_wheeled_01_cannon_f',_p_2,
				'i_apc_tracked_03_cannon_f',_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 30) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_apc_wheeled_01_cannon_f',_p_3,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_t_apc_wheeled_01_cannon_f',_p_3,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 40) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	_return;
};
if (_case isEqualTo 2) exitWith {
	// Side mission general
	_return = [
		[
			'b_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_afv_wheeled_01_cannon_f',_p_1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_apc_wheeled_01_cannon_f',_p_1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_t_afv_wheeled_01_cannon_f',_p_1,
			'i_apc_tracked_03_cannon_f',_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_t_apc_wheeled_01_cannon_f',_p_1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	if (_allPlayersCount > 10) then {
		_return = [
			[
				'b_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_afv_wheeled_01_cannon_f',_p_1,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_apc_wheeled_01_cannon_f',_p_1,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_lsv_01_at_f',_tank_modifier * _p_2,
				'b_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_t_afv_wheeled_01_cannon_f',_p_1,
				'i_apc_tracked_03_cannon_f',_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_t_apc_wheeled_01_cannon_f',_p_1,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_t_lsv_01_at_f',_tank_modifier * _p_2,
				'b_t_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 20) then {
		_return = [
			[
				'b_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_afv_wheeled_01_cannon_f',_p_2,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
				'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_t_afv_wheeled_01_cannon_f',_p_2,
				'i_apc_tracked_03_cannon_f',_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 30) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_apc_wheeled_01_cannon_f',_p_3,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_t_apc_wheeled_01_cannon_f',_p_3,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 40) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	_return;
};
if (_case isEqualTo 3) exitWith {
	_return = [
		[
			'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
			'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
			'b_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_afv_wheeled_01_cannon_f',_p_1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_apc_wheeled_01_cannon_f',_p_1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
			'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
			'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_t_afv_wheeled_01_cannon_f',_p_1,
			'i_apc_tracked_03_cannon_f',_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',_p_1,
			'i_lt_01_cannon_f',_p_1,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_t_apc_wheeled_01_cannon_f',_p_1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	if (_allPlayersCount > 10) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_afv_wheeled_01_cannon_f',_p_1,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_apc_wheeled_01_cannon_f',_p_1,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_lsv_01_at_f',_tank_modifier * _p_2,
				'b_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_t_afv_wheeled_01_cannon_f',_p_1,
				'i_apc_tracked_03_cannon_f',_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_1,
				'i_lt_01_at_f',_p_1,
				'i_lt_01_cannon_f',_p_1,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_t_apc_wheeled_01_cannon_f',_p_1,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_t_lsv_01_at_f',_tank_modifier * _p_2,
				'b_t_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 20) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_afv_wheeled_01_cannon_f',_p_2,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_t_afv_wheeled_01_cannon_f',_p_2,
				'i_apc_tracked_03_cannon_f',_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 30) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_apc_wheeled_01_cannon_f',_p_3,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_t_apc_wheeled_01_cannon_f',_p_3,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 40) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_2,
				'i_lt_01_at_f',_p_2,
				'i_lt_01_cannon_f',_p_2,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	_return;
};
if (_case isEqualTo 4) exitWith {
	// Grid/Insurgency AOs
	_return = [
		[
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_2,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_2,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_2
		],
		[
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_2,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_2,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_2
		]
	] select (worldName in ['Tanoa','Lingor3']);
	_return;
};
if (_case isEqualTo 5) exitWith {
	// Ambient Hostility - low target knowledge
	_return = [
		[
			'b_mbt_01_tusk_f',0,
			'b_afv_wheeled_01_up_cannon_f',0,
			'b_mbt_01_cannon_f',0.1,
			'i_mbt_03_cannon_f',0.1,
			'b_apc_tracked_01_aa_f',0,
			'b_afv_wheeled_01_cannon_f',0.1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),0.1,
			'i_lt_01_aa_f',1,
			'i_lt_01_at_f',1,
			'i_lt_01_cannon_f',1,			
			'i_apc_wheeled_03_cannon_f',0.5,
			'b_apc_wheeled_01_cannon_f',0.5,
			'b_mrap_01_gmg_f',1,
			'b_mrap_01_hmg_f',1,
			'i_mrap_03_gmg_f',1,
			'i_mrap_03_hmg_f',1,
			'b_lsv_01_at_f',1,
			'b_lsv_01_armed_f',1,
			'b_g_offroad_01_at_f',1,
			'b_g_offroad_01_armed_f',1,
			'i_c_offroad_02_at_f',1,
			'i_c_offroad_02_lmg_f',1
		],
		[
			'b_t_mbt_01_tusk_f',0,
			'b_t_afv_wheeled_01_up_cannon_f',0,
			'b_t_mbt_01_cannon_f',0.1,
			'i_mbt_03_cannon_f',0.1,
			'b_t_apc_tracked_01_aa_f',0,
			'b_t_afv_wheeled_01_cannon_f',0.1,
			'i_apc_tracked_03_cannon_f',0.1,
			'i_lt_01_aa_f',1,
			'i_lt_01_at_f',1,
			'i_lt_01_cannon_f',1,
			'i_apc_wheeled_03_cannon_f',0.5,
			'b_t_apc_wheeled_01_cannon_f',0.5,
			'b_t_mrap_01_gmg_f',1,
			'b_t_mrap_01_hmg_f',1,
			'i_mrap_03_gmg_f',1,
			'i_mrap_03_hmg_f',1,
			'b_t_lsv_01_at_f',1,
			'b_t_lsv_01_armed_f',1,
			'b_g_offroad_01_at_f',1,
			'b_g_offroad_01_armed_f',1,
			'i_c_offroad_02_at_f',1,
			'i_c_offroad_02_lmg_f',1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	_return;
};
if (_case isEqualTo 6) exitWith {
	// Ambient Hostility - higher target knowledge
	_return = [
		[
			'b_mbt_01_tusk_f',0,
			'b_afv_wheeled_01_up_cannon_f',0,
			'b_mbt_01_cannon_f',0.1,
			'i_mbt_03_cannon_f',0.1,
			'b_apc_tracked_01_aa_f',0,
			'b_afv_wheeled_01_cannon_f',0.1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),0.1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',2,
			'i_lt_01_cannon_f',2,			
			'i_apc_wheeled_03_cannon_f',1,
			'b_apc_wheeled_01_cannon_f',1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',0,
			'b_t_afv_wheeled_01_up_cannon_f',0,
			'b_t_mbt_01_cannon_f',0.1,
			'i_mbt_03_cannon_f',0.1,
			'b_t_apc_tracked_01_aa_f',0,
			'b_t_afv_wheeled_01_cannon_f',0.1,
			'i_apc_tracked_03_cannon_f',0.1,
			'i_lt_01_aa_f',_air_modifier * _p_1,
			'i_lt_01_at_f',2,
			'i_lt_01_cannon_f',2,
			'i_apc_wheeled_03_cannon_f',1,
			'b_t_apc_wheeled_01_cannon_f',1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	_return;
};
if (_case isEqualTo 7) exitWith {
	// Classic AO - armed
	_return = [
		[
			'b_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_afv_wheeled_01_cannon_f',_p_1,
			(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_3,
			'i_lt_01_at_f',_p_3,
			'i_lt_01_cannon_f',_p_3,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_apc_wheeled_01_cannon_f',_p_1,
			'b_mrap_01_gmg_f',_p_1,
			'b_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_lsv_01_at_f',_tank_modifier * _p_1,
			'b_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		],
		[
			'b_t_mbt_01_tusk_f',_tank_modifier * _p_0,
			'b_t_afv_wheeled_01_up_cannon_f',_tank_modifier * _p_0,
			'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
			'i_mbt_03_cannon_f',_tank_modifier * _p_1,
			'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
			'b_t_afv_wheeled_01_cannon_f',_p_1,
			'i_apc_tracked_03_cannon_f',_p_1,
			'i_lt_01_aa_f',_air_modifier * _p_3,
			'i_lt_01_at_f',_p_3,
			'i_lt_01_cannon_f',_p_3,
			'i_apc_wheeled_03_cannon_f',_p_1,
			'b_t_apc_wheeled_01_cannon_f',_p_1,
			'b_t_mrap_01_gmg_f',_p_1,
			'b_t_mrap_01_hmg_f',_p_1,
			'i_mrap_03_gmg_f',_p_1,
			'i_mrap_03_hmg_f',_p_1,
			'b_t_lsv_01_at_f',_tank_modifier * _p_1,
			'b_t_lsv_01_armed_f',_p_1,
			'b_g_offroad_01_at_f',_tank_modifier * _p_1,
			'b_g_offroad_01_armed_f',_p_1,
			'i_c_offroad_02_at_f',_tank_modifier * _p_1,
			'i_c_offroad_02_lmg_f',_p_1
		]
	] select (worldName in ['Tanoa','Lingor3']);
	if (_allPlayersCount > 10) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_afv_wheeled_01_cannon_f',_p_1,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_apc_wheeled_01_cannon_f',_p_1,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_lsv_01_at_f',_tank_modifier * _p_2,
				'b_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_1,
				'b_t_afv_wheeled_01_cannon_f',_p_1,
				'i_apc_tracked_03_cannon_f',_p_1,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_1,
				'b_t_apc_wheeled_01_cannon_f',_p_1,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_2,
				'i_mrap_03_hmg_f',_p_2,
				'b_t_lsv_01_at_f',_tank_modifier * _p_2,
				'b_t_lsv_01_armed_f',_p_2,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 20) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_afv_wheeled_01_cannon_f',_p_2,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_2,
				'b_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_1,
				'i_mbt_03_cannon_f',_tank_modifier * _p_1,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_2,
				'b_t_afv_wheeled_01_cannon_f',_p_2,
				'i_apc_tracked_03_cannon_f',_p_2,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_3,
				'i_lt_01_cannon_f',_p_3,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_2,
				'b_t_mrap_01_hmg_f',_p_2,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 30) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
				'b_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_4,
				'i_lt_01_cannon_f',_p_4,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_apc_wheeled_01_cannon_f',_p_3,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_1) * 0.75),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_1) * 0.75),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_2,
				'i_mbt_03_cannon_f',_tank_modifier * _p_2,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_3,
				'i_lt_01_at_f',_p_4,
				'i_lt_01_cannon_f',_p_4,
				'i_apc_wheeled_03_cannon_f',_p_3,
				'b_t_apc_wheeled_01_cannon_f',_p_3,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_0,
				'b_g_offroad_01_armed_f',_p_0,
				'i_c_offroad_02_at_f',_tank_modifier * _p_0,
				'i_c_offroad_02_lmg_f',_p_0
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	if (_allPlayersCount > 40) then {
		_return = [
			[
				'b_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.5),
				'b_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.5),
				'b_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_afv_wheeled_01_cannon_f',_p_3,
				(['i_apc_tracked_03_cannon_f','i_e_apc_tracked_03_cannon_f'] select (worldName isEqualTo 'Enoch')),_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_4,
				'i_lt_01_at_f',_p_4,
				'i_lt_01_cannon_f',_p_4,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_apc_wheeled_01_cannon_f',_p_2,
				'b_mrap_01_gmg_f',_p_1,
				'b_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_lsv_01_at_f',_tank_modifier * _p_1,
				'b_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			],
			[
				'b_t_mbt_01_tusk_f',((_tank_modifier * _p_2) * 0.5),
				'b_t_afv_wheeled_01_up_cannon_f',((_tank_modifier * _p_2) * 0.5),
				'b_t_mbt_01_cannon_f',_tank_modifier * _p_3,
				'i_mbt_03_cannon_f',_tank_modifier * _p_3,
				'b_t_apc_tracked_01_aa_f',_air_modifier * _p_3,
				'b_t_afv_wheeled_01_cannon_f',_p_3,
				'i_apc_tracked_03_cannon_f',_p_3,
				'i_lt_01_aa_f',_air_modifier * _p_4,
				'i_lt_01_at_f',_p_4,
				'i_lt_01_cannon_f',_p_4,
				'i_apc_wheeled_03_cannon_f',_p_2,
				'b_t_apc_wheeled_01_cannon_f',_p_2,
				'b_t_mrap_01_gmg_f',_p_1,
				'b_t_mrap_01_hmg_f',_p_1,
				'i_mrap_03_gmg_f',_p_1,
				'i_mrap_03_hmg_f',_p_1,
				'b_t_lsv_01_at_f',_tank_modifier * _p_1,
				'b_t_lsv_01_armed_f',_p_1,
				'b_g_offroad_01_at_f',_tank_modifier * _p_1,
				'b_g_offroad_01_armed_f',_p_1,
				'i_c_offroad_02_at_f',_tank_modifier * _p_1,
				'i_c_offroad_02_lmg_f',_p_1
			]
		] select (worldName in ['Tanoa','Lingor3']);
	};
	_return;
};
_return;