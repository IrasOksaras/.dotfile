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
        editor = "nixvim";
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
      };
    };
  };
}
