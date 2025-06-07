{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
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
