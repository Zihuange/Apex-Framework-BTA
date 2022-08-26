/*/
File: secureIntelVehicle.sqf
Author:

	Quiksilver
	
Last Modified:

	7/9/2018 A3 1.84 by Quiksilver
	
Description:

	Recover intel from a vehicle
___________________________________________________________________________/*/

scriptName 'Side Mission - Secure Intel Vehicle';

private [
	'_objVehTypes','_chaseTime','_chaseTimer','_objVehType','_emptySpawnPos','_altVehTypes','_altVehType','_objUnitTypes',
	'_objUnitType','_currentIntelPos','_notEscaping','_gettingAway','_heEscaped','_aGroup','_bGroup','_cGroup','_objUnit1',
	'_objUnit2','_objUnit3','_obj1','_obj2','_obj3','_intelObj','_enemiesArray','_randomDir','_poi','_flatPos','_flatPos1',
	'_flatPos2','_flatPos3','_position','_accepted','_fuzzyPos','_briefing','_escapeWP','_crewUnitType'
];

if (worldName isEqualTo 'Tanoa') then {
	_objVehTypes = ["I_C_Van_01_transport_F","I_C_Offroad_02_unarmed_F","O_T_MRAP_02_ghex_F","O_T_LSV_02_unarmed_F","I_MRAP_03_F"];
	_altVehTypes = ["O_T_MRAP_02_ghex_F"];
	_objUnitTypes = ["O_T_Officer_F","I_officer_F"];
	_crewUnitType = 'O_T_crew_F';
} else {
	_objVehTypes = ["O_MRAP_02_F","I_MRAP_03_F","O_MRAP_02_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F"];
	_altVehTypes = ["O_MRAP_02_F"];
	_objUnitTypes = ["O_officer_F","I_officer_F"];
	_crewUnitType = 'O_crew_F';
};
_chaseTime = 0;
_chaseTimer = 1200;

/*/------------------------------------------------------------------------- FIND POSITION FOR VEHICLE/*/

