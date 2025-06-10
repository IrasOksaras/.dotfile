{
  programs.nixvim.plugins = {
    floaterm = {
      enable = true;
      title = "";
      settings = {
        keymap_new = "<Leader>fo";
        keymap_kill = "<Leader>fk";
        keymap_show = "<Leader>fi";
        keymap_hide = "<Leader>fd";
      };
    };
  };
}
