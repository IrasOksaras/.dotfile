{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  let
    system = "x86_64-linux";
    overlays = [ inputs.nur.overlays.default ];
    pkgs = import inputs.nixpkgs { 
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
          ./nixos/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      myHome = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home-manager/home.nix
          ./home-manager/modules/home/zsh/zsh.nix
          ./home-manager/modules/home/neovim/neovim.nix
          ./home-manager/modules/home/git/git.nix
          ./home-manager/modules/home/wezterm/wezterm.nix
          ./home-manager/modules/home/tor-browser/tor-browser.nix
        ];
      };
    };
  };
}
