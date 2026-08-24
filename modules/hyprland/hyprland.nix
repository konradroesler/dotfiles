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
    "hypr/hyprland.lua".source = ./config/hyprland.lua;
		# For future files
		# "hypr/keybinds.lua".source = ./config/keybinds.lua;
		# "hypr/monitors.lua".source = ./config/monitors.lua;
		# "hypr/appearance.lua".source = ./config/appearance.lua;
		# "hypr/rules.lua".source = ./config/rules.lua;
  };
  /*
  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 14;
    };
  };
  */
}
