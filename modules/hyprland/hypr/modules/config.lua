------------------------------------------------------------
-- General configuration
------------------------------------------------------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "altgr-intl",
		numlock_by_default = true,
		repeat_rate = 25,
		repeat_delay = 300,
		follow_mouse = 1,
		float_switch_override_focus = 0,
		mouse_refocus = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},

	general = {
		layout = "dwindle",
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		["col.active_border"] = "rgb(549399)",
		["col.inactive_border"] = "0x00000000",
	},

	misc = {
		disable_autoreload = true,
		disable_hyprland_logo = true,
		always_follow_on_dnd = true,
		layers_hog_keyboard_focus = true,
		animate_manual_resizes = true,
		enable_swallow = true,
		focus_on_activate = true,
		middle_click_paste = false,
	},

	dwindle = {
		force_split = 0,
		special_scale_factor = 1.0,
		split_width_multiplier = 1.0,
		use_active_for_splits = true,
		preserve_split = true,
	},

	master = {
		new_status = "master",
		special_scale_factor = 1,
	},

	decoration = {
		rounding = 0,
		active_opacity = 1,
		inactive_opacity = 1,
		fullscreen_opacity = 1.0,

		blur = {
			enabled = true,
			size = 1,
			passes = 1,
			brightness = 1,
			contrast = 1.400,
			ignore_opacity = true,
			noise = 0,
			new_optimizations = true,
			xray = true,
		},
	},

	animations = {
		enabled = false,
	},

	xwayland = {
		force_zero_scaling = false,
	},
})
