{
	description = "NixOs configuration";

  inputs = { 
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
		nixosConfigurations = {
			# 'nixpad' is the hostname
			nixpad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system inputs; };
				modules = [
					./hosts/nixpad/configuration.nix

					home-manager.nixosModules.home-manager 
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.konrad = import ./hosts/nixpad/home.nix;
					}
				];
			};
		};
	};
}
