    /*
    fn_preCheckHouse.sqf
    	Author: Dillon "Itsyuka" Modine-Thuen
    	File: fn_preCheckHouse.sqf
    	Description: Checks to see if the house is owned (mainly for the purchase function)
    */
    private["_query","_house","_housePos"];
     
    _uid = [_this,0,"",[""]] call BIS_fnc_param;
    _house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
     
    if(isNull _house) exitWith {_house setVariable[format["preCheckHouse_%1",_uid],false,true];};
    _housePos = getPosATL _house;
    waitUntil {!DB_Async_Active};
    _query = format["housingCheckHouse:%1",_housePos];
    _queryResult = [_query,2,true] call DB_fnc_asyncCall;
    _queryResult_select_0 = _queryResult select 0;
    if(!(isNil "_queryResult_select_0")) exitWith {_house setVariable[format["preCheckHouse_%1",_uid],false,true];};
    _house setVariable[format["preCheckHouse_%1",_uid],true,true];