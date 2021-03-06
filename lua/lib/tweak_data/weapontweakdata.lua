local old_init = WeaponTweakData.init
function WeaponTweakData:init(tweak_data)
	--[[i dunno where to put this but heres a list of what weapons enemies use
	      heavy ar wpn_npc_m4
          light ar wpn_npc_s553
          heavy shot wpn_npc_benelli
          light shot wpn_npc_r870
          gman wpn_npc_r870
          other pistol nerds wpn_npc_c45
          revolver bois wpn_npc_raging_bull
          dozer wpn_npc_r870_dozer
          cd med wpn_npc_raging_bull_med
          cop smg wpn_npc_mp5
          meddozer wpn_npc_ump_meddozer
          dozer lmg wpn_npc_lmg_m249
          dozer black wpn_npc_saiga
		  cloaker wpn_npc_mp5_tactical
	]]--	  
	old_init(self, tweak_data)
	self.damage_tables = {
		deathvox_guard_pistol = { 
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 2},
			hard = {damage = 2},
			very_hard = {damage = 2},
			overkill = {damage = 2},
			mayhem = {damage = 2},
			death_wish = {damage = 2},
			crackdown = {damage = 6}
		},
-- note light and heavy baselines are not used for beat cop type enemies. These will be implemented separately. They correspond to swat unit types (blue, yellow) instead.
	deathvox_light_ar = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 2}, -- blue swat.
			hard = {damage = 2},
			very_hard = {damage = 4.5}, -- green.
			overkill = {damage = 4.5},
			mayhem = {damage = 6}, -- elite.
			death_wish = {damage = 6},
			crackdown = {damage = 7.5} -- zeal.
		},
	deathvox_heavy_ar = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 4}, -- yellow swat.
			hard = {damage = 4},
			very_hard = {damage = 6}, -- tan.
			overkill = {damage = 6},
			mayhem = {damage = 7.5}, -- elite.
			death_wish = {damage = 7.5},
			crackdown = {damage = 9} -- zeal.
		},
        deathvox_shotgun_light = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 6}, -- blue swat.
			hard = {damage = 6},
			very_hard = {damage = 7}, -- green.
			overkill = {damage = 7},
			mayhem = {damage = 7.5}, -- elite.
			death_wish = {damage = 7.5},
			crackdown = {damage = 9} -- zeal.
		},
	deathvox_shotgun_heavy = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 8}, -- yellow swat.
			hard = {damage = 8},
			very_hard = {damage = 9.5}, -- tan.
			overkill = {damage = 9.5},
			mayhem = {damage = 10}, -- elite.
			death_wish = {damage = 10},
			crackdown = {damage = 11} -- zeal.
		},
        deathvox_medic_pistol = { -- note uses light ar on difficulties below CD.
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 2}, -- blue.
			hard = {damage = 2}, --start.
			very_hard = {damage = 4}, -- green.
			overkill = {damage = 4},
			mayhem = {damage = 6},  -- elite.
			death_wish = {damage = 6},
			crackdown = {damage = 8} -- zeal
		},
	deathvox_cloaker = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 4.5},
			hard = {damage = 6}, -- start. Match to higher layer light AR to preserve unit coherence.
			very_hard = {damage = 6},
			overkill = {damage = 6},
			mayhem = {damage = 6}, 
			death_wish = {damage = 6},
			crackdown = {damage = 7.5} -- zeal. Increase from prior values, matched to light AR.
		},
	deathvox_sniper = { -- focus much more on aim/focus delay than damage shift.
-- no need for asset coherence on this unit only, as at a distance. Discuss typing with group.
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 16}, -- blue.
			hard = {damage = 16},
			very_hard = {damage = 18},
			overkill = {damage = 20}, -- green.
			mayhem = {damage = 20},
			death_wish = {damage = 20},
			crackdown = {damage = 24}
		},
	deathvox_greendozer = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 24},
			hard = {damage = 24},
			very_hard = {damage = 24}, -- start.
			overkill = {damage = 24},
			mayhem = {damage = 24},
			death_wish = {damage = 24},
			crackdown = {damage = 32} -- zeal.
		},
	deathvox_blackdozer = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 18},
			hard = {damage = 18},
			very_hard = {damage = 18},
			overkill = {damage = 18}, -- start.
			mayhem = {damage = 18},
			death_wish = {damage = 18},
			crackdown = {damage = 22.5} -- zeal. matched to DW.
		},
	deathvox_lmgdozer = { 
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 10},
			hard = {damage = 10},
			very_hard = {damage = 10},
			overkill = {damage = 10},
			mayhem = {damage = 8}, -- start. Skull. Matched to DW.
			death_wish = {damage = 8},
			crackdown = {damage = 10} -- zeal. Value increased. Matched to intended minidozer.
		},
        deathvox_medicdozer_smg = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 7.5},
			hard = {damage = 7.5},
			very_hard = {damage = 7.5},
			overkill = {damage = 7.5},
			mayhem = {damage = 7.5},
			death_wish = {damage = 7.5},
			crackdown = {damage = 7.5} -- start. zeal. Increase from prior values, matched to light AR.
		},
