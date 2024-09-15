{
  lib,
  username,
  homeDirectory,
  ...
}: {
  imports = lib.forEach [
    /fastfetch.nix
    /firefox
    /foot.nix
    /git.nix
    /home.nix
    /hyprland
    /kitty.nix
    /neovim
    /rofi
    /starship.nix
    /swaync
    /waybar
    /zsh.nix
  ] (x: ./. + "/../../modules" + x);

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
