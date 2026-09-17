{
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: let
  languages = import ./languages.nix {inherit pkgs;};
  treesitter = import ./treesitter.nix {inherit pkgs languages;};
  packages = import ./packages.nix {inherit pkgs languages;};
in {
  home.packages =
    packages.lspServers
    ++ packages.formatters
    ++ packages.linters
    ++ packages.generalTools;

  programs.neovim = {
    enable = true;
    # Use unstable so for 0.10
    package = pkgs-unstable.neovim-unwrapped;
    coc.enable = false;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    plugins = [
      treesitter.withGrammars
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };

  home.file."./.config/nvim/lua/konrad/init.lua".text = ''
    require("konrad.set")
    require("konrad.remap")
    vim.opt.runtimepath:append("${treesitter.parsers}")
  '';

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitter.withGrammars;
  };
}
