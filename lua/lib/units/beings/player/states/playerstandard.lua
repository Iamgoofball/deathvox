local mvec3_dis_sq = mvector3.distance_sq
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize

function PlayerStandard:init(unit)
	PlayerMovementState.init(self, unit)

	self._tweak_data = tweak_data.player.movement_state.standard
	self._obj_com = self._unit:get_object(Idstring("rp_mover"))
	local slot_manager = managers.slot
	self._slotmask_gnd_ray = slot_manager:get_mask("player_ground_check")
	self._slotmask_fwd_ray = slot_manager:get_mask("bullet_impact_targets")
	self._slotmask_bullet_impact_targets = slot_manager:get_mask("bullet_impact_targets")
	self._slotmask_pickups = slot_manager:get_mask("pickups")
	self._slotmask_AI_visibility = slot_manager:get_mask("AI_visibility")
	self._slotmask_long_distance_interaction = slot_manager:get_mask("long_distance_interaction")
	self._ext_camera = unit:camera()
	self._ext_movement = unit:movement()
	self._ext_damage = unit:character_damage()
	self._ext_inventory = unit:inventory()
	self._ext_anim = unit:anim_data()
	self._ext_network = unit:network()
	self._ext_event_listener = unit:event_listener()
	self._camera_unit = self._ext_camera._camera_unit
	self._camera_unit_anim_data = self._camera_unit:anim_data()
	self._machine = unit:anim_state_machine()
	self._m_pos = self._ext_movement:m_pos()
	self._pos = Vector3()
	self._stick_move = Vector3()
	self._stick_look = Vector3()
	self._cam_fwd_flat = Vector3()
	self._walk_release_t = -100
	self._last_sent_pos = unit:position()
	self._last_sent_pos_t = 0
	self._state_data = unit:movement()._state_data
	local pm = managers.player
	self.RUN_AND_RELOAD = pm:has_category_upgrade("player", "run_and_reload")
	self._pickup_area = 200 * pm:upgrade_value("player", "increased_pickup_area", 1)

	self:set_animation_state("standard")

	self._interaction = managers.interaction
	self._on_melee_restart_drill = pm:has_category_upgrade("player", "drill_melee_hit_restart_chance")
	local controller = unit:base():controller()

	if controller:get_type() ~= "pc" and controller:get_type() ~= "vr" then
		self._input = {}

		table.insert(self._input, BipodDeployControllerInput:new())

		if pm:has_category_upgrade("player", "second_deployable") then
			table.insert(self._input, SecondDeployableControllerInput:new())
		end
	end

	self._input = self._input or {}

	table.insert(self._input, HoldButtonMetaInput:new("night_vision", "weapon_firemode", nil, 0.5))

	self._menu_closed_fire_cooldown = 0

	managers.menu:add_active_changed_callback(callback(self, self, "_on_menu_active_changed"))

	--manually adding the player husk slotmask here when the FF Mutator is enabled, otherwise players won't be able to hit other players' husks with melee
	if managers.mutators:is_mutator_active(MutatorFriendlyFire) then
		self._slotmask_bullet_impact_targets = self._slotmask_bullet_impact_targets + World:make_slot_mask(3)
	end
end