-- Grenadier damage values are zero as they are actually used to target their grenades.
        deathvox_grenadier = {
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 0},
			hard = {damage = 0},
			very_hard = {damage = 0},
			overkill = {damage = 0},
			mayhem = {damage = 0},
			death_wish = {damage = 0},
			crackdown = {damage = 0} -- start.
		},
	deathvox_cop_pistol = {  -- mk 3 values. Previously 4 lock, now mapped to guard pistol.
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 2},
			hard = {damage = 2},
			very_hard = {damage = 2},
			overkill = {damage = 2},
			mayhem = {damage = 2},
			death_wish = {damage = 2},
			crackdown = {damage = 6}
		},
	deathvox_cop_revolver = { -- mk 3 values. Previously 4 lock, now start at four and follow medic pistol.
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 4},
			hard = {damage = 4},
			very_hard = {damage = 4},
			overkill = {damage = 4},
			mayhem = {damage = 6},
			death_wish = {damage = 6},
			crackdown = {damage = 8}
		},
	deathvox_cop_shotgun = {  -- mk 3 values. Previously 6 lock, now mapped to light shot.
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 6},
			hard = {damage = 6},
			very_hard = {damage = 7},
			overkill = {damage = 7},
			mayhem = {damage = 7.5},
			death_wish = {damage = 7.5},
			crackdown = {damage = 9}
		},
	deathvox_cop_smg = {  -- mk 3 values. previously 2.5 lock, now begin at 2.5 then mapped to light AR.
			not_a_real_difficulty = {damage = 10},
			normal = {damage = 2.5},
			hard = {damage = 2.5},
			very_hard = {damage = 4.5},
			overkill = {damage = 4.5},
			mayhem = {damage = 6},
			death_wish = {damage = 6},
			crackdown = {damage = 7.5}
		}
	}
	self._gun_list_cd = {}
	self.deathvox_guard_pistol = deep_clone(self.c45_npc)
	self.deathvox_medic_pistol = deep_clone(self.raging_bull_npc)
	self.deathvox_light_ar = deep_clone(self.g36_npc)
	self.deathvox_heavy_ar = deep_clone(self.m4_npc)
	self.deathvox_shotgun_light = deep_clone(self.r870_npc)
	self.deathvox_shotgun_heavy = deep_clone(self.benelli_npc)
	self.deathvox_sniper = deep_clone(self.m14_sniper_npc)
	self.deathvox_medicdozer_smg = deep_clone(self.mp5_npc)
	self.deathvox_grenadier = deep_clone(self.m32_crew)
	
	self.deathvox_lmgdozer = deep_clone(self.m249_npc)
	self.deathvox_cloaker = deep_clone(self.mp5_tactical_npc)
	self.deathvox_blackdozer = deep_clone(self.saiga_npc)
	self.deathvox_greendozer = deep_clone(self.r870_npc)

	self.deathvox_cop_pistol = deep_clone(self.c45_npc)
	table.insert(self._gun_list_cd, "deathvox_cop_pistol")

	self.deathvox_cop_revolver = deep_clone(self.raging_bull_npc)
	self.deathvox_cop_revolver.sounds.prefix = "rbull_npc"
	self.deathvox_cop_revolver.DAMAGE = 4 -- DEPRECATED due to use of damage table.
	self.deathvox_cop_revolver.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deathvox_cop_revolver.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deathvox_cop_revolver.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.deathvox_cop_revolver.CLIP_AMMO_MAX = 6
	self.deathvox_cop_revolver.NR_CLIPS_MAX = 8
	self.deathvox_cop_revolver.hold = "pistol"
	self.deathvox_cop_revolver.alert_size = 5000
	self.deathvox_cop_revolver.suppression = 1.8
	self.deathvox_cop_revolver.FIRE_MODE = "single"
	table.insert(self._gun_list_cd, "deathvox_cop_revolver")
	
	self.deathvox_cop_shotgun = deep_clone(self.r870_npc)
	self.deathvox_cop_shotgun.rays = nil
	self.deathvox_cop_shotgun.spread = nil
	self.deathvox_cop_shotgun.reload = "looped"
	self.deathvox_cop_shotgun.looped_reload_speed = 0.8 -- time it takes to reload each shell.
	table.insert(self._gun_list_cd, "deathvox_cop_shotgun")
	
	self.deathvox_cop_smg = deep_clone(self.mp5_npc)
	table.insert(self._gun_list_cd, "deathvox_cop_smg")
	
	self.deathvox_light_ar.sounds.prefix = "g36_npc" -- dont worry about this
	self.deathvox_light_ar.use_data.selection_index = 2 -- dont worry about this
	self.deathvox_light_ar.DAMAGE = 7.5 -- DEPRECATED due to use of damage table.
	self.deathvox_light_ar.muzzleflash = "effects/payday2/particles/weapons/556_auto" -- dont worry about this
	self.deathvox_light_ar.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556" -- dont worry about this
	self.deathvox_light_ar.CLIP_AMMO_MAX = 30 -- How many shots before reload
	self.deathvox_light_ar.NR_CLIPS_MAX = 5 -- Unused
	--self.deathvox_light_ar.pull_magazine_during_reload = "rifle" -- magazine used during reload.
	self.deathvox_light_ar.auto.fire_rate = 0.08 -- Firing delay in seconds
	--[[self.deathvox_light_ar.hold = { -- dont worry about this
		"bullpup",
		"rifle"
	}]]--
	self.deathvox_light_ar.alert_size = 5000 -- how far away in AlmirUnits(tm) it alerts people
	self.deathvox_light_ar.suppression = 1 -- dont worry about this
	self.deathvox_light_ar.usage = "is_light_rifle"
	self.deathvox_light_ar.anim_usage = "is_rifle"
	table.insert(self._gun_list_cd, "deathvox_light_ar")

	self.deathvox_heavy_ar.sounds.prefix = "m4_npc"
	self.deathvox_heavy_ar.use_data.selection_index = 2
	self.deathvox_heavy_ar.DAMAGE = 10 -- DEPRECATED due to use of damage table.
	self.deathvox_heavy_ar.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.deathvox_heavy_ar.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556"
	self.deathvox_heavy_ar.CLIP_AMMO_MAX = 20
	self.deathvox_heavy_ar.NR_CLIPS_MAX = 5
	--self.deathvox_heavy_ar.pull_magazine_during_reload = "rifle"
	self.deathvox_heavy_ar.auto.fire_rate = 0.08
	self.deathvox_heavy_ar.hold = "rifle"
	self.deathvox_heavy_ar.alert_size = 5000
	self.deathvox_heavy_ar.suppression = 1
	self.deathvox_heavy_ar.usage = "is_heavy_rifle"
	self.deathvox_heavy_ar.anim_usage = "is_rifle"
	table.insert(self._gun_list_cd, "deathvox_heavy_ar")

	self.deathvox_guard_pistol.sounds.prefix = "packrat_npc"
	self.deathvox_guard_pistol.use_data.selection_index = 1
	self.deathvox_guard_pistol.DAMAGE = 6 -- DEPRECATED due to use of damage table.
	self.deathvox_guard_pistol.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deathvox_guard_pistol.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deathvox_guard_pistol.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deathvox_guard_pistol.CLIP_AMMO_MAX = 15
	self.deathvox_guard_pistol.NR_CLIPS_MAX = 5
	--self.deathvox_guard_pistol.pull_magazine_during_reload = "pistol"
	self.deathvox_guard_pistol.hold = "pistol"
	self.deathvox_guard_pistol.alert_size = 2500
	self.deathvox_guard_pistol.suppression = 1
	self.deathvox_guard_pistol.usage = "is_pistol"
	self.deathvox_guard_pistol.anim_usage = "is_pistol"
	table.insert(self._gun_list_cd, "deathvox_guard_pistol")

	self.deathvox_medic_pistol.sounds.prefix = "mateba_npc"
	self.deathvox_medic_pistol.use_data.selection_index = 1
	self.deathvox_medic_pistol.DAMAGE = 8 -- DEPRECATED due to use of damage table.
	self.deathvox_medic_pistol.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deathvox_medic_pistol.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deathvox_medic_pistol.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
	self.deathvox_medic_pistol.CLIP_AMMO_MAX = 6
	self.deathvox_medic_pistol.NR_CLIPS_MAX = 8
	self.deathvox_medic_pistol.hold = "pistol"
	self.deathvox_medic_pistol.reload = "revolver"
	self.deathvox_medic_pistol.alert_size = 5000
	self.deathvox_medic_pistol.suppression = 1.8
	self.deathvox_medic_pistol.usage = "is_revolver"
	self.deathvox_medic_pistol.anim_usage = "is_revolver"
	self.deathvox_medic_pistol.armor_piercing = true -- armor piercing.
	table.insert(self._gun_list_cd, "deathvox_medic_pistol")

	self.deathvox_shotgun_light.sounds.prefix = "remington_npc"
	self.deathvox_shotgun_light.use_data.selection_index = 2
	self.deathvox_shotgun_light.DAMAGE = 12 -- DEPRECATED due to use of damage table.
	self.deathvox_shotgun_light.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.deathvox_shotgun_light.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.deathvox_shotgun_light.CLIP_AMMO_MAX = 6
	self.deathvox_shotgun_light.NR_CLIPS_MAX = 4
	self.deathvox_shotgun_light.hold = "rifle"
	self.deathvox_shotgun_light.alert_size = 4500
	self.deathvox_shotgun_light.suppression = 1.8
	self.deathvox_shotgun_light.is_shotgun = true 
	self.deathvox_shotgun_light.usage = "is_light_shotgun"
	self.deathvox_shotgun_light.anim_usage = "is_shotgun_pump"
	self.deathvox_shotgun_light.reload = "looped"
	self.deathvox_shotgun_light.looped_reload_speed = 0.8 -- time it takes to reload each shell
	table.insert(self._gun_list_cd, "deathvox_shotgun_light")

	self.deathvox_shotgun_heavy.sounds.prefix = "benelli_m4_npc"
	self.deathvox_shotgun_heavy.use_data.selection_index = 2
	self.deathvox_shotgun_heavy.DAMAGE = 15 -- DEPRECATED due to use of damage table.
	self.deathvox_shotgun_heavy.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.deathvox_shotgun_heavy.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.deathvox_shotgun_heavy.CLIP_AMMO_MAX = 8
	self.deathvox_shotgun_heavy.NR_CLIPS_MAX = 4
	self.deathvox_shotgun_heavy.hold = "rifle"
	self.deathvox_shotgun_heavy.reload = "looped"
	self.deathvox_shotgun_heavy.looped_reload_speed = 0.8 -- time it takes to reload each shell
	self.deathvox_shotgun_heavy.alert_size = 4500
	self.deathvox_shotgun_heavy.suppression = 1.8
	self.deathvox_shotgun_heavy.is_shotgun = true
	self.deathvox_shotgun_heavy.usage = "is_heavy_shotgun"
	self.deathvox_shotgun_heavy.anim_usage = "is_shotgun_pump"
	table.insert(self._gun_list_cd, "deathvox_shotgun_heavy")

	self.deathvox_sniper.categories = {"snp"}
	self.deathvox_sniper.sounds.prefix = "sniper_npc"
	self.deathvox_sniper.use_data.selection_index = 2
	self.deathvox_sniper.DAMAGE = 24 -- DEPRECATED due to use of damage table.
	self.deathvox_sniper.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deathvox_sniper.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deathvox_sniper.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deathvox_sniper.CLIP_AMMO_MAX = 10
	self.deathvox_sniper.NR_CLIPS_MAX = 5
	--self.deathvox_sniper.pull_magazine_during_reload = "rifle"
	--self.deathvox_sniper.auto.fire_rate = 0.5
	self.deathvox_sniper.alert_size = 5000
	self.deathvox_sniper.suppression = 1	
	self.deathvox_sniper.armor_piercing = true
	self.deathvox_sniper.usage = "is_assault_sniper"
	self.deathvox_sniper.anim_usage = "is_rifle"
    self.deathvox_sniper.use_laser = false
    self.deathvox_sniper.disable_sniper_laser = true	
	table.insert(self._gun_list_cd, "deathvox_sniper")
	
	self.deathvox_medicdozer_smg.sounds.prefix = "polymer_npc"
	self.deathvox_medicdozer_smg.use_data.selection_index = 1
	self.deathvox_medicdozer_smg.DAMAGE = 4.5 -- DEPRECATED due to use of damage table.
	self.deathvox_medicdozer_smg.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deathvox_medicdozer_smg.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deathvox_medicdozer_smg.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deathvox_medicdozer_smg.CLIP_AMMO_MAX = 30
	self.deathvox_medicdozer_smg.NR_CLIPS_MAX = 5
	self.deathvox_medicdozer_smg.reload = "rifle"
	self.deathvox_medicdozer_smg.pull_magazine_during_reload = "smg"
	self.deathvox_medicdozer_smg.auto.fire_rate = 0.05
	self.deathvox_medicdozer_smg.hold = "rifle"
	self.deathvox_medicdozer_smg.alert_size = 5000
	self.deathvox_medicdozer_smg.suppression = 1	
	self.deathvox_medicdozer_smg.usage = "is_tank_smg"
	table.insert(self._gun_list_cd, "deathvox_medicdozer_smg")

	self.deathvox_grenadier.sounds.prefix = "mgl_npc"
	self.deathvox_grenadier.use_data.selection_index = 2
	self.deathvox_grenadier.DAMAGE = 0 -- irrelevant, as does not fire bullets. DEPRECATED due to use of damage table.
	self.deathvox_grenadier.muzzleflash = "effects/payday2/particles/weapons/big_762_auto" -- increased visibility on fire.
	self.deathvox_grenadier.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty" -- appears to produce no effect.
	self.deathvox_grenadier.CLIP_AMMO_MAX = 9999999
	self.deathvox_grenadier.NR_CLIPS_MAX = 9999999
	self.deathvox_grenadier.looped_reload_speed = 10
	self.deathvox_grenadier.timers = {reload_not_empty = 10}
	self.deathvox_grenadier.timers.reload_empty = self.deathvox_grenadier.timers.reload_not_empty
	self.deathvox_grenadier.auto.fire_rate = 1
	self.deathvox_grenadier.hold = {
		"bullpup",
		"rifle"
	}
	self.deathvox_grenadier.reload = "rifle"
	self.deathvox_grenadier.alert_size = 5000
	self.deathvox_grenadier.suppression = 1
	self.deathvox_grenadier.usage = "is_heavy_rifle"
	self.deathvox_grenadier.anim_usage = "is_shotgun_pump"
	self.deathvox_grenadier.no_trail = true
	table.insert(self._gun_list_cd, "deathvox_grenadier")

	self.deathvox_lmgdozer.sounds.prefix = "m249_npc"
	self.deathvox_lmgdozer.use_data.selection_index = 2
	self.deathvox_lmgdozer.DAMAGE = 10 -- DEPRECATED due to use of damage table.
	self.deathvox_lmgdozer.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.deathvox_lmgdozer.shell_ejection = "effects/payday2/particles/weapons/shells/shell_556_lmg"
	self.deathvox_lmgdozer.CLIP_AMMO_MAX = 200
	self.deathvox_lmgdozer.NR_CLIPS_MAX = 2
	self.deathvox_lmgdozer.auto.fire_rate = 0.08
	self.deathvox_lmgdozer.hold = "rifle"
	self.deathvox_lmgdozer.alert_size = 5000
	self.deathvox_lmgdozer.suppression = 1
	self.deathvox_lmgdozer.usage = "is_dozer_lmg"
   	table.insert(self._gun_list_cd, "deathvox_lmgdozer")

	self.deathvox_cloaker.sounds.prefix = "schakal_npc"
	self.deathvox_cloaker.use_data.selection_index = 1
	self.deathvox_cloaker.DAMAGE = 4.5 -- DEPRECATED due to use of damage table.
	self.deathvox_cloaker.muzzleflash = "effects/payday2/particles/weapons/9mm_auto"
	self.deathvox_cloaker.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.deathvox_cloaker.shell_ejection = "effects/payday2/particles/weapons/shells/shell_9mm"
	self.deathvox_cloaker.CLIP_AMMO_MAX = 30
	self.deathvox_cloaker.NR_CLIPS_MAX = 5
	self.deathvox_cloaker.auto.fire_rate = 0.092
	self.deathvox_cloaker.hold = {
		"bullpup",
		"rifle"
	}
	self.deathvox_cloaker.alert_size = 5000
	self.deathvox_cloaker.suppression = 1
	self.deathvox_cloaker.usage = "is_cloaker_smg"
	table.insert(self._gun_list_cd, "deathvox_cloaker")
	
	self.deathvox_blackdozer.sounds.prefix = "saiga_npc"
	self.deathvox_blackdozer.use_data.selection_index = 2
	self.deathvox_blackdozer.DAMAGE = 22.5 -- DEPRECATED due to use of damage table.
	self.deathvox_blackdozer.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.deathvox_blackdozer.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug"
	self.deathvox_blackdozer.auto.fire_rate = 0.14
	self.deathvox_blackdozer.CLIP_AMMO_MAX = 11
	self.deathvox_blackdozer.NR_CLIPS_MAX = 10
	self.deathvox_blackdozer.hold = "rifle"
	self.deathvox_blackdozer.alert_size = 4500
	self.deathvox_blackdozer.suppression = 1.8
	self.deathvox_blackdozer.is_shotgun = true
	self.deathvox_blackdozer.usage = "is_dozer_saiga"
	table.insert(self._gun_list_cd, "deathvox_blackdozer")
	
	self.deathvox_greendozer.sounds.prefix = "remington_npc"
	self.deathvox_greendozer.use_data.selection_index = 2
	self.deathvox_greendozer.DAMAGE = 50 -- DEPRECATED due to use of damage table.
	self.deathvox_greendozer.muzzleflash = "effects/payday2/particles/weapons/762_auto"
	self.deathvox_greendozer.shell_ejection = "effects/payday2/particles/weapons/shells/shell_slug_semi"
	self.deathvox_greendozer.CLIP_AMMO_MAX = 6
	self.deathvox_greendozer.NR_CLIPS_MAX = 4
	self.deathvox_greendozer.hold = "shot"
	self.deathvox_greendozer.alert_size = 4500
	self.deathvox_greendozer.suppression = 1.8
	self.deathvox_greendozer.is_shotgun = true
	self.deathvox_greendozer.usage = "is_dozer_pump"
	self.deathvox_greendozer.anim_usage = "is_shotgun_pump"
	self.deathvox_greendozer.reload = "looped"
	self.deathvox_greendozer.looped_reload_speed = 0.8 -- time it takes to reload each shell.
	table.insert(self._gun_list_cd, "deathvox_greendozer")

	local difficulties = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local better_names = {
		"not_a_real_difficulty",
		"normal",
		"hard",
		"very_hard",
		"overkill",
		"mayhem",
		"death_wish",
		"crackdown"
	}
	if Global and Global.game_settings and Global.game_settings.difficulty then
		local difficulty_index = table.index_of(difficulties, Global.game_settings.difficulty)
		local diff_name = better_names[difficulty_index]
		log(diff_name .. " DIFFICULTY NAME SHIT")
		for _, weapon_type in ipairs(self._gun_list_cd) do
			if self.damage_tables[weapon_type] then
				local damage_table = self.damage_tables[weapon_type]
				if damage_table then
					local chosen_diff = damage_table[diff_name]
					if chosen_diff then
						self[weapon_type].DAMAGE = chosen_diff["damage"]
					end
				end
			end
		end
	end
