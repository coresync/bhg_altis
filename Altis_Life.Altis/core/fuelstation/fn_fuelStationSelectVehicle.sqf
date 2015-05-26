/**
 * File: fn_fuelStationSelectVehicle.sqf
 * Author: ishi
 * based on work by: MarioF
 *
 * Description:
 * Select vehicle in dialog and set the corrent values for the controls
 */
private["_display","_selIndex","_fitFuel","_perLitre","_cashFit","_veh","_listVeh","_txtVeh","_txtFit","_sliFit","_btnRefill","_txtCash","_nearVeh"];
disableSerialization;

_listVeh = (_this select 0) select 0;
_selIndex = (_this select 0) select 1;

_display = findDisplay 25500;

_txtVeh = _display displayCtrl 25502;
_txtFit = _display displayCtrl 25503;
_txtCash = _display displayCtrl 25504;
_sliFit = _display displayCtrl 25512;
_btnRefill = _display displayCtrl 25521;
_txtCash ctrlShow false;

_nearVeh = nearestObjects[(getPos player),["Car","Air","Ship"],30];
{ if(str(_x) == (_listVeh lbData _selIndex)) exitWith { _veh = _x; }; } foreach _nearVeh;

if(isNil "_veh" || {isNull _veh}) exitWith { life_action_inUse = false; hint localize "STR_FuelStation_NotNear"; };

life_fuelstation_lockVeh = _veh;

_txtVeh ctrlShow true;
_txtVeh ctrlSetText format["Zapfsaeule ($%1/L)", life_fuelstation_price];

_fitFuel = [typeOf _veh] call life_fnc_fuelStationVehicleCapacity;
_fitFuel = floor (_fitFuel - ((fuel _veh) * _fitFuel));

life_fuelstation_fitamount = _fitFuel;

_sliFit ctrlShow true;
_sliFit sliderSetSpeed [1,1];
_sliFit sliderSetRange [0, _fitFuel];
_cashFit = ( floor (kblisfe_kcbassh / life_fuelstation_price)) min _fitFuel;

_sliFit sliderSetPosition _cashFit;
_txtCash ctrlShow true;
_txtCash ctrlSetText format["$%1", round (_cashFit * life_fuelstation_price)];

_txtFit ctrlShow true;
_txtFit ctrlSetText format["%1 / %2 Liter", _cashFit, _fitFuel];
life_fuelstation_amount = _cashFit;

_btnRefill ctrlShow true;