{config, username, pkgs, spkgs, ...}: {

  home = rec {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.plasticity
    pkgs.blender
    pkgs.realvnc-vnc-viewer
    pkgs.remmina
    pkgs.pavucontrol
    pkgs.impala
    pkgs.gemini-cli
    pkgs.gns3-gui
    pkgs.ranger
    pkgs.screen
    pkgs.spotify
    pkgs.gparted
    pkgs.drawio
    pkgs.calcurse
    spkgs.kicad
    pkgs.keepassxc
    pkgs.grimblast
    pkgs.mysql-workbench
    pkgs.slack
    spkgs.parsec-bin
  ];

  home.sessionVariables = {
    TERMINAL = "${pkgs.wezterm}/bin/wezterm";
    BROWSER = "${pkgs.firefox}/bin/firefox";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
    };
  };

  programs = {
    cava = {
      enable = true;
    };
    cavalier = {
      enable = true;
    };
  };

  home.file = {
    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