end

-- Begin difficulty scripted weapon damage value population.

-- Begin NORMAL difficulty damage values. 


function WeaponTweakData:_set_normal()

	--Rifles
	self.m4_npc.DAMAGE = 4		-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 2		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 2		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 2		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ak47_ass_npc.DAMAGE = 2 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 4	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 2 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 6	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 8 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 6   -- apparently used exclusively by Sosa. Draft value up one tier from heavy AR.
	self.x_c45_npc.DAMAGE = 4	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 2	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 24 --temporary Greendozer Shotgun, not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 18 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 10 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 4.5 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 4.5 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 16	-- possibly fully overwritten.
	
	self.mp5_npc.DAMAGE = 2.5	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 2.5	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 2		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 4	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 2.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 4	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.
	
-- Begin NORMAL Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 15000 -- compare 35k base game. Note no repair though.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 7 -- Full explosive mult.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 0.5	-- same as base game hard.
	self.swat_van_turret_module.CLIP_SIZE = 200 -- compare base game stat, 400.
	self.swat_van_turret_module.AUTO_REPAIR = false -- No repair for SWAT tier.
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 1 
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = false
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 15000 -- compare 35k base game. Note no repair though.
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 7 -- Full explosive mult.
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 0.5	-- same as base game hard.
	self.ceiling_turret_module.CLIP_SIZE = 200 -- compare base game stat, 400.
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 15000 -- compare 35k base game. Note low damage.
	self.crate_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as base game overkill.
	self.crate_turret_module.EXPLOSION_DMG_MUL = 7 -- Full explosive mult.
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 0.5	-- same as base game hard.
	self.crate_turret_module.CLIP_SIZE = 150 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE
	
	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 0.5
	self.aa_turret_module.CLIP_SIZE = 200
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10	
	
