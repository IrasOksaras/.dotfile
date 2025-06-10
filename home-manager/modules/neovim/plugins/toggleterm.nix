{
  programs.nixvim.plugins = {
    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<Leader>tt]]";
        direction = "float";
      };
    };
  };
}
