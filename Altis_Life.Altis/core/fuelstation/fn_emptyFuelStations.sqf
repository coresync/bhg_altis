/**
 * File: fn_emptyFuelStations.sqf
 * Author: ishi
 *
 * Description:
 * Sets FuelCargo of all Land_fs_feed_F objects and adds an action for opening the refuel menu
 */
{
	[_x] spawn {
		private["_marker","_objs","_type"];
		_marker = _this select 0;
		_type = "Car";
		if (_marker in life_fuelstations_air) then { _type = "Air"; };
		if (_marker in life_fuelstations_ship) then { _type = "Ship"; };
		
		_objs = (nearestObjects [(getMarkerPos _marker), ["Land_fs_feed_F"], 50]);
		{
			_x setFuelCargo 0;
			if (_marker == "fuelstation_22") then {  // Tempfix for Kavala HQ having all types
				_x addAction["<t color='#b77414'>Tanken</t>",life_fnc_fuelStationShowMenu,"all",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 6 && playerSide == west'];
			} else {
				_x addAction["<t color='#b77414'>Tanken</t>",life_fnc_fuelStationShowMenu,_type,0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 6 '];
			};
		} foreach _objs;
	};
} foreach life_fuelstations;