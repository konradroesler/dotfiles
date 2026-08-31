{pkgs, ...}: {

	imports = [
		themes/catppuccin-mocha.nix
	];

  home.packages = with pkgs; [rofi];
}
