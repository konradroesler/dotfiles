{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "konradroesler";
    userEmail = "konrad.rosler@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
