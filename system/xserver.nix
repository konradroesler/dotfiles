{ pkgs, username, ... }:

{
  # Essential for wayland/hyprland
  services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.gdm.wayland = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  # Enable the GNOME Desktop Environment.
	# services.xserver.desktopManager.gnome.enable = true;
}
