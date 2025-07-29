{pkgs, ...}: {

  programs.nixvim  = {
    plugins = {
      alpha = {
        enable = true;
        # layout = [
        #   {
        #     type = "padding";
        #     val = 4;
        #   }
        #   {
        #     opts = {
        #       redraw = true;
        #     };
        #     type = "terminal";
        #     command = "${config.xdg.dataHome}/nvim/scripts/startup.sh";
        #     width = 54;
        #     height = 11;
        #   }
        #   {
        #     type = "padding";
        #     val = 2;
        #   }
        #   {
        #     opt = {
        #       "inherit" = {
        #         position = "center";
        #       };
        #     };
        #     type = "group";
        #     val = [
        #       {
        #         on_press = {
        #           __raw = "function() vim.cmd[[ene]] end";
        #         };
        #         opts = {
        #           shortcut = "n";
        #           position = "center";
        #         };
        #         type = "button";
        #         val = " New file";
        #       }
        #       {
        #         on_press = {
        #           __raw = "function() vim.cmd[[qa]] end";
        #         };
        #         opts = {
        #           # cursor = 2;
        #           shortcut = "q";
        #           position = "center";
        #         };
        #         type = "button";
        #         val = "󰈆  > Quit NVIM";
        #       }
        #     ];
        #   }
        #   {
        #     type = "padding";
        #     val = 2;
        #   }
        #   {
        #     opts = {
        #       hl = "Keyword";
        #       position = "center";
        #     };
        #     type = "text";
        #     val = "Inspiring quote here.";
        #   }
        # ];

        theme = "theta";
      };
    };

    extraPackages = [
      pkgs.terminaltexteffects
    ];
  };

  xdg.dataFile = {
    "nvim/scripts/startup.sh" = {
      source = ./scripts/startup.sh;
      executable = true;
    };
  };
}
