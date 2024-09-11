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
      # ./../../system/pipewire.nix
      # ./../../system/virtualisation.nix
      # ./../../system/hyprland.nix
      # ./../../system/services.nix
    ];
  
  # Brightness control
  services.illum.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.hyprland.enable = true;
  
  services.openssh.enable = true;

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
    neovim
    tree
    kitty
  ];
  programs.zsh.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Should not be changed without need
  system.stateVersion = "24.05";
}
