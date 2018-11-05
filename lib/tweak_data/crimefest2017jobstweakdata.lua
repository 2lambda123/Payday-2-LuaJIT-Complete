Crimefest2017JobsTweakData = Crimefest2017JobsTweakData or class()

function Crimefest2017JobsTweakData:init(tweak_data)
	self.challenges = {}

	self:_init_challenges(tweak_data)
end

function Crimefest2017JobsTweakData:_init_challenges(tweak_data)
	table.insert(self.challenges, {
		reward_id = "menu_cf2017_job_1_reward",
		name_id = "menu_cf2017_job_1",
		id = "cf2017_1",
		desc_id = "menu_cf2017_job_1_desc",
		show_progress = false,
		objectives = {tweak_data.safehouse:_progress("cf2017_1", 1, {
			name_id = "menu_cf2017_job_1_obj",
			desc_id = "menu_cf2017_job_1_obj_desc"
		})},
		rewards = {{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_p90_body_boxy",
			amount = 1
		}}
	})
end
