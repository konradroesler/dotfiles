{pkgs, ...}: {
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

  html = {
    treesitter = "html";
    lsp = pkgs.vscode-langservers-extracted;
    formatter = pkgs.prettier;
    linter = pkgs.htmlhint;
  };

  css = {
    treesitter = "css";
    lsp = pkgs.vscode-langservers-extracted;
    formatter = pkgs.prettier;
    linter = pkgs.stylelint;
  };

  javascript = {
    treesitter = "javascript";
    lsp = pkgs.typescript-language-server;
    formatter = pkgs.prettier;
    linter = pkgs.eslint;
  };
}
