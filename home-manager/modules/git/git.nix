{pkgs, ... }: let
  codegpt = pkgs.buildGoModule {
    pname = "codegpt";
    version = "1.2.1";

    src = pkgs.fetchFromGitHub {
      owner = "appleboy";
      repo = "CodeGPT";
      tag = "v1.2.1";
      hash = "sha256-Q89CTNbLp0QXaiOubCRAPM7RqMwVJkIAKy3Nr4S5GYc=";
    };

    nativeBuildInputs = [ pkgs.git ];

    vendorHash = "sha256-sihfhavfPoha8tiiV7+icPYEZkp7ZRx1wgJCYiQvJeI=";
  };
in {

  programs = {
    git = {
      enable = true;
      userName = "IrasOksaras";
      userEmail = "g024c1054@g.neec.ac.jp";
    };

    gh = {
      enable = true;
      extensions = [
        pkgs.gh-markdown-preview
      ];
      settings = {
        editor = "nvim";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          showIcons = true;
          nerdFontsVersion = "3";
        };
        git = {
          autoFetch = false;
        };
        os = {
          editPreset = "nvim";
        };
      };
    };
  };

  home.packages = [
    codegpt
  ];

  home.shellAliases = {
    lg = "lazygit";
  };

  xdg.configFile = {
    "codegpt.yaml" = {
      source = ./.codegpt.yaml;
      target = "codegpt/.codegpt.yaml";
    };
  };
}
