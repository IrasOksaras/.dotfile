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
      autoindent = true;
      cindent = true;
      smartindent = true;
      expandtab = true;
      smarttab = true;
      tabstop = 2;
      shiftwidth = 2;
      textwidth = 0;
    };
  };
}
