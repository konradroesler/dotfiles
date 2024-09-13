{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		git
		vim
		tree
	  # Copy paste in neovim
		wl-clipboard
	];
}
