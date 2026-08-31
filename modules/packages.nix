{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    cliphist # clip board manager
    poweralertd # power notifications
    p7zip
		thunderbird
		vscode
		anki
		texlive.combined.scheme-full
		# wallpaper daemon
		wpaperd
		librsvg
  ];

	nixpkgs.config.allowUnfree = true;
}
