
{ pkgs, username, ... }:

{
	services.dbus.enable = true;
  # Brightness control (wayland)
  services.illum.enable = true;
  services.openssh.enable = true;
}
