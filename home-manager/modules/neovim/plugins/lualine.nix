{
  programs.nixvim.plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          icon_enabled = true;
          component_separators = {
            left = "|";
            right = "|";
          };
        };
      };
    };
  };
}

