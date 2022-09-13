/*/
File: fn_dynamicTasks.sqf
Author: 

	Quiksilver

Last Modified:

	20/01/2018 A3 1.80 by Quiksilver

Description:

	Dynamic Tasks	
____________________________________________________________________________/*/

params ['_case','_type','_params','_isRx'];
private _array = [];
if (_case isEqualTo 1) then {
	if (_type isEqualTo 'DESTROY') then {
		_entity = _params # 0;
		_taskAuthor = _params # 1;
		_taskAuthorClass = _params # 2;
		_taskID = format ['QS_DYNTASK_%1_%2',_type,(round (random 10000))];
		private _description = format ['摧毁了一个 %1',(getText (configFile >> 'CfgVehicles' >> (typeOf _entity) >> 'displayName'))];
		if (_isRx) then {
			_description = format ['%2 ( %3 ) 创建了新的目标： %1 ',_description,_taskAuthor,_taskAuthorClass];
		};
		_array = [
			_taskID,
			'ADD',
			_type,
			[
				[	/*/CREATED/*/
					[_entity],
					{
						params ['_entity'];
						(alive _entity)
					},
					[
						_taskID,
						TRUE,
						[
							_description,
							'摧毁目标',
							'摧毁目标'
						],
						[_entity,TRUE],
						'CREATED',
						0,
						TRUE,
						TRUE,
						'destroy',
						FALSE
					]
				],
				[	/*/SUCCESS/*/
					[_entity],
					{
						params ['_entity'];
						(!alive _entity)
					}
				],
				[	/*/FAILED/*/
					[_entity],
					{
						FALSE
					}
				],
				[	/*/CANCEL/*/
					_params,
					{
						FALSE
					}
				]
			],
			_params
		];
		(missionNamespace getVariable 'QS_module_dynamicTasks_add') pushBack _array;
	};
	if (_type isEqualTo 'MEDEVAC') then {
		_entity = _params # 0;
		_entityName = _params # 1;
		_taskID = format ['QS_DYNTASK_%1_%2',_type,(round (random 10000))];
		(missionNamespace getVariable ['QS_dynTask_medevac_array',[]]) pushBack _entity;
		[_entityName,{50 cutText [(format ['%1 %2',_this,localize 'STR_QS_Text_207']),'PLAIN DOWN',0.5];}] remoteExec ['call',(allPlayers select {(_x getUnitTrait 'QS_trait_pilot')}),FALSE];
		private _description = format ['Medevac %1.<br/><br/> Bring %1 to the medical facility at base. The location is marked on your map as Medevac HQ.<br/><br/>This person cannot be revived by others.<br/><br/>If the task does not complete, have the patient wait at the medical facility for approximately 30 seconds.',_entityName];
		_array = [
			_taskID,
			'ADD',
			_type,
			[
				[	/*/CREATED/*/
					[_entity],
					{
						params ['_entity'];
						((alive _entity) && ((lifeState _entity) isEqualTo 'INCAPACITATED'))
					},
					[
						_taskID,
						TRUE,
						[
							_description,
							'医疗撤离',
							'医疗撤离'
						],
						[_entity,TRUE],
						'CREATED',
						0,
						TRUE,
						TRUE,
						'heal',
						FALSE
					]
				],
				[	/*/SUCCESS/*/
					[_entity,(markerPos 'QS_marker_medevac_hq')],
					{
						params ['_entity','_medevacBase'];
						private _c = FALSE;
						if (alive _entity) then {
							if ((lifeState _entity) isNotEqualTo 'INCAPACITATED') then {
								if ((_entity distance2D _medevacBase) < 50) then {
									if (isNull (objectParent _entity)) then {
										if (isNull (attachedTo _entity)) then {
											_c = TRUE;
										};
									};
								};
							};
						};
						_c;
					}
				],
				[	/*/FAILED/*/
					[_entity],
					{
						params ['_entity'];
						(!alive _entity)
					}
				],
				[	/*/CANCEL/*/
					[_entity],
					{
						FALSE
					}
				]
			],
			_params
		];
		(missionNamespace getVariable 'QS_module_dynamicTasks_add') pushBack _array;
	};
	if (_type isEqualTo 'PRISONER') then {
		_entity = _params # 0;
		_entity setTaskMarkerOffset [0,-10,1];
		_taskID = format ['QS_DYNTASK_%1_%2',_type,(round (random 10000))];
		private _description = '地面部队逮捕了一个敌军单位，将目标带回基地审讯。 在基地找到围栏区域（地图标记监狱）并在那里关押目标以完成任务。';
		_array = [
			_taskID,
			'ADD',
			_type,
			[
				[	/*/CREATED/*/
					[_entity],
					{
						params ['_entity'];
						(alive _entity)
					},
					[
						_taskID,
						TRUE,
						[
							_description,
							'撤离战俘',
							'撤离战俘'
						],
						[_entity,TRUE],
						'CREATED',
						0,
						TRUE,
						TRUE,
						'exit',
						FALSE
					]
				],
				[	/*/SUCCESS/*/
					[_entity,(markerPos 'QS_marker_gitmo')],
					{
						params ['_entity','_prisonBase'];
						private _c = FALSE;
						if (alive _entity) then {
							if ((_entity distance2D _prisonBase) < 30) then {
								if (isNull (objectParent _entity)) then {
									if (isNull (attachedTo _entity)) then {
										_c = TRUE;
									};
								};
							};
						};
						_c;
					}
				],
				[	/*/FAILED/*/
					[_entity],
					{
						params ['_entity'];
						(!alive _entity)
					}
				],
				[	/*/CANCEL/*/
					[_entity],
					{
						FALSE
					}
				]
			],
			_params
		];
		(missionNamespace getVariable 'QS_module_dynamicTasks_add') pushBack _array;
	};
	if (_type isEqualTo 'EVAC_PILOT') then {
		_entity = _params # 0;
		_entityName = _params # 1;
		_taskID = format ['QS_DYNTASK_%1_%2',_type,(round (random 10000))];
		private _description = format ['一名飞行员( %1 )刚刚紧急跳伞逃生，现急需撤离。 当飞行员接近基地时，任务即可完成。',_entityName];
		_array = [
			_taskID,
			'ADD',
			_type,
			[
				[	/*/CREATED/*/
					[_entity],
					{
						params ['_entity'];
						(alive _entity)
					},
					[
						_taskID,
						TRUE,
						[
							_description,
							'营救飞行员',
							'营救飞行员'
						],
						[_entity,TRUE],
						'CREATED',
						0,
						TRUE,
						TRUE,
						'navigate',
						FALSE
					]
				],
				[	/*/SUCCESS/*/
					[_entity,(markerPos 'QS_marker_base_marker')],
					{
						params ['_entity','_base'];
						private _c = FALSE;
						if (alive _entity) then {
							if ((_entity distance2D _base) < 500) then {
								_c = TRUE;
							};
						};
						_c;
					}
				],
				[	/*/FAILED/*/
					[_entity],
					{
						params ['_entity'];
						(!alive _entity)
					}
				],
				[	/*/CANCEL/*/
					[_entity],
					{
						params ['_entity'];
						(((vehicle _entity) isKindOf 'Air') && (_entity isEqualTo (driver (vehicle _entity))))
					}
				]
			],
			_params
		];
		(missionNamespace getVariable 'QS_module_dynamicTasks_add') pushBack _array;		
	};
	if (_type isEqualTo 'FIRE_SUPPORT') then {
		_entity = _params # 0;
		_taskAuthorName = _params # 1;
		_taskID = format ['QS_DYNTASK_%1_%2',_type,(round (random 10000))];
		_timeout = diag_tickTime + 900;
		private _description = format ['%1 呼叫火力单位打击 %2！ 这项任务在15分钟后会自动取消。',_taskAuthorName,(getText (configFile >> 'CfgVehicles' >> (typeOf _entity) >> 'displayName'))];
		_array = [
			_taskID,
			'ADD',
			_type,
			[
				[	/*/CREATED/*/
					[_entity],
					{
						params ['_entity'];
						(alive _entity)
					},
					[
						_taskID,
						TRUE,
						[
							_description,
							'火力打击',
							'火力打击'
						],
						[_entity,TRUE],
						'CREATED',
						0,
						TRUE,
						TRUE,
						'target',
						FALSE
					]
				],
				[	/*/SUCCESS/*/
					[_entity],
					{
						params ['_entity'];
						(!alive _entity)
					}
				],
				[	/*/FAILED/*/
					[_entity],
					{
						FALSE
					}
				],
				[	/*/CANCEL/*/
					[_entity,_timeout],
					{
						params ['_entity','_timeout'];
						((diag_tickTime > _timeout) && (alive _entity))
					}
				]
			],
			_params
		];
		(missionNamespace getVariable 'QS_module_dynamicTasks_add') pushBack _array;
	};
};