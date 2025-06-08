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
      {
        action = "<cmd>LazyGit<cr>";
        key = "<leader>gg";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
