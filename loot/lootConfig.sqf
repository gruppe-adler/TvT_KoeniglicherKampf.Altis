
//Distribution
LOOT_DISTRIBUTION = [
	12,	//dist_weapons
	10,	//dist_items 
	13, //dist_clothes
	10, //dist_vests 
	10, //dist_backpacks
	12, //dist_medical
	8, 	//dist_grenades 
	8,	//dist_accessories
	9,	//dist_sights
	6 	//dist_scopes
];

//Kick scopes if parameter says so
if (!SCOPES_ALLOWED) then {
	LOOT_DISTRIBUTION resize (count LOOT_DISTRIBUTION)-1;
};


// Set Weapon loot: Primary weapons, secondary weapons, Sidearms.
weaponsLoot = 	[
	"arifle_MX_F",
	"arifle_MX_GL_F",
	"arifle_MXC_F",
	"arifle_Katiba_F",
	"arifle_Katiba_C_F",
	"arifle_Katiba_GL_F",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20C_F",
	"arifle_Mk20_GL_F",
	"SMG_01_F",
	"SMG_02_F",
	"hgun_PDW2000_F",
	"arifle_MX_SW_F",
	"arifle_MX_SW_Black_F",

	"rhs_weap_ak74m",
	"rhs_weap_ak74m_camo",
	"rhs_weap_ak105",
	"rhs_weap_ak74m_desert_npz",
	"rhs_weap_ak74m_camo_npz",
	"rhs_weap_akms",
	"rhs_weap_ak104",
	"rhs_weap_ak104_npz",
	"rhs_weap_m4",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m16a4",
	"rhs_weap_m4_m203",
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_M590_5RD",
	"rhs_weap_M590_8RD",

	"SMA_ACR",
	"SMA_ACRblk",
	"SMA_ACRREM",
	"SMA_ACRREMblk",
	"SMA_HK416afg",
	"SMA_HK416GL",
	"SMA_HK416CUSTOMafgB",



	"hgun_P07_snds_F",
	"hgun_Rook40_F",
	"hgun_Rook40_snds_F",
	"hgun_ACPC2_F",
	"hgun_ACPC2_snds_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_01_snds_F",
	"hgun_Pistol_heavy_02_Yorris_F",

	"rhsusf_weap_m1911a1",
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9"
];

// Set items: Weapon attachments, first-aid, Binoculars
itemsLoot = [
	"NVGoggles",
	"NVGoggles_OPFOR",
	"ToolKit",
	"rhsusf_ANPVS_15",
	"ACE_Banana",
	"ACE_wirecutter",
	"ACE_MapTools",
	"ACE_ATragMX",
	"ACE_Clacker",
	"ACE_DefusalKit",
	"ACE_M26_Clacker",
	"ACE_Cellphone",
	"ACE_Flashlight_MX991",
	"ACE_Flashlight_KSF1",
	"ACE_Kestrel4500",
	"ACE_RangeCard",
	"Binocular",
	"Laserdesignator_03",
	"ACE_Yardage450",
	"ACE_Vector"
];

