/*/
File: fn_clientInteractSensorTarget.sqf
Author:

	Quiksilver
	
Last Modified:

	7/9/2018 A3 1.84 by Quiksilver
	
Description:

	Remote Sensors / Datalink Interaction
_____________________________________________________________/*/

_cursorObject = cursorObject;
if (isNull _cursorObject) exitWith {};
if (!alive _cursorObject) exitWith {
	50 cutText ['目标已消灭','PLAIN DOWN',0.25];
};
if ((!(_cursorObject isKindOf 'LandVehicle')) && (!(_cursorObject isKindOf 'Air')) && (!(_cursorObject isKindOf 'Ship')) && (!(_cursorObject isKindOf 'StaticWeapon'))) exitWith {
	50 cutText ['无效目标','PLAIN DOWN',0.25];
};
if (((crew _cursorObject) findIf {(alive _x)}) isEqualTo -1) exitWith {
	50 cutText ['目标未被占用','PLAIN DOWN',0.25];
};
if (_cursorObject isSensorTargetConfirmed (player getVariable ['QS_unit_side',EAST])) exitWith {
	50 cutText ['目标已被标记过','PLAIN DOWN',0.45];
};
if (_cursorObject in ([(listRemoteTargets (player getVariable ['QS_unit_side',EAST])),0] call (missionNamespace getVariable 'QS_fnc_listRemoteTargets'))) exitWith {
	50 cutText ['目标已被标记过','PLAIN DOWN',0.45];
};
if (_cursorObject getVariable ['QS_remoteTarget_reported',FALSE]) exitWith {
	50 cutText ['目标已被标记过','PLAIN DOWN',0.45];
};
if ((_cursorObject animationSourcePhase 'showcamonethull') isEqualTo 1) exitWith {
	50 cutText ['因伪装网无法标记目标','PLAIN DOWN',0.45];
};
if (_cursorObject getVariable ['QS_reportTarget_disable',FALSE]) exitWith {
	50 cutText ['无法标记此目标','PLAIN DOWN',0.45];
};
if (uiNamespace getVariable ['QS_client_progressVisualization_active',FALSE]) exitWith {};
_onCancelled = {
	params ['_cursorObject'];
	private _c = FALSE;
	if (!alive player) then {
		_c = TRUE;
	};
	if (!((lifeState player) in ['HEALTHY','INJURED'])) then {
		_c = TRUE;
	};
	if (!(cursorObject isEqualTo _cursorObject)) then {
		_c = TRUE;
	};
	if (!alive _cursorObject) then {
		_c = TRUE;
	};
	if (_cursorObject in ([(listRemoteTargets (player getVariable ['QS_unit_side',EAST])),0] call (missionNamespace getVariable 'QS_fnc_listRemoteTargets'))) then {
		_c = TRUE;
	};
	_c;
};
_onCompleted = {
	params ['_cursorObject'];
	if (player getUnitTrait 'QS_trait_JTAC') then {
		if (!isNil {player getVariable 'QS_client_jtac_sensorTarget'}) then {
			if (!alive (player getVariable 'QS_client_jtac_sensorTarget')) then {
				(player getVariable 'QS_client_jtac_sensorTarget') confirmSensorTarget [(player getVariable ['QS_unit_side',EAST]),FALSE];
			};
		};
		if ((!(_cursorObject in ([(listRemoteTargets (player getVariable ['QS_unit_side',EAST])),0] call (missionNamespace getVariable 'QS_fnc_listRemoteTargets')))) && (!(_cursorObject getVariable ['QS_remoteTarget_reported',FALSE]))) then {
			['confirmSensorTarget',_cursorObject,[(player getVariable ['QS_unit_side',EAST]),TRUE]] remoteExec ['QS_fnc_remoteExecCmd',(player getVariable ['QS_unit_side',EAST]),FALSE];
			_cursorObject confirmSensorTarget [(player getVariable ['QS_unit_side',EAST]),TRUE];
			_cursorObject setVariable ['QS_remoteTarget_reported',TRUE,TRUE];
			['reportRemoteTarget',(player getVariable ['QS_unit_side',EAST]),[_cursorObject,360]] remoteExec ['QS_fnc_remoteExecCmd',(player getVariable ['QS_unit_side',EAST]),FALSE];
			(player getVariable ['QS_unit_side',EAST]) reportRemoteTarget [_cursorObject,360];
			player setVariable ['QS_client_jtac_sensorTarget',_cursorObject,FALSE];
			50 cutText ['目标已标记','PLAIN DOWN',0.3];
			playSound 'beep_target';
			['sideChat',[EAST,'OPF'],(format ['%1 (JTAC) 标记了一个位于 %3 的 %2 并请求火力打击将其摧毁。',profileName,(getText (configFile >> 'CfgVehicles' >> (typeOf _cursorObject) >> 'displayName')),(mapGridPosition _cursorObject)])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			[77,'FIRE_SUPPORT',[_cursorObject,profileName],FALSE] remoteExec ['QS_fnc_remoteExec',2];
		} else {
			50 cutText ['目标已被标记过','PLAIN DOWN',0.3];
		};
	} else {
		if ((!(_cursorObject in ([(listRemoteTargets (player getVariable ['QS_unit_side',EAST])),0] call (missionNamespace getVariable 'QS_fnc_listRemoteTargets')))) && (!(_cursorObject getVariable ['QS_remoteTarget_reported',FALSE]))) then {
			['reportRemoteTarget',(player getVariable ['QS_unit_side',EAST]),[_cursorObject,180]] remoteExec ['QS_fnc_remoteExecCmd',(player getVariable ['QS_unit_side',EAST]),FALSE];
			(player getVariable ['QS_unit_side',EAST]) reportRemoteTarget [_cursorObject,180];
			_cursorObject setVariable ['QS_remoteTarget_reported',TRUE,TRUE];
			50 cutText ['目标已标记','PLAIN DOWN',0.3];
			playSound 'beep_target';
			['sideChat',[EAST,'OPF'],(format ['%1 (JTAC) 标记了一个位于 %3 的 %2 并请求火力打击将其摧毁。',profileName,(groupID (group player)),(getText (configFile >> 'CfgVehicles' >> (typeOf _cursorObject) >> 'displayName')),(mapGridPosition _cursorObject)])] remoteExec ['QS_fnc_remoteExecCmd',-2,FALSE];
			[77,'FIRE_SUPPORT',[_cursorObject,profileName],FALSE] remoteExec ['QS_fnc_remoteExec',2];
		} else {
			50 cutText ['目标已被标记过','PLAIN DOWN',0.3];
		};	
	};
};
private _time = [6,3] select (player getUnitTrait 'QS_trait_JTAC');
_time = _time + ([2,3] select ((_cursorObject animationSourcePhase 'showcamonethull') isEqualTo 1));
playSound 'clickSoft';
[
	'正在标记目标……',
	([7.5,3.75] select (player getUnitTrait 'QS_trait_JTAC')),
	0,
	[[],{FALSE}],
	[[_cursorObject],_onCancelled],
	[[_cursorObject],_onCompleted],
	[[],{FALSE}]
] spawn (missionNamespace getVariable 'QS_fnc_clientProgressVisualization');