_flatPos = [0,0,0];
_accepted = false;
while {!_accepted} do {
	_flatPos = ['WORLD',-1,-1,'LAND',[10,0,0.2,10,0,FALSE,objNull],TRUE,[],[],TRUE] call (missionNamespace getVariable 'QS_fnc_findRandomPos');
	if ((([(_flatPos # 0),(_flatPos # 1)] nearRoads 50) select {((_x isEqualType objNull) && ((roadsConnectedTo _x) isNotEqualTo []))}) isNotEqualTo []) then {
		if ((_flatPos distance2D (markerPos 'QS_marker_base_marker')) > 1700) then {
			if ((_flatPos distance2D (missionNamespace getVariable 'QS_AOpos')) > 1500) then {
				if ((_flatPos distance2D (markerPos 'QS_marker_Almyra_blacklist_area')) > 2000) then {
					if (missionNamespace getVariable 'QS_module_fob_enabled') then {
						if ((_flatPos distance (markerPos 'QS_marker_module_fob')) < 4000) then {
							if ((_flatPos distance (markerPos 'QS_marker_module_fob')) > 1000) then {
								_accepted = TRUE;
							};
						};
					} else {
						_accepted = TRUE;
					};
				};
			};
		};
	};
	if (_accepted) exitWith {};
};
	
/*/------------------------------------------------------------------------- NEARBY POSITIONS TO SPAWN STUFF (THEY SPAWN IN TRIANGLE SO NO ONE WILL KNOW WHICH IS THE OBJ VEHICLE. HEHEHEHE./*/
	
_flatPos1 = _flatPos getPos [2,(random 360)];
_flatPos2 = _flatPos getPos [10,(random 360)];
_flatPos3 = _flatPos getPos [15,(random 360)];
	
/*/------------------------------------------------------------------------- CREATE GROUP, VEHICLE AND UNIT/*/
/*/--------- OBJ 1/*/
		
_objVehType = selectRandom _objVehTypes;
_obj1 = createVehicle [_objVehType,_flatPos1,[],0,'NONE'];
_obj1 setDir (random 360);
_obj1 setVectorUp (surfaceNormal (getPosWorld _obj1));
_obj1 enableRopeAttach FALSE;
_obj1 enableVehicleCargo FALSE;
_obj1 setVariable ['QS_reportTarget_disable',TRUE,TRUE];
_aGroup = createGroup [EAST,TRUE];
_objUnit1 = _aGroup createUnit [(selectRandom _objUnitTypes),_flatPos1,[],0,'NONE'];
_objUnit1 assignAsDriver _obj1;
_objUnit1 moveInDriver _obj1;
	
/*/--------- OBJ 2 /*/
		
_objVehType = selectRandom _objVehTypes;
_obj2 = createVehicle [_objVehType,_flatPos2,[],0,'NONE'];
_obj2 setDir (random 360);
_obj2 setVectorUp (surfaceNormal (getPosWorld _obj1));
_obj2 enableRopeAttach FALSE;
_obj2 enableVehicleCargo FALSE;
_obj2 setVariable ['QS_reportTarget_disable',TRUE,TRUE];
_bGroup = createGroup [EAST,TRUE];
_objUnit2 = _bGroup createUnit [(selectRandom _objUnitTypes),_flatPos1,[],0,'NONE'];
_objUnit2 assignAsDriver _obj2;
_objUnit2 moveInDriver _obj2;
	
/*/-------- OBJ 3/*/
		
_objVehType = selectRandom _objVehTypes;
_obj3 = createVehicle [_objVehType,_flatPos3,[],0,'NONE'];
_obj3 setDir (random 360);
_obj3 setVectorUp (surfaceNormal (getPosWorld _obj1));
_obj3 enableRopeAttach FALSE;
_obj3 enableVehicleCargo FALSE;
_obj3 setVariable ['QS_reportTarget_disable',TRUE,TRUE];
_cGroup = createGroup [EAST,TRUE];
_objUnit3 = _cGroup createUnit [(selectRandom _objUnitTypes),_flatPos2,[],0,'NONE'];
_objUnit3 assignAsDriver _obj3;
_objUnit3 moveInDriver _obj3;
{_x lock 3;} forEach [_obj1,_obj2,_obj3];
{
	_x setVariable ['QS_dynSim_ignore',TRUE,TRUE];
	_x enableDynamicSimulation FALSE;
} forEach [_obj1,_obj2,_obj3,_aGroup,_bGroup,_cGroup,_objUnit1,_objUnit2,_objUnit3];
if ((random 1) > 0.5) then {
	{
		_x forceSpeed 50;
	} forEach [_obj1,_obj2,_obj3];
};

/*/---------- WHICH VEHICLE IS THE OBJECTIVE?/*/
	
_intelObj = selectRandom [_obj1,_obj2,_obj3];
	
/*/--------- OKAY, NOW ADD ACTION TO IT/*/

for '_x' from 0 to 2 step 1 do {
	_intelObj setVariable ['QS_secureable',TRUE,TRUE];
};
(driver _intelObj) addEventHandler [
	'FiredNear',
	{
		params ['_unit','_firer','_distance','_weapon','_muzzle','_mode','_ammo'];
		_unit removeEventHandler ['FiredNear',_thisEventHandler];
		missionNamespace setVariable ['QS_sm_enemyDetected',TRUE,FALSE];
	}
];

_intelObj addEventHandler [
	"Killed",
	{
		private ["_object","_killer","_name",'_objType','_killerType','_killerDisplayName','_objDisplayName'];
		_object = _this # 0;
		_killer = _this # 1;
		_objType = typeOf _object;
		if (isPlayer _killer) then {
			_killerType = typeOf (vehicle _killer);
			_killerDisplayName = getText (configFile >> 'CfgVehicles' >> _killerType >> 'displayName');
			_objDisplayName = getText (configFile >> 'CfgVehicles' >> _objType >> 'displayName');
			_name = name _killer;
			['sideChat',[WEST,'BLU'],(format ['%1 摧毁了带有情报的车辆 ( %2 )',_name,_objDisplayName])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		};
	}
];
_intelObj addEventHandler [
	'ContainerOpened',
	{
		params ['_container','_unit'];
		if (isPlayer _unit) then {
			['sideChat',[WEST,'BLU'],(format ['%1 获取了一个目标！',(name _unit)])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			missionNamespace setVariable ['QS_smSuccess',TRUE,FALSE];
			_container setVariable ['QS_secureable',FALSE,TRUE];
		};
	}
];

/*/--------------------------------------------------------------------------- SPAWN GUARDS/*/

_enemiesArray = [_flatPos1] call (missionNamespace getVariable 'QS_fnc_smEnemyEastIntel');
	
/*/-------------------------------------------------------------------------- BRIEFING/*/

_fuzzyPos = [((_flatPos # 0) - 300) + (random 600),((_flatPos # 1) - 300) + (random 600),0];
{
	_x setMarkerPosLocal _fuzzyPos;
	_x setMarkerAlpha 1;
} count ['QS_marker_sideMarker','QS_marker_sideCircle'];	
'QS_marker_sideMarker' setMarkerText (format ['%1获取情报(载具)',(toString [32,32,32])]);

[
	'QS_IA_TASK_SM_0',
	TRUE,
	[
		'敌军高阶军官正在交付重要情报，我们确信情报在其中一个载具内。搜索车辆库存以找到情报。如果敌军发现我们的踪迹，他们会试图撤离现场。敌军交付情报的地点并未准确标记在地图上。注意，载具被摧毁将会导致任务失败。',
		'获取情报(载具)',
		'获取情报(载具)'
	],
	(markerPos 'QS_marker_sideMarker'),
	'CREATED',
	5,
	FALSE,
	TRUE,
	'download',
	TRUE
] call (missionNamespace getVariable 'BIS_fnc_setTask');

_briefing = parseText "<t align='center'><t size='2.2'>支线任务</t><br/><t size='1.5' color='#00B2EE'>获取情报(载具)</t><br/>____________________<br/>我们从当地平民那里得知，敌军高阶军官正在交付重要情报，这是一个获取情报的机会！<br/><br/>地图上标记了行动区域，我们确信情报在其中一个载具内。搜索车辆库存以找到情报。如果敌军发现我们的踪迹，他们会试图撤离现场。敌军交付情报的地点并未准确标记在地图上。</t>";
['hint',_briefing] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
['NewSideMission',['获取情报(载具)']] remoteExec ['QS_fnc_showNotification',-2,FALSE];
	
/*/----- Set vars/*/

_notEscaping = TRUE;
_gettingAway = FALSE;
_heEscaped = FALSE;
missionNamespace setVariable ['QS_sideMissionUp',TRUE,TRUE];
missionNamespace setVariable ['QS_smSuccess',FALSE,TRUE];
missionNamespace setVariable ['QS_sm_enemyDetected',FALSE,FALSE];

/*/------------------------- CORE LOOP/*/

for '_x' from 0 to 1 step 0 do {

	/*/------------------------------------------ IF VEHICLE IS DESTROYED [FAIL]/*/
	
	if (!alive _intelObj) exitWith {
		sleep 0.3;
		['sideChat',[WEST,'HQ'],'目标被摧毁，任务失败！'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
		[0,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPosLocal [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];	
		sleep 120;
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [_objUnit1,_objUnit2,_objUnit3,_obj1,_obj2,_obj3];
		{
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};
	
	/*/----------------------------------------- IS THE ENEMY TRYING TO ESCAPE? /*/
	
	if (_notEscaping) then {
		/*/---------- NO? then LOOP until YES or an exitWith {}./*/
		sleep 0.3;
		if (([_intelObj,500] call (missionNamespace getVariable 'QS_fnc_enemyDetected')) || {(missionNamespace getVariable 'QS_sm_enemyDetected')}) then {
			missionNamespace setVariable ['QS_sm_enemyDetected',FALSE,FALSE];
			sleep 0.3;
			['sideChat',[WEST,'HQ'],'The target has spotted us and is trying to escape with the intel!'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		
			/*/--------- WHERE TO / HOW WILL THE OBJECTIVES ESCAPE?/*/
			
			{
				_escape1WP = _x addWaypoint [(missionNamespace getVariable 'QS_AOpos'), 100];	
				_escape1WP setWaypointType 'MOVE';
				_escape1WP setWaypointBehaviour 'CARELESS';
				_escape1WP setWaypointSpeed 'FULL';
			} forEach [_aGroup,_bGroup,_cGroup];
			
			/*/--------- END THE NOT ESCAPING LOOP/*/
		
			_notEscaping = false;
			sleep 0.3;
			
			/*/--------- SET GETTING AWAY TO TRUE TO DETECT IF HE'S ESCAPED./*/
			
			_gettingAway = true;
			_chaseTime = time + _chaseTimer;
		};
	};
	
	/*/------------------------------------------- THE ENEMY IS TRYING TO ESCAPE/*/
	
	if (_gettingAway) then {
		sleep 2;
		_currentIntelPos = position _intelObj;
		if ((_currentIntelPos distance (missionNamespace getVariable 'QS_AOpos')) < 300) then {
			_heEscaped = TRUE;
			_gettingAway = FALSE;
		};
		if ((((units WEST) inAreaArray [_currentIntelPos,1500,1500,0,FALSE,-1])) isEqualTo []) then {
			_heEscaped = TRUE;
			_gettingAway = FALSE;
		};
		if (time > _chaseTime) then {
			_heEscaped = TRUE;
			_gettingAway = FALSE;
		};
	};
	
	if (!(_intelObj inArea 'QS_marker_sideCircle')) then {
		_fuzzyPos = [(((position _intelObj) # 0) - 300) + (random 600),(((position _intelObj) # 1) - 300) + (random 600),0];
		{
			_x setMarkerPosLocal _fuzzyPos;
			_x setMarkerAlpha 1;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];
		['QS_IA_TASK_SM_0',_fuzzyPos] call (missionNamespace getVariable 'BIS_fnc_taskSetDestination');
	};
	
	/*/------------------------------------------ THE ENEMY ESCAPED [FAIL]/*/
	
	if (_heEscaped) exitWith {
		['sideChat',[WEST,'HQ'],'目标逃脱，任务失败！'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		sleep 0.3;
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
		[0,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPosLocal [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];	
		
		/*/--------- DELETE/*/
		
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [_objUnit1,_objUnit2,_objUnit3,_obj1,_obj2,_obj3];
		sleep 120;
		{
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};
	
	/*/------------------------------------------- THE INTEL WAS RECOVERED [SUCCESS]/*/
	
	if (missionNamespace getVariable 'QS_smSuccess') exitWith {
		sleep 0.3;
		['sideChat',[WEST,'HQ'],'情报已获取。 任务完成！ 我们正在将情报上传至到指挥部进行分析。'] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
		missionNamespace setVariable ['QS_sideMissionUp',FALSE,TRUE];
		[1,_flatPos] spawn (missionNamespace getVariable 'QS_fnc_smDebrief');
		{
			_x setMarkerPosLocal [-5000,-5000,0];
			_x setMarkerAlpha 0;
		} count ['QS_marker_sideMarker','QS_marker_sideCircle'];	
		
		/*/--------- DELETE/*/

		sleep 120;
		{
			missionNamespace setVariable [
				'QS_analytics_entities_deleted',
				((missionNamespace getVariable 'QS_analytics_entities_deleted') + 1),
				FALSE
			];
			deleteVehicle _x;
		} forEach [_objUnit1,_objUnit2,_objUnit3,_obj1,_obj2,_obj3];
		{	
			if (_x isEqualType objNull) then {
				0 = QS_garbageCollector pushBack [_x,'NOW_DISCREET',0];
			};
		} count _enemiesArray;
	};	
	sleep 1;
};