{
  programs.nixvim = {
    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
          style = "moon";
          terminal_colors = true;
          transparent = true;
        };
      };
    };
  };
}
