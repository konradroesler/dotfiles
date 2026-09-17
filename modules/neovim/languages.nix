{ pkgs, ... }:
{
  lua = {
    treesitter = "lua";
    lsp = pkgs.lua-language-server;
    formatter = pkgs.stylua;
  };
  python = {
    treesitter = "python";
    lsp = pkgs.pyright;
    formatter = pkgs.ruff;
    linter = pkgs.ruff;
  };
  bash = {
    treesitter = "bash";
    lsp = pkgs.bash-language-server;
  };
  nix = {
    treesitter = "nix";
    lsp = pkgs.nil;
    formatter = pkgs.alejandra;
  };
  markdown = {
    treesitter = "markdown";
  };
}
