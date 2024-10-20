{
  lib,
  username,
  homeDirectory,
  ...
}: {
  imports = lib.forEach [
    /fastfetch
		/firefox
    /foot
    /openfortivpn
    /git
    /home.nix
    /hyprland
		/languages
    /neovim
		/packages.nix
    /rofi
		/spicetify
    /starship
    /swaync
    /tmux
    /waybar
		/zathura
    /zsh
  ] (x: ./. + "/../../modules" + x);

  home.username = username;
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "24.05";

  # Let home manager install and manage itself
  programs.home-manager.enable = true;

  # Set default applications
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    TERMINAL = "foot";
  };
}