// Set Clothing: Hats, Helmets, Uniforms
clothesLoot = [
	"ARC_Common_OD_TAN_Uniform",
	"ARC_Common_Black_Uniform",
	"ARC_Common_Black_TAN_Uniform",
	"ARC_Common_Shirt_TAN_Uniform",
	"ARC_GER_Flecktarn_Uniform",
	"ARC_GER_Flecktarn_Uniform_vest",
	"ARC_GER_Tropentarn_Uniform",
	"ARC_GER_Flecktarn_Uniform_Light",
	"U_B_CombatUniform_mcam",
	"U_I_CombatUniform",
	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",
	"U_B_CTRG_1",
	"rhs_uniform_df15",
	"rhs_uniform_emr_patchless",
	"rhs_uniform_flora_patchless",
	"U_O_CombatUniform_ocamo",
	"U_O_CombatUniform_oucamo",
	"rhs_uniform_FROG01_d",
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_gorka_r_g",
	"rhs_uniform_gorka_r_y",
	"U_BG_Guerrilla_6_1",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_3",
	"U_BG_leader",
	"rhs_chdkz_uniform_2",
	"rhs_chdkz_uniform_3",
	"U_C_HunterBody_grn",
	"rhs_uniform_m88_patchless",
	"rhs_uniform_mflora_patchless",
	"U_B_PilotCoveralls",
	"U_O_SpecopsUniform_ocamo",
	"SMA_UNIFORMS_BLACK",
	"SMA_UNIFORMS_GREEN",
	"SMA_UNIFORMS_TAN",
	"U_I_G_Story_Protagonist_F",

	"ARC_Common_MEF_Helmet_G",
	"ARC_CapHeadPhone_OD",
	"ARC_Common_AllAllBlack_Helmet",
	"ARC_Common_ATACS_LE_Helmet",
	"ARC_Common_Desert_Helmet",
	"ARC_Common_FG_Helmet",
	"ARC_Common_FG_Helmet_Light",
	"ARC_Common_MEF_Helmet_Light",
	"ARC_Common_TAN_Helmet_Light",
	"ARC_Common_FG_Helmet_simple",
	"ARC_OD_M2000",
	"ARC_Black_M2000",
	"ARC_GER_Flecktarn_booniehat",
	"ARC_GER_Tropentarn_booniehat",
	"ARC_GER_Flecktarn_Helmet_Light",
	"ARC_GER_Tropentarn_Helmet_Light",
	"ARC_GER_Tropentarn_Helmet_simple",
	"ARC_GER_Flecktarn_Milcap",
	"ARC_GER_Flecktarn_Mich",
	"rhs_6b26_green",
	"rhs_6b26",
	"rhs_6b27m_green",
	"rhs_6b27m",
	"rhs_6b27m_ml",
	"rhs_6b28_green_bala",
	"rhs_6b28_ess",
	"rhsusf_ach_bare",
	"rhsusf_ach_bare_des_ess",
	"rhsusf_ach_bare_semi",
	"rhsusf_ach_bare_wood",
	"rhsusf_ach_bare_wood_ess",
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ucp",
	"H_Bandanna_khk",
	"H_Bandanna_cbr",
	"H_Watchcap_blk",
	"H_Watchcap_cbr",
	"rhs_Booniehat_flora",
	"rhs_Booniehat_digi",
	"H_Beret_02",
	"H_Booniehat_dgtl",
	"rhs_Booniehat_ocp",
	"rhs_Booniehat_ucp",
	"H_Cap_blk",
	"H_HelmetB_black",
	"H_HelmetB_camo",
	"H_HelmetB_grass",
	"H_HelmetSpecB",
	"H_HelmetSpecB_paint1",
	"rhsusf_opscore_bk",
	"rhsusf_opscore_fg",
	"rhsusf_opscore_ut",
	"rhs_fieldcap",
	"rhs_fieldcap_digi_des",
	"H_Hat_camo",
	"H_HelmetB_light_desert",
	"H_HelmetB_light_sand",
	"rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatwd",
	"rhsusf_mich_bare",
	"rhsusf_mich_bare_norotos_arc",
	"rhsusf_mich_bare_alt_semi",
	"rhsusf_mich_helmet_marpatwd",
	"H_MilCap_dgtl",
	"H_Shemag_olive",
	"H_ShemagOpen_tan",
	"H_ShemagOpen_khk",
	"rhs_tsh4",
	"rds_Woodlander_cap3",
	"rds_Woodlander_cap2",
	"rds_Villager_cap4",
	"rds_Villager_cap2"
];

