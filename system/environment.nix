{
  inputs,
  system,
	config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      git
      vim
			vlc
      tree
      hyprpicker
      bibata-cursors
      # Copy paste in neovim
      wl-clipboard
      inputs.alejandra.defaultPackage.${system}
			unzip
    ])
    ++ (with pkgs-unstable; [
      hyprshot
    ]);

	# creates a file in /etc/ with all installed packages
	environment.etc."current-system-packages".text =
  let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;
}
