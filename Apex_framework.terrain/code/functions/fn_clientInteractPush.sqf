/*
File: fn_clientInteractPush.sqf
Author:

	Quiksilver
	
Last Modified:

	13/06/2018 A3 1.82
	
Description:

	Push Vehicle
_____________________________________________________________*/

_t = cursorTarget;
private _canPush = TRUE;
if (!alive player) exitWith {};
if (!isNull (objectParent player)) exitWith {};
if (!alive _t) exitWith {};
if ((crew _t) isNotEqualTo []) exitWith {
	(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,5,-1,localize 'STR_QS_Hints_049',[],-1];
};
if ((getMass _t) > 5000) then {
	if (!(surfaceIsWater (getPosWorld _t))) then {
		_nearbyUnits = (getPosATL _t) nearEntities ['Man',10];
		if ((count _nearbyUnits) < 2) then {
			_canPush = FALSE;
			(missionNamespace getVariable 'QS_managed_hints') pushBack [5,FALSE,10,-1,localize 'STR_QS_Hints_050',[],-1,TRUE,'Too weak',TRUE];
		};
	};
};
if (!(_canPush)) exitWith {};
_vel = velocity _t;
_dir = (getPosWorld player) getDir (player modelToWorld [0,1,0]);
_pushVector = [((_vel # 0) + ((sin _dir) * 4)),((_vel # 1) + ((cos _dir) * 4)),((_vel # 2) + 1.25)];
if ((!underwater player) && (((eyePos player) # 2) > 0)) then {
	player playAction 'PutDown';
};
player allowDamage FALSE;
0 spawn {
	uiSleep 3;
	player allowDamage TRUE;
};
if (local _t) then {
	_t setVelocity _pushVector;
} else {
	[35,_t,_pushVector] remoteExec ['QS_fnc_remoteExec',_t,FALSE];
};
[_t] spawn {
	_t = _this # 0;
	uiSleep 2;
	if (local _t) then {
		_t setVelocity [0,0,0];
	} else {
		[35,_t,[0,0,0]] remoteExec ['QS_fnc_remoteExec',_t,FALSE];
	};
};