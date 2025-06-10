{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          file-browser = {
            enable = true;
          };
        };
        settings = {
          defaults = {
            file_ignore_patterns = [
              "^/git/"
            ];
          };
        };
      };

      web-devicons = {
        enable = true;
      };

      mini = {
        modules.icons = {
          enable = true;
        };
        mockDevIcons = {
          enable = true;
        };
      };
    };

    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<Leader>ff";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<Leader>fg";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<Leader>fb";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<Leader>fh";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
