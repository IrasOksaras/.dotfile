{
  programs.nixvim = {
    colorschemes = {
      monokai-pro = {
        enable = true;
        settings = {
          filter = "octagon";
          terminal_colors = true;
          transparent_background = true;
        };
      };
    };
  };
}
