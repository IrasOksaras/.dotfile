{config, pkgs, ...}:

{
  home = rec {
    username = "Iras";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ranger
    screen
    spotify
    slack
    terraform
    ansible
    drawio
    parsec-bin
    calcurse
    morgen
  ];
  
  home.file = {
    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
