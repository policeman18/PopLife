#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
closedialog 0;
[] call life_fnc_p_updateMenu;
if(!alive player) exitWith {}; //Prevent them from opening this for exploits while dead.

disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
	};
	
	case civilian:
	{
		ctrlShow[2012,false];
	};
};

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};