/*/
File: fn_aoEnemy.sqf
Author:

	Quiksilver
	
Last modified:

	22/08/2022 A3 2.10 by Quiksilver
	
Description:

	AO Enemies
______________________________________________/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** fn_aoEnemy START *****';
diag_log '****************************************************';
params ['_pos','_isHCEnabled','_aoData'];
private _terrainData = missionNamespace getVariable ['QS_classic_terrainData',[ [],[],[],[],[],[],[],[],[],[] ] ];
private _enemiesArray = [];
private _playerCount = count allPlayers;
private _randomPos = missionNamespace getVariable 'QS_aoPos';
private _aoPos = missionNamespace getVariable 'QS_aoPos';
private _playerThreshold = round (random [15,20,25]);
private _QS_new = FALSE;
private _isArmedAirEnabled = missionNamespace getVariable ['QS_armedAirEnabled',TRUE];
private _unit = objNull;
private _unit1 = objNull;
private _unit2 = objNull;
private _unit3 = objNull;
private _dirToCenter = 0;
private _infTypes = [
	'OIA_InfSquad',4,
	'OIA_InfTeam',2,
	'OIA_InfAssault',2,
	'OIA_InfTeam_AA',3,
	'OIA_InfTeam_AT',0.5,
	'OIA_InfTeam_HAT',1,
	'OI_reconPatrol',1,
	'OIA_ReconSquad',1,
	'OIA_InfTeam_LAT',2,
	'OIA_ARTeam',2
];
private _infUrbanType = '';
private _infUrbanTypes = [
	'OIA_ARTeam',2,
	'OIA_InfTeam_AT',1,
	'OIA_InfTeam_LAT',1
];
private _officerType = ['O_officer_F','O_T_Officer_F'] select (worldName in ['Tanoa','Enoch']);
private _engineerType = ['O_engineer_F','O_T_Engineer_F'] select (worldName in ['Tanoa','Enoch']);
private _basePos = markerPos 'QS_marker_base_marker';
private _aoSize = missionNamespace getVariable ['QS_aoSize',750];
private _QS_HQpos = missionNamespace getVariable 'QS_HQpos';
private _centerPos = _pos;
private _centerRadius = _aoSize;
private _roadPositionsValid = (((_centerPos select [0,2]) nearRoads _centerRadius) select {((_x isEqualType objNull) && ((roadsConnectedTo _x) isNotEqualTo []))}) apply {(getPosATL _x)};
private _allowVehicles = (count (_terrainData # 1)) > 40;
private _registeredPositions = missionNamespace getVariable ['QS_registeredPositions',[]];
private _buildingPositionsInArea = _terrainData # 6;
private _manyBuildingPositions = (count _buildingPositionsInArea) > 100;
if (_allowVehicles) then {
	_roadPositionsValid = _roadPositionsValid call (missionNamespace getVariable 'QS_fnc_arrayShuffle');
};
diag_log format ['***** AO ENEMY * NEAR ROADS COUNT: %1 *****',(count _roadPositionsValid)];

/*/=============================================================== AA VEHICLE/*/

private _aaArray = [];
if (_playerCount > 0) then {
	diag_log '****************************************************';
	diag_log '***** AO ENEMY ***** Spawning Fortified AA *****';
	diag_log '****************************************************';
	private _aaCount = 2;
	for '_x' from 1 to _aaCount step 1 do {
		_aaArray = [_centerPos] call (missionNamespace getVariable 'QS_fnc_aoFortifiedAA');
		if (_aaArray isNotEqualTo []) then {
			{
				_enemiesArray pushBack _x;
			} forEach _aaArray;
		};
	};
};

/*/=============================================================== INFANTRY PATROLS RANDOM/*/
	
diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning infantry patrols *****';
diag_log '****************************************************';
private _grpCount = 8;
if (_playerCount > 10) then {_grpCount = [12,10] select _allowVehicles;};
if (_playerCount > 20) then {_grpCount = [12,10] select _allowVehicles;};
if (_playerCount > 30) then {_grpCount = [15,13] select _allowVehicles;};
if (_playerCount > 40) then {_grpCount = [15,13] select _allowVehicles;};
if (_playerCount > 50) then {_grpCount = [15,13] select _allowVehicles;};
if (worldName isEqualTo 'Altis') then {
	if (_playerCount > 10) then {_grpCount = [12,10] select _allowVehicles;};
	if (_playerCount > 20) then {_grpCount = [12,10] select _allowVehicles;};
	if (_playerCount > 30) then {_grpCount = [15,13] select _allowVehicles;};
	if (_playerCount > 40) then {_grpCount = [15,13] select _allowVehicles;};
	if (_playerCount > 50) then {_grpCount = [15,13] select _allowVehicles;};
};
if (worldName in ['Tanoa','Lingor3']) then {
	if (_playerCount > 10) then {_grpCount = [10,8] select _allowVehicles;};
	if (_playerCount > 20) then {_grpCount = [10,8] select _allowVehicles;};
	if (_playerCount > 30) then {_grpCount = [13,11] select _allowVehicles;};
	if (_playerCount > 40) then {_grpCount = [13,11] select _allowVehicles;};
	if (_playerCount > 50) then {_grpCount = [13,11] select _allowVehicles;};
};
if (worldName isEqualTo 'Malden') then {
	if (_playerCount > 10) then {_grpCount = [10,8] select _allowVehicles;};
	if (_playerCount > 20) then {_grpCount = [10,8] select _allowVehicles;};
	if (_playerCount > 30) then {_grpCount = [13,11] select _allowVehicles;};
	if (_playerCount > 40) then {_grpCount = [13,11] select _allowVehicles;};
	if (_playerCount > 50) then {_grpCount = [13,11] select _allowVehicles;};
};
_placeTypes = [
	'(1 + houses)',2,
	'(1 + forest)',1,
	'(1 + forest) * (1 + houses)',1,
	'(1 + meadow)',1
];
private _placeType = '';
private _patrolRoute = [];
private _forestPositions = _terrainData # 8;
private _nearForestPositions = [];
private _nearForestPosition = [0,0,0];
private _forestPositionIndex = -1;
private _patrolGroup = grpNull;
private _bestPlaces = [];
for '_x' from 0 to (_grpCount - 1) step 1 do {
	if ((random 1) > 0.5) then {
		_bestPlaces = [];
	} else {
		_bestPlaces = [_centerPos,_aoSize,(selectRandomWeighted _placeTypes),15,3];
	};
	_randomPos = ['RADIUS',_centerPos,([_aoSize,_aoSize * 0.85] select ((random 1) > 0.5)),'LAND',[1.5,-1,0.5,3,0,FALSE,objNull],TRUE,_bestPlaces,[],FALSE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
	_patrolGroup = [_randomPos,(random 360),EAST,(selectRandomWeighted _infTypes),FALSE,grpNull,TRUE] call (missionNamespace getVariable 'QS_fnc_spawnGroup');
	[_patrolGroup,_randomPos,200,TRUE] call (missionNamespace getVariable 'QS_fnc_taskPatrol');		//125
	[(units _patrolGroup),1] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
	{
		[_x] call (missionNamespace getVariable 'QS_fnc_setCollectible');
		_x setVehiclePosition [(getPosWorld _x), [], 0, 'CAN_COLLIDE'];
		_enemiesArray pushBack _x;
	} forEach (units _patrolGroup);
	_patrolRoute = (_patrolGroup getVariable 'QS_AI_GRP_TASK') # 1;
	if (_registeredPositions isNotEqualTo []) then {
		_patrolRoute pushBack ((selectRandom _registeredPositions) getPos [(30 + (random 30)),random 360]);
	};
	if (_manyBuildingPositions) then {
		_patrolRoute pushBack (selectRandom _buildingPositionsInArea);
	};
	_nearForestPositions = _forestPositions inAreaArray [_randomPos,_aoSize,_aoSize,0,FALSE];
	if (_nearForestPositions isNotEqualTo []) then {
		_nearForestPosition = selectRandom _nearForestPositions;
		_forestPositionIndex = _forestPositions find _nearForestPosition;
		_forestPositions set [_forestPositionIndex,FALSE];
		_forestPositions deleteAt _forestPositionIndex;
		_patrolRoute pushBack _nearForestPosition;
		_patrolRoute = _patrolRoute call (missionNamespace getVariable 'QS_fnc_arrayShuffle');
		_patrolGroup setVariable ['QS_AI_GRP_TASK',[((_patrolGroup getVariable 'QS_AI_GRP_TASK') # 0),_patrolRoute,((_patrolGroup getVariable 'QS_AI_GRP_TASK') # 2),((_patrolGroup getVariable 'QS_AI_GRP_TASK') # 3)],QS_system_AI_owners];
	};
	_patrolGroup setVariable ['QS_AI_GRP',TRUE,QS_system_AI_owners];
	_patrolGroup setVariable ['QS_AI_GRP_CONFIG',['GENERAL','INFANTRY',(count (units _patrolGroup))],QS_system_AI_owners];
	_patrolGroup setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],QS_system_AI_owners];
	_patrolGroup setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
};

/*/=============================================================== STATIC WEAPONS/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning static weapons *****';
diag_log '****************************************************';

