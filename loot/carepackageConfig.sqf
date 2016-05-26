/* Defines what loot can spawn on a carepackage
*
* executed via server\carePackages.sqf on server
*/


CPWEAPONS = [
	"arifle_MXM_F",
	"srifle_EBR_F",
	"rhs_asval_pso1",
	"rhs_weap_sr25",
	"SMA_HK417_16in_afg",
	"SMA_HK417_16in_afg_tan",
	"srifle_DMR_05_blk_F",
	"rhs_weap_m14ebrri",
	"LMG_Zafir_F",
	"MMG_01_tan_F",
	"rhs_weap_pkp",
	"rhs_weap_pkm",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m240B"
];

CPSNIPERS = [
	"rhs_weap_sr25",
	"srifle_GM6_F",
	"srifle_LRR_F",
	"rhs_weap_svdp_npz",
	"rhs_weap_svds_npz",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_wd",
	"rhs_weap_M107"
];

CPSCOPES = [
	"optic_DMS",
	"optic_SOS",
	"optic_AMS",
	"optic_LRPS",
	"optic_KHS_old",
	"rhsusf_acc_LEUPOLDMK4",
	"FHQ_optic_LeupoldERT",
	"rhsusf_acc_LEUPOLDMK4_2"
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
	"U_I_FullGhillie_lsh",
	"U_B_FullGhillie_lsh",
	"U_I_FullGhillie_sard",
	"U_B_FullGhillie_sard",
	"U_B_GhillieSuit",
	"U_O_GhillieSuit",
	"U_I_GhillieSuit",
	"rhs_6b23_rifleman",
	"ARC_Common_Blk_Plate_Carrier_H",
	"ARC_Common_OD_Plate_Carrier_H",
	"ARC_Common_TAN_Plate_Carrier_H",
	"ARC_Common_TAN_HPC",
	"ARC_Common_OD_HPC_GL",
	"ARC_GER_Flecktarn_Plate_Carrier_H",
	"ARC_GER_Flecktarn_HPC_GL",
	"ARC_GER_Tropentarn_HPC_GL",
	"V_PlateCarrierSpec_mtp",
	"V_PlateCarrierIAGL_dgtl",
	"V_RebreatherB"
];





//If medium scopes are rare by parameter, add them to carepackage loot:
if (!SCOPES_ALLOWED) then {
	CPSCOPES = CPSCOPES + scopesLoot;
};
