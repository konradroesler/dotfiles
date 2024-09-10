_:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Automate garbace collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