end

-- Begin HARD difficulty damage values. 

function WeaponTweakData:_set_hard()
	--Rifles
	self.m4_npc.DAMAGE = 4		-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 2		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 2		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 2		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ak47_ass_npc.DAMAGE = 2 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 4	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 2 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 6	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 8 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 6   -- apparently used exclusively by Sosa. Draft value up one tier from heavy AR.
	self.x_c45_npc.DAMAGE = 4	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 2	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 24 --temporary Greendozer Shotgun, not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 18 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 10 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 6 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 6 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 16	-- possibly fully overwritten.
	
	self.mp5_npc.DAMAGE = 2.5	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 2.5	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 2		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 4	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 2.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 4	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.
	
-- Begin HARD Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 15000 -- compare 35k base game. Note no repair though.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 7 -- Full explosive mult.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 0.5	-- same as base game hard.
	self.swat_van_turret_module.CLIP_SIZE = 200 -- compare base game stat, 400.
	self.swat_van_turret_module.AUTO_REPAIR = false -- No repair for SWAT tier.
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 1 
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = false
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 15000 -- compare 35k base game. Note no repair though.
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 7 -- Full explosive mult.
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 0.5	-- same as base game hard.
	self.ceiling_turret_module.CLIP_SIZE = 200 -- compare base game stat, 400.
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 15000 -- compare 35k base game. Note low damage.
	self.crate_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.crate_turret_module.EXPLOSION_DMG_MUL = 7 -- Full explosive mult.
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 0.5	-- same as base game hard.
	self.crate_turret_module.CLIP_SIZE = 150 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE
	
	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 0.5
	self.aa_turret_module.CLIP_SIZE = 200
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10
end

