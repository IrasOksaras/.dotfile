{pkgs, ... }: {

  programs = {
    git = {
      enable = true;
    };

    gh = {
      enable = true;
      extensions = with pkgs; [gh-markdown-preview];
      settings = {
        editor = "nvim";
      };
    };

    lazygit = {
      enable = true;
    };
  };
}
