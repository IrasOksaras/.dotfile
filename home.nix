{config, pkgs, ...}:

{
  home = rec {
    username = "Iras";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    plugins = [
      {
      name = "powerlevevl10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh/powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initExtra = "source${config.home.homeDirectory}/.p10k.zsh";
  };

  home.file.".p10k.zsh".source = ./p10k.zsh;
}
