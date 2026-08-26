{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = ["git"];
    theme = "robbyrussell";
  };
}
