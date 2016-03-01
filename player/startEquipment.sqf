/* Entfernt Ausrüstung von Spieler und gibt ihm das Startequipment
*
* Ausgeführt durch init.sqf auf Spielern
*/

//Random uniform
/*
_vanillaUniforms = [
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour"
];

_randomUniform = selectRandom _vanillaUniforms;
*/
//_randomUniform = selectRandom ["U_C_Scientist"];

waitUntil {!isNull player};
waitUntil {player == player};


_randomUniform = "rhs_uniform_df15";



//Add equipment
comment "Exported from Arsenal by McDiod";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform _randomUniform;
for "_i" from 1 to 4 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "ACE_epinephrine";
player addItemToUniform "ACE_EarPlugs";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152";
player linkItem "ItemGPS";
