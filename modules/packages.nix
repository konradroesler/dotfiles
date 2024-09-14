{ pkgs, ... }:

{
	home.packages = with pkgs; [
		wl-clipboard
		cliphist # clip board manager
		poweralertd # power notifications
	];
}
