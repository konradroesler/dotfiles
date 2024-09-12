{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
	  # Copy paste in neovim
		wl-clipboard
	];
}