function PlayerStandard:_update_fwd_ray()
	local from = self._unit:movement():m_head_pos()
	local range = alive(self._equipped_unit) and self._equipped_unit:base():has_range_distance_scope() and 20000 or 4000
	local to = self._cam_fwd * range

	mvector3.add(to, from)

	self._fwd_ray = World:raycast("ray", from, to, "slot_mask", self._slotmask_fwd_ray)

	managers.environment_controller:set_dof_distance(math.max(0, math.min(self._fwd_ray and self._fwd_ray.distance or 4000, 4000) - 200), self._state_data.in_steelsight)

	if alive(self._equipped_unit) then
		if self._state_data.in_steelsight and self._equipped_unit:base().check_highlight_unit then
			--with this method, range for depth of field and scope distance isn't affected and marking works through glass (or to be more specific, through surfaces that the AI can see through)
			local marking_from = self._unit:movement():m_head_pos()
			local marking_to = self._cam_fwd * 20000

			mvector3.add(marking_to, marking_from)

			local ray_hits = nil
			local hit_person_or_sentry = false
			local person_mask = managers.slot:get_mask("persons")
			local sentry_mask = managers.slot:get_mask("sentry_gun")
			local wall_mask = managers.slot:get_mask("world_geometry", "vehicles")
			local shield_mask = managers.slot:get_mask("enemy_shield_check")
			local ai_vision_ids = Idstring("ai_vision")

			ray_hits = World:raycast_all("ray", marking_from, marking_to, "slot_mask", self._slotmask_fwd_ray, "ignore_unit", self._equipped_unit:base()._setup.ignore_units)

			local units_hit = {}
			local unique_hits = {}

			for i, hit in ipairs(ray_hits) do
				if not units_hit[hit.unit:key()] then
					units_hit[hit.unit:key()] = true
					unique_hits[#unique_hits + 1] = hit
					hit.hit_position = hit.position
					hit_person_or_sentry = hit_person_or_sentry or hit.unit:in_slot(person_mask) or hit.unit:in_slot(sentry_mask)
					local weak_body = hit.body:has_ray_type(ai_vision_ids)

					if hit_person_or_sentry then
						break
					elseif hit.unit:in_slot(wall_mask) and weak_body then
						break
					elseif hit.unit:in_slot(shield_mask) then
						break
					end
				end
			end

			for _, hit in ipairs(unique_hits) do
				if hit.unit then
					self._equipped_unit:base():check_highlight_unit(hit.unit)
				end
			end
		end

		if self._equipped_unit:base().set_scope_range_distance then
			self._equipped_unit:base():set_scope_range_distance(self._fwd_ray and self._fwd_ray.distance / 100 or false)
		end
	end
end

function PlayerStandard:_get_intimidation_action(prime_target, char_table, amount, primary_only, detect_only, secondary)
	local voice_type, new_action, plural = nil
	local unit_type_enemy = 0
	local unit_type_civilian = 1
	local unit_type_teammate = 2
	local unit_type_camera = 3
	local unit_type_turret = 4
	local is_whisper_mode = managers.groupai:state():whisper_mode()

	if prime_target then
		if prime_target.unit_type == unit_type_teammate then
			local is_human_player, record, do_nothing = nil

			if not detect_only then
				record = managers.groupai:state():all_criminals()[prime_target.unit:key()]

				if record.ai then
					if not prime_target.unit:brain():player_ignore() then
						if secondary then
							if prime_target.unit:movement()._should_stay then
								do_nothing = true
							end
						else
							if self._ext_movement:rally_skill_data() and not managers.player:has_enabled_cooldown_upgrade("cooldown", "long_dis_revive") and (prime_target.unit:character_damage():arrested() or prime_target.unit:character_damage():need_revive()) then
								do_nothing = true
							end
						end

						if not do_nothing then
							prime_target.unit:movement():set_cool(false)
							prime_target.unit:brain():on_long_dis_interacted(0, self._unit, secondary)
						end
					end
				else
					is_human_player = true
				end
			end

			local amount = 0
			local current_state_name = self._unit:movement():current_state_name()

			if current_state_name ~= "arrested" and current_state_name ~= "bleed_out" and current_state_name ~= "fatal" and current_state_name ~= "incapacitated" then
				local rally_skill_data = self._ext_movement:rally_skill_data()

				if rally_skill_data and mvector3.distance_sq(self._pos, record.m_pos) < rally_skill_data.range_sq then
					local needs_revive, is_arrested, action_stop = nil

					if not secondary then
						if prime_target.unit:base().is_husk_player then
							is_arrested = prime_target.unit:movement():current_state_name() == "arrested"
							needs_revive = prime_target.unit:interaction():active() and prime_target.unit:movement():need_revive() and not is_arrested
						else
							is_arrested = prime_target.unit:character_damage():arrested()
							needs_revive = prime_target.unit:character_damage():need_revive()
						end

						if needs_revive then
							if managers.player:has_enabled_cooldown_upgrade("cooldown", "long_dis_revive") then
								voice_type = "revive"

								managers.player:disable_cooldown_upgrade("cooldown", "long_dis_revive")
							else
								do_nothing = true
							end
						elseif is_human_player and not is_arrested and not needs_revive and rally_skill_data.morale_boost_delay_t and rally_skill_data.morale_boost_delay_t < managers.player:player_timer():time() then
							voice_type = "boost"
							amount = 1
						end
					end
				end
			end

			if is_human_player then
				prime_target.unit:network():send_to_unit({
					"long_dis_interaction",
					prime_target.unit,
					amount,
					self._unit,
					secondary or false
				})
			end

			voice_type = voice_type or secondary and not is_human_player and not do_nothing and "ai_stay" or not do_nothing and "come" or nil
			plural = false
		else
			local prime_target_key = prime_target.unit:key()

			if prime_target.unit_type == unit_type_enemy then
				plural = false

				if prime_target.unit:anim_data().hands_back then
					voice_type = "cuff_cop"
				elseif prime_target.unit:anim_data().surrender then
					voice_type = "down_cop"
				elseif is_whisper_mode and prime_target.unit:movement():cool() and prime_target.unit:base():char_tweak().silent_priority_shout then
					voice_type = "mark_cop_quiet"
				elseif prime_target.unit:base():char_tweak().priority_shout then
					voice_type = "mark_cop"
				else
					if managers.groupai:state():has_room_for_police_hostage() or prime_target.unit:anim_data().hands_back or prime_target.unit:anim_data().surrender then
						if prime_target.unit:base():char_tweak().surrender and not prime_target.unit:base():char_tweak().surrender.special and not prime_target.unit:base():char_tweak().surrender.never then
							voice_type = "stop_cop"
						end
					end
				end
			elseif prime_target.unit_type == unit_type_camera then
				plural = false
				voice_type = "mark_camera"
			elseif prime_target.unit_type == unit_type_turret then
				plural = false
				voice_type = "mark_turret"
			elseif prime_target.unit:base():char_tweak().is_escort then
				plural = false
				local e_guy = prime_target.unit

				voice_type = "escort_keep"
			else
				if prime_target.unit:anim_data().stand then
					if prime_target.is_tied or prime_target.unit:movement():stance_name() == "cbt" then
						voice_type = "come"
					else
						voice_type = "down"
					end
				elseif prime_target.unit:anim_data().move then
					if prime_target.is_tied or prime_target.unit:movement():stance_name() == "cbt" then
						voice_type = "come"
					else
						voice_type = "stop"
					end
				elseif prime_target.unit:anim_data().drop then
					if not prime_target.unit:anim_data().tied then
						voice_type = "down_stay"
					end
				else
					if not prime_target.is_tied then
						voice_type = "down"
					end
				end

				local num_affected = 0

				for _, char in pairs(char_table) do
					if char.unit_type == unit_type_civilian then
						if voice_type == "stop" and char.unit:anim_data().move then
							num_affected = num_affected + 1
						elseif voice_type == "down_stay" and char.unit:anim_data().drop then
							num_affected = num_affected + 1
						elseif voice_type == "down" and not char.unit:anim_data().move and not char.unit:anim_data().drop then
							num_affected = num_affected + 1
						end
					end
				end

				plural = num_affected > 1 and true or false
			end

			local max_inv_wgt = 0

			for _, char in pairs(char_table) do
				if max_inv_wgt < char.inv_wgt then
					max_inv_wgt = char.inv_wgt
				end
			end

			if max_inv_wgt < 1 then
				max_inv_wgt = 1
			end

			if detect_only then
				voice_type = "come"
			else
				for _, char in pairs(char_table) do
					if char.unit_type ~= unit_type_camera and char.unit_type ~= unit_type_teammate and (not is_whisper_mode or not char.unit:movement():cool()) then
						if char.unit_type == unit_type_civilian then
							if not amount then
								slot23 = tweak_data.player.long_dis_interaction.intimidate_strength
							end

							amount = slot23 * managers.player:upgrade_value("player", "civ_intimidation_mul", 1) * managers.player:team_upgrade_value("player", "civ_intimidation_mul", 1)
						end

						if prime_target_key == char.unit:key() then
							voice_type = char.unit:brain():on_intimidated(amount or tweak_data.player.long_dis_interaction.intimidate_strength, self._unit) or voice_type
						elseif not primary_only and char.unit_type ~= unit_type_enemy then
							char.unit:brain():on_intimidated((amount or tweak_data.player.long_dis_interaction.intimidate_strength) * char.inv_wgt / max_inv_wgt, self._unit)
						end
					end
				end
			end
		end
	end

	return voice_type, plural, prime_target
end

function PlayerStandard:_get_unit_intimidation_action(intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only, secondary)
	local char_table = {}
	local unit_type_enemy = 0
	local unit_type_civilian = 1
	local unit_type_teammate = 2
	local unit_type_camera = 3
	local unit_type_turret = 4
	local cam_fwd = self._ext_camera:forward()
	local my_head_pos = self._ext_movement:m_head_pos()

	if _G.IS_VR then
		local hand_unit = self._unit:hand():hand_unit(self._interact_hand)

		if hand_unit:raycast("ray", hand_unit:position(), my_head_pos, "slot_mask", 1) then
			return
		end

		cam_fwd = hand_unit:rotation():y()
		my_head_pos = hand_unit:position()
	end

	local range_mul = managers.player:upgrade_value("player", "intimidate_range_mul", 1) * managers.player:upgrade_value("player", "passive_intimidate_range_mul", 1)
	local intimidate_range_civ = tweak_data.player.long_dis_interaction.intimidate_range_civilians * range_mul
	local intimidate_range_ene = tweak_data.player.long_dis_interaction.intimidate_range_enemies * range_mul
	local highlight_range = tweak_data.player.long_dis_interaction.highlight_range * range_mul
	local intimidate_range_teammates = tweak_data.player.long_dis_interaction.intimidate_range_teammates

	if intimidate_enemies then
		local enemies = managers.enemy:all_enemies()

		for u_key, u_data in pairs(enemies) do
			if self._unit:movement():team().foes[u_data.unit:movement():team().id] and not u_data.unit:anim_data().hands_tied and not u_data.unit:anim_data().long_dis_interact_disabled and (not u_data.unit:character_damage() or not u_data.unit:character_damage():dead()) and (u_data.char_tweak.priority_shout or not only_special_enemies) then
				local can_intimidate = managers.groupai:state():has_room_for_police_hostage() or u_data.unit:anim_data().hands_back or u_data.unit:anim_data().surrender

				if managers.groupai:state():whisper_mode() then
					if u_data.unit:movement():cool() and u_data.char_tweak.silent_priority_shout then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 100, my_head_pos, cam_fwd)
					elseif not u_data.unit:movement():cool() then
						if can_intimidate and u_data.char_tweak.surrender and not u_data.char_tweak.surrender.special and not u_data.char_tweak.surrender.never then
							self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 200, my_head_pos, cam_fwd, nil, "ai_vision mover") --200 during stealth since this can really save you at times
						end
					end
				else
					if not u_data.char_tweak.priority_shout then
						if can_intimidate and u_data.char_tweak.surrender and not u_data.char_tweak.surrender.special and not u_data.char_tweak.surrender.never then
							self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 0.01, my_head_pos, cam_fwd, nil, "ai_vision mover")
						end
					else
						local cloaker_type = u_data.unit:base():has_tag("spooc")
						local medic_type = u_data.unit:base():has_tag("medic")
						local minigun_dozer = u_data.unit:base()._tweak_table == "tank_mini"
						local other_dozer_types = u_data.unit:base():has_tag("tank") and not u_data.unit:base():has_tag("medic") and not u_data.unit:base()._tweak_table == "tank_mini"
						local taser_type = u_data.unit:base():has_tag("taser")
						local captain = u_data.unit:base()._tweak_table == "phalanx_vip" and alive(managers.groupai:state():phalanx_vip())
						local other_shields = u_data.unit:base():has_tag("shield") and not u_data.unit:base()._tweak_table == "phalanx_vip"
						local sniper_type = u_data.unit:base():has_tag("sniper")

						local priority = (cloaker_type or taser_type) and 200 or medic_type and 150 and minigun_dozer and 100 or other_dozer_types and 75 or captain and 50 or other_shields and 25 or 10

						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range * (sniper_type and 3 or 1), false, false, priority, my_head_pos, cam_fwd)
					end
				end
			end
		end
	end

	if intimidate_civilians then
		local civilians = managers.enemy:all_civilians()

		for u_key, u_data in pairs(civilians) do
			if alive(u_data.unit) and u_data.unit:in_slot(21) and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort

				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001

					if not (u_data.unit:anim_data().drop and u_data.is_tied) then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
					end
				end
			end
		end
	end

	if intimidate_teammates then
		local criminals = managers.groupai:state():all_char_criminals()

		if managers.groupai:state():whisper_mode() then
			for u_key, u_data in pairs(criminals) do
				local added = nil

				if u_key ~= self._unit:key() then
					local rally_skill_data = self._ext_movement:rally_skill_data()

					if rally_skill_data and rally_skill_data.long_dis_revive and mvector3.distance_sq(self._pos, u_data.m_pos) < rally_skill_data.range_sq then
						local needs_revive = nil

						if u_data.unit:base().is_husk_player then
							needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
						else
							needs_revive = u_data.unit:character_damage():need_revive()
						end

						if needs_revive then
							if managers.player:has_enabled_cooldown_upgrade("cooldown", "long_dis_revive") then
								added = true
							end
						end
					end
				end

				if not added and not u_data.is_deployable and not u_data.unit:movement():downed() and not u_data.unit:base().is_local_player and not u_data.unit:anim_data().long_dis_interact_disabled then
					if secondary then
						if not u_data.unit:base().is_husk_player and not u_data.unit:movement():cool() and not u_data.unit:movement()._should_stay then
							self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, false, 0.01, my_head_pos, cam_fwd)
						end
					else
						if not u_data.unit:base().is_husk_player and not u_data.unit:movement():cool() then
							self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, true, 0.01, my_head_pos, cam_fwd)
						end
					end
				end
			end
		else
			for u_key, u_data in pairs(criminals) do
				local added = nil

				if u_key ~= self._unit:key() then
					local rally_skill_data = self._ext_movement:rally_skill_data()

					if rally_skill_data and rally_skill_data.long_dis_revive and mvector3.distance_sq(self._pos, u_data.m_pos) < rally_skill_data.range_sq then
						local needs_revive = nil

						if u_data.unit:base().is_husk_player then
							needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
						else
							needs_revive = u_data.unit:character_damage():need_revive()
						end

						if needs_revive then
							if managers.player:has_enabled_cooldown_upgrade("cooldown", "long_dis_revive") then
								added = true

								self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, true, 5000, my_head_pos, cam_fwd)
							end
						end
					end
				end

				if not added and not u_data.is_deployable and not u_data.unit:movement():downed() and not u_data.unit:base().is_local_player and not u_data.unit:anim_data().long_dis_interact_disabled then
					if secondary then
						if not u_data.unit:base().is_husk_player and not u_data.unit:movement()._should_stay then
							self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, false, 0.01, my_head_pos, cam_fwd)
						end
					else
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, true, 0.01, my_head_pos, cam_fwd)
					end
				end
			end
		end
	end

	if intimidate_enemies and intimidate_teammates then
		local enemies = managers.enemy:all_enemies()

		for u_key, u_data in pairs(enemies) do
			if u_data.unit:movement():team() and u_data.unit:movement():team().id == "criminal1" and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort

				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001

					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
				end
			end
		end
	end

	if intimidate_enemies then
		if managers.groupai:state():whisper_mode() then
			for _, unit in ipairs(SecurityCamera.cameras) do
				if alive(unit) and unit:enabled() and not unit:base():destroyed() and (unit:interaction() and unit:interaction():active() and not unit:interaction():disabled() or unit:base().is_friendly) then --apparently friendly means drones, I don't even (the one in Sosa's mansion won't be marked as it's not enabled)
					local dist = 2000
					local prio = 0.001

					self:_add_unit_to_char_table(char_table, unit, unit_type_camera, dist, false, false, prio, my_head_pos, cam_fwd, {
						unit
					})
				end
			end
		end

		local turret_units = managers.groupai:state():turrets()

		if turret_units then
			for _, unit in pairs(turret_units) do
				if alive(unit) and unit:movement():team().foes[self._ext_movement:team().id] then
					self:_add_unit_to_char_table(char_table, unit, unit_type_turret, 2000, false, false, 0.01, my_head_pos, cam_fwd, {
						unit
					})
				end
			end
		end
	end

	local prime_target = self:_get_interaction_target(char_table, my_head_pos, cam_fwd)

	return self:_get_intimidation_action(prime_target, char_table, intimidation_amount, primary_only, detect_only, secondary)
end
