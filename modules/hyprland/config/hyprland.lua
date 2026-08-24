-- ~/.config/hypr/hyprland.lua

local mainMod = "SUPER"

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


------------------------------------------------------------
-- Monitors
------------------------------------------------------------

-- Equivalent to:
-- monitor = ",preffered,auto,auto"
--
-- Note: the original has "preffered" (misspelled).
-- The Lua API uses "preferred".
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200",
	position = "auto",
	scale = 1.5,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080",
	position = "auto",
	scale = 1,
})

-- For a vertical monitor:
-- hl.monitor({
--     output = "HDMI-A-1",
--     transform = 3,
-- })


------------------------------------------------------------
-- Workspaces
------------------------------------------------------------

hl.workspace_rule({
	workspace = "1",
	monitor = "DP-1",
})

hl.workspace_rule({
	workspace = "2",
	monitor = "DP-1",
})

hl.workspace_rule({
	workspace = "3",
	monitor = "DP-1",
})

hl.workspace_rule({
	workspace = "4",
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = "5",
	monitor = "HDMI-A-1",
})


------------------------------------------------------------
-- Animations
------------------------------------------------------------

-- NONE

------------------------------------------------------------
-- Autostart
------------------------------------------------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment &")
	hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &")

	hl.exec_cmd("wl-clip-persist --clipboard both")
	hl.exec_cmd("wpaperd -d")

	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 18 &")
	hl.exec_cmd("poweralertd &")
	hl.exec_cmd("waybar &")
	hl.exec_cmd("swaync &")
	hl.exec_cmd("wl-paste --watch cliphist store &")
	hl.exec_cmd("hyprlock")

	-- App autostart
	hl.exec_cmd("[workspace 1 silent] foot")
	hl.exec_cmd("[workspace 2 silent] firefox-beta")
end)


------------------------------------------------------------
-- Keybindings
------------------------------------------------------------

-- Switch current course
hl.bind(
	"ALT + S",
	hl.dsp.exec_cmd("python ~/repos/lecture-notes/scripts/rofi-courses.py")
)

-- Show keybinds
hl.bind(
	mainMod .. " + F1",
	hl.dsp.exec_cmd("show-keybinds")
)


-- Applications
hl.bind(
	mainMod .. " + RETURN",
	hl.dsp.exec_cmd("foot")
)

hl.bind(
	"ALT + RETURN",
	hl.dsp.exec_cmd("foot --title float_foot")
)

hl.bind(
	mainMod .. " + B",
	hl.dsp.exec_cmd("firefox")
)

hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd("thunar")
)

hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("rofi -show drun || pkill rofi")
)

hl.bind(
	mainMod .. " + SHIFT + D",
	hl.dsp.exec_cmd(
		"hyprctl dispatch exec '[workspace 4 silent] discord --enable-features=UseOzonePlatform --ozone-platform=wayland'"
	)
)

hl.bind(
	mainMod .. " + SHIFT + M",
	hl.dsp.exec_cmd(
		"hyprctl dispatch exec '[workspace 4 silent] spotify --enable-features=UseOzonePlatform --ozone-platform=wayland'"
	)
)

hl.bind(
	mainMod .. " + SHIFT + C",
	hl.dsp.exec_cmd(
		"hyprctl dispatch exec '[workspace 3 silent] code --enable-features=UseOzonePlatform --ozone-platform=wayland'"
	)
)


-- Window management
hl.bind(
	mainMod .. " + Q",
	hl.dsp.window.close()
)

hl.bind(
	mainMod .. " + F",
	hl.dsp.window.fullscreen()
)

hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.window.float()
)

hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.window.center()
)

hl.bind(
	mainMod .. " + P",
	hl.dsp.window.pseudo()
)

hl.bind(
	mainMod .. " + J",
	hl.dsp.layout("togglesplit")
)


