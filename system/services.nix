
{ pkgs, username, ... }:

{
  # Brightness control (wayland)
  services.illum.enable = true;
  services.openssh.enable = true;
}
