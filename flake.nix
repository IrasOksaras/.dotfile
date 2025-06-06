{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs:
  let
    system = "x86_64-linux";
    overlays = [ inputs.nur.overlays.default ];
    pkgs = import inputs.nixpkgs-unstable { 
      config.allowUnfree = true;
      inherit system overlays;
    };
    spkgs = import inputs.nixpkgs { 
      config.allowUnfree = true;
      inherit system overlays;
    };
  in {
    nixosConfigurations = {
      myNixOS = inputs.nixpkgs-unstable.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {
          inherit inputs spkgs;
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
          inherit inputs spkgs;
        };
        modules = [
          ./home-manager/home.nix
          ./home-manager/modules/git/git.nix
          ./home-manager/modules/neovim/neovim.nix
          ./home-manager/modules/web-browser/web-browser.nix
          ./home-manager/modules/wezterm/wezterm.nix
          ./home-manager/modules/zsh/zsh.nix
        ];
      };
    };
  };
}
