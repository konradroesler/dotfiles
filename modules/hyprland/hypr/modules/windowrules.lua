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
