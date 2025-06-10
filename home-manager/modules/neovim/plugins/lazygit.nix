{
  programs.nixvim = {
    plugins = {
      lazygit = {
        enable = true;
      };
    };

    keymaps = [
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
