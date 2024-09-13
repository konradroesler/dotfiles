# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, config, pkgs, username, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
		] ++ lib.forEach [
      /boot.nix
			/environment.nix
      /fonts.nix
      /hyprland.nix
      # /locale.nix
			/misc.nix
			/network.nix
			/nh.nix
      /nix.nix
      /pipewire.nix
      /services.nix
			/thunar.nix
      # /virtualisation.nix
    ] (x: ./. + "../../../system" + x);
  

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    initialPassword = "123";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.zsh.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Should not be changed without need
  system.stateVersion = "24.05";
}