-- Begin VERY HARD difficulty damage values. 

function WeaponTweakData:_set_overkill()
	--Rifles
	self.m4_npc.DAMAGE = 6		-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 4.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 4.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 4.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ak47_ass_npc.DAMAGE = 4.5 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 6	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 4.5 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 7	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 9.5 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 7.5   -- apparently used exclusively by Sosa. Draft value up one tier from heavy AR.
	self.x_c45_npc.DAMAGE = 6	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 4.5	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 24 --temporary Greendozer Shotgun, not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 18 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 10 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 6 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 6 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 18	-- possibly fully overwritten.
	
	self.mp5_npc.DAMAGE = 4.5	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 4.5	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 2		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 4	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 4.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 6	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.

	
-- Begin VERY HARD Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 20000 -- compare 250k base game.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 5 -- reduced XP mult versus SWAT tier.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.swat_van_turret_module.CLIP_SIZE = 300 -- compare base game stat, 400.
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 1 -- Reduced repair count for FBI.
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 20000 -- compare 250k base game.
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 500 -- Same as base game overkill.
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 5 -- reduced XP mult versus SWAT tier.
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.ceiling_turret_module.CLIP_SIZE = 300 -- compare base game stat, 400.
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 20000 -- compare 250k base game.
	self.crate_turret_module.SHIELD_HEALTH_INIT = 500 -- Same as base game overkill.
	self.crate_turret_module.EXPLOSION_DMG_MUL = 5 -- reduced XP mult versus SWAT tier.
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.crate_turret_module.CLIP_SIZE = 200 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE

	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 2.0
	self.aa_turret_module.CLIP_SIZE = 300
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10
	
