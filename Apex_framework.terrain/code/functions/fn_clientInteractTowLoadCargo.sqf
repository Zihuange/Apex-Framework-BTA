/*/
File: fn_clientInteractTowLoadCargo.sqf
Author:

	Quiksilver
	
Last Modified:

	13/02/2018 A3 1.80 by Quiksilver
	
Description:

	-
_____________________________________________________________/*/

private _vehicle = vehicle player;
if (unitIsUav cameraOn) then {
	if ((toLowerANSI (typeOf cameraOn)) in [
		'b_ugv_01_f',
		'b_t_ugv_01_olive_f',
		'o_ugv_01_f',
		'o_t_ugv_01_ghex_f',
		'i_ugv_01_f',
		'c_idap_ugv_01_f',
		'i_e_ugv_01_f',
		'i_e_ugv_01_rcws_f'
	]) then {
		_vehicle = cameraOn;
	};
};
_attachedObjects = attachedObjects _vehicle;
private _towedVehicle = objNull;
private _vTransport = objNull;
if (alive _vehicle) then {
	if (_attachedObjects isNotEqualTo []) then {
		{
			if (_x getVariable ['QS_ropeAttached',FALSE]) then {
				if ((_x isKindOf 'Reammobox_F') || {(_x isKindOf 'AllVehicles')}) then {
					_towedVehicle = _x;
				};
			};
			if (!isNull _towedVehicle) exitWith {};
		} count _attachedObjects;
	};
};
private _array = [];
if (!isNull _towedVehicle) then {
	_nearViVTransports = (getPosATL _towedVehicle) nearEntities [['Air','LandVehicle','Ship'],20];
	if (_nearViVTransports isNotEqualTo []) then {
		{
			if ((!isNil {_x getVariable 'QS_ViV_v'}) || {(isClass (configFile >> 'CfgVehicles' >> (typeOf _x) >> 'vehicleTransport' >> 'Carrier'))}) exitWith {
				if (vehicleCargoEnabled _x) then {
					if (isNil {_x getVariable 'QS_ViV_v'}) then {
						_x setVariable ['QS_ViV_v',TRUE,TRUE];
					};
					_vTransport = _x;
					_array = [_towedVehicle,_vTransport];
				};
			};
		} count _nearViVTransports;
	};
};
if (isNull _vTransport) exitWith {};
_array params ['_child','_parent'];
if ((!alive _parent) || {(!alive _child)}) exitWith {
	50 cutText [localize 'STR_QS_Text_116','PLAIN DOWN',0.5];
};
if (!(vehicleCargoEnabled _child)) then {
	_child enableVehicleCargo TRUE;
};
if ((_parent canVehicleCargo _child) isNotEqualTo [TRUE,TRUE]) exitWith {
	_outcome = _parent canVehicleCargo _child;
	//[Possible to load cargo inside vehicle, possible to load cargo into empty vehicle]
	if (!(_outcome # 1)) then {
		50 cutText [(format ['%1 %3 %2',(getText (configFile >> 'CfgVehicles' >> (typeOf _child) >> 'displayName')),(getText (configFile >> 'CfgVehicles' >> (typeOf _parent) >> 'displayName')),localize 'STR_QS_Text_156']),'PLAIN',0.5];
	} else {
		50 cutText [localize 'STR_QS_Text_157','PLAIN',0.5];
	};
};
_child setVariable ['QS_loadCargoIn',_parent,FALSE];