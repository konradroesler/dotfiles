{
  inputs,
  system,
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      git
      vim
      tree
      hyprpicker
      bibata-cursors
      # Copy paste in neovim
      wl-clipboard
      inputs.alejandra.defaultPackage.${system}
			unzip
    ])
    ++ (with pkgs-unstable; [
      hyprshot
    ]);
}
