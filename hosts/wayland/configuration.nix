# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, username, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../system/boot.nix
      # ./../../system/locale.nix
      ./../../system/nix.nix
      ./../../system/pipewire.nix
      # ./../../system/virtualisation.nix
      ./../../system/hyprland.nix
      ./../../system/services.nix
      ./../../system/fonts.nix
			./../../system/environment.nix
    ];
  
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    initialPassword = "123";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git
		vim
    tree
  ];
  programs.zsh.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Should not be changed without need
  system.stateVersion = "24.05";
}
