{config, username, pkgs, spkgs, ...}: {

  home = rec {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.zathura
    pkgs.blender
    pkgs.calcurse
    pkgs.drawio
    pkgs.freecad-wayland
    pkgs.gemini-cli
    pkgs.gns3-gui
    pkgs.gparted
    pkgs.grimblast
    pkgs.impala
    pkgs.keepassxc
    pkgs.mysql-workbench
    pkgs.pavucontrol
    pkgs.ranger
    pkgs.realvnc-vnc-viewer
    pkgs.remmina
    pkgs.screen
    pkgs.slack
    pkgs.spotify
    pkgs.terraform
    spkgs.kicad
    spkgs.parsec-bin
    pkgs.cz-cli
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

  programs = {
    obsidian = {
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
