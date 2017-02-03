/* Defines what loot can spawn on a carepackage
*
* executed via server\carePackages.sqf on server
*/


CPWEAPONS = [
	//vanilla
	"LMG_Zafir_F",
	"LMG_Mk200_F",

	//rhs
	"rhs_weap_asval",
	"rhs_weap_asval_grip_npz",
	"rhs_weap_pkm",
	"rhs_weap_pkp",
	"rhs_weap_vss",
	"rhs_weap_vss_grip_npz",
	"rhs_weap_m14ebrri",
	"rhs_weap_m240B",
	"rhs_weap_m240G",
	"rhs_weap_m249",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip",
	"rhs_weap_m32",
	"rhs_weap_minimi_para_railed"
];

CPSNIPERS = [
	//vanilla
	"srifle_EBR_F",
	"arifle_MXM_Black_F",
	"srifle_DMR_01_F",

	//rhs
	"rhs_weap_svdp_npz",
	"rhs_weap_svds_npz",
	"rhs_weap_M107",
	"rhs_weap_M107_w",
	"rhs_weap_m14ebrri",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_wd",
	"rhs_weap_m24sws",
	"rhs_weap_m24sws_ghillie",
	"rhs_weap_m40a5",
	"rhs_weap_m40a5_wd",
	"rhs_weap_sr25",
	"rhs_weap_sr25_ec_wd",
	"rhs_weap_m82a1",
	"rhs_weap_t5000"
];

CPSCOPES = [
	//vanilla
	"optic_DMS",
	"optic_LRPS",
	"optic_SOS",

	//rhs
	"rhs_acc_dh520x56",
	"rhsusf_acc_M8541",
	"rhsusf_acc_M8541_low_wd",
	"rhsusf_acc_premier",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_ACOG_MDO",

	//fhq
	"FHQ_optic_LeupoldERT",
	"FHQ_optic_LeupoldERT_tan"
];

CPAMMO = [
	"DemoCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"APERSMine_Range_Mag",
	"SLAMDirectionalMine_Wire_Mag"
];

CPMEDICAL = [
	"ACE_fieldDressing",
	"ACE_morphine",
	"ACE_epinephrine",
	"ACE_bloodIV_250"
];

CPVESTSANDUNIFORMS = [
	"U_I_FullGhillie_ard",
	"U_B_FullGhillie_ard",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_B_GhillieSuit",
	"U_I_GhillieSuit",
	"U_B_T_FullGhillie_tna_F",
	"U_B_T_Sniper_F",
	"U_O_T_Sniper_F"
];


//If medium scopes are rare by parameter, add them to carepackage loot:
/*if (!SCOPES_ALLOWED) then {
	CPSCOPES = CPSCOPES + scopesLoot;
};*/