end

-- Begin OVERKILL difficulty damage values. 

function WeaponTweakData:_set_overkill_145()
	--Rifles
	self.m4_npc.DAMAGE = 6		-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 4.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 4.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 4.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ak47_ass_npc.DAMAGE = 4.5 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 6	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 4.5 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 7	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 9.5 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 7.5   -- apparently used exclusively by Sosa. Draft value up one tier from heavy AR.
	self.x_c45_npc.DAMAGE = 6	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 4.5	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 24 --temporary Greendozer Shotgun, not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 18 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 10 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 6 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 6 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 20	-- possibly fully overwritten.
	
	self.mp5_npc.DAMAGE = 4.5	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 4.5	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 2		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 4	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 4.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 6	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.
	
-- Begin OVERKILL Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 20000 -- compare 250k base game.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD.
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 5 -- reduced XP mult versus SWAT tier.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.swat_van_turret_module.CLIP_SIZE = 300 -- compare base game stat, 400.
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 1 -- Reduced repair count for FBI.
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 20000 -- compare 250k base game.
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 500 -- Same as base game overkill.
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 5 -- reduced XP mult versus SWAT tier.
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.ceiling_turret_module.CLIP_SIZE = 300 -- compare base game stat, 400.
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 20000 -- compare 250k base game.
	self.crate_turret_module.SHIELD_HEALTH_INIT = 500 -- Same as base game overkill.
	self.crate_turret_module.EXPLOSION_DMG_MUL = 5 -- reduced XP mult versus SWAT tier.
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.crate_turret_module.CLIP_SIZE = 200 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE
	
	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 2.0
	self.aa_turret_module.CLIP_SIZE = 300
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10
	
end

-- Begin MAYHEM difficulty damage values. 

function WeaponTweakData:_set_easy_wish()
	--Rifles
	self.m4_npc.DAMAGE = 7.5		-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 6		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 6		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 6		-- Light SWAT Riflemen, possibly. Mapped to light AR, Akan.
	self.ak47_ass_npc.DAMAGE = 6 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 7.5	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 6 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 7.5	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 10 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 9   -- apparently used exclusively by Sosa. Draft value up one tier from heavy AR.
	self.x_c45_npc.DAMAGE = 8	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 6	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 24 --temporary Greendozer Shotgun, not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 18 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 10 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 6 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 6 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 20	-- sniper damage, set according to table.
	self.m14_sniper_npc.sniper_trail = true
	self.deathvox_sniper.sniper_trail = true
	self.m14_sniper_npc.use_laser = false
    self.m14_sniper_npc.disable_sniper_laser = true
	
	self.mp5_npc.DAMAGE = 6	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 6	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 2		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 6	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 4.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 7.5	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.
	
-- Begin MAYHEM Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 30000 -- compare 400k base game.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD, "vivinite" shield.
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 3 -- Same as CD, "vivinite" shield.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.swat_van_turret_module.CLIP_SIZE = 400 -- compare base game stat, 800.
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 2 -- same as base game.
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 30000 -- compare 400k base game.
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 700 -- Same as CD, "vivinite" shield.
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.ceiling_turret_module.CLIP_SIZE = 400 -- compare base game stat, 800.
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 30000 -- compare 400k base game.
	self.crate_turret_module.SHIELD_HEALTH_INIT = 700 -- Same as CD, "vivinite" shield.
	self.crate_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.crate_turret_module.CLIP_SIZE = 250 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE
	
	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 2.0
	self.aa_turret_module.CLIP_SIZE = 400
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10	
	
