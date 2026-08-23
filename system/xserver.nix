{
  pkgs,
  username,
  ...
}: {
  # Essential for wayland/hyprland
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "altgr-intl";
      # displayManager.gdm.wayland = true;
    };
    displayManager.gdm.enable = true;
    displayManager.autoLogin = {
      enable = true;
      user = username;
    };
    libinput.enable = true;
  };

  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome.enable = true;
}
