/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/

if (!isNil {ocupado}) exitWith {hint "Estás ocupado";};

[] spawn {
	tranqui = true;
	sleep 8;
	tranqui = nil;
};

_a = _this select 0;

player playActionNow "PutDown";
sleep 2;
player playActionNow "";

_arb = (_this select 0) select 0;
_fru = "manzana" createVehicle (getPos _arb);
[[_fru, ["<t color=""#FFBF00"" size='1' shadow='1'>" +"Recoger",'null = [_this select 0] execVM "ica\frutas\recogerM.sqf";', "", 7,false,true,"",""]], "ICARUK_fnc_addAction", true, true] spawn BIS_fnc_MP; 

