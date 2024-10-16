{pkgs, ...}: {

	imports = [
		# themes/gruvbox.nix
		themes/catppuccin-mocha.nix
	];

  home.packages = with pkgs; [rofi-wayland];
}
