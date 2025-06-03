{config, pkgs, ...}:

{
  home = rec {
    username = "Iras";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  programs.ncspot = {
    enable = true;
  };

  home.packages = with pkgs; [
    gns3-gui
    gns3-server
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
    notion-app-enhanced
    kicad
  ];
  
  home.file = {
    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
