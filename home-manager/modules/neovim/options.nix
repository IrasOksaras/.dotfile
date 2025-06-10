{
  programs.nixvim = {
    clipboard = {
      register = [ "unnamed" "unnamedplus" ];
      providers.wl-copy = {
        enable = true;
      };
    };
    opts = {
      swapfile = false;
      fileencoding = "utf-8";
      number = true;
      cursorline = true;
      guicursor = "n:blinkon0";
      list = true;
      listchars = "tab:▸\\ ,eol:↲,space:･";
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
    };
  };
}
