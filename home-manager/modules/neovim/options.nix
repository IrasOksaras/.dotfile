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
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
    };
    extraConfigLua = ''
      vim.cmd("set list listchars=tab:▸\\ ,eol:↲,space:･")
      '';
  };
}
