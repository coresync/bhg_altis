#include <macro.h>
/**
 * File: fn_fuelStationShowMenu.sqf
 * Author: ishi
 * based on work by: MarioF
 *
 * Description:
 * Refuelling menu
 */
private["_fuelstation","_menu","_mode","_types","_objs","_index","_fuelPrice","_marketprice","_type","_info","_capacity","_diff","_distance","_mod"];
disableSerialization;

_fuelstation = [_this,0,objNull] call BIS_fnc_param;
_mode = [_this,3,""] call BIS_fnc_param;
if(isNull _fuelstation) exitWith{};

switch(_mode) do {
	case ("Car"): {_types = ["Car"]; _distance = 8; };
	case ("Air"): {_types = ["Air"]; _distance = 10; };
	case ("Ship"): {_types = ["Ship"]; _distance = 15; };
	case ("all"): {_types = ["Car","Air","Ship"]; _distance = 15; };
};

life_action_inUse = true;

// Close menu after refuelling
[] spawn {
	waitUntil{!life_action_inUse};
	life_fuelstation_lockVeh = objNull;
	life_fuelstation_amount = 0;
	life_fuelstation_fitamount = 0;
	if(!isNull findDisplay 25500) then { closeDialog 25500 };
};
if(isNull findDisplay 25500) then { createDialog "FuelStation_Menu" };
waitUntil {!isNull findDisplay 25500};
_menu = findDisplay 25500;

// Get price
_index = ["oilp",__GETC__(sell_array)] call TON_fnc_index;
_fuelPrice = (__GETC__(sell_array) select _index) select 1;
/*_marketprice = ["oilp"] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_fuelPrice = _marketprice;
};*/
_fuelPrice = ([(_fuelPrice / 230), 2] call BIS_fnc_cutDecimals) max 3;
_mod = 1;
if (playerSide in [west,independent]) then { _mod = 0.6; }; // Make it cheaper for cops and medics/adac
life_fuelstation_price = _fuelPrice * _mod;


// Try to find the Vehicle
_objs = nearestObjects[(getPos _fuelstation), _types, _distance];
if((count _objs) == 0) exitWith { hint localize "STR_FuelStation_NotNear"; life_action_inUse = false; };

_vehicleList = _menu displayCtrl 25511;

// Add vehicle to menu
{
	_type = typeOf _x;
	_info = [_type] call life_fnc_fetchVehInfo;

	_capacity = [_type] call life_fnc_fuelStationVehicleCapacity;
	_diff = _capacity - ((fuel _x) * _capacity); // fuel _x gives a value between 0.0 and 1.0 => percentage of fuel cargo
	
	if(_diff > 1) then {
		_vehicleList lbAdd format["%1", _info select 3];
		_vehicleList lbSetPicture [(lbSize _vehicleList)-1,(_info select 2)];
		_vehicleList lbSetData [(lbSize _vehicleList)-1,str(_x)];
	};
} foreach _objs;
