{
  pkgs,
  languages,
  ...
}: let
  vals = builtins.attrValues languages;
  pick = key: builtins.filter (x: x != null) (map (l: l.${key} or null) vals);
in {
  lspServers = pick "lsp";
  formatters = pick "formatter";
  linters = pick "linter";
  generalTools = with pkgs; [ripgrep fd gcc];
}