// Set Vests: Any vests
vestsLoot = [
	"ARC_Common_Cbr_PlateCarrier_1",
	"ARC_Common_OD_PlateCarrier_1",
	"ARC_Common_Cbr_PlateCarrier_2",
	"ARC_Common_OD_PlateCarrier_2",
	"ARC_Common_OD_rangemaster_belt",
	"ARC_Common_Cbr_rangemaster_belt",
	"ARC_Common_Cbr_BandollierB_rgr",
	"ARC_Common_Blk_BandollierB_rgr",
	"ARC_Common_TAN_BandollierB_rgr",
	"ARC_GER_Flecktarn_PlateCarrier_1",
	"ARC_GER_Tropentarn_PlateCarrier_1",
	"ARC_GER_Flecktarn_PlateCarrier_2",
	"ARC_GER_Tropentarn_PlateCarrier_2",
	"ARC_GER_Flecktarn_Plate_Carrier",
	"ARC_GER_Tropentarn_Plate_Carrier",
	"ARC_GER_Tropentarn_rangemaster_belt",
	"ARC_GER_Flecktarn_BandollierB_rgr",
	"rhs_6b13_Flora",
	"rhs_6b13_Flora_6sh92",
	"rhs_6b13_Flora_6sh92_vog",
	"rhs_6b13_EMR",
	"rhs_6b13_6sh92_vog",
	"rhs_6b23",
	"rhs_6b23_6sh92",
	"rhs_6b23_vydra_3m",
	"rhs_6b23_digi",
	"rhs_6b23_digi_6sh92",
	"rhs_6b23_ML",
	"rhs_6b23_ML_6sh92_headset",
	"rhs_6sh92",
	"rhs_6sh92_vog_headset",
	"V_PlateCarrier1_blk",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier2_rgr",
	"V_Chestrig_blk",
	"V_Chestrig_rgr",
	"V_Chestrig_khk",
	"V_PlateCarrierIA1_dgtl",
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ucp",
	"V_HarnessO_brn",
	"V_HarnessO_gry",
	"V_BandollierB_khk",
	"V_BandollierB_oli",
	"SMA_UNIFORMS_BLACK_VEST",
	"SMA_UNIFORMS_GREEN_VEST",
	"SMA_UNIFORMS_TAN_VEST",
	"rhsusf_spc",
	"rhsusf_spc_light",
	"rhsusf_spc_rifleman",
	"V_TacVest_blk",
	"V_TacVest_camo",
	"V_TacVest_khk"
];

// Set Backpacks: Any packpacks
backpacksLoot = [
	"ARC_GER_Backpack_Flecktarn",
	"ARC_GER_Backpack_Tropentarn",
	"ARC_Common_Backpack_compact_ATACS_LE",
	"ARC_GER_Backpack_compact_Flecktarn",
	"ARC_GER_Backpack_compact_Tropentarn",
	"ARC_Common_Kitbag_compact_Black",
	"ARC_GER_Kitbag_compact_Flecktarn",
	"ARC_GER_Kitbag_compact_Tropentarn",
	"ARC_GER_Backpack_Carryall_Flecktarn",
	"ARC_GER_Backpack_Carryall_Tropentarn",
	"B_AssaultPack_cbr",
	"B_AssaultPack_dgtl",
	"B_AssaultPack_rgr",
	"B_AssaultPack_ocamo",
	"B_AssaultPack_khk",
	"B_Carryall_cbr",
	"B_Carryall_khk",
	"B_Carryall_oli",
	"B_FieldPack_blk",
	"B_FieldPack_cbr",
	"B_FieldPack_khk",
	"B_Kitbag_rgr",
	"B_Kitbag_cbr",
	"B_TacticalPack_blk",
	"B_TacticalPack_rgr",
	"B_TacticalPack_oli",
	"rhs_assault_umbts",
	"rhs_sidor"
];

medicalLoot = [
	"ACE_fieldDressing",
	"ACE_morphine",
	"ACE_epinephrine",
	"ACE_bloodIV_250"
];

