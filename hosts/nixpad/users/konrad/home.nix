{ lib, username, homeDirectory, ... }:

{
  imports = [
    ./../../../../modules/alacritty.nix
    ./../../../../modules/foot.nix
    ./../../../../modules/git.nix
    ./../../../../modules/starship.nix
    ./../../../../modules/zsh.nix
    ./../../../../modules/firefox.nix
    ./../../../../modules/tmux.nix
  ];

  home.username = username;
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "24.05";

	# Let home manager install and manage itself
	programs.home-manager.enable = true;

  # Set default applications
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };
}
