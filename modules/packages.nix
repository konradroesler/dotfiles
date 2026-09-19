{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs;
    [
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
    ]
    ++ [
      pkgs-unstable.opencode
    ];

  nixpkgs.config.allowUnfree = true;
}
