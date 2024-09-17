{
  description = "Konrad's flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland (this flake seems to have some problem)
    /*
    hyprland = {
    	type = "git";
        url = "https://github.com/hyprwm/Hyprland";
        submodules = true;
      };
    */
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    inherit (nixpkgs.lib) nixosSystem;

    createNixosConfiguration = {
      system,
      username,
      homeDirectory,
      hostname ? null,
      modules ? [],
      includeHomeManager ? true,
    }: let
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
      nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs pkgs-unstable system username homeDirectory hostname;
        };
        modules =
          [
            ./hosts/${hostname}/configuration.nix
            {networking.hostName = hostname;}
          ]
          ++ (
            if includeHomeManager
            then [
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = false;
                  extraSpecialArgs = {
                    inherit inputs pkgs-unstable;
                  };
                  users."${username}" = import ./hosts/${hostname}/home.nix {
                    inputs = inputs;
                    lib = nixpkgs.lib; # not sure if this is elegant
                    inherit username homeDirectory;
                  };
                  backupFileExtension = "backup";
                };
              }
            ]
            else []
          )
          ++ modules;
      };
  in {
    nixosConfigurations = {
      nixpad = createNixosConfiguration {
        system = "x86_64-linux";
        username = "konrad";
        homeDirectory = "/home/konrad/";
        hostname = "nixpad";
      };
      wayland = createNixosConfiguration {
        system = "x86_64-linux";
        username = "konrad";
        homeDirectory = "/home/konrad/";
        hostname = "wayland";
      };
    };
  };
}
