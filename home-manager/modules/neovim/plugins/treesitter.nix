{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        custom_filetypes = {
          ejs = "html";
        };
      };
    };
    treesitter-refactor = {
      enable = true;
    };
  };
}
