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