-- Misc scripts
hl.bind(
	mainMod .. " + ESCAPE",
	hl.dsp.exec_cmd("hyprlock")
)

hl.bind(
	mainMod .. " + SHIFT + ESCAPE",
	hl.dsp.exec_cmd("power-menu")
)

hl.bind(
	mainMod .. " + T",
	hl.dsp.exec_cmd("toggle_oppacity")
)

hl.bind(
	mainMod .. " + SHIFT + B",
	hl.dsp.exec_cmd("toggle_waybar")
)

hl.bind(
	mainMod .. " + N",
	hl.dsp.exec_cmd("swaync-client -t -sw")
)

hl.bind(
	mainMod .. " + SHIFT + W",
	hl.dsp.exec_cmd("vm-start")
)


------------------------------------------------------------
-- Screenshots
------------------------------------------------------------

hl.bind(
	"Print",
	hl.dsp.exec_cmd("hyprshot -m region --clipboard-only")
)

hl.bind(
	mainMod .. " + Print",
	hl.dsp.exec_cmd("hyprshot -m window --clipboard-only")
)

hl.bind(
	mainMod .. " + SHIFT + Print",
	hl.dsp.exec_cmd("hyprshot -m active --mode output")
)


------------------------------------------------------------
-- Focus
------------------------------------------------------------

--[[
hl.bind(
	mainMod .. " + LEFT",
	hl.dsp.window.focus("l")
)

hl.bind(
	mainMod .. " + RIGHT",
	hl.dsp.window.focus("r")
)

hl.bind(
	mainMod .. " + UP",
	hl.dsp.window.focus("u")
)

hl.bind(
	mainMod .. " + DOWN",
	hl.dsp.window.focus("d")
)
]]


------------------------------------------------------------
-- Workspace switching
------------------------------------------------------------

local workspaces = {
	{ key = "1", workspace = "1" },
	{ key = "2", workspace = "2" },
	{ key = "3", workspace = "3" },
	{ key = "4", workspace = "4" },
	{ key = "5", workspace = "5" },
	{ key = "6", workspace = "6" },
	{ key = "7", workspace = "7" },
	{ key = "8", workspace = "8" },
	{ key = "9", workspace = "9" },
	{ key = "0", workspace = "10" },
}

for _, ws in ipairs(workspaces) do
	hl.bind(
		mainMod .. " + " .. ws.key,
		hl.dsp.focus({ workspace = ws.workspace })
	)

	hl.bind(
		mainMod .. " + SHIFT + " .. ws.key,
		hl.dsp.window.move({
			workspace = ws.workspace,
			follow = false,
		})
	)
end


------------------------------------------------------------
-- Move window to empty workspace
------------------------------------------------------------

hl.bind(
	mainMod .. " + CTRL + C",
	hl.dsp.window.move({
		workspace = "empty",
	})
)


------------------------------------------------------------
-- Window movement
------------------------------------------------------------

hl.bind(
	mainMod .. " + SHIFT + LEFT",
	hl.dsp.window.move({ direction = "left" })
)

hl.bind(
	mainMod .. " + SHIFT + RIGHT",
	hl.dsp.window.move({ direction = "right" })
)

hl.bind(
	mainMod .. " + SHIFT + UP",
	hl.dsp.window.move({ direction = "up" })
)

hl.bind(
	mainMod .. " + SHIFT + DOWN",
	hl.dsp.window.move({ direction = "down" })
)


------------------------------------------------------------
-- Window resizing
------------------------------------------------------------

hl.bind(
	mainMod .. " + CTRL + LEFT",
	hl.dsp.window.resize({ x = -80, y = 0, relative = true })
)

hl.bind(
	mainMod .. " + CTRL + RIGHT",
	hl.dsp.window.resize({ x = 80, y = 0, relative = true })
)

hl.bind(
	mainMod .. " + CTRL + UP",
	hl.dsp.window.resize({ x = 0, y = -80, relative = true })
)

