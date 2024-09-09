{ lib, config, pkgs, ... }:

{
  imports = [
    ./../../modules/alacritty.nix
    ./../../modules/firefox.nix
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

	programs.git = {
		enable = true;
		userName = "konradroesler";
		userEmail = "konrad.rosler@gmail.com";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	programs.bash.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

	home.stateVersion = "24.05";

	# Let home manager install and manage itself
	programs.home-manager.enable = true;
}
