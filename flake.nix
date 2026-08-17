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

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
	url = "github:sodiboo/niri-flake";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
	url = "github:0xc000022070/zen-browser-flake";
	inputs = {
		nixpkgs.follows = "nixpkgs";
		home-manager.follows = "home-manager";
	};
    };

    zapret2 = {
	url = "github:bol-van/zapret2";
	flake = false;
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
