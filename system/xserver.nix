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
      videoDrivers = ["amdgpu"];
      displayManager.gdm.enable = true;
      # displayManager.gdm.wayland = true;
    };
    displayManager.autoLogin = {
      enable = true;
      user = username;
    };
    libinput.enable = true;
  };

  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome.enable = true;
}
