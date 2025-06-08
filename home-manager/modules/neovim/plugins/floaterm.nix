{
  programs.nixvim.plugins = {
    floaterm = {
      enable = true;
      settings = {
        keymap_new = "<Leader>ft";
        keymap_kill = "<Leader>fk";
      };
    };
  };
}
