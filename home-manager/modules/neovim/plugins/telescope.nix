{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          file-browser = {
            enable = true;
            settings = {
              use_fd = true;
            };
          };
          fzf-native = {
            enable = true;
            settings = {
              fuzzy = true;
              override_generic_sorter = true;
              override_file_soter = true;
              case_mode = "smart_case";
            };
          };
        };
        settings = {
          defaults = {
            winblend = 0;
            file_ignore_patterns = [
              "^/git/"
            ];
          };
          pickers = {
            find_files = {
              hidden = true;
            };
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

    extraConfigLua = ''
      vim.cmd([[highlight TelescopeNormal guibg=None]])
      vim.cmd([[highlight TelescopeBorder guibg=None]])
      vim.cmd([[highlight TelescopePromptBorder guibg=None]])
      vim.cmd([[highlight TelescopeResultsBorder guibg=None]])
      vim.cmd([[highlight TelescopePreviewBorder guibg=None]])
    '';

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
