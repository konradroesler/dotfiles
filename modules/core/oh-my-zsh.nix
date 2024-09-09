{ lib, config, pkgs, ... }:

{
  programs.zsh.oh-my-zsh = {
    enable = true;
    # TODO install "thefuck"
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
}
