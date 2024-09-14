{
  inputs,
  system,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    vim
    tree
    # Copy paste in neovim
    wl-clipboard
    inputs.alejandra.defaultPackage.${system}
  ];
}
