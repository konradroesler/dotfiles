# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, username, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../system/boot.nix
      ./../../system/locale.nix
      ./../../system/nix.nix
      ./../../system/pipewire.nix
      ./../../system/virtualisation.nix
      ./../../system/wayland.nix
      # ./../../system/hyprland.nix
    ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.zsh.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    initialPassword = "123";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    neovim
    tree
  ];

  # Enable sway
  programs.sway.enable = true;

  # Should not be changed without need
  system.stateVersion = "24.05";
}