hl.bind(
	mainMod .. " + CTRL + DOWN",
	hl.dsp.window.resize({ x = 0, y = 80, relative = true })
)


------------------------------------------------------------
-- Move floating window
------------------------------------------------------------

hl.bind(
	mainMod .. " + ALT + LEFT",
	hl.dsp.window.move({ x = -80, y = 0, relative = true })
)

hl.bind(
	mainMod .. " + ALT + RIGHT",
	hl.dsp.window.move({ x = 80, y = 0, relative = true })
)

hl.bind(
	mainMod .. " + ALT + UP",
	hl.dsp.window.move({ x = 0, y = -80, relative = true })
)

hl.bind(
	mainMod .. " + ALT + DOWN",
	hl.dsp.window.move({ x = 0, y = 80, relative = true })
)


------------------------------------------------------------
-- Media
------------------------------------------------------------

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("pamixer -t")
)

hl.bind(
	"XF86AudioPlay",
	hl.dsp.exec_cmd("playerctl play-pause")
)

hl.bind(
	"XF86AudioNext",
	hl.dsp.exec_cmd("playerctl next")
)

hl.bind(
	"XF86AudioPrev",
	hl.dsp.exec_cmd("playerctl previous")
)

hl.bind(
	"XF86AudioStop",
	hl.dsp.exec_cmd("playerctl stop")
)


------------------------------------------------------------
-- Mouse wheel workspace switching
------------------------------------------------------------

--[[
hl.bind(
	mainMod .. " + mouse_down",
	hl.dsp.workspace("e-1")
)

hl.bind(
	mainMod .. " + mouse_up",
	hl.dsp.workspace("e+1")
)
]]


------------------------------------------------------------
-- Clipboard manager
------------------------------------------------------------

hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu -theme-str 'window {width: 50%;}' | cliphist decode | wl-copy"
	)
)


------------------------------------------------------------
-- Volume binds
------------------------------------------------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true }
)


------------------------------------------------------------
-- Mouse bindings
------------------------------------------------------------

hl.bind(
	mainMod .. " + mouse:272",
	hl.dsp.window.drag(),
	{ mouse = true }
)

hl.bind(
	mainMod .. " + mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true }
)


------------------------------------------------------------
-- Window rules
------------------------------------------------------------

-- qView
hl.window_rule({
	match = { title = "^qView" },
	float = true,
})

hl.window_rule({
	match = { title = "^qView" },
	center = true,
})

hl.window_rule({
	match = { title = "^qView" },
	size = { 1200, 725 },
})


-- imv
hl.window_rule({
	match = { title = "^imv" },
	float = true,
})

hl.window_rule({
	match = { title = "^imv" },
	center = true,
})

hl.window_rule({
	match = { title = "^imv" },
	size = { 1200, 725 },
})


-- mpv
hl.window_rule({
	match = { title = "^mpv" },
	float = true,
})

hl.window_rule({
	match = { title = "^mpv" },
	center = true,
})

hl.window_rule({
	match = { title = "^mpv" },
	size = { 1200, 725 },
})


-- Aseprite
hl.window_rule({
	match = { title = "^Aseprite" },
	tile = true,
})


-- Floating terminal
hl.window_rule({
	match = { title = "^float_kitty$" },
	float = true,
})

hl.window_rule({
	match = { title = "^float_kitty$" },
	center = true,
})

hl.window_rule({
	match = { title = "^float_kitty$" },
	size = { 950, 600 },
})


-- Other applications
hl.window_rule({
	match = { title = "^audacious" },
	float = true,
})

hl.window_rule({
	match = { title = "^rofi" },
	pin = true,
})

hl.window_rule({
	match = { title = "^neovide" },
	tile = true,
})

hl.window_rule({
	match = { title = "^mpv" },
	idle_inhibit = "focus",
})

hl.window_rule({
	match = { title = "^udiskie" },
	float = true,
})

