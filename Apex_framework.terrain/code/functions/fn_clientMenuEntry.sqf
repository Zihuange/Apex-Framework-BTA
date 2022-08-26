/*/
File: fn_clientMenuEntry.sqf
Author:
	
	Quiksilver
	
Last Modified:

	26/08/2022 A3 2.10 by Quiksilver

Description:

	Client Entry Menu
__________________________________________________________/*/
disableSerialization;
_type = _this # 0;
if (_type isEqualTo 'onLoad') then {
	_display = _this # 1;
	_ctrlTitle = _display displayCtrl 1802;
	_ctrlTitle ctrlSetText briefingName;
	_ctrlSText1 = _display displayCtrl 1806;
	private _text = '';
	_text = parseText format [
		'<t underline="true">简报</t><br/><t size="1">完成主线和支线任务，夺取敌人在 %1 上的主动权！</t><br/><br/><t underline="true">规则</t><t size="1"><br/>%3</t><br/><br/><t underline="true">Staff</t><br/><t size="1">%4</t><br/><br/><t underline="true">Discord</t><br/><t size="1">%2</t><br/><br/><t underline="true">Hotkeys</t><br/><t size="1">[Home] - 玩家菜单<br/>[End] - Earplugs<br/>[4] - 背起武器<br/>[L.Ctrl]+[Reload] - 整理弹匣<br/>[V] - 跳跃 (奔跑中使用)<br/>[U] - 班组管理<br/>[J]x2 - 打开任务简报</t>',
		worldName,
		(missionNamespace getVariable ['QS_missionConfig_commTS','']),
		(missionNamespace getVariable ['QS_missionConfig_splash_serverRules','']),
		(missionNamespace getVariable ['QS_missionConfig_splash_adminNames',''])
	];
	_ctrlSText1 ctrlSetStructuredText _text;
};
if (_type isEqualTo 'B1') then {
	closeDialog 0;
};
if (_type isEqualTo 'onUnload') then {
	0 spawn {
		uiSleep 0.1;
		createDialog 'QS_client_dialog_menu_roles';
	};
};