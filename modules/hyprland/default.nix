{inputs, ...}: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./settings.nix
    # ./variables.nix
    # inputs.hyprland.homeManagerModules.default
  ];
}
