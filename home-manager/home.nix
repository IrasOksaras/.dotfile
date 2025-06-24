{config, username, pkgs, spkgs, ...}: {

  home = rec {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.gns3-gui
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

  home.sessionVariables = {
    TERMINAL = "${pkgs.wezterm}/bin/wezterm";
    BROWSER = "${pkgs.firefox}/bin/firefox";
  };

  home.file = {
    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