private _usedSettlementPosition = FALSE;
private _dir = 0;
private _building = objNull;
if (missionNamespace getVariable ['QS_ao_terrainIsSettlement',FALSE]) then {
	if ((random 1) > 0.5) then {
		if ((missionNamespace getVariable ['QS_ao_objsUsedTerrainBldgs',0]) <= 2) then {
			_buildingTypes = (call (missionNamespace getVariable 'QS_data_smallBuildingTypes')) select {(sizeOf _x) >= 10};
			_buildingList = (nearestObjects [_centerPos,_buildingTypes,_aoSize * 0.75,TRUE]) select {!isObjectHidden _x};
			if (_buildingList isNotEqualTo []) then {
				_randomPos = [0,0,0];
				for '_i' from 0 to 9 step 1 do {
					_building = selectRandom _buildingList;
					_randomPos = getPosATL _building;
					if (
						((_randomPos distance2D _QS_HQpos) > 100) && 
						((_registeredPositions inAreaArray [_randomPos,50,50,0,FALSE]) isEqualTo [])
					) exitWith {};
				};
				_usedSettlementPosition = TRUE;
				_dir = getDir _building;
				_building allowDamage FALSE;
				_building hideObjectGlobal TRUE;
				(missionNamespace getVariable 'QS_virtualSectors_hiddenTerrainObjects') pushBack _building;
			};
		};
	};
};
if (!_usedSettlementPosition) then {
	for '_x' from 0 to 49 step 1 do {
		_randomPos = ['RADIUS',_centerPos,(_aoSize * 0.85),'LAND',[5,0,0.3,5,0,FALSE,objNull],FALSE,[],[],TRUE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
		if (
			((_registeredPositions inAreaArray [_randomPos,100,100,0,FALSE]) isEqualTo []) && 
			((((_randomPos select [0,2]) nearRoads 25) select {((_x isEqualType objNull) && ((roadsConnectedTo _x) isNotEqualTo []))}) isEqualTo [])
		) exitWith {};
	};
};
_list = [
	["Land_Mil_WallBig_4m_F",[-0.354004,-0.0078125,11.045],0,270.632],
	["Land_Mil_WallBig_4m_F",[-0.0952148,0.0634766,11.082],0,0],
	["O_HMG_02_high_F",[-2.18506,-2.04688,10.4124],0,234.27],
	["O_HMG_02_high_F",[-1.84229,2.15332,10.4124],0,309.028],
	["O_HMG_02_high_F",[2.16064,1.62402,10.4124],0,42.212],
	["O_HMG_02_high_F",[1.96973,-2.24854,10.4124],0,139.225]
];
_tower = createVehicle ['CargoPlaftorm_01_green_F',[0,0,0]];
if (_usedSettlementPosition) then {
	_tower setPos _randomPos;
	//_tower setDir _dir;
} else {
	_tower setPosASL _randomPos;
	//_tower setDir (random 360);
};
missionNamespace setVariable ['QS_registeredPositions',((missionNamespace getVariable 'QS_registeredPositions') + [_randomPos]),FALSE];
_tower addEventHandler [
	'Deleted',
	{
		params ['_tower'];
		{
			deleteVehicle _x;
		} forEach (_tower getVariable ['QS_entity_assocEntities',[]]);
	}
];
_tower addEventHandler [
	'Killed',
	{
		params ['_tower'];
		{
			deleteVehicle _x;
		} forEach (_tower getVariable ['QS_entity_assocEntities',[]]);
	}
];
_tower setVectorUp [0,0,1];
sleep 0.5;
_enemiesArray pushBack _tower;
private _object = objNull;
private _offset = 5;
private _attachPos = [0,0,0];
_tower setVariable ['QS_entity_assocEntities',[],FALSE];
_towerGrp = createGroup [EAST,TRUE];
{
	_object = createVehicle [_x # 0,[0,0,0]];
	_object allowDamage FALSE;
	_attachPos = _x # 1;
	_attachPos set [2,(_attachPos # 2) - _offset];
	_object attachTo [_tower,_attachPos];
	_object setDir ((getDir _tower) + (_x # 3));
	_object spawn {sleep 1; detach _this;};
	_tower setVariable ['QS_entity_assocEntities',((_tower getVariable ['QS_entity_assocEntities',[]]) + [_object]),FALSE];
	_enemiesArray pushBack _object;
	if (_object isKindOf 'StaticWeapon') then {
		if (_playerCount < 30) then {
			[_object] call (missionNamespace getVariable 'QS_fnc_downgradeVehicleWeapons');
		} else {
			if ((random 1) > 0.666) then {
				[_object] call (missionNamespace getVariable 'QS_fnc_downgradeVehicleWeapons');
			};
		};
		_grp = createVehicleCrew _object;
		(units _grp) joinSilent _towerGrp;
		(gunner _object) setVariable ['QS_AI_UNIT_isMG',TRUE,QS_system_AI_owners];
		(gunner _object) setVariable ['QS_AI_UNIT_enabled',TRUE,QS_system_AI_owners];
		(gunner _object) addEventHandler [
			'Hit',
			{
				params ['_unit','_source','_damage','_instigator'];
				if (!isNull _source) then {
					_unit reveal [_source,4];
					(group _unit) reveal [_source,4];
				};
				if (!isNull _instigator) then {
					_unit reveal [_instigator,4];
					(group _unit) reveal [_instigator,4];
				};
			}
		];
		(gunner _object) addEventHandler [
			'Killed',
			{
				_killed = _this # 0;
				if (!isNull _killed) then {
					if (!isNull (_killed getVariable 'QS_staticGunnerVehicle')) then {
						(_killed getVariable 'QS_staticGunnerVehicle') setDamage 1;
					};
				};
			}
		];
		_object addEventHandler [
			'GetOut',
			{
				(_this # 2) setDamage 1;
				(_this # 0) setDamage 1;
			}
		];
		_object addEventHandler [
			'Deleted',
			{
				params ['_object'];
			}
		];
		_object lock 3;
		if (
			((random 1) > 0.333) ||
			{(_playerCount < 20)}
		) then {
			_object removeWeaponTurret ['HMG_M2_Mounted',[0]];
			{
				_object addWeaponTurret _x;
			} forEach [
				['M134_minigun',[0]]
			];
			{
				_object addMagazineTurret _x;
			} forEach [
				['5000Rnd_762x51_Yellow_Belt',[0]],
				['5000Rnd_762x51_Yellow_Belt',[0]],
				['5000Rnd_762x51_Yellow_Belt',[0]],
				['5000Rnd_762x51_Yellow_Belt',[0]]
			];
		};
		_enemiesArray pushBack (gunner _object);
		(gunner _object) setVariable ['QS_staticGunnerVehicle',_object,FALSE];
		(gunner _object) enableAIFeature ['PATH',FALSE];
		(gunner _object) enableAIFeature ['COVER',FALSE];
		
		if (worldName in ['Tanoa','Enoch']) then {
			(gunner _object) setUnitLoadout 'o_t_soldier_f';
		};
		_object enableDynamicSimulation TRUE;
		(gunner _object) enableDynamicSimulation TRUE;
	} else {
		_object enableSimulationGlobal FALSE;
	};
} forEach _list;
[(units _towerGrp),3] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
_towerGrp setGroupIdGlobal ['HMG Tower'];
_towerGrp setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
_towerGrp setCombatMode 'RED';
_towerGrp setBehaviourStrong 'COMBAT';
_towerGrp setCombatBehaviour 'COMBAT';
_towerGrp enableAttack TRUE;

/*/=============================================================== INFANTRY OVERWATCH/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning infantry overwatch *****';
diag_log '****************************************************';

_grpCount = 3;
if (_playerCount > 15) then {
	_grpCount = 4;
	if (_playerCount > 30) then {
		_grpCount = 5;
	};
};
private _overwatchGroup = grpNull;
for '_x' from 0 to _grpCount step 1 do {
	private _watchPos = selectRandom [(ATLToASL _centerPos),(ATLToASL _QS_HQpos),(ATLToASL (getPosATL (missionNamespace getVariable 'QS_radioTower')))];
	
	for '_z' from 0 to 49 step 1 do {
		_randomPos = [_watchPos,(_aoSize * 0.8),25,10,[[objNull,'VIEW'],(0.1 max (random 1))]] call (missionNamespace getVariable 'QS_fnc_findOverwatchPos');
		if (
			(!([_randomPos,50,6] call (missionNamespace getVariable 'QS_fnc_waterInRadius')))
		) exitWith {};
	};
	
	
	
	_infUrbanType = selectRandomWeighted _infUrbanTypes;
	_overwatchGroup = [_randomPos,(random 360),EAST,_infUrbanType,FALSE] call (missionNamespace getVariable 'QS_fnc_spawnGroup');
	[(units _overwatchGroup),2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
	if ((random 1) > 0.5) then {
		[_overwatchGroup,_randomPos,65,TRUE] call (missionNamespace getVariable 'QS_fnc_taskPatrol');
	} else {
		if ((random 1) > 0.8) then {
			_overwatchGroup setFormDir (random 360);
		} else {
			_overwatchGroup setFormDir (_randomPos getDir _watchPos);
		};
		{_x setUnitPos 'Middle';} count (units _overwatchGroup);
	};
	{
		_x setVehiclePosition [(getPosWorld _x),[],0,'CAN_COLLIDE'];
		[_x] call (missionNamespace getVariable 'QS_fnc_setCollectible');
		0 = _enemiesArray pushBack _x;
	} count (units _overwatchGroup);
	_overwatchGroup setVariable ['QS_AI_GRP',TRUE,QS_system_AI_owners];
	_overwatchGroup setVariable ['QS_AI_GRP_CONFIG',['GENERAL','INFANTRY',(count (units _overwatchGroup))],QS_system_AI_owners];
	_overwatchGroup setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],QS_system_AI_owners];
	_overwatchGroup setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
};

/*/=============================================================== GROUND VEHICLE RANDOM/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning Armored Vehicles *****';
diag_log '****************************************************';

private _vehCount = [1,2] select _allowVehicles;
if (_playerCount > 10) then {
	_vehCount = [2,3] select _allowVehicles;
};
if (_playerCount > 20) then {
	_vehCount = [2,3] select _allowVehicles;
};
if (_playerCount > 30) then {
	_vehCount = [3,4] select _allowVehicles;
};
if (_playerCount > 40) then {
	_vehCount = [4,5] select _allowVehicles;
};	
if (_playerCount > 50) then {
	_vehCount = [4,5] select _allowVehicles;
};
private _AOveh = objNull;
private _AOvehGroup = grpNull;
for '_x' from 0 to (_vehCount - 1) step 1 do {
	_AOvehGroup = createGroup [EAST,TRUE];
	if (_allowVehicles) then {
		_randomPos = selectRandom _roadPositionsValid;
	} else {
		_randomPos = [_centerPos,0,_aoSize,2.5,0,0.4,0] call (missionNamespace getVariable 'QS_fnc_findSafePos');
	};
	_AOveh = createVehicle [(selectRandomWeighted ([([0,7] select _allowVehicles)] call (missionNamespace getVariable 'QS_fnc_getAIMotorPool'))),[(_randomPos # 0),(_randomPos # 1),0.25],[],0,'NONE'];
	_AOveh allowDamage FALSE;
	_AOveh limitSpeed (random [30,40,50]);
	(missionNamespace getVariable 'QS_AI_vehicles') pushBack _AOveh;
	clearMagazineCargoGlobal _AOveh;
	clearWeaponCargoGlobal _AOveh;
	clearItemCargoGlobal _AOveh;
	clearBackpackCargoGlobal _AOveh;
	_AOveh setUnloadInCombat [TRUE,FALSE];
	[0,_AOveh,EAST] call (missionNamespace getVariable 'QS_fnc_vSetup2');
	_AOveh addEventHandler ['GetOut',(missionNamespace getVariable 'QS_fnc_AIXDismountDisabled')];
	_AOveh enableRopeAttach FALSE;
	_AOveh enableVehicleCargo FALSE;
	if (random 1 >= 0.25) then {_AOveh allowCrewInImmobile [TRUE,TRUE];};
	/*/_AOveh forceFollowRoad TRUE;/*/
	_AOveh setConvoySeparation 50;
	[_AOveh] spawn {sleep 5; (_this # 0) allowDamage TRUE;};
	_AOveh setVectorUp (surfaceNormal _randomPos);
	if (_playerCount < 30) then {
		[_AOveh] call (missionNamespace getVariable 'QS_fnc_downgradeVehicleWeapons');
	} else {
		if ((random 1) > 0.5) then {
			[_AOveh] call (missionNamespace getVariable 'QS_fnc_downgradeVehicleWeapons');
		};
	};
	_AOveh addEventHandler ['Killed',(missionNamespace getVariable 'QS_fnc_vKilled2')];
	_unit1 = _AOvehGroup createUnit [_engineerType,_randomPos,[],0,'NONE'];
	_unit1 = _unit1 call (missionNamespace getVariable 'QS_fnc_unitSetup');
	_unit1 assignAsDriver _AOveh;
	_unit1 moveInDriver _AOveh;
	_unit2 = _AOvehGroup createUnit [_engineerType,_randomPos,[],0,'NONE'];
	_unit2 = _unit2 call (missionNamespace getVariable 'QS_fnc_unitSetup');
	_unit2 assignAsGunner _AOveh;
	_unit2 moveInGunner _AOveh;
	if ((_AOveh emptyPositions 'commander') isEqualTo 1) then {
		_unit3 = _AOvehGroup createUnit [_engineerType,_randomPos,[],0,'NONE'];
		_unit3 = _unit3 call (missionNamespace getVariable 'QS_fnc_unitSetup');
		_unit3 assignAsCommander _AOveh;
		_unit3 moveInCommander _AOveh;
	};
	_AOvehGroup addVehicle _AOveh;
	[_AOvehGroup,_randomPos,_aoSize,_roadPositionsValid,TRUE] call (missionNamespace getVariable 'QS_fnc_taskPatrolVehicle');
	_AOveh lock 3;
	if (_AOveh isKindOf 'mbt_04_base_f') then {
		[(units _AOvehGroup),3] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
	} else {
		[(units _AOvehGroup),2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
	};
	{
		_x setVariable ['BIS_noCoreConversations',TRUE,FALSE];
		0 = _enemiesArray pushBack _x;
	} count (units _AOvehGroup);
	_unit2 setSkill ['aimingAccuracy',0.1];
	_AOvehGroup allowFleeing 0;
	0 = _enemiesArray pushBack _AOveh;
	_AOvehGroup setVariable ['QS_AI_GRP',TRUE,QS_system_AI_owners];
	_AOvehGroup setVariable ['QS_AI_GRP_CONFIG',['GENERAL','VEHICLE',(count (units _AOvehGroup)),_AOveh],QS_system_AI_owners];
	_AOvehGroup setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],QS_system_AI_owners];
};

/*/===== Spawning Support vehicle/*/

if (_allowVehicles) then {
	private _supportData = [];
	private _supportEntities = [];
	private _supportElement = [];
	private _supportEntity = objNull;
	_supportData pushBack ['REPAIR',TRUE,[_roadPositionsValid]];
	if ((random 1) > 0.5) then {
		_supportData pushBack ['MEDICAL',TRUE,[_roadPositionsValid]];
	};
	{
		_supportElement = _x;
		_supportEntities = _supportElement call (missionNamespace getVariable 'QS_fnc_spawnSupport');
		{
			_supportEntity = _x;
			_enemiesArray pushBack _supportEntity;
		} forEach _supportEntities;
	} forEach _supportData;
};

/*/=============================================================== SNIPERS/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning Snipers *****';
diag_log '****************************************************';
private _sniperGroup = grpNull;
private _towerPos = getPosATL (missionNamespace getVariable 'QS_radioTower');
for '_x' from 0 to ([1,2] select (_playerCount > 30)) step 1 do {
	private _watchPos = selectRandom [(ATLToASL _towerPos),(AGLToASL _QS_HQpos)];
	_randomPos = [_watchPos,(_aoSize * 1.25),(_aoSize * 0.5),10,[[objNull,'VIEW'],0.75]] call (missionNamespace getVariable 'QS_fnc_findOverwatchPos');
	_sniperGroup = [_randomPos,(random 360),EAST,'OI_SniperTeam_2',FALSE] call (missionNamespace getVariable 'QS_fnc_spawnGroup');
	_sniperGroup setCombatMode 'RED';
	_sniperGroup setBehaviourStrong 'STEALTH';
	[(units _sniperGroup),(selectRandom [3,4])] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
	_sniperGroup setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
	_dirToCenter = _randomPos getDir _watchPos;
	_sniperGroup setFormDir _dirToCenter;
	{
		_x setUnitPos (['MIDDLE','DOWN'] select (_playerCount > 10));
	} forEach (units _sniperGroup);
	{
		_x setVehiclePosition [(getPosWorld _x),[],0,'CAN_COLLIDE'];
		[_x] call (missionNamespace getVariable 'QS_fnc_setCollectible');
		_x doWatch (ASLToAGL _watchPos); 
		0 = _enemiesArray pushBack _x;
	} count (units _sniperGroup);
};

/*/=============================================================== AO MORTAR PIT/*/

if ((random 1) > 0.5) then {
	diag_log '****************************************************';
	diag_log '***** AO ENEMY ***** Spawning Mortar Pit *****';
	diag_log '****************************************************';
	private _mortarPit = [_centerPos] call (missionNamespace getVariable 'QS_fnc_aoMortarPit');
	if (_mortarPit isNotEqualTo []) then {
		{
			0 = _enemiesArray pushBack _x;
		} count _mortarPit;
	};
};

/*/=============================================================== ENEMIES IN BUILDINGS/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning Enemies in buildings *';
diag_log '****************************************************';

private _AOgarrisonGroup = grpNull;
private _toGarrison = [];
private _indArray = [
	"o_soldieru_a_f","o_soldieru_aar_f","o_soldieru_ar_f","o_soldieru_medic_f","o_engineer_u_f","o_soldieru_exp_f","o_soldieru_gl_f",
	"o_urban_heavygunner_f","o_soldieru_m_f","o_soldieru_at_f","o_soldieru_f","o_soldieru_lat_f","o_urban_sharpshooter_f",
	"o_soldieru_sl_f","o_soldieru_tl_f","o_g_engineer_f","o_g_medic_f","o_g_soldier_a_f","o_g_soldier_ar_f","o_g_soldier_exp_f","o_g_soldier_f","o_g_soldier_f",
	"o_g_soldier_gl_f","o_g_soldier_lat_f","o_g_soldier_lite_f","o_g_soldier_m_f","o_g_soldier_sl_f","o_g_soldier_tl_f",
	"o_g_sharpshooter_f","o_g_soldier_ar_f"
];
if ((count (_terrainData # 4)) > 6) then {
	if (worldName in ['Tanoa','Enoch']) then {
		_indArray = [
			"i_c_soldier_para_1_f","i_c_soldier_para_2_f","i_c_soldier_para_3_f","i_c_soldier_para_4_f","i_c_soldier_para_5_f","i_c_soldier_para_6_f",
			"i_c_soldier_para_7_f","i_c_soldier_para_8_f"
		];	
	};
	_AOgarrisonGroup = createGroup [RESISTANCE,TRUE];
	for '_x' from 0 to ([29,14] select (missionNamespace getVariable ['QS_ao_urbanSpawn',FALSE])) step 1 do {
		_randomUnit = selectRandom _indArray;
		_unit = _AOgarrisonGroup createUnit [_randomUnit,_centerPos,[],100,'NONE'];
		_unit = _unit call (missionNamespace getVariable 'QS_fnc_unitSetup');
		_enemiesArray pushBack _unit;
		_toGarrison pushBack _unit;
	};
	_AOgarrisonGroup setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
	[_toGarrison,2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
};
_QS_HQpos set [2,0];
private _resistanceGrp = createGroup [RESISTANCE,TRUE];
_unit = _resistanceGrp createUnit ['I_C_Soldier_Para_1_F',_QS_HQpos,[],10,'NONE'];
_unit = _unit call (missionNamespace getVariable 'QS_fnc_unitSetup');
_enemiesArray pushBack _unit;
_toGarrison pushBack _unit;
if (_toGarrison isNotEqualTo []) then {
	[_centerPos,(_aoSize * 0.9),_toGarrison,['House']] call (missionNamespace getVariable 'QS_fnc_garrisonUnits');
	_toGarrison joinSilent _resistanceGrp;
};
_resistanceGrp setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];

/*/=============================================================== ENEMIES IN HQ BUILDINGS/*/
if (worldName in ['Tanoa','Enoch']) then {
	_indArray = [
		'o_soldieru_ar_f','o_soldieru_medic_f','o_engineer_u_f','o_soldieru_exp_f','o_soldieru_gl_f',
		'o_urban_heavygunner_f','o_soldieru_m_f','o_soldieru_aa_f','o_soldieru_at_f','o_soldieru_lat_f','o_urban_sharpshooter_f'
	];
} else {
	_indArray = [
		'o_soldieru_ar_f','o_soldieru_medic_f','o_engineer_u_f','o_soldieru_exp_f','o_soldieru_gl_f',
		'o_urban_heavygunner_f','o_soldieru_m_f','o_soldieru_aa_f','o_soldieru_at_f','o_soldieru_lat_f','o_urban_sharpshooter_f'
	];
};
private _AOgarrisonGroup2 = createGroup [RESISTANCE,TRUE];
_toGarrison = [];
for '_x' from 0 to 8 step 1 do {
	_randomUnit = selectRandom _indArray;
	_unit = _AOgarrisonGroup2 createUnit [_randomUnit,_QS_HQpos,[],0,'NONE'];
	_unit = _unit call (missionNamespace getVariable 'QS_fnc_unitSetup');
	_enemiesArray pushBack _unit;
	_toGarrison pushBack _unit;
};
[_QS_HQpos,60,_toGarrison,[]] call (missionNamespace getVariable 'QS_fnc_garrisonUnits');
[_toGarrison,2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
_AOgarrisonGroup2 setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
{
	_x setDamage 0;
} forEach _toGarrison;

/*/=============================================================== BOAT PATROL/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning Boat Patrol *****';
diag_log '****************************************************';
if (((missionNamespace getVariable ['QS_classic_AOData',[]]) # 4) isEqualTo 1) then {
	private _boatArray = [(missionNamespace getVariable 'QS_AOpos')] call (missionNamespace getVariable 'QS_fnc_aoBoatPatrol');
	if (_boatArray isNotEqualTo []) then {
		{
			0 = _enemiesArray pushBack _x;
		} count _boatArray;
	};
};

/*/=============================================================== HQ GUARDS/*/

diag_log '****************************************************';
diag_log '***** AO ENEMY ***** Spawning HQ Guards *****';
diag_log '****************************************************';

_randomPos = ['RADIUS',_QS_HQpos,50,'LAND',[],FALSE,[],[0,40,'O_soldier_F'],FALSE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
_infUrbanType = selectRandomWeighted _infUrbanTypes;
private _hqGroup1 = [_randomPos,(random 360),EAST,_infUrbanType,FALSE] call (missionNamespace getVariable 'QS_fnc_spawnGroup');
[_hqGroup1,_QS_HQpos,70,TRUE] call (missionNamespace getVariable 'QS_fnc_taskPatrol');
[(units _hqGroup1),2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
_hqGroup1 setVariable ['QS_AI_GRP',TRUE,QS_system_AI_owners];
_hqGroup1 setVariable ['QS_AI_GRP_CONFIG',['GENERAL','INFANTRY',(count (units _hqGroup1))],QS_system_AI_owners];
_hqGroup1 setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],QS_system_AI_owners];
_hqGroup1 setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
{
	_x call (missionNamespace getVariable 'QS_fnc_unitSetup');
	_x setVehiclePosition [(getPosWorld _x),[],0,'CAN_COLLIDE'];
	0 = _enemiesArray pushBack _x;
} forEach (units _hqGroup1);
_infUrbanType = selectRandomWeighted _infUrbanTypes;
_randomPos = ['RADIUS',_QS_HQpos,50,'LAND',[],FALSE,[],[0,40,'O_soldier_F'],FALSE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
private _hqGroup2 = [_randomPos,(random 360),EAST,_infUrbanType,FALSE] call (missionNamespace getVariable 'QS_fnc_spawnGroup');
[_hqGroup2,_QS_HQpos,70,TRUE] call (missionNamespace getVariable 'QS_fnc_taskPatrol');
[(units _hqGroup2),2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
_hqGroup2 setVariable ['QS_AI_GRP',TRUE,QS_system_AI_owners];
_hqGroup2 setVariable ['QS_AI_GRP_CONFIG',['GENERAL','INFANTRY',(count (units _hqGroup2))],QS_system_AI_owners];
_hqGroup2 setVariable ['QS_AI_GRP_DATA',[TRUE,serverTime],QS_system_AI_owners];
_hqGroup2 setVariable ['QS_AI_GRP_HC',[0,-1],QS_system_AI_owners];
{
	_x call (missionNamespace getVariable 'QS_fnc_unitSetup');
	0 = _enemiesArray pushBack _x;
} forEach (units _hqGroup2);
private _commandGrp = createGroup [EAST,TRUE];
_commandGrp setGroupIdGlobal ['Command'];
_commandGrp setVariable ['QS_dynSim_ignore',TRUE,QS_system_AI_owners];
_commandGrp enableDynamicSimulation FALSE;
private _commander = _commandGrp createUnit [_officerType,_QS_HQpos,[],0,'NONE'];
{
	missionNamespace setVariable _x;
} forEach [
	['csatHQGroup',_commandGrp,FALSE],
	['QS_csatCommander',_commander,TRUE],
	['QS_commanderAlive',TRUE,FALSE]
];
_commander setVariable ['QS_surrenderable',TRUE,TRUE];
_commander allowDamage FALSE;
_commander enableStamina FALSE;
_commander enableFatigue FALSE;
_commander setVariable ['QS_dynSim_ignore',TRUE,QS_system_AI_owners];
private _headgear = ['H_Beret_blk','H_Beret_CSAT_01_F'] select ((random 1) > 0.9);
private _loadouts = [
	[
		[["sgun_HunterShotgun_01_sawedoff_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_O_OfficerUniform_ocamo",[["FirstAidKit",1],["Chemlight_red",1,1],["2Rnd_12Gauge_Pellets",4,2]]],["V_LegStrapBag_coyote_F",[["FirstAidKit",1],["2Rnd_12Gauge_Slug",5,2],["2Rnd_12Gauge_Pellets",5,2]]],["B_RadioBag_01_hex_F",[["2Rnd_12Gauge_Pellets",7,2],["2Rnd_12Gauge_Slug",5,2]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["arifle_AKS_F","","","",["30Rnd_545x39_Mag_F",30],[],""],[],[],["U_O_OfficerUniform_ocamo",[["FirstAidKit",1],["Chemlight_red",1,1],["30Rnd_545x39_Mag_Tracer_F",3,30]]],["V_LegStrapBag_coyote_F",[["FirstAidKit",1],["30Rnd_545x39_Mag_Tracer_F",9,30]]],["B_RadioBag_01_hex_F",[["30Rnd_545x39_Mag_Tracer_F",8,30],["SmokeShellRed",3,1]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["SMG_03C_TR_black","muzzle_snds_570","","optic_Nightstalker",["50Rnd_570x28_SMG_03",50],[],""],[],[],["U_O_OfficerUniform_ocamo",[["FirstAidKit",1],["Chemlight_red",1,1],["50Rnd_570x28_SMG_03",2,50]]],["V_LegStrapBag_coyote_F",[["FirstAidKit",1],["50Rnd_570x28_SMG_03",5,50]]],["B_RadioBag_01_hex_F",[["SmokeShellRed",3,1],["50Rnd_570x28_SMG_03",5,50]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["SMG_05_F","muzzle_snds_L","","optic_Nightstalker",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_O_OfficerUniform_ocamo",[["FirstAidKit",1],["Chemlight_red",1,1],["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",3,30]]],["V_LegStrapBag_coyote_F",[["FirstAidKit",1],["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",7,30]]],["B_RadioBag_01_hex_F",[["SmokeShellRed",3,1],["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",6,30]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["MMG_01_hex_F","muzzle_snds_93mmg_tan","","optic_Nightstalker",["150Rnd_93x64_Mag",150],[],"bipod_02_F_hex"],[],["hgun_Pistol_heavy_02_Yorris_F","","","optic_Yorris",["6Rnd_45ACP_Cylinder",6],[],""],["U_O_OfficerUniform_ocamo",[["FirstAidKit",1],["SmokeShellRed",3,1]]],["V_LegStrapBag_coyote_F",[["SmokeShell",1,1],["SmokeShellRed",1,1],["150Rnd_93x64_Mag",1,150]]],["B_RadioBag_01_hex_F",[["150Rnd_93x64_Mag",1,150],["SmokeShell",1,1],["SmokeShellRed",1,1]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]]
	],
	[
		[["sgun_HunterShotgun_01_sawedoff_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_O_T_Officer_F",[["FirstAidKit",1],["Chemlight_red",1,1],["2Rnd_12Gauge_Pellets",4,2]]],["V_LegStrapBag_black_F",[["FirstAidKit",1],["2Rnd_12Gauge_Slug",5,2],["2Rnd_12Gauge_Pellets",5,2]]],["B_RadioBag_01_ghex_F",[["2Rnd_12Gauge_Pellets",7,2],["2Rnd_12Gauge_Slug",5,2]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["arifle_AKS_F","","","",["30Rnd_545x39_Mag_F",30],[],""],[],[],["U_O_T_Officer_F",[["FirstAidKit",1],["Chemlight_red",1,1],["30Rnd_545x39_Mag_Tracer_F",3,30]]],["V_LegStrapBag_black_F",[["FirstAidKit",1],["30Rnd_545x39_Mag_Tracer_F",9,30]]],["B_RadioBag_01_ghex_F",[["30Rnd_545x39_Mag_Tracer_F",8,30],["SmokeShellRed",3,1]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["SMG_03C_TR_black","muzzle_snds_570","","optic_Nightstalker",["50Rnd_570x28_SMG_03",50],[],""],[],[],["U_O_T_Officer_F",[["FirstAidKit",1],["Chemlight_red",1,1],["50Rnd_570x28_SMG_03",2,50]]],["V_LegStrapBag_black_F",[["FirstAidKit",1],["50Rnd_570x28_SMG_03",5,50]]],["B_RadioBag_01_ghex_F",[["SmokeShellRed",3,1],["50Rnd_570x28_SMG_03",5,50]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["SMG_05_F","muzzle_snds_L","","optic_Nightstalker",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_O_T_Officer_F",[["FirstAidKit",1],["Chemlight_red",1,1],["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",3,30]]],["V_LegStrapBag_black_F",[["FirstAidKit",1],["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",7,30]]],["B_RadioBag_01_ghex_F",[["SmokeShellRed",3,1],["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",6,30]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]],
		[["MMG_01_tan_F","muzzle_snds_93mmg","","optic_Nightstalker",["150Rnd_93x64_Mag",150],[],"bipod_02_F_blk"],[],["hgun_Pistol_heavy_02_Yorris_F","","","optic_Yorris",["6Rnd_45ACP_Cylinder",6],[],""],["U_O_T_Officer_F",[["FirstAidKit",1],["SmokeShellRed",3,1]]],["V_LegStrapBag_coyote_F",[["SmokeShell",1,1],["SmokeShellRed",1,1],["150Rnd_93x64_Mag",1,150]]],["B_RadioBag_01_ghex_F",[["SmokeShell",1,1],["SmokeShellRed",1,1],["150Rnd_93x64_Mag",1,150]]],_headgear,"G_Aviator",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]]
	]
] select (worldName in ['Tanoa','Enoch']);
_commander setUnitLoadout (selectRandom _loadouts);
{
	_commander enableAIFeature _x;
} forEach [
	['COVER',FALSE],
	['AUTOCOMBAT',FALSE],
	['PATH',FALSE],
	['AIMINGERROR',FALSE],
	['SUPPRESSION',FALSE]
];
{
	_commander addEventHandler _x;
} forEach [
	[
		'HandleDamage',
		{
			_oldDamage = if ((_this # 5) isEqualTo -1) then {(damage (_this # 0))} else {((_this # 0) getHitIndex (_this # 5))};
			_damage = _oldDamage + (((_this # 2) - _oldDamage) * 0.05);
			_damage;
		}
	],
	[
		'Killed',
		{
			params ['_killed','_killer'];
			_killed removeAllEventHandlers 'HandleDamage';
			missionNamespace setVariable ['QS_commanderAlive',FALSE,FALSE];
			['QS_IA_TASK_AO_2'] call (missionNamespace getVariable 'BIS_fnc_deleteTask');
			{
				_x setMarkerPos (missionNamespace getVariable 'QS_HQpos');
			} forEach [
				'QS_marker_hqMarker',
				'QS_marker_hqCircle'
			];
			['CompletedSub',[localize 'STR_QS_Notif_007']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
			if (!isNull _killer) then {
				if (isPlayer _killer) then {
					_name = name _killer;
					_text = format ['%1 %2',_name,localize 'STR_QS_Chat_019'];
					['sideChat',[WEST,'HQ'],_text] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
				};
			};
		}
	],
	[
		'FiredMan',
		{
			(_this # 0) setAmmo [primaryWeapon (_this # 0),100];
		}
	],
	[
		'Hit',
		{
			(_this # 0) reveal [(_this # 1),4];
		}
	]
];
[_QS_HQpos,30,(units _commandGrp),[]] call (missionNamespace getVariable 'QS_fnc_garrisonUnits');
[(units _commandGrp),4] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
_commander spawn {
	sleep 3;
	_this setUnitPos (selectRandom ['Middle','Down']);
};
_commandGrp setVariable ['QS_AI_GRP_TASK',['COMMAND',_centerPos,-1,-1],QS_system_AI_owners];
_commandGrp setVariable ['QS_AI_GRP',TRUE,QS_system_AI_owners];
_commandGrp setVariable ['QS_AI_GRP_CONFIG',['COMMAND','CLASSIC'],QS_system_AI_owners];
_commandGrp setVariable ['QS_AI_GRP_DATA',[TRUE,-1],QS_system_AI_owners];
_commander setVariable ['QS_hidden',TRUE,TRUE];
_commander setVariable ['QS_AI_ignoreDamageReduction',TRUE,TRUE];
_commander setUnitTrait ['QS_trait_commander',TRUE,TRUE];
_commander setUnitTrait ['audibleCoef',0.5];
_commandGrp setFormDir (random 360);
{
	_enemiesArray pushBack _x;
} forEach (units _commandGrp);
{
	(missionNamespace getVariable 'QS_classic_AI_enemy_0') pushBack _x;
} forEach _enemiesArray;
diag_log '****************************************************';
diag_log '***** AO ENEMY ***** fn_aoEnemy END ****************';
diag_log '****************************************************';