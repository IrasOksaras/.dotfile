{ pkgs, ... }: {
  programs = {
    taskwarrior = {
      enable = true;
      package = pkgs.taskwarrior3;
      colorTheme = "solarized-dark-256";
    };
  };

  home.packages = [
    pkgs.taskwarrior-tui
  ];

  home.shellAliases = {
    tt = "taskwarrior-tui";
  };
}
