{
  inputs = {
    # nixos-hardware.url = "github:NixOS/nixpkgs/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, nur, home-manager, ...}@inputs:
  let
    system = "x86_64-linux";
    overlays = [ nur.overlay ];
    pkgs = import nixpkgs { 
      config.allowUnfree = true;
      inherit system overlays;
    };
  in {
    nixosConfigurations = {
      myNixOS = inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration.nix
        ];
      };
    };

    homeConfigurations = {
      myHome = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
