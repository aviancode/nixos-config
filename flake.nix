{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };

      modules = [
        inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.home-manager

        # Connecting hosts
        ./hosts/desktop
      ];
    };

    packages.${system} = import ./packages { inherit pkgs; };
    formatter.${system} = pkgs.nixfmt-rfc-style;
  };
}
