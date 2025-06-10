{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps =
    [
      {
        action = "<esc>";
        key = "jk";
        mode = [ "i" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
