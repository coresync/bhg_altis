/*
	File: IntroCam
	Author: Dexter
	( script might already be known, havent seen it yet though ) 
*/
private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];
_camDistance = 150;
_randCamX = 150 - floor(random 150);
_randCamY = 70 - floor(random 150);
_camTime = 12 ;// you can change the time for sure, I adjusted mine to the intro music
player say3D "BHG_Intro";

//intro move
showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
life_firstSpawn = false;