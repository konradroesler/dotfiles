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
  ];

	nixpkgs.config.allowUnfree = true;
}
