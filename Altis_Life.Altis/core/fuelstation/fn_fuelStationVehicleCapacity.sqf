/**
 * File: fn_fuelStationVehicleCapacity.sqf
 * Author: ishi
 *
 * Description:
 * Fuel capacity of vehicles
 */
private["_classname"];
_classname = [_this,0,""] call BIS_fnc_param;

switch (_classname) do {
	case "B_Quadbike_01_F": {15}; // Quadbike
	case "C_Offroad_01_F": {45}; // Offroad
	case "B_G_Offroad_01_F": {60}; // Rebellenoffroad
	case "C_Hatchback_01_F": {40}; // Limo
	case "C_Hatchback_01_sport_F": {60}; // Limo Sport
	case "C_SUV_01_F": {60}; // SUV
	
	case "C_Kart_01_Fuel_F": {15}; // Kart
	case "C_Kart_01_Vrana_F": {15}; // Kart
	case "C_Kart_01_Blu_F": {15}; // Kart
	case "C_Kart_01_Red_F": {15}; // Kart
		
	case "I_Truck_02_covered_F": {600}; // Zamak
	case "I_Truck_02_transport_F": {600}; // Zamak
	case "I_Truck_02_fuel_F": {600}; // Zamak
	case "C_Van_01_transport_F": {80}; // Truck
	case "C_Van_01_box_F": {80}; // Truck
	case "C_Van_01_fuel_F": {80}; // Truck
	case "B_Truck_01_box_F": {900}; // HEMTT
	case "B_Truck_01_transport_F": {900}; // HEMTT
	case "B_Truck_01_mover_F": {900}; // HEMTT
	case "B_Truck_01_covered_F": {900}; // HEMTT
	case "B_Truck_01_fuel_F": {900}; // HEMTT
	case "O_Truck_03_device_F": {900}; // Temptest
	case "O_Truck_03_covered_F": {900}; // Temptest
	case "O_Truck_03_ammo_F": {900}; // Temptest
	case "O_Truck_03_fuel_F": {900}; // Temptest
	
	case "B_MRAP_01_F": {450}; // Hunter
	case "O_MRAP_02_F": {600}; // Ifrit
	case "I_MRAP_03_F": {450}; // Strider
	
	case "I_Heli_light_03_unarmed_F": {1000}; // Hellcat
	case "B_Heli_Light_01_F": {450}; // Hummingbird
	case "O_Heli_Light_02_unarmed_F": {900}; // Orca
	case "I_Heli_Transport_02_F": {1500}; // Mohawk
	case "B_Heli_Transport_01_F": {1500}; // Ghost Hawk
	
	case "C_Rubberboat": {50}; // Rescue Boat
	case "C_Boat_Civil_01_police_F": {200}; // Motorboat (Police)
	case "B_Boat_Armed_01_minigun_F": {900}; // Speedboat Minigun
	case "B_SDV_01_F": {90}; // SDV
	case "O_Lifeboat": {50}; // Rescue Boat
	case "O_Boat_Transport_01_F": {90}; // Assault Boat
	case "C_Boat_Civil_01_F": {200}; // Motorboat

	default {100};
};