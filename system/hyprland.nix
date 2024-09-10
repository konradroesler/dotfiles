{ inputs, pkgs, ... }:

{
  programs.hyperland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = with pkgs; xdg-dekstop-portal-hyprland;
  };
}