grenadeLoot = [
	"HandGrenade",
	"MiniGrenade",
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellGreen",
	"SmokeShellRed",
	"SmokeShellPurple",
	"SmokeShellOrange",
	"SmokeShellBlue",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	"rhs_mag_rgd5",
	"rhs_mag_rgn",
	"rhs_mag_rgo",
	"rhs_mag_rdg2_white",
	"rhs_mag_rdg2_black",
	"rhs_mag_nspd",
	"rhs_mag_m67",
	"rhs_mag_an_m8hc",
	"APERSTripMine_Wire_Mag"
];

weaponAccessoryLoot = [
	"muzzle_snds_M",
	"muzzle_snds_acp",
	"muzzle_snds_H",
	"muzzle_snds_L",
	"muzzle_snds_B",
	"bipod_01_F_snd",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	"muzzle_snds_338_black",
	"muzzle_snds_93mmg",
	"rhs_acc_pbs1",
	"rhs_acc_tgpv",
	"rhs_acc_dtk4short",
	"rhs_acc_dtk4long",
	"rhs_acc_dtk3",
	"rhs_acc_dtk",
	"rhs_acc_dtk1l",
	"rhs_acc_ak5",
	"rhs_acc_2dpZenit",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_SR25S",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	"FHQ_acc_ANPEQ15_black",
	"FHQ_acc_LLM01L",
	"SMA_supp2btanSCAR_556",
	"SMA_supp2bSCAR_556",
	"SMA_spSCAR_762",
	"SMA_supp1b_556",
	"SMA_supp1BB_556",
	"SMA_supp1BOD_556",
	"SMA_supp2smaB_556",
	"SMA_FLASHHIDER1",
	"SMA_FLASHHIDER2",
	"ACE_muzzle_mzls_H",
	"ACE_muzzle_mzls_B",
	"ACE_muzzle_mzls_L",
	"ACE_muzzle_mzls_smg_01",
	"ACE_muzzle_mzls_smg_02"
];

sightsLoot = [
	"rhs_acc_pkas",
	"rhs_acc_1p63",
	"rhs_acc_ekp1",
	"rhs_acc_1p78",
	"rhs_acc_1pn93_2",
	"optic_Aco_smg",
	"optic_ACO_grn_smg",
	"optic_Holosight_smg",
	"optic_Yorris",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_Holosight",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",
	"FHQ_optic_AIM",
	"FHQ_optic_AIM_tan",
	"FHQ_optic_HWS_G33",
	"FHQ_optic_HWS_G33_tan",
	"FHQ_optic_HWS_tan",
	"FHQ_optic_HWS",
	"FHQ_optic_MicroCCO",
	"FHQ_optic_MicroCCO_tan",
	"FHQ_optic_MicroCCO_low",
	"FHQ_optic_MicroCCO_low_tan",
	"FHQ_optic_AC11704",
	"FHQ_optic_AC11704_tan",
	"FHQ_optic_AC12136",
	"FHQ_optic_AC12136_tan",
	"FHQ_optic_MARS",
	"FHQ_optic_MARS_tan",
	"FHQ_optic_AimM_BLK",
	"FHQ_optic_AimM_TAN",
	"FHQ_optic_MCCO_M_BLK",
	"FHQ_optic_MCCO_M_TAN"
];

scopesLoot = [
	"optic_Arco",
	"optic_Hamr",
	"optic_MRCO",
	"FHQ_optic_ACOG",
	"FHQ_optic_ACOG_tan",
	"FHQ_optic_VCOG",
	"FHQ_optic_VCOG_tan",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG_wd",
	"rhsusf_acc_ACOG_USMC",
	"rhs_acc_1p29",
	"rhs_acc_pso1m21",
	"rhs_acc_pso1m2",
	"rhs_acc_1pn93_1"
];


// Exclude buildings from loot spawn. Use 'TYPEOF' to find building name
exclusionList = [
	"Land_Pier_F",
	"Land_Pier_small_F",
	"Land_NavigLight",
	"Land_LampHarbour_F",
	 "Land_runway_edgelight"
];