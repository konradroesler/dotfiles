------------------------------------------------------------
-- Window rules
------------------------------------------------------------

-- mpv
hl.window_rule({
	match = { title = "^mpv" },
	float = true,
	center = true,
	size = { 1200, 725 },
})

hl.window_rule({
	match = { title = "^rofi" },
	pin = true,
})

hl.window_rule({
	match = { title = "^udiskie" },
	float = true,
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

-- File upload
hl.window_rule({
	match = { title = "^File Upload$" },
	size = { 850, 500 },
})

hl.window_rule({
	match = { class = "^(file_progress|confirm|dialog|download|notification|error|confirmreset)$" },
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
	no_anim = true,
	no_initial_focus = true,
	max_size = { 1, 1 },
	no_blur = true,
})
