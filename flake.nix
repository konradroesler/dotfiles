{
	description = "NixOs configuration";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
		# home-manager, used for managing user configuration
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
		nixosConfigurations = {
			# 'nixos-gnome' is the hostname
			nixos-gnome = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/nixos-gnome/configuration.nix

					# make home-manager as a module of nix so that 
					# home-manager configuration will be deployed automatically
					# when executing `nixos-rebuild switch`
					home-manager.nixosModules.home-manager 
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.konrad = import ./hosts/nixos-gnome/home.nix;
					}
				];
			};
		};
	};
}
