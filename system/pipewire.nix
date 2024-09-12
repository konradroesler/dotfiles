{ config, pkgs, ... }:

{
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudio ];
}
