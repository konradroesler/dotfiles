{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    cliphist # clip board manager
    poweralertd # power notifications
    p7zip
		inkscape-with-extensions
		discord
		thunderbird
		obs-studio
		transcribe
		yt-dlp
		vscode
		anki
		texlive.combined.scheme-full
		swi-prolog
		# wallpaper daemon
		wpaperd
		librsvg
		# anki to wallpaper project
		imagemagick
		libpng
		ghostscript_headless
  ];

	nixpkgs.config.allowUnfree = true;
}
