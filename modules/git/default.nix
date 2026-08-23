{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
		settings = {
			user = {
				name = "konradroesler";
				email = "konrad.rosler@gmail.com";
			};
			init.defaultBranch = "main";
		};
  };
}
