{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        file-browser = {
          enable = true;
        };
      };
      settings.defaults = {
        file_ignore_patterns = [
          "^/git/"
        ];
      };
    };

    web-devicons = {
      enable = true;
    };

    mini = {
      modules.icons = {
        enable = true;
      };
      mockDevIcons = {
        enable = true;
      };
    };
  };
}
