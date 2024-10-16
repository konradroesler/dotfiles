{
  lib,
  username,
  homeDirectory,
  ...
}: {
  imports = lib.forEach [
		/discord.nix
    /fastfetch.nix
    /firefox
    /foot.nix
    /openfortivpn
    /git.nix
    /home.nix
    /hyprland
    /kitty.nix
    /neovim
		/obs-studio.nix
		/packages.nix
    /rofi
    /starship.nix
    /swaync
		/thunderbird.nix
    /tmux.nix
		/transcribe.nix
    /waybar
		/yt-dlp.nix
		/zathura
    /zsh.nix
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
