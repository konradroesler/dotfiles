{ inputs, config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  # Used with hyprland flake (doesnt work though)
  # programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  # programs.hyprland.portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
}
