
{ username, ... }:

{

  # Essential for wayland/hyprland
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  # Brightness control (wayland)
  services.illum.enable = true;

  # Ssh
  services.openssh.enable = true;
}
