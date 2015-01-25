/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

if(life_atmcash > (call life_revive_fee)) then 
{
	life_atmcash = life_atmcash - (call life_revive_fee);
} else {
	life_atmcash = 0;
};

switch(playerSide) do 
{
	case independent: {[[player,0,"textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
};

life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

wakPlugs = false;
0.5 fadeSound 1;

player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate;