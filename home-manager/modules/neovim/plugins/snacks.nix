{ ... }: {
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        image = {
          enabled = true;
          doc = {
            enabled = true;
            inline = false;
            float = true;
            max_width = 30;
            max_height = 15;
          };
        };
      };
    };
  };
}
