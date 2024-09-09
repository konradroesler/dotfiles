{ lib, config, pkgs, ... }:

{
  imports = [
    ./../../modules/alacritty.nix
    ./../../modules/git.nix
    ./../../modules/starship.nix
    ./../../modules/zsh.nix
    ./../../modules/firefox.nix
    ./../../modules/tmux.nix
  ];

	home.username = "konrad";
	# force value, not doing so causes a conflict with `nixos/commons.nix`
	home.homeDirectory = lib.mkForce "/home/konrad/";

	# Packages that should be installed to the user profile
	home.packages = with pkgs; [
		neofetch
	];

  # Set default applications
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

	programs.bash.enable = true;

	home.stateVersion = "24.05";

	# Let home manager install and manage itself
	programs.home-manager.enable = true;
}
