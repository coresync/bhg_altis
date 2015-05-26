/**
 * File: fn_fuelStationSliderChange.sqf
 * Author: ishi
 * based on work by: MarioF
 *
 * Description:
 * Functionality for the sliders
 */
private["_display","_newFit","_txtFit","_txtCash","_sliFit","_maxFit","_sliNew"];
disableSerialization;

_display = findDisplay 25500;

_txtFit = _display displayCtrl 25503;
_txtCash = _display displayCtrl 25504;
_sliFit = _display displayCtrl 25512;

_maxFit = ( floor (kblisfe_kcbassh / life_fuelstation_price)) min life_fuelstation_fitamount;
_sliNew = sliderPosition _sliFit;
if(_sliNew > _maxFit) then {
	_sliFit sliderSetPosition _maxFit;
};
life_fuelstation_amount = sliderPosition _sliFit;
_txtCash ctrlSetText format["$%1", round (life_fuelstation_price * life_fuelstation_amount)];

life_fuelstation_amount = floor(sliderPosition _sliFit);
_newFit = life_fuelstation_amount;

_txtFit ctrlSetText format["%1 / %2 Liter", life_fuelstation_amount, life_fuelstation_fitamount];