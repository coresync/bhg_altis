/**
 * File: fn_fuelStationFill.sqf
 * Author: ishi
 * based on work by: MarioF
 *
 * Description:
 * Functionality for the sliders
 */
private["_display","_txtStation","_txtVehicle","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill","_duration","_away"];
disableSerialization;

if(!isNull findDisplay 25500) then { closeDialog 25500; };

life_interrupted = false;

_veh = life_fuelstation_lockVeh;

if (life_fuelstation_amount == 0) exitWith{life_action_inUse = false; closeDialog 0; hint localize "STR_FuelStation_MustSetAmount";};
if ((life_fuelstation_amount*life_fuelstation_price) > kblisfe_kcbassh || kblisfe_kcbassh == 0) exitWith{life_action_inUse = false; closeDialog 0; hint localize "STR_FuelStation_NotEnoughMoney";};

_txtStation = "Zapfsaeule";
_txtVehicle = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");

_upp = format["%2 -> %1",_txtVehicle,_txtStation];
//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 (0 / %2 Liter)...",_upp,life_fuelstation_amount];
_progress progressSetPosition 0.01;
_cP = 0.01;
_duration = (((life_fuelstation_amount / 2000) max 0.1) min 0.7);
_away = true;

while{alive player && !life_interrupted && _cP < 1} do
{
	sleep _duration;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%1 (%2 / %3 Liter)...",_upp, round(_cP * life_fuelstation_amount), life_fuelstation_amount];
	if((_veh distance player) > 20) then { _away = false; };
};

5 cutText ["","PLAIN"];
_succAmount = round (life_fuelstation_amount * _cP);

if(life_interrupted || !alive player || !_away) then {
	_txtTmp = format ["Betankungsvorgang abgebrochen, du hast %1 Liter eingefüllt", _succAmount];
	titleText[_txtTmp,"PLAIN"];
} else {
	_txtTmp = format ["Betankungsvorgang erfolgreich, du hast %1 Liter eingefüllt", _succAmount];
	titleText[_txtTmp,"PLAIN"];
};

kblisfe_kcbassh = round (kblisfe_kcbassh - (_succAmount * life_fuelstation_price));
if(kblisfe_kcbassh < 0) then { kblisfe_kcbassh = 0; };

_fillValue = (fuel _veh) + (_succAmount / ([typeOf _veh] call life_fnc_fuelStationVehicleCapacity));
if(local _veh) then {
	_veh setFuel _fillValue;
} else {
	[[_veh,_fillValue],"life_fnc_setFuel",_veh,false] spawn life_fnc_MP;
};

life_interrupted = false;
life_action_inUse = false;