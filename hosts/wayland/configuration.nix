# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  lib,
  config,
  pkgs,
  username,
  hostname,
  ...
}: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ]
    ++ lib.forEach [
      /boot.nix
      /environment.nix
      /fonts.nix
      /misc.nix
      /network.nix
      /nh.nix
      /nix.nix
      /pipewire.nix
      /programs.nix
      /security.nix
      /services.nix
      /system.nix
      # /virtualisation.nix
      /wayland.nix
      /xserver.nix
    ] (x: ./. + "../../../system" + x);

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    initialPassword = "123";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
  };
}
