{
	description = "Konrad's flake";

  inputs = { 
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let 
      inherit (nixpkgs.lib) nixosSystem;

      # Create NixOs configuration with specified hostname and username
      createNixosConfiguration = 
      {
        system,
        username,
        homeDirectory,
        hostname ? null,
        modules ? [ ],
        includeHomeManager ? true,
      }:
      nixosSystem {

        inherit system;
        specialArgs = {
          inherit inputs username homeDirectory hostname;
        };
        modules =
        [
          ./hosts/${hostname}/configuration.nix
          { networking.hostName = hostname; }
        ]
        ++ (
          if includeHomeManager then
            [
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = false;
                  extraSpecialArgs = {
                    inherit inputs;
                  };
                  users."${username}" = import ./hosts/${hostname}/users/${username}/home.nix {
                    inputs = inputs;
                    inherit username homeDirectory;
                  };
                  backupFileExtension = "backup";
                };
              }
            ]
          else
            [ ]
        )
        ++ modules;
      };
    in
    {
		nixosConfigurations = {
			nixpad = createNixosConfiguration {
        system = "x86_64-linux";
        username = "konrad";
        homeDirectory = "/home/konrad/";
        hostname = "nixpad";
			};
		};
  };
}
