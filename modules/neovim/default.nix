{
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: let
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.bash
    p.markdown
    p.lua
    p.nix
  ]);

  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in {
  home.packages = with pkgs; [
    ripgrep
    fd
    # needed for treesitter
    clang-tools
    clang
    # lua-lanuage-server
  ];

  programs.neovim = {
    enable = true;
    # Use unstable so for 0.10
    package = pkgs-unstable.neovim-unwrapped;
    coc.enable = false;
    withNodeJs = true;

    plugins = [
      treesitterWithGrammars
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };

  home.file."./.config/nvim/lua/konrad/init.lua".text = ''
    require("konrad.set")
    require("konrad.remap")
    vim.opt.runtimepath:append("${treesitter-parsers}")
  '';

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitterWithGrammars;
  };
}
