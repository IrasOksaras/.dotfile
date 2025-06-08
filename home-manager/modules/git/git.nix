{pkgs, ... }: {

  programs = {
    git = {
      enable = true;
      userName = "IrasOksaras";
      userEmail = "g024c1054@g.neec.ac.jp";
    };

    gh = {
      enable = true;
      extensions = with pkgs; [gh-markdown-preview];
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
}
