{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # General purpose media lib
    mpv
    # Snapshot editing
    swappy
    # PDF viewer
    sioyek
    # Music player
    mpd
    # Image viewer
    feh
  ];
}
