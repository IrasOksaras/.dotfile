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

    wezterm = {
      url = "github:wezterm/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixcats = {
      url = "github:BirdeeHub/nixCats-nvim";
    };
    
    niri-scratchpad-flake = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    walker = {
      url = "github:abenz1267/walker/v2.11.1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.elephant.follows = "elephant";
    };
    elephant = {
      url = "github:abenz1267/elephant/v2.16.0";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs: let
    system = "x86_64-linux";
    username = "Iras";
    overlays = [ inputs.nur.overlays.default ];
    pkgs = import inputs.nixpkgs-unstable { 
      config.permittedInsecurePackages = [
        "ciscoPacketTracer8-8.2.2"
      ];
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
          inherit inputs username spkgs;
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
          inherit inputs username spkgs;
        };
        modules = [
          ./home-manager/home.nix
          ./home-manager/modules/btop/btop.nix
          ./home-manager/modules/git/git.nix
          ./home-manager/modules/im/im.nix
          ./home-manager/modules/kubectl/kubectl.nix
          ./home-manager/modules/ncspot/ncspot.nix
          ./home-manager/modules/neovim/neovim.nix
          ./home-manager/modules/obsidian/obsidian.nix
          ./home-manager/modules/opencode/opencode.nix
          ./home-manager/modules/prismlauncher/prismlauncher.nix
          ./home-manager/modules/ssh/ssh.nix
          ./home-manager/modules/taskwarrior/taskwarrior.nix
          ./home-manager/modules/web-browser/web-browser.nix
          ./home-manager/modules/wezterm/wezterm.nix
          ./home-manager/modules/wm/wm.nix
          ./home-manager/modules/yazi/yazi.nix
          ./home-manager/modules/zsh/zsh.nix
        ];
      };
    };
  };
}