hl.window_rule({
	match = { title = "^Transmission$" },
	float = true,
})

hl.window_rule({
	match = { title = "^Volume Control$" },
	float = true,
})

hl.window_rule({
	match = { title = "^Firefox — Sharing Indicator$" },
	float = true,
})

hl.window_rule({
	match = { title = "^Firefox — Sharing Indicator$" },
	move = { 0, 0 },
})

hl.window_rule({
	match = { title = "^Volume Control$" },
	size = { 700, 450 },
})

hl.window_rule({
	match = { title = "^Volume Control$" },
	move = { "40", "55%" },
})


------------------------------------------------------------
-- Former windowrulev2 rules
------------------------------------------------------------

-- Picture-in-Picture
hl.window_rule({
	match = { title = "^Picture-in-Picture$" },
	float = true,
})

hl.window_rule({
	match = { title = "^Picture-in-Picture$" },
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	match = { title = "^Picture-in-Picture$" },
	pin = true,
})


-- imv / mpv opacity
hl.window_rule({
	match = { title = ".*imv.*" },
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	match = { title = ".*mpv.*" },
	opacity = "1.0 override 1.0 override",
})


-- foot
hl.window_rule({
	match = { class = "foot" },
	opacity = "0.95 override 0.95 override",
})


-- Workspace assignments
hl.window_rule({
	match = { class = "^(discord)$" },
	workspace = "4",
})

hl.window_rule({
	match = { class = "^(Gimp-2.10)$" },
	workspace = "4",
})

hl.window_rule({
	match = { class = "^(Audacious)$" },
	workspace = "5",
})

hl.window_rule({
	match = { class = "^(Spotify)$" },
	workspace = "5",
})


-- Idle inhibit
hl.window_rule({
	match = { class = "^(mpv)$" },
	idle_inhibit = "focus",
})

hl.window_rule({
	match = { class = "^(firefox)$" },
	idle_inhibit = "fullscreen",
})


-- Zenity
hl.window_rule({
	match = { class = "^(zenity)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(zenity)$" },
	center = true,
})

hl.window_rule({
	match = { class = "^(zenity)$" },
	size = { 850, 500 },
})


-- FileRoller
hl.window_rule({
	match = { class = "^(org.gnome.FileRoller)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(org.gnome.FileRoller)$" },
	center = true,
})

hl.window_rule({
	match = { class = "^(org.gnome.FileRoller)$" },
	size = { 850, 500 },
})


-- File upload
hl.window_rule({
	match = { title = "^File Upload$" },
	size = { 850, 500 },
})

hl.window_rule({
	match = { class = "^(pavucontrol)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(SoundWireServer)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(.sameboy-wrapped)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(file_progress)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(confirm)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(dialog)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(download)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(notification)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(error)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(confirmreset)$" },
	float = true,
})

hl.window_rule({
	match = { title = "^Open File$" },
	float = true,
})

hl.window_rule({
	match = { title = "^File Upload$" },
	float = true,
})

hl.window_rule({
	match = { title = "^branchdialog$" },
	float = true,
})

hl.window_rule({
	match = { title = "^Confirm to replace files$" },
	float = true,
})

hl.window_rule({
	match = { title = "^File Operation Progress$" },
	float = true,
})


------------------------------------------------------------
-- XWayland video bridge
------------------------------------------------------------

hl.window_rule({
	match = { class = "^(xwaylandvideobridge)$" },
	opacity = "0.0 override",
})

hl.window_rule({
	match = { class = "^(xwaylandvideobridge)$" },
	no_anim = true,
})

hl.window_rule({
	match = { class = "^(xwaylandvideobridge)$" },
	no_initial_focus = true,
})

hl.window_rule({
	match = { class = "^(xwaylandvideobridge)$" },
	max_size = { 1, 1 },
})

hl.window_rule({
	match = { class = "^(xwaylandvideobridge)$" },
	no_blur = true,
})
