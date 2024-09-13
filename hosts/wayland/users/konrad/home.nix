{ lib, username, homeDirectory, ... }:

{
  imports = lib.forEach [
    /foot.nix
    /git.nix
    /starship.nix
    /zsh.nix
    /firefox.nix
    /hyprland.nix
    /kitty.nix
    /neovim/default.nix
		/waybar
		/rofi
  ] (x: ./. + "/../../../../modules" + x);

  home.username = username;
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "24.05";

  # Let home manager install and manage itself
  programs.home-manager.enable = true;

  # Set default applications
  # home.sessionVariables = {
  #   BROWSER = "firefox";
  #   EDITOR = "nvim";
  #   TERMINAL = "foot";
  # };
}
