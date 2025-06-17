{config, pkgs, spkgs, ...}: {

  home = rec {
    username = "Iras";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  programs.ncspot = {
    enable = true;
  };

  home.packages = [
    pkgs.gns3-gui
    pkgs.gns3-server
    pkgs.ranger
    pkgs.screen
    pkgs.spotify
    pkgs.slack
    pkgs.terraform
    pkgs.ansible
    pkgs.drawio
    pkgs.calcurse
    pkgs.morgen
    pkgs.notion-app-enhanced
    pkgs.kicad
    pkgs.grimblast
    spkgs.parsec-bin
  ];

  home.file = {
    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
