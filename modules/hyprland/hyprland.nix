{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
		configType = "lua";
		# Unstable feature only as of 26.05
		# extraLuaFiles = {
		#  "config" = {
		#    content = ./config/hyprland.lua;
		#    autoLoad = true;
		#  };
		#};
  };

	xdg.configFile = {
    "hypr/hyprland.lua".source = ./hypr/hyprland.lua;
    "hypr/modules/autostart.lua".source = ./hypr/modules/autostart.lua;
    "hypr/modules/config.lua".source = ./hypr/modules/config.lua;
    "hypr/modules/keybinds.lua".source = ./hypr/modules/keybinds.lua;
    "hypr/modules/monitors.lua".source = ./hypr/modules/monitors.lua;
    "hypr/modules/windowrules.lua".source = ./hypr/modules/windowrules.lua;
    "hypr/modules/workspaces.lua".source = ./hypr/modules/workspaces.lua;
  };
}
