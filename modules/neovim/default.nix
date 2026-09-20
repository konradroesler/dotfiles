{
  pkgs,
  pkgs-unstable,
  ...
}: let
  languages = import ./languages.nix {inherit pkgs;};
  packages = import ./packages.nix {inherit pkgs languages;};
in {
  home.packages =
    packages.lspServers
    ++ packages.formatters
    ++ packages.linters
    ++ packages.generalTools
    ++ [
      pkgs.tree-sitter
      pkgs.gcc
    ];

  programs.neovim = {
    enable = true;
    coc.enable = false;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
  };

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };

  home.file."./.config/nvim/lua/konrad/init.lua".text = ''
    require("konrad.set")
    require("konrad.remap")
  '';
}
