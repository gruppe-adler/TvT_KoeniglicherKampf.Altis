
//Distribution
LOOT_DISTRIBUTION = [
	15,	//dist_weapons
	10,	//dist_items
	16, //dist_clothes
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
weaponsLoot = [
	//vanilla rifles
	"hgun_PDW2000_F",
	"arifle_TRG20_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_plain_F",
	"arifle_Mk20C_plain_F",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"srifle_EBR_F",
	"arifle_MX_F",
	"arifle_MX_Black_F",
	"arifle_MX_GL_F",
	"arifle_MX_GL_Black_F",
	"SMG_02_F",
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F",
	"SMG_01_F",
	"SMG_05_F",
	"arifle_CTAR_blk_F",
	"arifle_CTAR_ghex_F",

	//rhs rifles
	"rhs_weap_ak103_1",
	"rhs_weap_ak103_gp25",
	"rhs_weap_ak103_gp25_npz",
	"rhs_weap_ak104",
	"rhs_weap_ak104_npz",
	"rhs_weap_ak105",
	"rhs_weap_ak105_npz",
	"rhs_weap_ak74m_2mag_camo",
	"rhs_weap_ak74m_camo",
	"rhs_weap_ak74m_desert",
	"rhs_weap_ak74m_npz",
	"rhs_weap_akm",
	"rhs_weap_akm_gp25",
	"rhs_weap_aks74",
	"rhs_weap_aks74u",
	"rhs_weap_aks74un",
	"rhs_weap_pp2000",
	"rhs_weap_kar98k",
	"rhs_weap_m21a",
	"rhs_weap_m21a_pr",
	"rhs_weap_m70ab2",
	"rhs_weap_m70b1",
	"rhs_weap_m92",
	"rhs_weap_m38",
	"rhs_weap_m38_rail",
	"rhs_weap_savz61",
	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10_m320",
	"rhs_weap_hk416d10_LMT",
	"rhs_weap_hk416d145",
	"rhs_weap_hk416d145_m320",
	"rhs_weap_m16a4",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_m27iar",
	"rhs_weap_m27iar_grip",
	"rhs_weap_m4",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_m203",
	"rhs_weap_m4_m203S",
	"rhs_weap_m4_mstock",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_m203",
	"rhs_weap_m4a1_blockII",
	"rhs_weap_m4a1_blockII_bk",
	"rhs_weap_m4a1_blockII_d",
	"rhs_weap_m4a1_blockII_M203_d",
	"rhs_weap_m4a1_blockII_KAC",
	"rhs_weap_m4a1_blockII_wd",
	"rhs_weap_m4a1_blockII_KAC_wd",
	"rhs_weap_m4a1_pmag",
	"rhs_weap_m4a1_m203",
	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	"rhs_weap_mk18",
	"rhs_weap_mk18_bk",
	"rhs_weap_mk18_d",
	"rhs_weap_mk18_m320",
	"rhs_weap_mk18_wd",
	"rhs_weap_mk18_KAC_wd",
	"rhs_weap_mk18_KAC",
	"rhsusf_weap_MP7A2",
	"rhsusf_weap_MP7A2_aor1",
	"rhsusf_weap_MP7A2_desert",
	"rhs_weap_g36c",
	"rhs_weap_g36kv",
	"rhs_weap_g36kv_ag36",
	"rhs_weap_m21a_pbg40",
	"rhs_weap_m70b1n",
	"rhs_weap_m70b3n",
	"rhs_weap_m70b3n_pbg40",

	//vanilla handguns
	"hgun_Pistol_heavy_02_F",
	"hgun_ACPC2_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Rook40_F",
	"hgun_P07_F",
	"hgun_Pistol_01_F",
	"hgun_P07_khk_F",

	//rhs handguns
	"rhs_weap_pya",
	"rhs_weap_makarov_pm",
	"rhs_weap_pp2000_folded",
	"rhs_weap_rsp30_white",
	"rhs_weap_rsp30_green",
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m1911a1",
	"rhs_weap_M320",
	"rhsusf_weap_m9"
];

// Set items:
itemsLoot = [
	//vanilla
	"MineDetector",
	"ToolKit",
	"Binocular",

	//ace
	"ACE_SpraypaintBlack",
	"ACE_SpraypaintBlue",
	"ACE_DeadManSwitch",
	"ACE_Flashlight_MX991",
	"ACE_HuntIR_monitor",
	"ACE_Clacker",
	"ACE_SpottingScope",
	"ACE_wirecutter",
	"ACE_Kestrel4500",
	"ACE_DefusalKit"
];

// Set Clothing: Hats, Helmets, Uniforms
clothesLoot = [
	//vanilla uniforms
	"U_B_CombatUniform_mcam",
	"U_B_CombatUniform_mcam_tshirt",
	"U_I_CombatUniform",
	"U_I_OfficerUniform",
	"U_B_CTRG_1",
	"U_B_CTRG_3",
	"U_Competitor",
	"U_O_CombatUniform_ocamo",
	"U_O_CombatUniform_oucamo",
	"U_BG_Guerrilla_6_1",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_leader",
	"U_I_HeliPilotCoveralls",
	"U_C_HunterBody_grn",
	"U_OrestesBody",
	"U_B_survival_uniform",
	"U_I_C_Soldier_Bandit_4_F",
	"U_I_C_Soldier_Bandit_1_F",
	"U_I_C_Soldier_Bandit_2_F",
	"U_I_C_Soldier_Bandit_3_F",
	"U_B_T_Soldier_F",
	"U_B_CTRG_Soldier_F",
	"U_B_CTRG_Soldier_urb_1_F",
	"U_B_GEN_Commander_F",
	"U_B_GEN_Soldier_F",
	"U_I_C_Soldier_Para_2_F",
	"U_I_C_Soldier_Para_3_F",
	"U_I_C_Soldier_Para_5_F",
	"U_I_C_Soldier_Para_4_F",
	"U_I_C_Soldier_Para_1_F",
	"U_B_T_Soldier_SL_F",
	"U_C_man_sport_1_F",
	"U_C_man_sport_2_F",
	"U_I_C_Soldier_Camo_F",

	//rhs uniforms
	"rhs_uniform_emr_des_patchless",
	"rhs_uniform_emr_patchless",
	"rhs_uniform_flora_patchless",
	"rhs_uniform_flora_patchless_alt",
	"rhs_uniform_gorka_r_g",
	"rhs_uniform_gorka_r_y",
	"rhs_uniform_mvd_izlom",
	"rhs_uniform_m88_patchless",
	"rhs_uniform_mflora_patchless",
	"rhsgref_uniform_para_ttsko_mountain",
	"rhsgref_uniform_vsr",
	"rhsgref_uniform_ttsko_forest",
	"rhsgref_uniform_alpenflage",
	"rhsgref_uniform_ERDL",
	"rhsgref_uniform_flecktarn",
	"rhsgref_uniform_tigerstripe",
	"rhsgref_uniform_reed",
	"rhsgref_uniform_woodland",
	"rhsgref_uniform_woodland_olive",
	"rhsgref_uniform_specter",
	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",
	"rhs_uniform_FROG01_d",
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_g3_blk",
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_mc",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_tan",
	"rhssaf_uniform_m10_digital",
	"rhssaf_uniform_m10_digital_desert",
	"rhssaf_uniform_m10_digital_summer",
	"rhssaf_uniform_m10_digital_tan_boots",
	"rhssaf_uniform_m93_oakleaf",
	"rhssaf_uniform_m93_oakleaf_summer",

	//vanilla headgear
	"H_Bandanna_gry",
	"H_Bandanna_blu",
	"H_Bandanna_khk_hs",
	"H_Bandanna_khk",
	"H_Bandanna_sgg",
	"H_Watchcap_blk",
	"H_Watchcap_cbr",
	"H_Watchcap_camo",
	"H_Booniehat_khk_hs",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"H_Cap_grn_BI",
	"H_Cap_blk",
	"H_HelmetB",
	"H_HelmetLeaderO_ocamo",
	"H_HelmetLeaderO_oucamo",
	"H_HelmetSpecB",
	"H_HelmetSpecB_blk",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_sand",
	"H_HelmetSpecB_snakeskin",
	"H_Hat_brown",
	"H_HelmetB_light_black",
	"H_HelmetB_light_desert",
	"H_HelmetB_light_grass",
	"H_HelmetB_light_sand",
	"H_HelmetB_light_snakeskin",
	"H_Cap_headphones",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_ShemagOpen_tan",
	"H_ShemagOpen_khk",
	"H_Beret_gen_F",
	"H_Booniehat_tna_F",
	"H_HelmetCrew_O_ghex_F",
	"H_HelmetB_tna_F",
	"H_HelmetB_Enh_tna_F",
	"H_MilCap_ghex_F",
	"H_MilCap_tna_F",

	//rhs headgear
	"rhs_6b26_green",
	"rhs_6b26_bala_green",
	"rhs_6b27m_green",
	"rhs_6b27m_green_ess",
	"rhs_6b27m_digi",
	"rhs_6b27m_digi_ess_bala",
	"rhs_6b27m",
	"rhs_6b27m_ess",
	"rhs_6b27m_ml",
	"rhs_6b27m_ml_ess",
	"rhs_6b28_green",
	"rhs_6b28_green_ess",
	"rhs_6b28",
	"rhs_6b28_bala",
	"rhs_6b28_flora",
	"rhs_6b7_1m_bala1",
	"rhs_6b7_1m_emr",
	"rhs_6b7_1m_ess_bala",
	"rhs_6b7_1m_bala1_flora",
	"rhs_6b7_1m_bala2_olive",
	"rhs_altyn_novisor",
	"rhs_altyn_novisor_ess_bala",
	"rhs_beanie_green",
	"rhs_Booniehat_digi",
	"rhs_Booniehat_flora",
	"rhs_fieldcap",
	"rhs_fieldcap_digi",
	"rhsgref_fieldcap_ttsko_digi",
	"rhsgref_Booniehat_alpen",
	"rhsgref_fieldcap_ttsko_urban",
	"rhsgref_helmet_pasgt_erdl",
	"rhsgref_helmet_pasgt_flecktarn",
	"rhsgref_helmet_pasgt_woodland",
	"rhsgref_ssh68_emr",
	"rhsgref_ssh68_ttsko_forest",
	"rhsgref_ssh68_ttsko_mountain",
	"rhsgref_ssh68_ttsko_dark",
	"rhsusf_ach_bare",
	"rhsusf_ach_bare_des",
	"rhsusf_ach_bare_des_headset_ess",
	"rhsusf_ach_bare_headset",
	"rhsusf_ach_bare_semi",
	"rhsusf_ach_bare_semi_headset",
	"rhsusf_ach_helmet_M81",
	"rhsusf_ach_helmet_ESS_ocp",
	"rhsusf_ach_helmet_headset_ess_ocp",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_cvc_green_helmet",
	"rhsusf_cvc_helmet",
	"rhs_booniehat2_marpatwd",
	"rhs_Booniehat_ucp",
	"rhsusf_opscore_aor1_pelt",
	"rhsusf_opscore_aor2",
	"rhsusf_opscore_bk",
	"rhsusf_opscore_coy_cover",
	"rhsusf_opscore_fg",
	"rhsusf_opscore_mc_cover",
	"rhsusf_opscore_mc_cover_pelt_nsw",
	"rhsusf_opscore_mc",
	"rhsusf_opscore_paint",
	"rhsusf_opscore_mar_ut",
	"rhsusf_lwh_helmet_M1942",
	"rhsusf_lwh_helmet_marpatd_ess",
	"rhsusf_lwh_helmet_marpatwd_blk_ess",
	"rhsusf_lwh_helmet_marpatwd_headset_blk",
	"rhsusf_mich_bare",
	"rhsusf_mich_bare_alt",
	"rhsusf_mich_bare_norotos_alt",
	"rhsusf_mich_bare_semi",
	"rhsusf_mich_bare_norotos_alt_semi",
	"rhsusf_mich_bare_alt_tan",
	"rhsusf_mich_bare_norotos_arc_alt_tan",
	"rhsusf_protech_helmet",
	"rhsusf_protech_helmet_ess",
	"rhs_8point_marpatd",
	"rhssaf_booniehat_digital",
	"rhssaf_booniehat_md2camo",
	"rhssaf_helmet_m97_black_nocamo",
	"rhssaf_helmet_m59_85_oakleaf",
	"rhssaf_helmet_m97_black_nocamo_black_ess_bare",
	"rhssaf_helmet_m97_nostrap_blue_tan_ess",
	"rhssaf_helmet_m97_nostrap_blue_tan_ess_bare",
	"rhssaf_helmet_m97_md2camo",
	"rhssaf_helmet_m97_md2camo_black_ess",
	"rhssaf_helmet_m97_olive_nocamo_black_ess",
	"rhssaf_helmet_m97_olive_nocamo_black_ess_bare",
	"rhssaf_helmet_m97_woodland",
	"rhssaf_helmet_m97_woodland_black_ess"
];

// Set Vests: Any vests
vestsLoot = [
	//vanilla
	"V_PlateCarrierGL_blk",
	"V_PlateCarrier2_blk",
	"V_PlateCarrier2_rgr",
	"V_Chestrig_blk",
	"V_Chestrig_rgr",
	"V_Chestrig_khk",
	"V_Chestrig_oli",
	"V_PlateCarrierL_CTRG",
	"V_PlateCarrierIAGL_dgtl",
	"V_PlateCarrierIA2_dgtl",
	"V_PlateCarrierIAGL_oli",
	"V_HarnessOGL_gry",
	"V_HarnessO_gry",
	"V_Rangemaster_belt",
	"V_TacVestIR_blk",
	"V_BandollierB_blk",
	"V_BandollierB_cbr",
	"V_BandollierB_rgr",
	"V_BandollierB_khk",
	"V_BandollierB_oli",
	"V_TacVest_blk",
	"V_TacVest_brn",
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_TacVest_oli",
	"V_PlateCarrier_Kerry",
	"V_PlateCarrier1_rgr_noflag_F",
	"V_HarnessO_ghex_F",
	"V_BandollierB_ghex_F",
	"V_TacChestrig_cbr_F",
	"V_TacChestrig_grn_F",
	"V_TacChestrig_oli_F",

	//rhs
	"rhs_6b13_Flora",
	"rhs_6b13_Flora_6sh92_vog",
	"rhs_6b13_EMR_6sh92",
	"rhs_6b13_EMR_6sh92_headset_mapcase",
	"rhs_6b13_6sh92",
	"rhs_6b13_crewofficer",
	"rhs_6b23_6sh116_od",
	"rhs_6b23_6sh92_radio",
	"rhs_6b23_rifleman",
	"rhs_6b23_6sh116",
	"rhs_6b23_digi_6sh92_radio",
	"rhs_6b23_digi_6sh92_vog",
	"rhs_6b23_digi_engineer",
	"rhs_6b23_digi_rifleman",
	"rhs_6b23_ML",
	"rhs_6b23_ML_6sh92_radio",
	"rhs_6b23_ML_rifleman",
	"rhs_6b43",
	"rhs_6sh46",
	"rhs_6sh92_vog",
	"rhs_6sh92_digi",
	"rhs_6sh92_digi_vog",
	"rhs_6sh92_vsr",
	"rhs_6sh92_vsr_vog",
	"rhs_vydra_3m",
	"rhsgref_6b23_khaki_rifleman",
	"rhsgref_6b23_ttsko_digi_medic",
	"rhsgref_6b23_ttsko_digi_rifleman",
	"rhsgref_6b23_ttsko_forest_rifleman",
	"rhsgref_6b23_ttsko_mountain_rifleman",
	"rhs_6b5_khaki",
	"rhs_6b5_sniper_khaki",
	"rhs_6b5_sniper",
	"rhs_6b5_sniper_ttsko",
	"rhs_6b5_officer_vsr",
	"rhsgref_otv_digi",
	"rhsgref_TacVest_ERDL",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ucp_Rifleman",
	"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_iotv_ucp_Squadleader",
	"rhsusf_spc_corpsman",
	"rhsusf_spc_mg",
	"rhsusf_spc_rifleman",
	"rhsusf_spcs_ocp_rifleman",
	"rhsusf_spcs_ucp",
	"rhssaf_vest_otv_md2camo",
	"rhssaf_vest_md99_digital",
	"rhssaf_vest_md99_md2camo_rifleman",
	"rhssaf_vest_md99_woodland_rifleman",
	"rhssaf_vest_md98_md2camo",
	"rhssaf_vest_md98_rifleman"
];

// Set Backpacks: Any packpacks
backpacksLoot = [
	//vanilla
	"B_AssaultPack_blk",
	"B_AssaultPack_cbr",
	"B_AssaultPack_rgr",
	"B_AssaultPack_khk",
	"B_Carryall_cbr",
	"B_Carryall_khk",
	"B_Carryall_oli",
	"B_FieldPack_blk",
	"B_FieldPack_cbr",
	"B_FieldPack_khk",
	"B_FieldPack_oli",
	"B_Kitbag_cbr",
	"B_Kitbag_rgr",
	"B_Kitbag_sgg",
	"B_TacticalPack_blk",
	"B_TacticalPack_rgr",
	"B_TacticalPack_oli",
	"B_ViperHarness_blk_F",
	"B_ViperHarness_ghex_F",
	"B_ViperHarness_khk_F",
	"B_ViperHarness_oli_F",
	"B_ViperLightHarness_hex_F",
	"B_ViperLightHarness_khk_F",

	//rhs
	"rhs_medic_bag",
	"rhs_sidor",
	"rhs_assault_umbts",
	"rhs_assault_umbts_engineer_empty",
	"rhsusf_assault_eagleaiii_coy",
	"rhsusf_assault_eagleaiii_ocp",
	"rhssaf_kitbag_digital",
	"rhssaf_kitbag_md2camo",
	"rhssaf_kitbag_smb"
];

medicalLoot = [
	"ACE_fieldDressing",
	"ACE_bloodIV_500",
	"ACE_epinephrine",
	"ACE_morphine"
];

grenadeLoot = [
	//vanilla
	"SmokeShell",
	"MiniGrenade",
	"rhs_mag_an_m8hc",
	"Chemlight_blue",
	"Chemlight_green",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellOrange",
	"HandGrenade",

	//rhs
	"rhs_mag_m67",
	"rhs_mag_f1",
	"rhs_mag_m18_yellow",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_rdg2_black",
	"rhs_mag_rdg2_white",
	"rhs_mag_rgd5"
];

weaponAccessoryLoot = [
	//vanilla
	"acc_flashlight",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",

	//rhs
	"rhs_acc_2dpZenit",
	"rhs_acc_uuk",
	"rhs_acc_ak5",
	"rhs_acc_dtk",
	"rhs_acc_dtk2",
	"rhs_acc_dtk4short",
	"rhs_acc_dtk1983",
	"rhs_acc_dtk3",
	"rhs_acc_grip_ffg2",
	"rhs_acc_harris_swivel",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15_top",
	"rhsusf_acc_anpeq15_wmx_light",
	"rhsusf_acc_anpeq15_wmx",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip2_tan",
	"rhsusf_acc_grip1",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_grip3",
	"rhsusf_acc_grip3_tan"
];

sightsLoot = [
	//vanilla rifle sights
	"optic_ACO_grn",
	"optic_Aco_smg",
	"optic_Aco",
	"optic_Holosight",

	//vanilla handgun sights
	"optic_Yorris",
	"optic_MRD",

	//rhs rifle sights
	"rhs_acc_rakursPM",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_xps3",
	"rhs_acc_1p63",
	"rhs_acc_ekp1",
	"rhs_acc_pkas",

	//fhq rifle sights
	"FHQ_optic_AC11704",
	"FHQ_optic_AC11704_tan",
	"FHQ_optic_AC12136",
	"FHQ_optic_AIM",
	"FHQ_optic_AIM_tan",
	"FHQ_optic_HWS",
	"FHQ_optic_HWS_tan",
	"FHQ_optic_MARS",
	"FHQ_optic_MARS_tan",
	"FHQ_optic_MicroCCO",
	"FHQ_optic_MicroCCO_tan",
	"FHQ_optic_MicroCCO_low",
	"FHQ_optic_MicroCCO_low_tan"
];

scopesLoot = [
	//vanilla scopes
	"optic_Arco",
	"optic_MRCO",

	//rhs scopes
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_SpecterDR",
	"rhsusf_acc_ACOG_RMR",
	"rhsusf_acc_ACOG_wd",
	"rhs_acc_1p29",
	"rhs_acc_1p78",
	"rhs_acc_pgo7v",
	"rhs_acc_pgo7v_ak",
	"rhs_acc_pso1m2",
	"rhs_acc_pso1m2_ak",
	"rhs_acc_pso1m21",
	"rhs_acc_pso1m21_ak",

	//fhq scopes
	"FHQ_optic_ACOG",
	"FHQ_optic_ACOG_tan",
	"FHQ_optic_AimM_BLK",
	"FHQ_optic_AimM_TAN",
	"FHQ_optic_HWS_G33",
	"FHQ_optic_HWS_G33_tan",
	"FHQ_optic_MCCO_M_BLK",
	"FHQ_optic_MCCO_M_TAN",
	"FHQ_optic_VCOG",
	"FHQ_optic_VCOG_tan"
];
