/*
File: fn_curatorFunctions.sqf
Author:

	Quiksilver
	
Last Modified:

	1/09/2022 A3 2.10 by Quiksilver
	
Description:

	Custom Curator Functions
	
Keys:

	61 = F3
	62 = F4

	NUM_0 = 82
	NUM_1 = 79
	NUM_2 = 80
	NUM_3 = 81
	NUM_4 = 75
	NUM_5 = 76
	NUM_6 = 77
	NUM_7 = 71
	NUM_8 = 72
	NUM_9 = 73

	https://community.bistudio.com/wiki/curatorSelected
______________________________________________________*/

_key = _this # 0;
_validKeys = [61,62,82,79,80,81,75,76,77,71,72,73];
if (
	(isNull (findDisplay 312)) ||
	{(!(_key in _validKeys))} ||
	{(diag_tickTime < (player getVariable ['QS_curator_executingFunction',-1]))}
) exitWith {};
player setVariable ['QS_curator_executingFunction',(diag_tickTime + 2),FALSE];
scopeName 'main';
if (_key isEqualTo 61) exitWith {
	if (!isNil {player getVariable 'QS_staff_menuOpened'}) exitWith {};
	playSound 'Click';
	player setVariable ['QS_staff_menuOpened',TRUE,FALSE];
	0 spawn {uiSleep 2;player setVariable ['QS_staff_menuOpened',nil,FALSE];};
	private _curators = ['CURATOR'] call (missionNamespace getVariable 'QS_fnc_whitelist');
	if ((getPlayerUID player) in _curators) then {
		private _logic = getAssignedCuratorLogic player;
		if (!isNull _logic) then {
			if (!isNil {player getVariable 'QS_staff_curatorLastUpdate'}) exitWith {
				if (!isStreamFriendlyUIEnabled) then {
					(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,5,-1,localize 'STR_QS_Hints_103',[],(serverTime + 10),TRUE,localize 'STR_QS_Hints_104',FALSE];
				};
			};
			player setVariable ['QS_staff_curatorLastUpdate',TRUE,FALSE];
			0 spawn {uiSleep 10;player setVariable ['QS_staff_curatorLastUpdate',nil,FALSE];};
			[49,_logic] remoteExec ['QS_fnc_remoteExec',2,FALSE];
			if (!isStreamFriendlyUIEnabled) then {
				(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_105',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
			};
		};
	};
};
if (_key isEqualTo 62) exitWith {
	if (diag_tickTime > (missionNamespace getVariable ['QS_curator_AIOffloadCooldown',-1])) then {
		missionNamespace setVariable ['QS_curator_AIOffloadCooldown',diag_tickTime + 5,FALSE];
		playSound ['ClickSoft',FALSE];
		private _selected = curatorSelected # 0;
		private _groups = [];
		if (_selected isNotEqualTo []) then {
			{
				if (
					(_x isKindOf 'Man') &&
					(!isPlayer _x) &&
					(alive _x) &&
					(!isNull (group _x))
				) then {
					_groups pushBackUnique (group _x);
				};
			} forEach _selected;
			if (_groups isNotEqualTo []) then {
				_groups = _groups select {
					_grp = _x;
					((local _grp) && (((units _grp) findIf {(isPlayer _x)}) isEqualTo -1))
				};
				if (_groups isNotEqualTo []) then {
					QS_data_AISkills = [
						'general',
						'courage',
						'aimingAccuracy',
						'aimingShake',
						'aimingSpeed',
						'commanding',
						'endurance',
						'spotDistance',
						'spotTime',
						'reloadSpeed'
					];
					QS_data_AIFeatures = [
						//'ALL',
						'AIMINGERROR',
						'ANIM',
						'AUTOCOMBAT',
						'AUTOTARGET',
						'CHECKVISIBLE',
						'COVER',
						'FSM',
						'LIGHTS',
						'MINEDETECTION',
						'MOVE',
						'NVG',
						'PATH',
						'RADIOPROTOCOL',
						'SUPPRESSION',
						'TARGET',
						'TEAMSWITCH',
						'WEAPONAIM'
					];
					private _grp = grpNull;
					private _grpData = [];
					private _unitData = [];
					private _unitsData = [];
					private _unit = objNull;
					private _unitSkills = [];
					private _unitAIFeatures = [];
					{
						_grp = _x;
						_grpData = [
							(['CARELESS','SAFE','AWARE','COMBAT','STEALTH','ERROR'] find (behaviour (leader _grp))),
							['BLUE','GREEN','WHITE','YELLOW','RED'] find (combatMode _grp),
							[0,1] select (attackEnabled _grp)
						];
						_unitData = [];
						_unitsData = [];
						_unit = objNull;
						_unitSkills = [];
						_unitAIFeatures = [];
						{
							_unit = _x;
							_unitData = [];
							_unitSkills = [];
							_unitAIFeatures = [];
							_unitData pushBack _unit;
							_unitData pushBack (skill _unit);
							{
								_unitSkills pushBack (_unit skillFinal _x);
							} forEach QS_data_AISkills;
							_unitData pushBack _unitSkills;
							{
								_unitAIFeatures pushBack ([0,1] select (_unit checkAIFeature _x));
							} forEach QS_data_AIFeatures;
							_unitData pushBack _unitAIFeatures;
							_unitData pushBack (['Down','Up','Middle','Auto'] find (unitPos _unit));
							_unitData pushBack (getAnimSpeedCoef _unit);
							_unitData pushBack ([0,1] select (isStaminaEnabled _unit));
							_unitsData pushBack _unitData;
						} forEach (units _grp);
						_grpData pushBack _unitsData;
						{
							_grp setVariable [_x,_grp getVariable _x,2];
						} forEach (allVariables _grp);
						_grp setVariable ['QS_AI_GRP_ZEUS_data',_grpData,2];
						if (((_grp getEventHandlerInfo ['Local',0]) # 2) isEqualTo 0) then {
							_grp addEventHandler [
								'Local',
								{
									params ['_grp','_isLocal'];
									_grp removeEventHandler [_thisEvent,_thisEventHandler];
									systemChat format ['Zeus AI Offload - %1 offloaded to server: %2',(groupId _grp),!_isLocal]
								}
							];
						};
					} forEach _groups;
					// this is pretty basic but whatever
					systemChat 'Zeus AI Offload - attempting ...';
					_groups spawn {
						sleep 2;		// allow time for variable propagation
						[18,_this,profileName] remoteExec ['QS_fnc_remoteExec',2,FALSE];
					};
				};
			};
		};
	} else {
		systemChat 'Zeus AI Offload - cooldown (5 seconds)';
	};
};
if (_key isEqualTo 82) exitWith {
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_106',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
};
if (_key isEqualTo 79) exitWith {
	//comment 'Garrison selected units into buildings';
	playSound ['ClickSoft',FALSE];
	private ['_selectedUnits','_countUnits','_radius'];
	private _selectedUnits = [];
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	{
		if (
			(_x isKindOf 'Man') &&
			(!isPlayer _x) &&
			(alive _x)
		) then {
			_selectedUnits pushBack _x;
		};
	} forEach (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	_countUnits = count _selectedUnits;
	_radius = 50;
	if (_countUnits > 8) then {_radius = 100;};
	if (_countUnits > 16) then {_radius = 200;};
	if (_countUnits > 24) then {_radius = 300;};
	[(getPosATL (_selectedUnits # 0)),_radius,_selectedUnits,['House','Building']] spawn (missionNamespace getVariable 'QS_fnc_garrisonUnits');
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_107',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
};
if (_key isEqualTo 80) exitWith {
	//comment 'Group patrol';
	playSound ['ClickSoft',FALSE];
	private ['_selectedGroups','_countGroups','_radius'];
	_selectedGroups = [];
	if ((curatorSelected # 1) isEqualTo []) then {breakTo 'main';};
	{
		if (((units _x) findIf {(alive _x)}) isNotEqualTo -1) then {
			if (!(isPlayer (leader _x))) then {
				0 = _selectedGroups pushBack _x;
			};
		};
	} count (curatorSelected # 1);
	if (_selectedGroups isEqualTo []) then {breakTo 'main';};
	{
		[_x,(getPosATL ((units _x) # 0)),100] call (missionNamespace getVariable 'QS_fnc_taskPatrol');
	} forEach _selectedGroups;
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_108',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
};
if (_key isEqualTo 81) exitWith {
	//comment 'Search building';
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_109',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
	private ['_buildings','_building','_selectedGroup','_waypoint','_grp'];
	if ((curatorSelected # 1) isEqualTo []) then {breakTo 'main';};
	{
		_grp = _x;
		if (((units _grp) findIf {(alive _x)}) isNotEqualTo -1) then {
			if (!(isPlayer (leader _grp))) then {
				if ((count (waypoints _grp)) > 1) then {
					if ((count (waypoints _grp)) isEqualTo 2) then {
						_waypoint = (waypoints _grp) # 1;
						_buildings = nearestObjects [(waypointPosition _waypoint),['House'],25,TRUE];
						if (_buildings isEqualTo []) then {breakTo 'main';};
						_building = _buildings # 0;
						deleteWaypoint _waypoint;
						0 = [_grp,[_building,(count (_building buildingPos -1))],180,FALSE] spawn (missionNamespace getVariable 'QS_fnc_searchNearbyBuilding');
					};
				} else {
					0 = [_grp,[objNull,0],180,FALSE] spawn (missionNamespace getVariable 'QS_fnc_searchNearbyBuilding');
				};
			};
		};
	} count (curatorSelected # 1);
};
if (_key isEqualTo 75) exitWith {
	//comment 'Stalker squad';
	playSound ['ClickSoft',FALSE];
	private ['_prey','_building','_selectedGroups','_selectedGroup','_waypoint','_grp','_wpPosition','_nearestUnit','_nearestUnits'];
	_selectedGroups = [];
	if ((curatorSelected # 1) isEqualTo []) then {breakTo 'main';};
	{
		_grp = _x;
		if (local _grp) then {
			if (((units _grp) findIf {(alive _x)}) isNotEqualTo -1) then {
				if (!(isPlayer (leader _grp))) then {
					if ((waypoints _grp) isNotEqualTo []) then {
						if ((waypointPosition [_grp,(currentWaypoint _grp)]) isNotEqualTo [0,0,0]) then {
							_wpPosition = waypointPosition [_grp,(currentWaypoint _grp)];
							_nearestUnits = _wpPosition nearEntities [['CAManBase','LandVehicle'],25];
							if (_nearestUnits isNotEqualTo []) then {
								_nearestUnit = _nearestUnits # 0;
								if (!isNull _nearestUnit) then {
									if (alive _nearestUnit) then {
										if (((lifeState _nearestUnit) in ['HEALTHY','INJURED']) || {(_nearestUnit isKindOf 'LandVehicle')}) then {
											[
												_grp,
												_nearestUnit,
												{FALSE},
												10,
												'RED',
												'AWARE',
												'FULL',
												'AUTO',
												0,
												FALSE
											] spawn (missionNamespace getVariable 'QS_fnc_stalk');
											0 = (missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_110',[],-1,TRUE,'Curator',FALSE];
										};
									};
								};
							} else {
								(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,10,-1,localize 'STR_QS_Hints_111',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
							};
						} else {
							(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,10,-1,localize 'STR_QS_Hints_112',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
						};
					} else {
						(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_113',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
					};
				} else {
					(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_114',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
				};
			};
		} else {
			(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_115',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
		};
	} count (curatorSelected # 1);
};
if (_key isEqualTo 76) exitWith {
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_106',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
};
if (_key isEqualTo 77) exitWith {
	playSound ['ClickSoft',FALSE];
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_116',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
	private _selectedUnits = [];
	private _unit = objNull;
	private _target = objNull;
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	private _selected = objNull;
	{
		_selected = _x;
		if (_selected isKindOf 'Man') then {
			if (!isPlayer _selected) then {
				if (alive _selected) then {
					_selectedUnits pushBack _x;
				};
			};
		} else {
			if (_selected in vehicles) then {
				if ((crew _selected) isNotEqualTo []) then {
					{
						_selectedUnits pushBack _x;
					} forEach (crew _selected);
				};
			};
		};
	} forEach (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	private _remoteUnits = _selectedUnits select {(!local _x)};
	private _localUnits = _selectedUnits select {(local _x)};
	private _inHouse = [FALSE,objNull];
	if (_localUnits isNotEqualTo []) then {
		if ((count _localUnits) > 24) then { _localUnits = _localUnits select [0,24]; };
		{
			_unit = _x;
			if (!(_unit getUnitTrait 'medic')) then {
				_target = [_unit,1000,TRUE] call (missionNamespace getVariable 'QS_fnc_AIGetAttackTarget');
				if (alive _target) then {
					_inHouse = [_target,getPosWorld _target] call (missionNamespace getVariable 'QS_fnc_inHouse');
					if (_inHouse # 0) then {
						_target = _inHouse # 1;
					};
					[_unit,_target,selectRandomWeighted [1,0.5,2,0.5],TRUE,TRUE,FALSE,-1] call (missionNamespace getVariable 'QS_fnc_AIDoSuppressiveFire');
				};
			};
		} forEach _localUnits;
	};
	if (_remoteUnits isNotEqualTo []) then {
		if ((count _remoteUnits) > 24) then { _remoteUnits = _remoteUnits select [0,24]; };
		[30,_remoteUnits] remoteExec ['QS_fnc_remoteExec',(_remoteUnits # 0),FALSE];
	};
};
if (_key isEqualTo 71) exitWith {
	private _selectedUnits = [];
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	{
		if (_x isKindOf 'Man') then {
			if (isNull (objectParent _x)) then {
				if (alive _x) then {
					if (isNull (attachedTo _x)) then {
						if ((lifeState _x) isEqualTo 'INCAPACITATED') then {
							0 = _selectedUnits pushBack _x;
						};
					};
				};
			};
		};
	} count (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	private _unit = _selectedUnits # 0;
	if ((lifeState _unit) isEqualTo 'INCAPACITATED') then {
		if (local _unit) then {
			_unit setUnconscious FALSE;
			_unit setCaptive FALSE;
		} else {
			[68,_unit,FALSE,FALSE] remoteExec ['QS_fnc_remoteExec',_unit,FALSE];
		};
	};
	/*/
	missionNamespace setVariable [
		'QS_curator_revivePoints',
		((missionNamespace getVariable 'QS_curator_revivePoints') - 1),
		TRUE
	];
	/*/
	//systemChat format ['%2 %1',(missionNamespace getVariable 'QS_curator_revivePoints'),localize 'STR_QS_Chat_106'];
	_module = getAssignedCuratorLogic player;
	/*/[28,_module,((curatorPoints _module) - 0.05)] remoteExec ['QS_fnc_remoteExec',2,FALSE];/*/
	private _text = '';
	if ((random 1) > 0.333) then {
		_text = format ['%1 %2!',((name _unit) + ([' [AI]',''] select (isPlayer _unit))),localize 'STR_QS_Hints_117'];
	} else {
		if ((random 1) > 0.5) then {
			_text = format ['%2 %1!',((name _unit) + ([' [AI]',''] select (isPlayer _unit))),localize 'STR_QS_Hints_118'];
		} else {
			_text = format ['%1 %2',((name _unit) + ([' [AI]',''] select (isPlayer _unit))),localize 'STR_QS_Hints_119'];
		};
	};
	if (_text isNotEqualTo '') then {
		['systemChat',_text] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
	};
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_120',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
};
if (_key isEqualTo 72) exitWith {
	//comment 'Toggle player view directions';
	playSound ['ClickSoft',FALSE];
	if (isNil {missionNamespace getVariable 'QS_curator_playerViewDirections'}) then {
		(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_121',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
		missionNamespace setVariable [
			'QS_curator_playerViewDirections',
			(
				addMissionEventHandler [
					'Draw3D',
					{
						{
							private _p0 = eyePos _x;
							_v1 = getCameraViewDirection _x;
							private _p1 = _p0 vectorAdd (_v1 vectorMultiply (currentZeroing (vehicle _x)));
							_p1 = ASLToAGL _p1;
							_p0 = ASLToAGL _p0;
							_arr = [_p0,_p1,[1,1,1,1]];
							for '_i' from 0 to 2 step 1 do {
								drawLine3D _arr;
							};
						} count allPlayers;
						if (isNull (findDisplay 312)) then {
							if (!isNil {missionNamespace getVariable 'QS_curator_playerViewDirections'}) then {
								removeMissionEventHandler ['Draw3D',(missionNamespace getVariable 'QS_curator_playerViewDirections')];
								missionNamespace setVariable ['QS_curator_playerViewDirections',nil,FALSE];
							};
						};
					}
				]
			),
			FALSE
		];
	} else {
		(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,5,-1,localize 'STR_QS_Hints_122',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
		removeMissionEventHandler ['Draw3D',(missionNamespace getVariable 'QS_curator_playerViewDirections')];
		missionNamespace setVariable ['QS_curator_playerViewDirections',nil,FALSE];
	};	
};
if (_key isEqualTo 73) exitWith {
	playSound ['ClickSoft',FALSE];
	//comment 'Revive selected players';
	private _selectedUnits = [];
	if ((curatorSelected # 0) isEqualTo []) then {breakTo 'main';};
	{
		if (_x isKindOf 'Man') then {
			if (alive _x) then {
				if (!(isPlayer _x)) then {
					if (isNull (objectParent _x)) then {
						if (isNull (attachedTo _x)) then {
							if ((lifeState _x) in ['HEALTHY','INJURED']) then {
								_selectedUnits pushBack _x;
							};
						};
					};
				};
			};
		};
	} forEach (curatorSelected # 0);
	if (_selectedUnits isEqualTo []) then {breakTo 'main';};
	private _unit = _selectedUnits # 0;
	if ((lifeState _unit) in ['HEALTHY','INJURED']) then {
		if (local _unit) then {
			{
				_unit setVariable _x;
			} forEach [
				['QS_RD_draggable',TRUE,TRUE],
				['QS_RD_loadable',TRUE,TRUE]
			];
			_unit setUnconscious TRUE;
			_unit setCaptive TRUE;
			(missionNamespace getVariable 'QS_managed_hints') pushBack [5,TRUE,3,-1,localize 'STR_QS_Hints_123',[],-1,TRUE,localize 'STR_QS_Hints_104',FALSE];
		} else {
			50 cutText [localize 'STR_QS_Text_205','PLAIN DOWN',0.333];
		};
	} else {
		50 cutText [localize 'STR_QS_Text_206','PLAIN DOWN',0.333];
	};
};