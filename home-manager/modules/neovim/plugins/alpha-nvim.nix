{config, pkgs, ...}: {

  programs.nixvim.plugins = {
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            redraw = true;
          };
          type = "terminal";
          command = "${config.xdg.dataHome}/nvim/scripts/startup.sh";
          width = 54;
          height = 11;
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              on_press = {
                __raw = "function() vim.cmd[[ene]] end";
              };
              opts = {
                shortcut = "n";
              };
              type = "button";
              val = " New file";
            }
            {
              on_press = {
                __raw = "function() vim.cmd[[qa]] end";
              };
              opts = {
                shortcut = "q";
              };
              type = "button";
              val = "󰈆 Quit Neovim";
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Keyword";
            position = "center";
          };
          type = "text";
          val = "Inspiring quote here.";
        }
      ];

      # theme = "startify";
    };
  };

  home.packages = [
    pkgs.figlet
    pkgs.terminaltexteffects
  ];

  xdg.dataFile = {
    "nvim/scripts/startup.sh" = {
      source = ./scripts/startup.sh;
      executable = true;
    };
  };
}