end

-- Begin DEATHWISH difficulty damage values. 

function WeaponTweakData:_set_overkill_290()
	--Rifles
	self.m4_npc.DAMAGE = 7.5		-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 6		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 6		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 6		-- Light SWAT Riflemen, possibly. Mapped to light AR, Akan.
	self.ak47_ass_npc.DAMAGE = 6 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 7.5	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 6 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 7.5	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 10 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 9   -- apparently used exclusively by Sosa. Draft value up one tier from heavy AR.
	self.x_c45_npc.DAMAGE = 8	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 6	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 24 --temporary Greendozer Shotgun, not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 18 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 10 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 6 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 6 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 20	-- sniper damage, set according to table.
	self.m14_sniper_npc.sniper_trail = true
	self.deathvox_sniper.sniper_trail = true
	self.m14_sniper_npc.use_laser = false
    self.m14_sniper_npc.disable_sniper_laser = true
	
	self.mp5_npc.DAMAGE = 6	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 6	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 2		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 6	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 4.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 7.5	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.

-- Begin DEATHWISH Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 30000 -- compare 400k base game.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300 -- Same as CD, "vivinite" shield.
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 3 -- Same as CD, "vivinite" shield.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.swat_van_turret_module.CLIP_SIZE = 400 -- compare base game stat, 800.
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 2 -- same as base game.
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 30000 -- compare 400k base game.
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 700 -- Same as CD, "vivinite" shield.
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.ceiling_turret_module.CLIP_SIZE = 400 -- compare base game stat, 800.
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 30000 -- compare 400k base game.
	self.crate_turret_module.SHIELD_HEALTH_INIT = 700 -- Same as CD, "vivinite" shield.
	self.crate_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 2.0	-- same as base game overkill.
	self.crate_turret_module.CLIP_SIZE = 250 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE
	
	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 2.0
	self.aa_turret_module.CLIP_SIZE = 400
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10
	
end

-- Begin CRACKDOWN difficulty damage values. 

function WeaponTweakData:_set_sm_wish() 
	--Rifles
	self.m4_npc.DAMAGE = 9	-- Heavy SWAT Riflemen. Mapped to heavy AR.
	self.g36_npc.DAMAGE = 7.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.ump_npc.DAMAGE = 7.5		-- Light SWAT Riflemen, possibly. Mapped to light AR.
	self.akmsu_smg_npc.DAMAGE = 7.5		-- Light SWAT Riflemen, possibly. Mapped to light AR, Akan.
	self.ak47_ass_npc.DAMAGE = 7.5 -- possibly unused aside from akan. Mapped to light AR.
	self.ak47_npc.DAMAGE = 9	-- possibly used by mobster units. Map to heavy AR.
	self.scar_npc.DAMAGE = 7.5 --Scripted murky units, possibly useful for later custom units? Mapped to light AR.
	
	--Shotguns
	self.r870_npc.DAMAGE = 9	-- Light SWAT Shotgunners. Mapped to Light Shotgun.
	self.benelli_npc.DAMAGE = 11 -- Heavy SWAT Shotgunners. Mapped to Heavy Shotgun.
	
	--Unique/Special Weapons (scripted, special enemies, bosses)
	self.contraband_npc.DAMAGE = 11  -- apparently used exclusively by Sosa. Heavy AR + 20.
	self.x_c45_npc.DAMAGE = 10	-- chavez weapon. Check name and syntax. Draft map to medic revolver + 20.
	
	self.m4_yellow_npc.DAMAGE = 7.5	-- populates taser damage after other fixes applied. Map to light AR.
	
	self.mossberg_npc.DAMAGE = 50 --temporary Greendozer Shotgun. not enough shotguns to map to all units, consider Bulldozer-specific weapon presets?
	self.saiga_npc.DAMAGE = 22.5 --Blackdozer Saiga, mapped to Deathvox Blackdozer.
	self.m249_npc.DAMAGE = 12 --LMGDozer M249, has is_rifle behavior, needs to have it's usage changed. consider Bulldozer-specific weapon presets?
	self.rpk_lmg_npc.DAMAGE = 10 --LMGDozer M249, AKAN faction, has is_rifle behavior, normal M249.
	self.s552_npc.DAMAGE = 7.5 --No info on what or who uses it, so it might be better used as the MedicDozer weapon, damage mapped as such, unsure whether it actually exists as a weapon in the game's files, however.
	
	self.mp5_tactical_npc.DAMAGE = 7.5 --Used by Cloaker, mapped to Deathvox Cloaker SMG.
	self.asval_smg_npc.DAMAGE = 7.5 --Used by Akan Cloaker, mapped to Deathvox Cloaker SMG.
	
--	self.m14_npc.DAMAGE = 3		-- possibly unused.
	self.m14_sniper_npc.DAMAGE = 24	-- sniper damage, set according to table
	--Sniper Trail for Snipers
	self.m14_sniper_npc.sniper_trail = true
	self.deathvox_sniper.sniper_trail = true
	self.m14_sniper_npc.use_laser = false
    self.m14_sniper_npc.disable_sniper_laser = true
	
	
	self.mp5_npc.DAMAGE = 7.5	-- smg used by number of units. Map to cop smg.
	self.mp9_npc.DAMAGE = 7.5	-- shield only.	Map to cop smg.
	self.c45_npc.DAMAGE = 6		-- pistol used by variety of units. Draft map to cop pistol.
	self.raging_bull_npc.DAMAGE = 8	-- bronco used by variety of units. Draft map to cop revolver. Make sure no armor pierce.
	self.mac11_npc.DAMAGE = 7.5	-- smg used by number of criminal units. Map to cop smg.
	self.smoke_npc.DAMAGE = 9	-- vit secret enemy weapon. Map to Heavy AR.
