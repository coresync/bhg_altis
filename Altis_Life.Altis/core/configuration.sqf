#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 0.1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_vdFoot = viewDistance;
life_vdCar = viewDistance;
life_vdAir = viewDistance;
tawvd_addon_disable = true;

life_fadeSound = false;

BHG_Earplugs = 0;

/******** Exploitfix Variables *****/
life_action_gather = false; // add this to your variables

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_maxWeightT = LIFE_SETTINGS(getNumber,"total_maxWeightT");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;

//life_fuelstations = ["fuelstation_1","fuelstation_2","fuelstation_3","fuelstation_4","fuelstation_5","fuelstation_6","fuelstation_7","fuelstation_8","fuelstation_9","fuelstation_10","fuelstation_11","fuelstation_12","fuelstation_13","fuelstation_14","fuelstation_15","fuelstation_16","fuelstation_17","fuelstation_18","fuelstation_19","fuelstation_20","fuelstation_21","fuelstation_22","fuelstation_23","fuelstation_24","fuelstation_25","fuelstation_26","fuelstation_27","fuelstation_28","fuelstation_29","fuelstation_30"];
//life_fuelstations_air = ["fuelstation_23","fuelstation_24","fuelstation_25"];
//life_fuelstations_ship = ["fuelstation_26","fuelstation_27","fuelstation_28","fuelstation_29"];

life_istazed = false;
life_vehicles = [];

switch (playerSide) do {
	case west: {
		BANK = 7000; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};
	
	case civilian: {
		BANK = 5000; //Starting Bank Money
		life_paycheck = 350; //Paycheck Amount
	};
	
	case independent: {
		BANK = 6500;
		life_paycheck = 450;
	};
};

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	
	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));
