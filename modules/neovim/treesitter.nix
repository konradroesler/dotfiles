{
  pkgs,
  languages,
  ...
}: let
  grammarNames =
    builtins.filter (n: n != null)
    (builtins.map (l: l.treesitter or null) (builtins.attrValues languages));

  withGrammars =
    pkgs.vimPlugins.nvim-treesitter.withPlugins
    (p: map (name: p.${name}) grammarNames);

  parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = withGrammars.dependencies;
  };
in {
  inherit withGrammars parsers;
}
