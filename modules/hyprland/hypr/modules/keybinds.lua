local mainMod = "SUPER"
------------------------------------------------------------
-- Keybindings
------------------------------------------------------------

hl.bind(
	mainMod .. " + RETURN",
	hl.dsp.exec_cmd("foot")
)
hl.bind(
	mainMod .. " + B",
	hl.dsp.exec_cmd("firefox-beta")
)
hl.bind(
	mainMod .. " + E",
	hl.dsp.exec_cmd("thunar")
)
hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("rofi -show drun || pkill rofi")
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
	hl.dsp.window.focus({direction = "left"})
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
