{ lib, config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
  ];

	home.username = "konrad";
	# force value, not doing so causes a conflict with `nixos/commons.nix`
	home.homeDirectory = lib.mkForce "/home/konrad/";

	# Packages that should be installed to the user profile
	home.packages = with pkgs; [
		neofetch
	];

	programs.git = {
		enable = true;
		userName = "konradroesler";
		userEmail = "konrad.rosler@gmail.com";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	programs.bash.enable = true;

	home.stateVersion = "24.05";

	# Let home manager install and manage itself
	programs.home-manager.enable = true;
}
