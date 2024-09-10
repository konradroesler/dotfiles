{ inputs, pkgs, ... }:

{
  programs.hyperland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-dekstop-portal-hyprland;
  };
}