--	self.mini_npc.DAMAGE = 10	-- minigun damage. Used only for specific scripted enemies. Draft value assumes general lmg usage.
	
-- below code is goofball legacy believed to reinitialize enemy melee values.	
	self.npc_melee.baton.damage = 5
	self.npc_melee.knife_1.damage = 7
	self.npc_melee.fists.damage = 4
-- end goofball legacy code block.
-- Begin CRACKDOWN Turret values.

	self.swat_van_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.swat_van_turret_module.SHIELD_HEALTH_INIT = 300
	self.swat_van_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7.
	self.swat_van_turret_module.FIRE_DMG_MUL = 0.1
	self.swat_van_turret_module.BAG_DMG_MUL = 100
	self.swat_van_turret_module.SHIELD_DMG_MUL = 1
	self.swat_van_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.swat_van_turret_module.BODY_DAMAGE_CLAMP = 4200
	self.swat_van_turret_module.DAMAGE = 3.5
	self.swat_van_turret_module.CLIP_SIZE = 500 --reduced from base game stat, 800.
	self.swat_van_turret_module.AUTO_REPAIR = true
	self.swat_van_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.swat_van_turret_module.AUTO_REPAIR_DURATION = 30
	self.swat_van_turret_module.AUTO_RELOAD_DURATION = 8
	self.swat_van_turret_module.CAN_GO_IDLE = true
	self.swat_van_turret_module.IDLE_WAIT_TIME = 10
	
	--Ceiling turrets.
	self.ceiling_turret_module.HEALTH_INIT = 40000
	self.ceiling_turret_module.SHIELD_HEALTH_INIT = 700
	self.ceiling_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7
	self.ceiling_turret_module.FIRE_DMG_MUL = 0.1
	self.ceiling_turret_module.BAG_DMG_MUL = 100
	self.ceiling_turret_module.SHIELD_DMG_MUL = 1
	self.ceiling_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.ceiling_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.ceiling_turret_module.DAMAGE = 3.5
	self.ceiling_turret_module.CLIP_SIZE = 800
	self.ceiling_turret_module.AUTO_REPAIR = false
	self.ceiling_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.ceiling_turret_module.AUTO_REPAIR_DURATION = 1
	self.ceiling_turret_module.AUTO_RELOAD_DURATION = 8
	self.ceiling_turret_module.CAN_GO_IDLE = false
	self.ceiling_turret_module.IDLE_WAIT_TIME = 1
	
	--Crate turrets. Clone Ceiling turrets with slight revisions.
	self.crate_turret_module.HEALTH_INIT = 40000
	self.crate_turret_module.SHIELD_HEALTH_INIT = 700
	self.crate_turret_module.EXPLOSION_DMG_MUL = 3 -- base game value is 7
	self.crate_turret_module.FIRE_DMG_MUL = 0.1
	self.crate_turret_module.BAG_DMG_MUL = 100
	self.crate_turret_module.SHIELD_DMG_MUL = 1
	self.crate_turret_module.SHIELD_DAMAGE_CLAMP = 350
	self.crate_turret_module.BODY_DAMAGE_CLAMP =  4200
	self.crate_turret_module.DAMAGE = 3.5
	self.crate_turret_module.CLIP_SIZE = 400 -- reduced due to locations used being mostly close range.
	self.crate_turret_module.AUTO_REPAIR = false
	self.crate_turret_module.AUTO_REPAIR_MAX_COUNT = 1
	self.crate_turret_module.AUTO_REPAIR_DURATION = 1
	self.crate_turret_module.AUTO_RELOAD_DURATION = 8
	self.crate_turret_module.CAN_GO_IDLE = false
	self.crate_turret_module.IDLE_WAIT_TIME = 1
	
	--unusual variants in base game files; may or may not be used.
	self.ceiling_turret_module_no_idle = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range = deep_clone(self.ceiling_turret_module)
	self.ceiling_turret_module_longer_range.CAN_GO_IDLE = false
	self.ceiling_turret_module_longer_range.FIRE_RANGE = 30000
	self.ceiling_turret_module_longer_range.DETECTION_RANGE = self.ceiling_turret_module_longer_range.FIRE_RANGE
	
	-- AA turret; used on Henry's Rock.
	self.aa_turret_module.HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.SHIELD_HEALTH_INIT = 999999 -- functionally immortal.
	self.aa_turret_module.EXPLOSION_DMG_MUL = 0
	self.aa_turret_module.FIRE_DMG_MUL = 0
	self.aa_turret_module.BAG_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DMG_MUL = 0
	self.aa_turret_module.SHIELD_DAMAGE_CLAMP = 10
	self.aa_turret_module.BODY_DAMAGE_CLAMP = 10
	self.aa_turret_module.DAMAGE = 3.5
	self.aa_turret_module.CLIP_SIZE = 800
	self.aa_turret_module.AUTO_REPAIR = true 
	self.aa_turret_module.AUTO_REPAIR_MAX_COUNT = 999
	self.aa_turret_module.AUTO_REPAIR_DURATION = 30
	self.aa_turret_module.AUTO_RELOAD_DURATION = 8
	self.aa_turret_module.CAN_GO_IDLE = false
	self.aa_turret_module.IDLE_WAIT_TIME = 10
end
