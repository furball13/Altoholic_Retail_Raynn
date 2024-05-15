local addonName = "Altoholic"
local addon = _G[addonName]

-- From DataStore_Achievements\Enum.lua
local cat = DataStore.Enum.AchievementCategories

--[[
How to read and modify the lists below:

The achievement categories displayed in the add-on are the combination of data found in the 2 tables sortedAchievements & unsortedAchievements.

A given category can be present in just sortedAchievements (if the list is fully sorted) or in both tables.
When data is present in both tables, achievements will be displayed using the following rule:

- First all sorted achievements will be displayed in the specified order.
- Then the remaining achievements from the unsorted list will be added in alphabetical order (based on their name in-game)
=> this implies that the unsorted achievements will be displayed in a different order based on the localization.

Information about factions :

- All achievements that are not faction specific (most of them), are entered as numbers in the tables.
- If an achievement exists for both factions (i.e. with 2 different id's), then it is represented as a string
in the following format "alliance id : horde id", always with the alliance id first.

Note: this rules applies for achievements that are really identical, same objective, same achievement name.

There are some achievements that are identical for both factions, but that bear different names, so treat them separately !

--]]

local sortedAchievements = {
	-- Character
	[cat.Character] = { 14796, 14797, 545, 546 },
	[cat.CharacterLevel] = { 6, 7, 8, 9, 14884, 14782, 14783, 15805, 7382, 7383, 7384, 7380 },
	[cat.CharacterMoney] = { 1176, 1177, 1178, 1180, 1181, 5455, 5456, 6753 },
	[cat.CharacterRiding] = { 891, 889, 890, 5180 },

	-- Quests
	[cat.Quests] = { 1182, 5752, 1576, 4958, 941, 14222 },
	[cat.QuestsCompleted] = { 503, 504, 505, 506, 507, 508, 32, 978, 7520 },
	[cat.QuestsDaily] = { 31, 973, 974, 975, 976, 977, 5751, 7410, 7411 },
	[cat.QuestsWorld] = { 11126, 11127, 11128, 11129, 11130, 11131, 11132 },
	[cat.QuestsDungeon] = { 4956, 4957 },

	[cat.QuestsEasternKingdoms] = { 1676, 4896, 4900, 4909, 4901, 4905, 12430, 4892, 4908, 4895, 4897, 4899, 4906, 4902,
		4910, 4894, 4904, 4893, 4903, 12429 },
	[cat.QuestsKalimdor] = { 1678, "4925:4976", 4927, 4926, 4928, 4930, "4929:4978", 4931, "4932:4979", 4933, 4934,
		"4937:4981", "4936:4980", 4935, 4938, 4939, 4940 },
	[cat.QuestsOutland] = { 1262, "1189:1271", 1190, "1191:1272", "1192:1273", 1193, 1194, 1195 },
	[cat.QuestsNorthrend] = { 41, "33:1358", "34:1356", "35:1359", "37:1357", 36, 39, 38, 40 },
	[cat.QuestsCataclysm] = { 4875, 4870, "4869:4982", 4871, 4872, "4873:5501" },
	[cat.QuestsPandaria] = { 6541, "6300:6534", 6301, "6535:6536", "6537:6538", 6539, 6540, 7929, 7928, 8121, 8099 },
	[cat.QuestsDraenor] = { "9833:9923", "8921:8922", 8671, 8845, "8923:8924", "8920:8919", "8925:8926", "8927:8928",
		"9491:9492", "10067:10074", "9825:9836", 9606, 9602, 9607, 9674, 9605, 9615, "9564:9562", "10068:10075" },
	[cat.QuestsLegion] = { 11157, 10763, 10698, 10059, 10790, 11124, 10617, 11340, 11544, 11846, 11546, 11189, 11731, 11732,
		11735, 11736, 11737, 11738, 12073, 12066 },
	[cat.QuestsBfA] = { 12593, 12582, 12473, 12497, 12496, 12997, 12891, 12510, 12555, 12478, 11868, 11861, 13294, 12480,
		12481, 12479, 12509, 13144, 13512 },
	[cat.QuestsShadowlands] = { 14280, 14334, 14281, 14801, 14206, 14799, 14164, 14800, 13878, 14798, 14790, 14758 },
	[cat.QuestsShadowlands92] = { 15336, 15518, 15515, 15259 },
	[cat.QuestsDragonflight] = { 16585, 16334, 16401, 15394, 16405, 16336, 16428, 16363, 16398 },
	[cat.QuestsDragonflight101] = { 17739, 17734, 17779, 17785, 17735 },
	[cat.QuestsDragonflight102] = { 19026, 19318, 18958, 19293 },

	-- Exploration
	[cat.Exploration] = { 964, 1244, 1832, 1833, 2556, 9924 },
	[cat.ExplorationExplorer] = { 42, 43, 44, 45, 4868, 6974, 8935, 11188, 12988, 46, 15388 },

	[cat.ExplorationEasternKingdoms] = { 761, 765, 766, 775, 777, 627, 778, 771, 776, 859, 858, 772, 868, 779, 781, 780, 774,
		769, 782, 4995, 773, 768, 770, 802, 841, 1206 },
	[cat.ExplorationKalimdor] = { 845, 852, 860, 861, 844, 848, 728, 850, 853, 849, 855, 736, 750, 856, 4996, 847, 851, 842,
		846, 854, 857 },
	[cat.ExplorationOutland] = { 862, 863, 867, 866, 865, 843, 864, 1311, 1312 },
	[cat.ExplorationNorthrend] = { 1254, 1263, 1264, 1265, 1266, 1267, 1457, 1268, 1269, 1270, 1956, 2256, 2257, 2557 },
	[cat.ExplorationCataclysm] = { 4863, 4825, 4864, 4865, 4866, 4975, 5518, 5548, 5754, 4827, 5753 },
	[cat.ExplorationPandaria] = { 6350, 6351, 6969, 6975, 6976, 6977, 6978, 6979, 7437, 7438, 7439, 7994, 7995, 7996, 7997,
		7281, 7282, 7283, 7284, 8723, 8784 },
	[cat.ExplorationDraenor] = { 10018, 8937, 8938, 8939, 8940, 8941, 8942, 10260, 9726, 9727, 10348, 9728, 10261, 10262,
		9400, 10061, 10259, 10070 },
	[cat.ExplorationLegion] = { 11190, 11446, 10665, 10666, 10667, 10668, 10669, 11543, 11256, 11258, 11257, 11259, 11260,
		11261, 11262, 11264, 11263, 11265, 12101, 12102, 12103, 12104, 12077, 12078, 12026, 12028, 12074, 12083, 12084 },
	[cat.ExplorationBfA] = { 12557, 12556, 12558, 12560, 12561, 12559, 13776, 13712, 12940, 12942, 12944, 12941, 12943,
		12939, 12852, 12851, 12995, 12849, 12853, 12771, 13475, 13477, 13476, 13482, 13555, 13474, 13478, 13479, 13686, 13744,
		13745, 13743, 13754, 13755, 13753, 13759, 13760, 13758, 13762, 13746, 13747, 13748, 13749, 13751, 13752, 13750, 13756,
		13757, 13761 },
	[cat.ExplorationShadowlands] = { 14303, 14305, 14304, 14306, 14663, 14307, 14308, 14309, 14310, 14311, 14312, 14313,
		14314, 14825, 14743, 14744 },
	[cat.ExplorationDragonflight] = { 16452, 16400, 16457, 16460, 16518 },

	[cat.PvP] = { 907, 714, 727, 1157, "2016:2017", 389, 396, 10561, 247 },
	[cat.PvPHonorableKills] = { 229, 245, "246:1005", 238, 513, 515, 516, 512, 509, 239, 869, 870, 5363 },
	[cat.PvPKills] = { 604, 603, "388:1006", 614, 613, 14817, 619, 616, 618, 14815 },
	[cat.PvPBattleground] = { 230, 1175, "8052:8055", "908:909", 227, 231 },
	[cat.PvPHonor] = { 12893, 12894, 12895, 12900, 12901, 12902, 12903, 12904, 12905, 12906, 12907, 12908, 12909, 12910,
		12911, 12912, 12913, 12914, 12915, 12916, 12917, 13701, 13702, 13703 },
	[cat.PvPArena] = { 397, 398, 875, 876, 2090, 2093, 2092, 2091 },
	[cat.PvPRatedBattleground] = { 5269, 5323, 5324, 5325, 5824, 5326, 5345, 5346, 5347, 5348, 5349, 5350, 5351, 5352, 5338,
		5353, 5354, 5355, 5342, 5356, 6941, 5268, 5322, 5327, 5328, 5823, 5329, 5330, 5331, 5332, 5333, 5334, 5335, 5336, 5337,
		5359, 5339, 5340, 5341, 5357, 5343, 6942 },
	[cat.PvPWorld] = { 12573, 12571, 12572, 12577, 12579, 12578, 12576, 12574, 12575, 13570, 13569, "12605:12604",
		"13439:13438", "13402:13403", "13387:13388", 14514, 14513, 14511, 14512, 11475, 11476, 11477, 11478, 11474 },
	[cat.PvPWarsongGulch] = { 166, 167, 1172 },
	[cat.PvPArathi] = { 154, 155, 1169 },
	[cat.PvPEyeOfTheStorm] = { 208, 209, 1171 },
	[cat.PvPAlteracValley] = { 218, 219, 1167 },
	[cat.PvPAshran] = { 9218, 9219, 9220 },
	[cat.PvPIsleOfConquest] = { 3776, 3777, "3857:3957" },
	[cat.PvPWintergrasp] = { 1752, 1717, 1718, 3136, 3137, 3836, 3837, 4585, 4586, "1737:2476" },
	[cat.PvPBattleForGilneas] = { 5245, 5246, 5258 },
	[cat.PvPTwinPeaks] = { 5208, 5209, 5223 },
	[cat.PvPSilvershardMines] = { 6739, 6883, 7106 },
	[cat.PvPTempleOfKotmogu] = { 6740, 6882, 6981 },
	[cat.PvPSeethingShore] = { 12409, 12410, 12412 },
	[cat.PvPDeepwindGorge] = { 8331, 8332 },

	[cat.DungeonHero] = { 1283, 1284, 1288, 1287, 1289, 4844, 6925, 9391, 11164, 12807, 14418, 16294 },
	[cat.DungeonGloryHero] = { 2136, 4845, 6927, 9396, 11163, 12812, 14322, 16295 },
	[cat.DungeonGloryRaider] = { 1285, 1286, 2137, 2138, 12401, 4602, 4603, 4853, 5828, 6169, 6932, 8124, 8454, 8985, 10149,
		11180, 11763, 11987, 12806, 13315, 13687, 14146, 14355, 15130, 15491, 16355 },
	[cat.DungeonsOther] = { 4476, 4477, 4478, 11183, 11184, 11185, 11162, 1658, 6926, 9619, 5506 },

	[cat.DungeonsClassic] = { 629, 628, 630, 631, 632, 633, 635, 634, 636, 637, 7413, 638, 639, 640, 641, 642, 643, 644, 645,
		646 },
	[cat.DungeonsBurningCrusade] = { 647, 667, 648, 668, 649, 669, 650, 670, 651, 671, 666, 672, 652, 673, 653, 674, 654,
		675, 655, 676, 656, 677, 657, 678, 658, 679, 659, 680, 660, 681, 661, 682 },
	[cat.DungeonsLichKing] = { 477, 489, 478, 490, 480, 491, 481, 492, 482, 493, 483, 494, 484, 495, 485, 496, 486, 497, 487,
		498, 488, 499, 479, 500, "4296:3778", "4298:4297", 4516, 4519, 4517, 4520, 4518, 4521 },
	[cat.DungeonsCataclysm] = { 4833, 5060, 4839, 5061, 4846, 5063, 4847, 5064, 4840, 5062, 4841, 5065, 4848, 5066, 5083,
		5093, 5769, 5768, 6117, 6118, 6119 },
	[cat.DungeonsPandaria] = { 6757, 6758, 6457, 6456, 6469, 6470, 6755, 6756, 10010, 6759, 6760, 6761, 6762, 10011, 6763 },
	[cat.DungeonsDraenor] = { 9037, 9046, 10076, 9038, 9047, 10079, 9039, 9049, 10080, 8843, 8844, 10081, 9043, 9052, 10082,
		9041, 9054, 10084, 9044, 9053, 10083, 9042, 9055, 10085 },
	[cat.DungeonsLegion] = {
		10780, 10781, 10782, 10456, 10458, 10457, -- Eye of Azshara
		10783, 10784, 10785, 10769, 10766, -- Darkheart Thicket
		10786, 10788, 10789, 10542, 10544, 10543, -- Halls of Valor
		10795, 10796, 10797, 10875, 10996, -- Neltharion's Lair
		10798, 10799, 10800, 10554, 10553, -- Assault on Violet Hold
		10801, 10802, 10803, 10707, 10679, 10680, -- Vault of the Wardens
		10804, 10805, 10806, 10710, 10711, 10709, -- Blackrook Hold
		10807, 10808, 10809, 10411, 10413, 10412, -- Maw of Souls
		10813, 10773, 10775, 10776, -- Arcway
		10816, 10611, 10610, -- Court of Stars
		11929, 11429, 11433, 11338, 11430, 11432, 11335, 11431, -- Return to Karazhan
		11700, 11701, 11702, 11769, 11768, 11703, -- Cathedral of Eternal Night
		12007, 12008, 12009, 12005, 12004, -- Seat of the Triumvirate
		11183, 11184, 11185, 11162, 11181, -- Keystones
		11181 -- Keystones
	},

	[cat.RaidsClassic] = { 686, 685, 689, 687 },
	[cat.RaidsBurningCrusade] = { 690, 692, 693, 694, 695, 696, 697, 698 },
	-- [cat.RaidsLichKing] = {  },
	-- 3.0 Vault of Archavon
	[cat.RaidsLichKingVaultOfArchavon] = { 1722, 1721, 3136, 3137, 3836, 3837, 4585, 4586, 4016, 4017 },
	-- 3.0 Naxxramas
	[cat.RaidsLichKingNaxxramas] = { 562, 563, 564, 565, 566, 567, 568, 569, 572, 573, 574, 575, 576, 577 },
	-- 3.0 Obsidian Sanctum
	[cat.RaidsLichKingObsidianSanctum] = { 1876, 625, 2047, 2048, 624, 1877, 2049, 2052, 2050, 2053, 2051, 2054 },
	-- 3.0 Eye of Eternity
	[cat.RaidsLichKingEyeOfEternity] = { 1869, 1870, 2148, 2149, 622, 623, 1874, 1875 },
	-- 3.1 Ulduar
	-- [cat.RaidsLichKingUlduar] = {  },
	-- 3.2 Trial of the Crusader
	[cat.RaidsLichKingTrialOfTheCrusader] = { 3917, 3916, 3918, 3812, 3936, 3937, 3798, 3799, 3815, 3800, 3816, 3996, 3997,
		3797, 3813 },
	-- 3.2 Onyxia's Lair
	[cat.RaidsLichKingOnyxiasLair] = { 4403, 4406, 4402, 4405, 4396, 4397, 4404, 4407 },
	-- 3.3 Icecrown Citadel
	[cat.RaidsLichKingIcecrownCitadel] = { 4531, 4604, 4528, 4605, 4529, 4606, 4527, 4607, 4530, 4597, 4532, 4608, 4628,
		4632, 4629, 4633, 4630, 4634, 4631, 4635, 4583, 4584, 4636, 4637 },
	-- 3.3 Ruby Sanctum
	[cat.RaidsLichKingRubySanctum] = { 4817, 4815, 4818, 4816 },

	-- 4.0 Blackwing Descent
	[cat.RaidsCataclysmBlackwingDescent] = { 4842, 5094, 5107, 5108, 5109, 5115, 5116 },
	-- 4.0 Bastion of Twilight
	[cat.RaidsCataclysmBastionOfTwilight] = { 4850, 5118, 5117, 5119, 5120, 5121 },
	-- 4.0 Throne of the Four Winds
	[cat.RaidsCataclysmThroneOfTheFourWinds] = { 4851, 5122, 5123 },
	-- 4.2 Firelands
	[cat.RaidsCataclysmFirelands] = { 5802, 5807, 5808, 5809, 5806, 5805, 5804, 5803 },
	-- 4.3 Dragon Soul
	[cat.RaidsCataclysmDragonSoul] = { 6106, 6107, 6177, 6109, 6110, 6111, 6112, 6113, 6114, 6115, 6116 },

	[cat.RaidsPandaria] = { 6480, 6517, 8028, 8123, 8535 },
	-- 5.0 Mogu'Shan Vaults
	[cat.RaidsPandariaMoguShanVaults] = { 6458, 6844, 6719, 6720, 6721, 6722, 6723 },
	-- 5.0 Heart of Fear
	[cat.RaidsPandariaHeartOfFear] = { 6718, 6845, 6725, 6726, 6727, 6728, 6729, 6730 },
	-- 5.0 Terrace of Endless Spring
	[cat.RaidsPandariaTerraceOfEndlessSpring] = { 6689, 6731, 6732, 6733, 6734 },
	-- 5.2 Throne of Thunder
	[cat.RaidsPandariaThroneOfThunder] = { 8069, 8070, 8071, 8072, 8056, 8057, 8058, 8059, 8060, 8061, 8062, 8063, 8064,
		8065, 8066, 8067, 8068 },
	-- 5.4 Siege of Orgrimmar
	[cat.RaidsPandariaSiegeOfOrgrimmar] = { 8458, 8459, 8461, 8462, 8679, 8680, 8463, 8465, 8466, 8467, 8468, 8469, 8470,
		8471, 8472, 8478, 8479, 8480, 8481, 8482 },

	[cat.RaidsDraenor] = { 9423, 9425, 10071 },
	-- 6.0 Highmaul
	[cat.RaidsDraenorHighmaul] = { 8986, 8987, 8988, 8949, 8960, 8961, 8962, 8963, 8964, 8965 },
	-- 6.0 Blackrock Foundry
	[cat.RaidsDraenorBlackrockFoundry] = { 8989, 8990, 8991, 8992, 8966, 8967, 8968, 8956, 8932, 8969, 8970, 8971, 8972,
		8973 },
	-- 6.2 Hellfire Citadel
	[cat.RaidsDraenorHellfireCitadel] = { 10023, 10024, 10025, 10020, 10019, 10027, 10032, 10033, 10034, 10035, 10253, 10037,
		10040, 10041, 10038, 10039, 10042, 10043 },

	-- 7.0 Emerald Nightmare
	[cat.RaidsLegionEmeraldNightmare] = { 10818, 10819, 10820, 10821, 10822, 10823, 10824, 10825, 10826, 10827, 10555, 10771,
		10753, 10830, 10663, 10772, 10755 },
	-- 7.1 Trial of Valor
	[cat.RaidsLegionTrialOfValor] = { 11394, 11426, 11337, 11386, 11377, 11396, 11397, 11398 },
	-- 7.1 The Nighthold
	[cat.RaidsLegionNighthold] = { 10829, 10837, 10838, 10839, 10840, 10842, 10843, 10844, 10845, 10846, 10847, 10848, 10849,
		10850, 10678, 10697, 10742, 10817, 10851, 10754, 10704, 10575, 10699, 10696 },
	-- 7.2 Tomb of Sargeras
	[cat.RaidsLegionTombOfSargeras] = { 11787, 11788, 11789, 11790, 11767, 11774, 11775, 11776, 11777, 11778, 11779, 11780,
		11781, 11724, 11696, 11683, 11676, 11675, 11674, 11773, 11770, 11699 },
	-- 7.3 Antorus, the Burning Throne
	[cat.RaidsLegionAntorus] = { 11988, 11989, 11990, 11991, 11992, 11993, 11994, 11995, 11996, 11997, 11998, 11999, 12000,
		12001, 12002, 11949, 11948, 11930, 11928, 11915, 12065, 12129, 12067, 12030, 12046, 12257 },

	-- 8.0 Uldir
	[cat.RaidsBfAUldir] = { 12521, 12522, 12523, 12524, 12526, 12530, 12527, 12529, 12531, 12532, 12533 },
	-- 8.1 Battle of Dazar'alor
	[cat.RaidsBfABattleOfDazaralor] = { 13286, 13289, 13287, 13291, 13288, 13292, "13298:13295", 13293, 13299, 13300, 13311,
		13312, 13313, 13314 },
	-- 8.1 Crucible of Storms
	[cat.RaidsBfACrucibleOfStorms] = { 13414, 13416, 13417, 13501, 13506 },
	-- 8.2 The Eternal Palace
	[cat.RaidsBfAEternalPalace] = { 13718, 13719, 13725, 13726, 13728, 13727, 13729, 13730, 13731, 13732, 13733 },
	-- 8.3 Ny'alotha
	[cat.RaidsBfANyalotha] = { 14193, 14194, 14195, 14196, 14041, 14043, 14044, 14045, 14046, 14048, 14049, 14052, 14050,
		14051, 14054, 14055 },

	-- 9.0 Castle Nathria
	[cat.RaidsShadowlandsCastleNathria] = { 14715, 14717, 14718, 14356, 14357, 14360, 14359, 14358, 14361, 14362, 14363,
		14364, 14365 },
	-- 9.1 Sanctum of Domination
	[cat.RaidsShadowlandsSanctumOfDomination] = { 15122, 15123, 15124, 15126, 15127, 15668, 15128, 15112, 15113, 15114,
		15115, 15116, 15117, 15118, 15119, 15120, 15121 },
	-- 9.2 Sepulcher of the First Ones
	[cat.RaidsShadowlandsSepulcherOfTheFirstOnes] = { 15417, 15478, 15490, 15479, 15480, 15481, 15482, 15483, 15484, 15485,
		15486, 15487, 15488, 15489 },

	-- 10.0 Vault of the Incarnates
	[cat.RaidsDragonflightVaultOfTheIncarnates] = {
		16343, -- Vault of the Incarnates
		16345, -- Heroic: Vault of the Incarnates
		16354, -- Mythic: Vault of the Incarnates
		17110, -- The Primal Bulwark
		17111, -- Caverns of Infusion
		17112, -- Fury of the Storm
		16346, -- Mythic: Eranog
		16347, -- Mythic: Terros
		16348, -- Mythic: The Primal Council
		16349, -- Mythic: Sennarth, The Cold Breath
		16350, -- Mythic: Dathea, Ascended
		16351, -- Mythic: Kurog Grimtotem
		16352, -- Mythic: Broodkeeper Diurna
		16353, -- Mythic: Raszageth the Storm-Eater
		16335, -- What Frozen Things Do
		16365, -- Little Friends
		16364, -- The Lunker Below
		16419, -- I Was Saving That For Later
		16458, -- Nothing But Air
		16450, -- The Power is MINE!
		16442, -- Incubation Extermination
		16451, -- The Ol Raszle Daszle
	},
	-- 10.1 Aberrus
	[cat.RaidsDragonflightAberrus] = {
		18160, -- Aberrus, the Shadowed Crucible
		18161, -- Heroic: Aberrus, the Shadowed Crucible
		18162, -- Mythic: Aberrus, the Shadowed Crucible
		18163, -- Discarded Works
		18164, -- Fury of Giants
		18165, -- Neltharion's Shadow
		18167, -- Edge of the Void
		18151, -- Mythic: Kazzara, the Hellforged
		18152, -- Mythic: The Amalgamation Chamber
		18153, -- Mythic: The Forgotten Experiments
		18154, -- Mythic: Assault of the Zaqali
		18155, -- Mythic: Rashok, the Elder
		18156, -- Mythic: The Vigilant Steward, Zskarn
		18157, -- Mythic: Magmorax
		18158, -- Mythic: Echo of Neltharion
		18159, -- Mythic: Scalecommander Sarkareth
		18229, -- Cosplate
		18168, -- I'll Make My Own Shadowflame
		18173, -- Tabula Rasa
		18228, -- Are You Even Trying?
		18230, -- Whac-A-Swog
		18193, -- Eggscellent Eggsecution
		18172, -- Escar-Go-Go-Go
		18149, -- Objects in Transit May Shatter
		17877, -- We'll Never See That Again, Surely
	},
	-- 10.2 Amirdrassil
	[cat.RaidsDragonflightAmirdrassil] = {
		19331, -- Amirdrassil, the Dream's Hope
		19333, -- Heroic: Amirdrassil, the Dream's Hope
		19334, -- Mythic: Amirdrassil, the Dream's Hope
		19344, -- Incarnate's Wake
		19345, -- Molten Incursion
		19346, -- The Viridian Weave
		19347, -- Fate of Amirdrassil
		19335, -- Mythic: Gnarlroot
		19336, -- Mythic: Igira the Cruel
		19337, -- Mythic: Volcoross
		19338, -- Mythic: Council of Dreams
		19339, -- Mythic: Larodar, Keeper of the Flame
		19340, -- Mythic: Nymue, Weaver of the Cycle
		19341, -- Mythic: Smolderon
		19342, -- Mythic: Tindral Sageswift, Seer of the Flame
		19343, -- Mythic: Fyrakk the Blazing
		19322, -- Meaner Pastures
		19320, -- Cruelty Free
		19321, -- Swog Champion
		19193, -- Ducks In A Row
		19394, -- A Dream Within a Dream
		19089, -- Don't Let the Doe Hit You On The Way Out
		19319, -- Haven't We Done This Before?
		19393, -- Whelp, I'm Lost
		19390, -- Memories of Teldrassil
	},

	[cat.Professions] = { 116, 731, 732, 733, 734, 4924, 6830, 9464, 735, 4914, 6835, 9507, 7378, 7379, 9087, 9071, 9454,
		9453, 12737, 13516, 12735, 12740, 12733, 13056, 10583, 10581, 10586, 10587, 10582, 10585, 10761, 10588, 12736, 12741,
		12734, 12731, 14328, 14329, 14330 },
	[cat.ProfessionsCooking] = { "1563:1784", 3296, 1998, 1999, 2000, 2001, 2002 },
	[cat.ProfessionsCookingLevel] = { 121, 122, 123, 124, 125, 4916, 6365, 7300, 7301, 7302, 7303, 7304, 7305, 7306, 9500,
		10589, 12742, 12743, 14332, 16631 },
	[cat.ProfessionsCookingLearn] = { 1795, 1796, 1797, 1798, 1799, 5471, 7328 },
	[cat.ProfessionsCookingCook] = { 1800, 1777, 1778, 1779, 5472, 5473, 7326, 7327, 9501, 10762, 12744, 12746 },
	[cat.ProfessionsCookingDailyQuests] = { 5474, 5841, 5842, 5475, 5843, 5844, "5845:5846" },
	[cat.ProfessionsFishing] = { 9547 },
	[cat.ProfessionsFishingLevel] = { 126, 127, 128, 129, 130, 4917, 6839, 9503, 10594, 12753, 12754, 14333, 16632 },
	[cat.ProfessionsFishingFishUp] = { 1556, 1557, 1558, 1559, 1560, 1561, 2094, 2095, 1957, 2096, 10722, 1837, 1836, 726,
		144, 1958, 150, 12756, 12990, 12758, 12759, 16546, 16563, 16562, 16561, 16533, 16531 },
	[cat.ProfessionsFishingCatch] = { 306, 1225, 1517, 1516, 7611, 9456, 9457, 9458, 9459, 9455, 9460, 9461, 9462, 10597,
		10595, 10596, 12757, 16548, 16564, 16565, 17207 },
	[cat.ProfessionsFishingDailyQuests] = { 5476, 5847, 5848, 5477, 5849, 5850, 5851, 905, 3217 },
	[cat.ProfessionsArchaeologyLevel] = { 4857, 4919, 4920, 4921, 4922, 4923, 6837, 9409, 10600, 12760, 12761 },
	[cat.ProfessionsArchaeologyFind] = { 5315, 5469, 5470, 4854, 4855, 4856, 9422 },
	[cat.ProfessionsArchaeologyCollector] = { 8222, 8223, 7345, 7365, 8220, 8221, 7343, 7363, 7349, 7369, 7353, 7373, 7342,
		7362, 7344, 7364, 8226, 8227, 7354, 7374, 8234, 8235, 7348, 7368, 8230, 8231, 7356, 7376, 7339, 7359, 7338, 7358, 7346,
		7366, 7351, 7371, 8232, 8233, 8224, 8225, 8228, 8229, 7347, 7367, 7350, 7370, 7352, 7372, 7340, 7360, 7341, 7361, 7355,
		7375, 7357, 7377 },
	[cat.ProfessionsArchaeologyLegion] = { 10607, 10608, 10609, 10605, 10601, 10602, 10603, 10604, 10606 },
	[cat.ProfessionsArchaeologyBfA] = { 12769, 12770, 12765, 12762, 12764 },

	[cat.ReputationsExalted] = { 522, 523, 524, 521, 520, 519, 518, 1014, 1015, 5374, 5723, 6826, 6742, 11177, 12864, 12865,
		12866 },
	[cat.ReputationsAlliedRaces] = { 12515, 13163, 12243, 14013, 12242, 12245, 12518, 12244, 13206, 13161 },
	[cat.ReputationsHeritage] = { 13076, 13504, 12414, 14014, 12291, 12415, 13077, 12413, 14002, 13503 },
	[cat.ReputationsDraenor] = { 9469, 9470, 9471, 9472, 9476, 9475, "9478:9477", 9072, "10350:10349" },
	[cat.ReputationsShadowlands] = { 14338, 14335, 14337, 14336, 14656, 14315, 15059, 15069, 15220 },
	[cat.ReputationsDragonflight] = { 16549, 16536, 16532, 16494, 16537, 16539 },

	[cat.WorldEvents] = { 9426, 9427, 9428 },
	[cat.WorldEventsLunarFestival] = { 605, 606, 607, 608, 609 },
	[cat.WorldEventsLoveIsInTheAir] = { 9389, 9392, 9393, 9394 },
	[cat.WorldEventsMidSummerDesecrate] = { "1028:1031", "1029:1032", "1030:1033", "6007:6010", "6013:6014", "8042:8043",
		"11276:11277", "11278:11279", 13343, 13342, 1037, 1035 },
	[cat.WorldEventsMidSummerKeepers] = { 1025, 1026, 1027, 6009, 6012, 8044, 11284, 11282, 13340, 17738, 1036 },
	[cat.WorldEventsMidSummerWardens] = { 1022, 1023, 1024, 6008, 6011, 8045, 11283, 11280, 13341, 17737, 1034 },
	[cat.WorldEventsBrewfest] = { 18579, 2796, 1183, 295, 293, 1936, 1260, 303, "1184:1203", 1185 },
	[cat.WorldEventsHallowsEndTricks] = { "966:967", "963:965", "969:968", "5836:5835", "5837:5838", "7601:7602", 18360, 971 },
	[cat.WorldEventsDarkmoon] = { 9250, 9251, 9252, 9983 },
	[cat.WorldEventsDarkmoonRealRace] = { 9755, 9756, 9759, 9760, 9761, 9770, 9769, 9766, 9764, 9780, 9781, 9783, 9785, 9786,
		9787, 9790, 9792 },
	[cat.WorldEventsDarkmoonRealBigRace] = { 9793, 9794, 9795, 9797, 9799, 9800, 9801, 9803, 9805, 9812, 9813, 9815, 9817,
		9806, 9807, 9809, 9811 },
	[cat.WorldEventsDarkmoonDance] = { 15212, 15213, 15222, 15223, 15214, 15215, 15216, 15217, 15221 },
	[cat.WorldEventsTimewalking] = { 15309, 15310, 19079 },

	[cat.PetBattlesCollect] = { 6554, 6555, 6556, 6557, 7436, 6612, 6613, 6614, 6615, 6616, 6611, 7465, 7462, 7463, 7464 },
	[cat.PetBattlesCollectUnique] = { 1017, 15, 1248, 1250, 2516, 5876, 5877, 5875, 7500, 7501, 9643, 12992, 12958, 15641,
		15642, 15643, 15644 },
	[cat.PetBattlesCollectLeashes] = { 7934, 8293, 9824, 11320, 12079, 13469 },
	[cat.PetBattlesCollectSafari] = { 6586, 6585, 6587, 6588, 6589, 6590, 9685, 11233, 12930, 13693, 13694, 14867, 16519 },
	[cat.PetBattlesBattle] = { 6603, 6602, 6604, 6605, 7525, 6606, 9724, 6601, 7498, 7499, 6607, 8410, 8518, 9069, 10052 },
	[cat.PetBattlesBattleWins] = { 6594, 6593, 6462, 6591, 6592, 6618, 6619, 6851, 6584, 6621, 6622, 6558, 6559, 6560, 9463 },
	[cat.PetBattlesBattlePvP] = { 6595, 6596, 6597, 6598, 6599, 6620, 8297, 8298, 8300, 8301, 12280, 12281, 12284, 12287,
		12282, 12286, 12289, 12283, 12279, 12285, 12290 },
	[cat.PetBattlesBattleLegion] = { 9686, 9687, 9688, 9689, 9690, 9691, 9692, 9693, 9694, 9695, 9696, 10876 },
	[cat.PetBattlesBattleArgus] = { 12089, 12091, 12092, 12093, 12094, 12095, 12096, 12097, 12098, 12099, 12100, 12088 },
	[cat.PetBattlesBattleBfA] = { 13280, 13270, 13271, 13272, 13273, 13274, 13281, 13275, 13277, 13278, 13279, 12936, 13766,
		13625, 13626 },
	[cat.PetBattlesBattleShadowlands] = { 14868, 14869, 14870, 14871, 14872, 14873, 14874, 14875, 14876, 14877, 14879, 14625,
		14881 },
	[cat.PetBattlesBattleDragonflight] = { 16464, 16501, 16503, 16504, 16505, 16506, 16507, 16508, 16509, 16510, 16511,
		16512 },
	[cat.PetBattlesLevel] = { 7433, 6566, 6567, 6568, 6569, 6570, 6579, 6580, 6583, 6578, 6581, 6582, 6609, 6610, 9070 },

	[cat.CollectionsToyBox] = { 9670, 9671, 9672, 9673, 10354, 11176, 12996, 15781, 13708 },
	[cat.CollectionsMounts] = { 2141, 2142, 2143, "2536:2537", "7860:7862", "8302:8304", "9598:9599", "10356:10355",
		"12932:12931", "12933:12934", "15834:15833" },
	[cat.CollectionsAppearances] = { 10681, 10692, 10687, 10682, 10691, 10690, 10688, 10693, 10686, 10684, 10685, 10689,
		10694, 11761, 16502 },
	[cat.CollectionsAppearancesRaids] = { 11741, 11742, 11743, 11746, 11747, 11748, 11749, 11750, 11751, 11752, 11762, 11753,
		11754, 11755, 11756, 11757, 11758, 11759, 11740, 11631, 11628, 11760, 12020, 12991, 13385, 13571, 14058, 14614, 15110,
		16395 },
	[cat.CollectionsAppearancesPvP] = { 11706, 11707, 11708, 11709, 11710, 11711, 11712, 11713, 11714, 11715, 11716, 11717,
		11718, 11719, 11720, 11629, 11721, 11722, 11630, 11723, 12021, 12993, 13433, 13585, 14059, 14831, 15102 },
	[cat.CollectionsDrakeCosmetics] = {
		16699, -- Renewed Proto-Drake Scales and Patterns
		16696, -- Renewed Proto-Drake Armor
		16700, -- Renewed Proto-Drake Horns and Hair
		16697, -- Renewed Proto-Drake Head Features
		16698, -- Renewed Proto-Drake Tail Features
		16701, -- Windborne Velocidrake Scales and Patterns
		16702, -- Windborne Velocidrake Armor
		16704, -- Windborne Velocidrake Horns and Fur
		16705, -- Windborne Velocidrake Head Features
		16706, -- Windborne Velocidrake Back and Tail
		16707, -- Highland Drake Scales and Patterns
		16708, -- Highland Drake Armor
		16710, -- Highland Drake Horns and Hair
		16712, -- Highland Drake Head Features
		16711, -- Highland Drake Back and Tail
		16723, -- Cliffside Wylderdrake Scales and Patterns
		16724, -- Cliffside Wylderdrake Armor
		16725, -- Cliffside Wylderdrake Horns and Manes
		16727, -- Cliffside Wylderdrake Head Features
		16726, -- Cliffside Wylderdrake Back and Tail
	},

	[cat.ExpansionFeaturesArgentTournament] = { 2756, 2758, 2777, 2760, 2779, 2762, 2780, 2763, 2781, 2764, 2778, 2761, 2782,
		2770, 2817, 2783, 2765, 2784, 2766, 2785, 2767, 2786, 2768, 2787, 2769, 2788, 2771, 2816 },
	[cat.ExpansionFeaturesTolBarad] = { 5412, "5417:5418", "5489:5490", 5416, 6045, 6108 },
	[cat.ExpansionFeaturesPandariaScenarios] = { 6943, 7252, 8310, 7988, 7271, 8016, "8314:8315", "8364:8366", 8316, 8312,
		6923, 7522, 8311, 8009, 8317, 8318, 8013, 7265, 8010, 8294, 8327, "7523:7524", 7249 },
	[cat.ExpansionFeaturesProvingGrounds] = { 9590 },
	[cat.ExpansionFeaturesProvingGroundsDamage] = { 9572, 9573, 9574, 9575, 9576, 9577 },
	[cat.ExpansionFeaturesProvingGroundsHealer] = { 9584, 9585, 9586, 9587, 9588, 9589 },
	[cat.ExpansionFeaturesProvingGroundsTank] = { 9578, 9579, 9580, 9581, 9582, 9583 },
	[cat.ExpansionFeaturesDraenorGarrisons] = { "9100:9545", "9101:9546", "9210:9132", "9828:9897", "9912:9914",
		"10015:10016", "9928:9901", 8933, 9099, 9098, 9095, 9096, 9097, 9125, 9126, 9128, 9094, 9405, 9406, 9407, 9429, 9076,
		9077, "9078:9080", 9450, 9565, 9451, 9452, 9495, 9497, 9498, 9499, 9538, 9526, "9539:9705", "9540:9706", 9468, 9703,
		9527, 9517, 9520, 9518, 9519, 9516, 9521, 9522, 9509, 9510, 9511, 9512, 9513, 9514, 9515, 9639, "9738:9508", 9107, 9108,
		9109, 9494, 9130, 9131, 9110, 9111, 9129, 9211, 9212, 9213, 9243, 9152, 9167, 9543, 9244, 9162, 9164, 9165, 9826, 9181,
		9208, 9207, 9205, 9204, 9203, 9206, 9209, 9827, 9858, 9133, 9134, 9138, 9139, 9140, 9141, 9142, 9143, 9150, 9900, 9146,
		9523, 9145, 9524, 9147, 10177, 10169, 10168, 10166, 10165, 10170, "10172:10255", "10173:10275", "10174:10276",
		"10256:10258", "10167:10307", 10164, 10156, 10154, 10162, 10163, 10159, 10160, 10017, 10036, 10161, 10155 },

	[cat.ExpansionFeaturesLegionClassHall] = { 11298, 11223, 10994, 11135, 11136, 10746, 10459, 10460, 10461, 10747, 10748,
		"10749:11173", "10743:10745", 10706, 11212, 11213, 11214, 11215, 11216, 11217, 11219, 11220, 11221, 11222, 10750, 11171 },
	[cat.ExpansionFeaturesIslandExpeditions] = {
		12590, 12589, 12591, 12592, -- Un'gol Ruins
		13095, 13096, 13097, 13098, -- Dread Chain
		13103, 13104, 13105, 13106, -- Rotting Mire
		13099, 13100, 13101, 13102, -- Molten Cay
		13111, 13112, 13113, 13114, -- Verdant Mire
		13107, 13108, 13109, 13110, -- Skittering Hollow
		13119, 13118, 13116, 13115, -- Whispering Reef
		13577, 13578, 13579, 13580, -- Crestfall
		13396, 13397, 13398, 13400, -- Havenswood
		13389, 13394, 13395, 13399, -- Jorundall
		13581, 13582, 13583, 13584, -- Snowblossom Village
		13142, 13122, 13141, -- Miscellaneous
		12596, 12594, 12595, -- Win Normal/Heroic/Mythic
		12597, 13120, 13121, -- Win PvP
		13129, -- Sucker Punch
		13123, 13124, -- Loot Dubloons
		13125, 13126, 13127, 13128, "13133:13135", 13134, -- More Miscellaneous
		13132
	},
	[cat.ExpansionFeaturesWarEffort] = { "12896:12867", "12898:12869", "12899:12870", 12872, "12881:12873", "12888:12877",
		"12889:12876", "12884:12878", "12886:12879", 12874, "13739:13738", "14150:14149", "13737:13735", 13309, "13305:13306",
		"13308:13307", "13297:13296", 13310 },
	[cat.ExpansionFeaturesHeartOfAzeroth] = { 12918, 13572, 13769, 13770, 13771, 13772, 13773, 13775, 13998, 13777 },
	[cat.ExpansionFeaturesVisionsOfNzoth] = { 14170, 14171, 14172, 14173, 14063, 14065, 14067, 14062, 14064, 14066, 14143,
		13994, 14162, 14165, 14166, 14167, 14168, 14169, 14060, 14061 },
	[cat.ExpansionFeaturesTorghast] = { 14483, 14463, 14478, 14488, 14473, 14493, 14808, 14809, 14810, 15076, 15079, 14759,
		14760, 14795, 14754, 14755, 15093, 15095, 15094, 15096, 15092 },
	[cat.ExpansionFeaturesTorghastCorridors] = { 14468, 14469, 14470, 14471, 14472, 14568, 14569, 14570 },
	[cat.ExpansionFeaturesTorghastFlawless] = { 15091, 15083, 15081, 15084, 15087, 15082, 15088, 15089 },
	[cat.ExpansionFeaturesTorghastPhantasma] = { 14499, 14500, 14501, 14776 },
	[cat.ExpansionFeaturesCovenantSanctums] = { 14627, 14834, 14835, 14836, 14631, 14629, 14628, 14630, 14837, 14632, 14636,
		14633, 14637, 15023, 15024, 15025, 14777, 14639, 14638 },
	[cat.ExpansionFeaturesCovenantSanctumsKyrian] = { 14340, 14342, 14343, 14344, 14345, 14346, 14348, 14349, 14351 },
	[cat.ExpansionFeaturesCovenantSanctumsVenthyr] = { 14749, 14682 },
	[cat.ExpansionFeaturesCovenantSanctumsNightFae] = { 14670, 14675, 14676, 14677, 14780, 14789, 14775 },
	[cat.ExpansionFeaturesCovenantSanctumsNecrolords] = { 14684, 14753, 14751, 14748, 14833, 14752, 14764 },
	[cat.ExpansionFeaturesCovenantSanctumsAdventures] = { 14840, 14841, 14842, 14839, 14846, 14847, 14844, 14843 },

--[[
	[cat.ExpansionFeaturesDragonriderRacing] = { 15939, 15940, 15941, 15855, 15936, 15924, 15917, 15857, 15926, 15698, 15927,
		15718, 15923, 15895, 15726, 15920, 15696, 15899, 15732, 15938, 15925, 15719, 15922, 15841, 15856, 15704, 15697, 15738,
		15929, 15935, 15921, 15846, 15724, 15711, 15835, 15787, 15932, 15919, 15858, 15915, 15720, 15715, 15730, 15852, 15849,
		15844, 15845, 15843, 15842, 15768, 15765, 15707, 15838, 15840, 15839, 15837, 15836, 15786, 15931, 15918, 15859, 15774,
		16307, 16304, 15762, 15916, 15902, 15933, 15911, 15891, 15778, 15779, 15775, 15766, 15764, 15905, 15904, 15783, 15860,
		15772, 15773, 15769, 15770, 16305, 16303, 15703, 15757, 15758, 15937, 15802, 15827, 15828, 15821, 15928, 15716, 15712,
		15745, 15746, 15742, 15744, 15900, 15901, 15897, 15898, 15733, 15734, 15731, 15851, 15847, 15848, 15934, 15912, 15913,
		15894, 15893, 15892, 15727, 15725, 15780, 15776, 15767, 15763, 15710, 15705, 15706, 15906, 15907, 15903, 15782, 15785,
		15930, 15771, 16306, 16302, 15760, 15761, 15759, 15803, 15799, 15801, 15800, 15791, 15793, 15792, 15788, 15790, 15789,
		15831, 15822, 15818, 15739, 15740, 15736, 15737, 15721, 15723, 15717, 15714, 15747, 15735, 15850, 15914, 15909, 15910,
		15896, 15729, 15728, 15777, 15709, 15908, 15784, 15702, 15804, 15830, 15832, 15829, 15823, 15820, 15819, 15741, 15722,
		15713, 15743 },
]]--
	[cat.ExpansionFeaturesDragonriderRacing] = {
		19478, -- Now THIS is Dragon Racing!
		15939, -- Dragon Racing Completionist: Bronze
		15940, -- Dragon Racing Completionist: Silver
		17330, -- Reverse Racer: Bronze
		18790, -- Dragonriding Challenge: Dragon Isles: Bronze
        },
	[cat.ExpansionFeaturesDragonriderRacingWakingShores] = {
		16575, -- Waking Shores Glyph Hunter
		15917, -- Waking Shores: Gold
		15928, -- Waking Shores Advanced: Silver
		15929, -- Waking Shores Advanced: Gold
		17195, -- Waking Shores Reverse: Bronze
		18748, -- Waking Shores Challenge: Bronze
	},
	[cat.ExpansionFeaturesDragonriderRacingOhnaranPlains] = {
		16576, -- Ohn'ahran Plains Glyph Hunter
		15920, -- Ohn'ahran Plains: Gold
		15931, -- Ohn'ahran Plains Advanced: Silver
		15932, -- Ohn'ahran Plains Advanced: Gold
		17198, -- Ohn'ahran Plains Reverse: Bronze
		17199, -- Ohn'ahran Plains Reverse: Silver
		18754, -- Ohn'ahran Plains Challenge: Bronze
	},
        [cat.ExpansionFeaturesDragonriderRacingAzureSpan] = {
		16577, -- Azure Span Glyph Hunter
		15923, -- Azure Span: Gold
		15934, -- Azure Span Advanced: Silver
		15935, -- Azure Span Advanced: Gold
		17201, -- Azure Span Reverse: Bronze
		18757, -- Azure Span Challenge: Bronze
        },
        [cat.ExpansionFeaturesDragonriderRacingThaldraszus] = {
		16578, -- Thaldraszus Glyph Hunter
		15926, -- Thaldraszus: Gold
		15936, -- Thaldraszus Advanced: Bronze
		15937, -- Thaldraszus Advanced: Silver
		17204, -- Thaldraszus Reverse: Bronze
		18760, -- Thaldraszus Challenge: Bronze
        },
        [cat.ExpansionFeaturesDragonriderRacingForbiddenReach] = {
		17411, -- Forbidden Reach Glyph Hunter
		17294, -- Forbidden Reach Racing Completionist
		17296, -- Forbidden Reach Racing Completionist: Silver
		17279, -- Forbidden Reach: Bronze
		17280, -- Forbidden Reach: Silver
		17284, -- Forbidden Reach Advanced: Bronze
		17286, -- Forbidden Reach Advanced: Silver
		17288, -- Forbidden Reach Reverse: Bronze
		17289, -- Forbidden Reach Reverse: Silver
		18779, -- Forbidden Reach Challenge: Bronze
        },
        [cat.ExpansionFeaturesDragonriderRacingZaralekCavern] = {
		18150, -- Zaralek Cavern Glyph Hunter
		17492, -- Zaralek Cavern Racing Completionist
		17493, -- Zaralek Cavern Racing Completionist: Silver
		17485, -- Zaralek Cavern: Gold
		17486, -- Zaralek Cavern Advanced: Bronze
		17487, -- Zaralek Cavern Advanced: Silver
		17489, -- Zaralek Cavern Reverse: Bronze
		17490, -- Zaralek Cavern Reverse: Silver
		18786, -- Zaralek Cavern Challenge: Bronze
        },
        [cat.ExpansionFeaturesDragonriderRacingEmeraldDream] = {
		19306, -- Emerald Dream Glyph Hunter
		19118, -- Emerald Dream Racing Completionist
		19119, -- Emerald Dream Racing Completionist: Silver
		19127, -- Emerald Dream Challenge Racing Completionist
		19109, -- Emerald Dream: Bronze
		19110, -- Emerald Dream: Silver
		19112, -- Emerald Dream Advanced: Bronze
		19113, -- Emerald Dream Advanced: Silver
		19115, -- Emerald Dream Reverse: Bronze
		19116, -- Emerald Dream Reverse: Silver
		19121, -- Emerald Dream Challenge: Bronze
		19124, -- Emerald Dream Reverse Challenge: Bronze
        },
        [cat.ExpansionFeaturesDragonriderRacingKalimdorCup] = {
		17721, -- Kalimdor Racing Completionist
		17722, -- Kalimdor Racing Completionist: Silver
		17713, -- Kalimdor: Silver
		17714, -- Kalimdor: Gold
		17715, -- Kalimdor Advanced: Bronze
		17716, -- Kalimdor Advanced: Silver
		17718, -- Kalimdor Reverse: Bronze
		17719, -- Kalimdor Reverse: Silver
        },
        [cat.ExpansionFeaturesDragonriderRacingEasternKingdomsCup] = {
		18939, -- Eastern Kingdoms Racing Completionist
		18940, -- Eastern Kingdoms Racing Completionist: Silver
		18568, -- Eastern Kingdoms: Gold
		18569, -- Eastern Kingdoms Advanced: Bronze
		18570, -- Eastern Kingdoms Advanced: Silver
		18572, -- Eastern Kingdoms Reverse: Bronze
		18573, -- Eastern Kingdoms Reverse: Silver
        },
        [cat.ExpansionFeaturesDragonriderRacingOutlandCup] = {
		19105, -- Outland Racing Completionist
		19106, -- Outland Racing Completionist: Silver
		19092, -- Outland: Bronze
		19097, -- Outland: Silver
		19099, -- Outland Advanced: Bronze
		19100, -- Outland Advanced: Silver
		19102, -- Outland Reverse: Bronze
		19103, -- Outland Reverse: Silver
        },
        [cat.ExpansionFeaturesDragonriderRacingNorthrendCup] = {
		19721, -- Northrend Racing Completionist
		19722, -- Northrend Racing Completionist: Silver
		19674, -- Northrend: Bronze
		19675, -- Northrend: Silver
		19677, -- Northrend Advanced: Bronze
		19679, -- Northrend Advanced: Silver
		19682, -- Northrend Reverse: Bronze
		19683, -- Northrend Reverse: Silver
	},
	[cat.ExpansionFeaturesPrimalStorms] = { 16480, 16484, 16498, 16477, 16483, 16467, 16461, 16487, 16482, 16478, 16481,
		16465, 16479, 16476, 16500, 16475, 16492, 16486, 16463, 16488, 16489, 16466, 16485, 16468, 16499, 16490 },

	[cat.RemixPandaria] = {
		19871, -- Infinite Power
		20593, -- Time Trial
		40223, -- Timerunner
		19872, -- The Jade Forest
		19873, -- Valley of the Four Winds
		19874, -- Krasarang Wilds
		19875, -- Kun-Lai Summit
		19877, -- Townlong Steppes
		19878, -- Dread Wastes
		19876, -- Vale of Eternal Blossoms
		19879, -- Landfall
		19880, -- Isle of Thunder
		20003, -- Timeless Isle
		19881, -- Escalation
		20004, -- Heroic: Pandaria Scenarios
		20005, -- Heroic: Pandaria Dungeons
		20006, -- Pandaria Raids
		20007, -- Heroic: Pandaria Raids
		20008, -- Looking For Group: The Jade Forest
		20009, -- Looking For Group: Valley of the Four Winds
		20011, -- Looking For Group: Kun-Lai Summit
		20012, -- Looking For Group: Townlong Steppes
		20014, -- Looking For Group: Vale of Eternal Blossoms
		20015, -- Looking For Group: Isle of Thunder
		20016, -- Looking For Group: Timeless Isle
	},
	[cat.RemixPandariaQuests] = {
		19882, -- Campaign: The Jade Forest
		19884, -- Campaign: Valley of the Four Winds
		19885, -- Campaign: Krasarang Wilds
		19887, -- Campaign: Kun-Lai Summit
		19889, -- Campaign: Townlong Steppes
		19890, -- Campaign: Dread Wastes
		19891, -- Campaign: Landfall
		19892, -- Campaign: Isle of Thunder
	},
	[cat.RemixPandariaReputation] = {
		19912, -- Order of the Cloud Serpent
		19913, -- The August Celestials
		19914, -- Shado-Pan
		19915, -- The Klaxxi
		19916, -- Golden Lotus
		19917, -- Operation: Shieldwall
		19919, -- Kirin Tor Offensive
		19921, -- Shado-Pan Assault
		19922, -- Emperor Shaohao
	},
	[cat.RemixPandariaExploration] = {
		19962, -- Tour The Jade Forest
		19963, -- Tour Valley of the Four Winds
		19964, -- Tour Krasarang Wilds
		19965, -- Tour Kun-Lai Summit
		19966, -- Tour Townlong Steppes
		19967, -- Tour Dread Wastes
		19970, -- Tour Timeless Isle
		20026, -- Explore Jade Forest
		20027, -- Explore Valley of the Four Winds
		20028, -- Explore Krasarang Wilds
		20029, -- Explore Kun-Lai Summit
		20030, -- Explore Townlong Steppes
		20031, -- Explore Dread Wastes
		19977, -- Hidden Treasures: The Jade Forest
		19978, -- Hidden Treasures: Valley of the Four Winds
		19979, -- Hidden Treasures: Krasarang Wilds
		19980, -- Hidden Treasures: Kun-Lai Summit
		19981, -- Hidden Treasures: Townlong Steppes
		19982, -- Hidden Treasures: Timeless Isle
		19993, -- Elusive Foes: The Jade Forest
		19994, -- Elusive Foes: Valley of the Four Winds
		19995, -- Elusive Foes: Krasarang Wilds
		19996, -- Elusive Foes: Kun-Lai Summit
		19997, -- Elusive Foes: Townlong Steppes
		19998, -- Elusive Foes: Dread Wastes
		20069, -- Elusive Foes: Vale of Eternal Blossoms
		19999, -- Elusive Foes: Landfall
		20000, -- Elusive Foes: Isle of Thunder
		20001, -- Elusive Foes: Timeless Isle
		20002, -- Powerful Enemies: Timeless Isle
	},
	[cat.RemixPandariaScenarios] = {
		19923, -- Greenstone Village
		19893, -- A Brewing Storm
		19925, -- Unga Ingoo
		19926, -- Brewmoon Festival
		19927, -- Arena of Annihilation
		19928, -- Crypt of Forgotten Kings
		19930, -- Assault on Zan'vess
		19933, -- Dagger in the Dark
		19931, -- A Little Patience
		20500, -- Lion's Landing
		19938, -- Theramore's Fall
		19934, -- Battle on the High Seas
		19940, -- Blood in the Snow
		19942, -- Dark Heart of Pandaria
		19944, -- Secrets of Ragefire
	},
	[cat.RemixPandariaDungeons] = {
		19894, -- Temple of the Jade Serpent
		19896, -- Stormstout Brewery
		19898, -- Shado-Pan Monastery
		19900, -- Siege of Niuzao Temple
		19902, -- Gate of the Setting Sun
		19904, -- Mogu'shan Palace
		19906, -- Scarlet Halls
		19908, -- Scarlet Monastery
		19910, -- Scholomance
	},
	[cat.RemixPandariaRaids] = {
		19946, -- Raid Finder: Mogu'shan Vaults
		19949, -- Raid Finder: Heart of Fear
		19952, -- Raid Finder: Terrace of Endless Spring
		19955, -- Raid Finder: Throne of Thunder
		19958, -- Raid Finder: Siege of Orgrimmar
		19947, -- Mogu'shan Vaults
		19950, -- Heart of Fear
		19953, -- Terrace of Endless Spring
		19956, -- Throne of Thunder
		19959, -- Siege of Orgrimmar
		19948, -- Heroic: Mogu'shan Vaults
		19951, -- Heroic: Heart of Fear
		19954, -- Heroic: Terrace of Endless Spring
		19957, -- Heroic: Throne of Thunder
		19960, -- Heroic: Siege of Orgrimmar
		20017, -- Salyis's Warband
		20018, -- Sha of Anger
		20019, -- Nalak, the Storm Lord
		20020, -- Oondasta
		20021, -- Chi-ji, the Red Crane
		20022, -- Yu'lon, the Jade Serpent
		20023, -- Niuzao, the Black Ox
		20024, -- Xuen, the White Tiger
		20025, -- Ordos
	},

	[cat.FeatsOfStrengthMountsArena] = { 886, 887, 888, 2316, 3096, 3756, 3757, 4600, 6003, 6322, 6741, 8216, 8678, 8705,
		8707, 9229, 10137, 10146, 10999, 11000, 11001, 11002, 13450, 12139, 12140, 13093, 13202, 13632, 13958, 14816, 14999 },
	[cat.FeatsOfStrengthMountsRaF] = { 1436, 4832, 8213, 8794, 9925 },
	[cat.FeatsOfStrengthDungeonsBfA] = { 13079, 13448, 13780, 14144, 13080, 13449, 13781, 14145 },
	[cat.FeatsOfStrengthDungeonsShadowlands] = { 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506,
		15691, 15688, 15689, 15690, 15756 },
	[cat.FeatsOfStrengthDungeonsDragonflight] = { 16647, 16648, 16649, 16650, 16429 },

	[cat.FeatsOfStrengthPvPRatedBG] = { 5344, 6316, 6939, 8243, 8652, 8654, 8658, 5358, 6317, 6940, 8244, 8653, 8657, 8659 },
	[cat.FeatsOfStrengthPvPUnchained] = { "14967:14966", "13452:13453", "13530:13521", "13531:13522", "13532:13523",
		"13533:13524", "13534:13525", "13535:13526", "13536:13527", "13537:13528", "13538:13529", "13822:13812", "13823:13813",
		"13824:13814", "13825:13815", "13826:13816", "13827:13817", "13828:13818", "13829:13819", "13830:13820", "13831:13821",
		"13933:13945", "13934:13946", "13935:13947", "13936:13948", "13937:13949", "13938:13950", "13939:13951", "13940:13952",
		"13941:13953", "13942:13954", "14555:14561", "14557:14563", "14558:14564", "14559:14565", "14560:14566" },

	[cat.FeatsOfStrengthEventsWinterveil] = { 1705, 1706, 6059, 6060, 6061, 7852, 8698, 9915, 10337, 10751, 11913, 12850,
		13927, 14931 },
	[cat.FeatsOfStrengthEventsAnniversary] = { 2398, 4400, 5512, 5863, 6131, 7853, 8820, 10058, 10741, 11848, 12827, 13917,
		14271, 14942, 15218, "9729:9566", 9550, 13931, 11395 },
	[cat.FeatsOfStrengthPromotionsBlizzCon] = { 411, 412, 414, 415, 3536, 5378, 6185, 8793, 9763, 10322, 11294, 11931, 13138,
		14027, 14904 },
	[cat.FeatsOfStrengthPromotionsCollector] = { 662, 663, 664, 665, 683, 5377, 6848, 6849, 8916, 8917, 10320, 10321, 12229,
		12230, 12232, 7412, 8795, 4824, 7842, 10309, 11064 },

	[cat.Legacy] = { },
	[cat.LegacyCharacter] = { 10, 11, 12, 13, 4826, 6193, 9060, 10671, 12544,
	        557, 556, 5373, 5372, 6348, 6349, 9707, 9708, 12546, 12547, 14796, 14797,
		16, 705,
	        558, 559 },
	[cat.LegacyQuests] = { "8030:8031", 7533, "7534:8008", 7535, 7536, 8325,
	        8306, 8307,
		9640, 9641, 9642, "10021:10148" },
	[cat.LegacyPvP] = { },
	[cat.LegacyDungeons] = { },
	[cat.LegacyRaids] = { },
	[cat.LegacyProfessions] = { 730, 4915, 6836, 9506, 10580,
	        131, 132, 133, 134, 135, 4918, 6838, 9505, 10599 },
	[cat.LegacyCurrencies] = { 5535, 5536, 5537, 5538, 6924,
		3844, 4316,
		5542, 5541, 5540, 5539,
		2085, 2086, 2087, 2088, 2089 },
	[cat.LegacyWorldEvents] = { "11558:11559", "13189:13190", "13191:13192", "13186:13188" },
	[cat.LegacyExpansionFeatures] = { },
	-- [cat.] = {},
	-- [cat.] = {},

}

local unsortedAchievements = {
	[cat.QuestsEasternKingdoms] = { 5442, 5444, 940 },
	[cat.QuestsKalimdor] = { 5443, 5453, 5448, 5546, 5547, 5454 },
	[cat.QuestsOutland] = { 939, 1275, 1276 },
	[cat.QuestsNorthrend] = { 547, 561, 938, 961, 962, 1277, 1428, 1596 },
	[cat.QuestsCataclysm] = { 4874, "5318:5319", 4959, 5483, 5451, 5482, 5450, 5445, 5317, 4961, 5447, 5449, 4960, 5446,
		5452, 5481, "5320:5321", 5859, 5860, 5861, 5862, 5864, 5865, 5866, 5867, 5868, 5869, 5870, 5871, 5872, 5873, 5874, 5879 },
	[cat.QuestsPandaria] = { 7318, 7294, 7296, 7312, 7287, 7323, 7310, 7320, 7285, 7286, 7309, 7298, 7292, 7290, 7291, 7308,
		7295, 7299, 7317, 7324, 7316, 7297, 7319, 7322, 7502, 7289, 7307, 7321, 7313, 7314, 7293, 7288, 8112, 8118, 8120, 8117,
		8101, 8119, 8100, 8114, 8107, 8115, 8105, 8109, 8110, 8111, 8104, 8108, 8116, 8212 },
	[cat.QuestsDraenor] = { 9437, 9433, 9678, 9635, 9533, 9571, 9548, 9667, 9537, 9634, 9633, 9534, 9612, 9655, 9613, 9486,
		9638, 9610, 9483, 9656, 9659, 9436, 9601, 9617, 9654, 9600, "9528:9529", 9434, 9663, 9658, 9711, 9710, 9637, 9536, 9435,
		9535, 9632, 9541, 9636, 9432, "9530:9531", 9479, 9481, "10072:10265" },
	[cat.QuestsLegion] = { 12431, 12416, 11607, 11681, 11427, 12439, 10398, 11240, 10774, 10756, 11232, 11125, 10877, 11186,
		10793, 11133, 10626 },
	[cat.QuestsBfA] = { 13021, 13042, 13009, 13050, 13020, 13035, 13017, 13047, 13053, 13059, 13045, 13030, 13041, 13023,
		13060, 13062, 13048, 12614, 13038, 13039, 13022, 13054, 13011, 13049, 12087, 13037, 13046, 13014, 13025, 14154, 14157,
		14153, 14161, 13924, 13790, 13542, 13700, 13791, 13573, 13709, 13435, 13517, 13437, 13263, 13284, 13466, 13441, 12719,
		13285, 13467, 13384, 13251, 13553, 13710, 13283, 13440, 13426, 13925, 13026 },
	[cat.QuestsShadowlands] = { 14233, 14671, 14672, 14735, 14737, 14741, 14762, 14765, 14766, 14772, 14961, 15000, 15001,
		15032, 15033, 15034, 15035, 15036, 15037, 15039, 15041, 15042, 15043, 15044, 15055, 15056, 15057, 15064, 15066, 15107 },
	[cat.QuestsDragonflight] = { 15795, 15797, 15794, 15796, 16580, "15325:15638", 16574, 16292, 15889, 16291, 16808, 17342, 17343,
		17546, 18559, 17782, 18854, 18804, 19008, 17773, 18867 },
	
	[cat.ExplorationPandaria] = { 8078, 8743, 8727, 8729, 8722, 8714, 7932, 8103, 6856, 6716, 6846, 6857, 6850, 7230, 7381,
		6754, 6855, 6847, 7518, 6858, 8051, 8050, 8049, 8726, 8725, 8712, 8724, 8730, 8717, 8718, 8719, 8720, 8721, 8716, 7330,
		7329 },
	[cat.ExplorationDraenor] = { 9402, 9401, 10069, 9502, 14728 },
	[cat.ExplorationLegion] = { 10627, 11175, 11066, 11802, 11841, 12069, 11178, 14729 },
	[cat.ExplorationBfA] = { 12482, 12588, 12989, 13016, 13018, 13024, 13027, 13028, 13029, 13036, 13051, 13057, 13058,
		13061, 13064, 13082, 13083, 13087, 13094, 13250, 13470, 13472, 13473, 13541, 13549, 13556, 13635, 13638, 13645, 13690,
		13691, 13692, 13696, 13699, 13704, 13707, 13711, 13713, 13722, 13763, 13764, 13765, 13836, 14158, 14159, 14160, 14730 },
	[cat.ExplorationShadowlands] = { 14272, 14273, 14274, 14276, 14277, 14339, 14353, 14504, 14505, 14506, 14507, 14508,
		14509, 14510, 14626, 14634, 14658, 14659, 14660, 14721, 14731, 14733, 14734, 14738, 14742, 14745, 14746, 14747, 14761,
		14763, 14767, 14768, 14769, 14770, 14771, 14774, 14779, 14788, 14791, 14802, 14894, 14895, 14943, 15053, 15054, 15099 },
	[cat.ExplorationShadowlands92] = { 15211, 15224, 15229, 15331, 15391, 15392, 15402, 15404, 15406, 15407, 15410, 15411,
		15502, 15508, 15509, 15512, 15513, 15514, 15542, 15648 },
	[cat.ExplorationDragonflight] = { 16474, 16423, 15985, 16575, 16409, 16577, 16578, 15991, 16576, 16493, 16072, 16071,
		16061, 15890, 16297, 16406, 15988, 16107, 16673, 16070, 16053, 16584, 16670, 16052, 16583, 16102, 16103, 16073, 15989,
		16323, 16638, 16622, 16065, 16669, 16063, 16338, 16446, 16569, 16069, 15990, 16057, 15986, 16556, 16059, 16495, 16064,
		16066, 16497, 16496, 16581, 16462, 16298, 16301, 16051, 16056, 16055, 16058, 16621, 16679, 16672, 16666, 16060, 16668,
		16410, 16062, 16099, 16105, 16300, 16299, 16676, 16101, 16634, 16411, 16054, 16424, 16678, 16677, 16068, 15987, 16098,
		16104, 16067, 16671, 16667, 16106, 16100, 16412 },
	[cat.PvPArena] = { 408, 1162, 399, 400, 401, 1159, 402, 403, 405, 1160, 5266, 5267, 699, 14618 },
	[cat.PvPWorld] = { 12856, 12857, 12858, 12859, 12860, 12861, 12862, 12863, 13317, 13429, 13568, 13623, 13720, 14515,
		14516, 14517, 14518, 14519, 14520 },
	[cat.PvPWarsongGulch] = { 199, 872, 204, "203:1251", 1259, 200, "202:1502", 207, 713, "206:1252", 201, 168, 712 },
	[cat.PvPArathi] = { 73, 156, 157, 158, 159, 161, 162, 165, 583, 584, 710, 711, 1153 },
	[cat.PvPEyeOfTheStorm] = { 211, 212, 213, 214, 216, 233, 587, 783, 784, 1258 },
	[cat.PvPAlteracValley] = { 221, 582, "225:1164", 706, 873, 708, 709, "1151:224", 707, 220, 226, 223, 1166, 222,
		"13928:13930" },
	[cat.PvPAshran] = { "9104:9103", "9225:9224", "9256:9257", "9408:9217", "9714:9715", 9102, 9105, 9106, 9216, 9222, 9228,
		9473, 9474 },
	[cat.PvPIsleOfConquest] = { 3848, 3849, 3853, 3854, 3852, "3856:4256", 3847, 3855, 3845, "3851:4177", 3850, "3846:4176" },
	[cat.PvPWintergrasp] = { 1721, 1722, 1723, 1727, 1751, 1755, 2080, 2199 },
	[cat.PvPBattleForGilneas] = { 5247, 5248, 5249, 5250, 5251, 5252, 5253, 5254, 5255, 5256, 5257, 5262 },
	[cat.PvPTwinPeaks] = { "5226:5227", "5231:5552", 5229, "5221:5222", 5220, 5219, 5216, "5213:5214", 5211, 5230, 5215,
		5210, 5228 },
	[cat.PvPSilvershardMines] = { 7039, 7049, 7057, 7062, 7099, 7100, 7102, 7103 },
	[cat.PvPTempleOfKotmogu] = { 6947, 6950, 6970, 6971, 6972, 6973, 6980 },
	[cat.PvPSeethingShore] = { 12404, 12406, 12405, 12407, 12408, 12411 },
	[cat.PvPDeepwindGorge] = { 8333, 14175, 14186, 14187, 14188 },

	[cat.DungeonsLichKing] = { 1296, 1297, 1816, 1817, 1834, 1860, 1862, 1864, 1865, 1866, 1867, 1868, 1871, 1872, 1873,
		1919, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2056, 2057, 2058, 2150, 2151, 2152, 2153, 2154,
		2155, 2156, 2157, 3802, 3803, 3804, 4522, 4523, 4524, 4525, 4526 },
	[cat.DungeonsCataclysm] = { 5858, 5291, 5282, 5284, 5505, 5281, 5298, 5289, 5296, 5292, 5293, 5370, 5369, 5290, 5288,
		5285, 5503, 5286, 5368, 5367, 5366, 5287, 5294, 5295, 5504, 5283, 5297, 5371, 5744, 5765, 5761, 5743, 5762, 5760, 5759,
		5750, 6132, 6127, 5995, 6130, 6070 },
	[cat.DungeonsPandaria] = { 6929, 6531, 6479, 6928, 6475, 6476, 6946, 6478, 6471, 6420, 6400, 6684, 6460, 6089, 6402,
		6945, 6427, 6715, 6713, 6394, 6477, 6485, 6822, 6396, 6821, 6671, 6472, 6736, 6688 },
	[cat.DungeonsDraenor] = { 9023, 8993, 9056, 9005, 9551, 9057, 9081, 9035, 9025, 9008, 9058, 9045, 9034, 9083, 9036, 9552,
		9007, 9033, 9026, 9082, 9493, 9024, 9017, 9223, 9018 },
	[cat.DungeonsBfA] = { 12489, 12723, 13624, 12550, 12548, 12507, 12722, 12549, 12998, 13698, 13706, 12600, 12602, 12457,
		12508, 12499, 12855, 12273, 12503, 12498, 12270, 12601, 12490, 12726, 12727, 12462, 13723, 12495, 13545, 12854, 12500,
		12721, 12272, 12833, 12825, 12501, 12848, 12831, 12840, 12846, 12506, 12842, 12844, 12483, 12824, 12837, 12502, 12835,
		12847, 12504, 13258, 13075, 12505, 12484, 12838, 12832, 12845, 12841, 12826, 12488, 13259 },
	[cat.DungeonsShadowlands] = { 15178, 15190, 14413, 14325, 14199, 14409, 14368, 14415, 14417, 14411, 15109, 15179, 14291,
		14567, 15106, 14327, 14289, 14290, 14323, 14295, 15177, 14375, 14503, 14533, 14606, 14331, 14292, 14347, 14352, 14607,
		14354, 14296, 14320, 14297, 14197, 14372, 14369, 14286, 14374, 14284, 14408, 14373, 14285, 14370, 14410, 14414, 14198,
		14367, 14326, 14412, 14416, 14371, 14324, 14366 },

	[cat.DungeonsDragonflight] = { 16278, 16280, 16434, 16279, 16440, 16432, 16427, 16339, 16275, 16260, 16274, 16441, 16262,
		16517, 16257, 16265, 16268, 16329, 16426, 16263, 16445, 16337, 16281, 16453, 16271, 16404, 16331, 16456, 16430, 16320,
		16402, 16296, 16267, 16620, 16269, 16270, 16273, 16438, 16255, 16256, 16264, 16276, 16277, 16282, 16602, 16272, 16447,
		16330, 16261, 16266, 16110 },

	-- 3.0 Naxxramas
	[cat.RaidsLichKingNaxxramas] = { 2176, 2177, 1858, 1859, 2184, 2185, 1856, 1857, 1997, 2140, 2178, 2179, 2182, 2183,
		2180, 2181, 578, 579, 2146, 2147, 1996, 2139 },
	-- 3.1 Ulduar
	[cat.RaidsLichKingUlduar] = { 12388, 12340, 12327, 12396, 12398, 12397, 12372, 12367, 12345, 12339, 12362, 12400, 12368,
		12395, 12363, 12350, 12342, 12333, 12352, 12360, 12337, 12336, 12335, 12332, 12323, 12399, 12311, 12310, 12384, 12369,
		12309, 12361, 12348, 12312, 12373, 12343, 12346, 12338, 12325, 12366, 12349, 12351, 12347, 12344, 12341, 12302, 12334,
		12329, 12328, 12321, 12313, 12314, 12316, 12297, 12322, 12324, 12330, 12326, 12320, 12315 },
	-- 3.3 Icecrown Citadel
	[cat.RaidsLichKingIcecrownCitadel] = { 4580, 4620, 4601, 4621, 4534, 4610, 4538, 4614, 4577, 4615, 4535, 4611, 4536,
		4612, 4537, 4613, 4578, 4616, 4581, 4622, 4539, 4618, 4579, 4619, 4582, 4617 },

	-- 4.0 Blackwing Descent
	[cat.RaidsCataclysmBlackwingDescent] = { 5310, 5307, 5309, 5306, 4849, 5308 },
	-- 4.0 Bastion of Twilight
	[cat.RaidsCataclysmBastionOfTwilight] = { 4852, 5311, 5312, 5300 },
	-- 4.0 Throne of the Four Winds
	[cat.RaidsCataclysmThroneOfTheFourWinds] = { 5305, 5304 },
	-- 4.2 Firelands
	[cat.RaidsCataclysmFirelands] = { 5810, 5855, 5813, 5829, 5821, 5799, 5830 },
	-- 4.3 Dragon Soul
	[cat.RaidsCataclysmDragonSoul] = { 6180, 6105, 6174, 6175, 6133, 6084, 6128, 6129 },

	-- 5.0 Mogu'Shan Vaults
	[cat.RaidsPandariaMoguShanVaults] = { 7933, 6724, 6674, 6823, 6455, 7056, 6686, 6687 },
	-- 5.0 Heart of Fear
	[cat.RaidsPandariaHeartOfFear] = { 6936, 6518, 6683, 6553, 6937, 6922 },
	-- 5.0 Terrace of Endless Spring
	[cat.RaidsPandariaTerraceOfEndlessSpring] = { 6824, 6717, 6825, 6933 },
	-- 5.2 Throne of Thunder
	[cat.RaidsPandariaThroneOfThunder] = { 8090, 8073, 8087, 8038, 8086, 8037, 8082, 8094, 8077, 8081, 8097, 8098 },
	-- 5.4 Siege of Orgrimmar
	[cat.RaidsPandariaSiegeOfOrgrimmar] = { 8529, 8520, 8448, 8527, 8528, 8543, 8536, 8532, 8531, 8453, 8537, 8521, 8530,
		8538 },

	-- 6.0 Highmaul
	[cat.RaidsDraenorHighmaul] = { 8958, 8948, 8980, 8947, 8974, 8975, 8976, 8977 },
	-- 6.0 Blackrock Foundry
	[cat.RaidsDraenorBlackrockFoundry] = { 8952, 8978, 8929, 8982, 8983, 8930, 8984, 8981, 8979 },
	-- 6.2 Hellfire Citadel
	[cat.RaidsDraenorHellfireCitadel] = { 9972, 10030, 10073, 9979, 10086, 10026, 9989, 9988, 10012, 10057, 10013, 10087,
		10054 },

	[cat.RaidsLegion] = { 11786, 11160 },
	[cat.RaidsBfA] = { 12587 },

	-- 8.0 Uldir
	[cat.RaidsBfAUldir] = { 12830, 12937, 12938, 12551, 12772, 12836, 12823, 12828 },
	-- 8.1 Battle of Dazar'alor
	[cat.RaidsBfABattleOfDazaralor] = { 13383, 13316, 13430, 13290, 13431, 13401, 13345, 13410, 13325, 13425 },
	-- 8.2 The Eternal Palace
	[cat.RaidsBfAEternalPalace] = { 13724, 13767, 13633, 13628, 13716, 13629, 13768, 13684 },
	-- 8.3 Ny'alotha
	[cat.RaidsBfANyalotha] = { 14148, 14023, 14026, 14139, 14147, 14019, 14024, 14008, 13990, 14037, 14038, 13999 },

	-- 9.0 Castle Nathria
	[cat.RaidsShadowlandsCastleNathria] = { 14293, 14608, 14610, 14294, 14376, 14617, 14619, 14525, 14524, 14523 },
	-- 9.1 Sanctum of Domination
	[cat.RaidsShadowlandsSanctumOfDomination] = { 15133, 15065, 15108, 14998, 15131, 15105, 15132, 15058, 15003, 15040,
		15125 },
	-- 9.2 Sepulcher of the First Ones
	[cat.RaidsShadowlandsSepulcherOfTheFirstOnes] = { 15315, 15381, 15386, 15396, 15397, 15398, 15399, 15400, 15401, 15416,
		15418, 15419, 15492, 15493, 15494 },
	-- 10.0 Vault of the Incarnates
	[cat.RaidsDragonflightVaultOfTheIncarnates] = {
	},
	-- 10.1 Aberrus
	[cat.RaidsDragonflightAberrus] = {
	},
	-- 10.2 Amirdrassil
	[cat.RaidsDragonflightAmirdrassil] = {
	},

	[cat.ProfessionsCooking] = { 877, 1780, 1781, 1785, 1801, 5779, 7325, 12747, 10593, 10592, 10591 },
	[cat.ProfessionsCookingDailyQuests] = { 906, "1782:1783" },
	[cat.ProfessionsFishing] = { 153, 878, 1243, 1257, 3218, 5478, 5479, 7274, 7614, 10598, 13489, 12755, 11725, 13502 },
	[cat.ProfessionsFishingDragonflight] = { 16317, 16322, 16547, 16321, 16553, 16551, 16550, 16552 },
	[cat.ProfessionsArchaeologyCataclysm] = { 4858, 4859, 5191, 5192, 5193, 5301, 5511 },
	[cat.ProfessionsArchaeologyPandaria] = { 7331, 7332, 7333, 7334, 7335, 7336, 7337, 7612, 8219 },
	[cat.ProfessionsArchaeologyDraenor] = { 9410, 9411, 9412, 9413, 9414, 9415, 9419 },

	[cat.Reputations] = { 948, 762, 953, 945, "942:943", 5794 },
	[cat.ReputationsClassic] = { 955, 956, 946, 944 },
	[cat.ReputationsBurningCrusade] = { 896, 893, 902, 894, 901, 899, 898, 903, 1638, 958, "764:763", 900, 959, 960, 897 },
	[cat.ReputationsLichKing] = { 950, 2083, 2082, 1009, 952, 1010, 947, 4598, 1008, 951, "1012:1011", 1007, 949 },
	[cat.ReputationsCataclysm] = { 5375, 4886, 5376, 4884, 4881, 4882, 4883, 4885, 5827 },
	[cat.ReputationsPandaria] = { 6366, 6543, 6544, 6545, 6546, 6547, 6548, 6550, 6551, 6552, "6828:6827", 7479, 8208, 8206,
		8205, 8209, 8210, 8715, 8023 },
	[cat.ReputationsLegion] = { 10672, 11941, 12081, 11653, 12076, 11545, 10778, 11652, 12292, 11159, 11796 },
	[cat.ReputationsBfA] = { 12947, 12954, 12957, 12955, 12952, 12951, 13357, 12953, 12948, 14156, 13559, 12949, 12956,
		14155, 13558, 12950 },
	[cat.ReputationsDragonflight] = { 16587, 16625, 16588, 16591, 16573, 16545, 16624, 16530, 16600, 16444, 16542, 16560,
		16570, 16572, 16623, 16567, 16522, 16568, 16571, 16540, 16543, 16566, 16544, 16529, 16528, 16541, 16443 },

	[cat.WorldEvents] = { 1683, 3456, 1693, 1793, 1656, 1691, 2798, 3478, 3457, 1039, 1038, 913, 2144 },
	[cat.WorldEventsLunarFestival] = { 626, 910, 911, 912, 914, 915, 937, 1281, 1396, 1552, 6006, 17321 },
	[cat.WorldEventsLoveIsInTheAir] = { 1701, 260, 1695, 1699, "1279:1280", 1704, 1291, 1694, 1703, "1697:1698", 1700, 1188,
		1702, 1696, 4624 },
	[cat.WorldEventsNoblegarden] = { 2576, 2418, 2417, 2436, 249, 2416, 2676, "2421:2420", 2422, "2419:2497", 248 },
	[cat.WorldEventsChildrensWeek] = { 275, 1786, 1788, 1789, 1790, 1791, 1792 },
	[cat.WorldEventsMidSummer] = { 271, 263, 1145, 272 },
	[cat.WorldEventsHallowsEnd] = { 284, 255, 291, 1261, 288, "1040:1041", 292, 981, 979, 283, 289, 972, 10365, 18960, 18962 },
	[cat.WorldEventsPilgrimsBounty] = { 3579, "3576:3577", "3556:3557", "3580:3581", "3596:3597", 3558, 3582, 3578, 3559 },
	[cat.WorldEventsWinterveil] = { 277, 1690, "4436:4437", "1686:1685", 1295, 1282, 1689, 1687, 273, "1255:259", 279, 1688,
		252, "5853:5854", 8699, 10353, 15181 },
	[cat.WorldEventsDarkmoon] = { 6019, 6020, 6021, 6022, 6023, 6024, 6025, 6026, 6027, 6028, 6029, "6030:6031", 6032, 6332,
		9885, 9894, 11919, 11920, 11921, 11918, 9819 },

	[cat.PetBattlesCollect] = { 6608, 6571, 8519, 8397, 13715, 15004 },

	[cat.CollectionsMounts] = { 2076, 2077, 2078, 2097, 4888, 5749, 7386, 9713, 13513 },

	[cat.ExpansionFeaturesArgentTournament] = { 3676, 2773, 2836, 3736, 3677, 4596, 2772 },
	[cat.ExpansionFeaturesTolBarad] = { "5718:5719", 5486, 5487, 5415, 5488 },
	[cat.ExpansionFeaturesPandariaScenarios] = { 8319, 7273, 6931, 7989, 7990, 7257, 7276, 8368, 8017, 8329, 8330, 7992,
		7272, 7275, 8347, "7526:7529", 7239, 7248, 7987, "7527:7530", "8011:8014", 7258, 7267, 7385, 7266, "6874:7509", 7231,
		8295, 7232, 7261, "8012:8015", 7984, 7993, 7991, 6930, 7986 },
	[cat.ExpansionFeaturesDraenorGarrisons] = { "9630:9248", 9264, 9246, 9265, "9631:9255", 9487 },
	[cat.ExpansionFeaturesTorghast] = { 14778, 15067, 14498, 15075, 14773, 15080 },
	[cat.ExpansionFeaturesCovenantSanctumsKyrian] = { 14851, 14852, 14853, 14854, 14856, 14857, 14858, 14859, 14860, 14861,
		14862, 14863, 14864, 14865, 14866, 14887, 14502 },
	[cat.ExpansionFeaturesCovenantSanctumsVenthyr] = { 14680, 14679, 14678, 14723, 14724, 14725, 14726, 14727, 14683, 14681 },

	[cat.FeatsOfStrength] = { 4496, 8812, 9016, 9597, 10334, 11137, 13779, 14140, 19326, 19397, 19398 },
	[cat.FeatsOfStrengthMounts] = { 416, 424, 430, 729, 879, 880, 881, 882, 883, 884, 885, 980, 2081, 3356, 3357, 3496, 3636,
		3896, 4625, 4626, 4627, 5767, 8092, 14183 },
	[cat.FeatsOfStrengthDungeonsChallenge] = { 8430, 8431, 8432, 8433, 8434, 8436, 8437, 8438, 8439, 8903, 9620, 9621, 9622,
		9623, 9624, 9625, 9626, 9627 },
	[cat.FeatsOfStrengthDungeonsBfA] = { 13789 },
	[cat.FeatsOfStrengthDungeonsShadowlands] = { 15045, 15046, 15047, 15048, 15049, 15050, 15051, 15052, 15693, 15692, 15500,
		15695, 15694 },
	[cat.FeatsOfStrengthDungeonsDragonflight] = { 16639, 16641, 16660, 16643, 16661, 16646, 16642, 16644, 16640, 16658,
		16659, 16645 },
	[cat.FeatsOfStrengthRaids] = { 425, 426, 428, 429, 725, 2496, 3004, 3005, 3142, 3316, "4156:4079", 4623, 5313, 5839,
		6181, 8089, 9680, 11387, 11744, 11869, 15191 },
	[cat.FeatsOfStrengthRaidsAhead] = { 6954, 8246, 8248, 8249, 8398, 8399, 9441, 9444, 10044, 11194, 11195, 11581, 11874,
		12110, 12536, 13322, 13418, 13784, 14068, 14460, 15134 },
	[cat.FeatsOfStrengthRaidsCuttingEdge] = { 7485, 7486, 7487, 8238, 8260, 8400, 8401, 9442, 9443, 10045, 11191, 11192,
		11580, 11875, 12111, 12535, 13323, 13419, 13785, 14069, 14461, 15135 },
	[cat.FeatsOfStrengthReputation] = { 871, 1205, 2336, 5788 },
	[cat.FeatsOfStrengthEvents] = { 1292, 1293, 1636, 1637, 2079, 2116, 2456, 4782, 4786, 4790, 4887, 5533, 7467, 7468, 9618,
		10335, 11065, 11200, 11201, 14750, 16431 },
	[cat.FeatsOfStrengthPromotions] = { 8345, 9496, 9926, 10537, 10657, 11210, 11211, 11425, 12454, 13196, 14283 },
	[cat.FeatsOfStrengthPvP] = { 404, 406, 407, 409, 418, 419, 420, 1161, 3336, 3436, 3618, 3758, 4599, 6002, 6124, 6938,
		8214, 8391, 8392, 8643, 8644, 8645, 8646, 8649, 8666, 8667, 8668, 8669, 8670, 8791, 9725, 12567, 12568, 13136, 13137,
		13227, 13228, 13636, 13637, 13943, 13944, 14191, 14611, 14612 },
	[cat.FeatsOfStrengthPvPDraenor] = { 9230, 9231, 9232, 9239, 9240, 9241, 9242, 9995, 9996, 9997, 9998, 10000, 10001,
		10094, 10095, 10096, 10097, 10098, 10099, 10100, 10101, 10102, 10103, 10104, 10105, 10106, 10107, 10108, 10109, 10110,
		10111, 10112, 10113, 10114, 10115, 10116, 10117, 10118, 10119, 10120, 10121 },
	[cat.FeatsOfStrengthPvPLegion] = { 10997, 10998, 11003, 11004, 11005, 11008, 11009, 11010, 11011, 11012, 11013, 11014,
		11015, 11016, 11017, 11018, 11019, 11020, 11021, 11022, 11023, 11024, 11025, 11026, 11027, 11028, 11029, 11030, 11031,
		11032, 11033, 11034, 11035, 11036, 11037, 11038, 11039, 11040, 11041, 11042, 11043, 11044, 11045, 11046, 11047, 11048,
		11049, 11050, 11051, 11052, 11053, 11054, 11055, 11056, 11057, 11058, 11059, 11060, 11061, 11062, 11578, 11579, 11697,
		11698, 12010, 12031, 12032, 12034, 12035, 12036, 12037, 12038, 12039, 12040, 12041, 12042, 12043, 12044, 12045, 12090,
		12134, 12135, 12167, 12168, 12169, 12170, 12171, 12172, 12173, 12174, 12175, 12176, 12177, 12178, 12179, 12185, 12186,
		12187, 12188, 12189, 12190, 12191, 12192, 12194, 12195, 12196, 12197, 12198 },
	[cat.FeatsOfStrengthPvPBfA] = { 12945, 12959, 12960, 12961, 12962, 12963, 12964, 13199, 13200, 13203, 13204, 13205,
		13209, 13210, 13211, 13212, 13451, 13465, 13630, 13634, 13639, 13641, 13642, 13643, 13644, 13647, 13676, 13957, 13959,
		13962, 13963, 13964, 13965, 13966, 13967, 13989 },
	[cat.FeatsOfStrengthPvPShadowlands] = { 14685, 14686, 14687, 14688, 14689, 14690, 14691, 14692, 14693, 14968, 14969,
		14970, 14971, 14972, 14973, 14974, 14975, 14976 },
	[cat.FeatsOfStrengthPvPDragonflight] = { 15951, 15960, 15957, 15955, 15956, 15953, 15954, 15984, 15958, 15942, 15943,
		15952, 15961, 15959 },
	[cat.FeatsOfStrengthRealmFirst] = { 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 1400, 1402, 1404, 1405,
		1406, 1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414, 1415, 1416, 1417, 1418, 1419, 1420, 1421, 1422, 1423, 1424, 1425,
		1426, 1427, 1463, 3117, 3259, 4078, 4576, 4998, 4999, 5000, 5001, 5002, 5003, 5004, 5005, 5006, 5007, 5008, 5381, 5382,
		5383, 5384, 5385, 5386, 5387, 5388, 5389, 5390, 5391, 5392, 5393, 5394, 5395, 5396, 6433, 6523, 6524, 6743, 6744, 6745,
		6746, 6747, 6748, 6749, 6750, 6751, 6752, 6829, 6859, 6860, 6861, 6862, 6863, 6864, 6865, 6866, 6867, 6868, 6869, 6870,
		6871, 6872, 6873, 11224, 13078, 14662 },

	[cat.Legacy] = { },
	[cat.LegacyCharacter] = { 2716 },
	[cat.LegacyQuests] = { },
	[cat.LegacyPvP] = { 12136, 12137, 452, 1174, 440, 443, 433, 438, 11169, 441, 10743, 469, 11167, 470, 11165, 612, 472, 454, 445, 10092, 8360, 450, 436, 451, 615, 449, 10093, 447, 701, 437, 610, 468, 8350, 12181, 435, 11166, 1762, 442, 471, 448, 11168, 434, 11470, 10993, 8359, 11685, 444, 10745, 2200, 10991, 11689, 8485, 11472, 439, 2192, 11691, 1764, 446, 11694, 10561, 8641, 8450, 453, 12109, 11170, 8358, 11687, 8484, 617, 473, 8642, 1765, 1310, 1761, 12199, 12108, 11692, 8351, 9233, 11686, 2189, 1757, 11471, 11693, 8382, 10992, 9238, 1308, 10090, 11690, 1763, 611, 12200, 10995, 9214, 8451, 9234, 8354, 8093, 10088, 11468, 12180, 12182, 2190, 2193, 11688, 700, 8381, 9215, 2194, 1309, 11469, 8218, 8355, 2191, 1766, 12183, 9236, 10091, 10089 },
	[cat.LegacyDungeons] = { 8899, 2188, 6375, 6378, 9493, 8885, 8898, 8883, 6886, 6894, 11181, 6884, 6917, 6890, 6889, 8897, 6885, 8878, 6906, 6918, 6374, 6897, 6915, 8884, 6919, 6920, 6900, 6902, 6913, 8895, 8889, 6901, 6896, 6912, 6899, 6893, 6895, 6916, 6891, 8876, 8877, 8888, 6908, 6903, 6898, 8871, 8891, 8892, 8880, 8881, 8875, 6907, 8886, 8872, 8873, 11218, 1307, 8879, 8882, 8887, 9000, 6914, 8874, 9002, 9004, 8894, 6905, 8890, 8997, 6888, 9003, 13075, 8998, 8999, 6892, 6910, 6909, 6911, 6904, 6887, 9001, 8893 },
	[cat.LegacyRaids] = { 431, 560, 2958, 2187, 432, 2186, 3188, 2924, 2957, 4080, 2903, 684, 3164, 3002, 3037, 3036, 2975, 3810, 2976, 3059, 3819, 3189, 2904, 3184, 3185, 2941, 2944, 2909, 2954, 2927, 3176, 3159, 3187, 3163, 3056, 3141, 2951, 2945, 2946, 3179, 2955, 2977, 2935, 8533, 2947, 3180, 2971, 2979, 2926, 3808, 3007, 3098, 3181, 2923, 3186, 3158, 3057, 2959, 3003, 2894, 688, 2953, 2942, 3011, 3077, 2925, 2969, 2970, 2888, 3014, 3157, 2906, 2948, 3008, 2967, 3182, 3016, 2931, 3076, 2915, 2952, 2919, 2981, 2928, 2939, 3183, 2934, 3138, 2911, 2908, 3817, 2968, 3013, 3118, 2932, 2933, 2995, 2918, 2989, 2996, 2910, 2891, 3161, 2961, 2984, 3010, 3097, 2982, 3058, 2963, 2973, 2956, 2938, 2936, 2913, 2914, 2960, 2929, 3162, 691, 2921, 3809, 3818, 2980, 3006, 2985, 2983, 2943, 2974, 3015, 3178, 2916, 2912, 2930, 2892, 2893, 2890, 2886, 2907, 2905, 3012, 2965, 3009, 3177, 2937, 2917, 3237, 2997, 2978, 2889, 2895, 2887, 3017, 2962, 2972, 2940 },
	[cat.LegacyProfessions] = { 11139, 17412, 17410, 17498, 17496, 10585, 11138, 10586, 17497, 17499 },
	[cat.LegacyCurrencies] = { },
	[cat.LegacyWorldEvents] = { 13194, 11567, 11573, 11570 },
	[cat.LegacyExpansionFeatures] = { 11772, 11144, 10747, 10853, 11611, 11612, 11143, 12071, 11610, 12072, 11609, 10852 },
	-- [cat.] = {},
	-- [cat.] = {},

}

addon:Service("AltoholicUI.AchievementsLists", function()

	local function SortByName(a, b)
		if type(a) == "string" then
			a = strsplit(":", a)
			a = tonumber(a)
		end
		if type(b) == "string" then
			b = strsplit(":", b)
			b = tonumber(b)
		end

		local nameA = select(2, GetAchievementInfo(a)) or ""
		local nameB = select(2, GetAchievementInfo(b)) or ""
		return nameA < nameB
	end

	local function GetSortedSize(categoryID)
		return (sortedAchievements[categoryID]) and #sortedAchievements[categoryID] or 0
	end

	local function GetUnsortedSize(categoryID)
		return (unsortedAchievements[categoryID]) and #unsortedAchievements[categoryID] or 0
	end

	local function GetFactionInfo(value)
		-- Achievement is the same for alliance and horde, simply return the value (the achievement ID)
		if type(value) == "number" then return value end

		-- Achievement is different for alliance and horde, return the two values separately
		if type(value) == "string" then
			local ally, horde = strsplit(":", value)
			return tonumber(ally), tonumber(horde) -- return alliance ach id, horde ach id
		end
	end

	return {
		Initialize = function()
			-- order each category by name, do this only once at startup
			for category, data in pairs(unsortedAchievements) do
				table.sort(data, SortByName)
			end
		end,
		GetCategorySize = function(categoryID)
			return GetSortedSize(categoryID) + GetUnsortedSize(categoryID)
		end,
		GetAchievementFactionInfo = function(categoryID, index)
			if index <= 0 then return end

			local size = GetSortedSize(categoryID)

			-- We want index 5 and we have 10 sorted entries, return the info
			if index <= size then
				return GetFactionInfo(sortedAchievements[categoryID][index])
			end

			-- We want index 10, but only 8 in sorted, so we want index 2 of unsorted
			index = index - size
			size = GetUnsortedSize(categoryID)

			-- We want index 2 and we have 5 unsorted entries, return the info
			if index <= size then
				return GetFactionInfo(unsortedAchievements[categoryID][index])
			end
		end,
	}
end)
