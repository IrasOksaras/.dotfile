{inputs, username, pkgs, ...}: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null;
    portalPackage = null;
    plugins = [
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = import ./hyprland/hyprlandSettings.nix;
  };

  services = {
    hypridle = {
      enable = true;
      package = inputs.hypridle.packages.${pkgs.system}.hypridle;
      settings = {
        general = {

        };
      };
    };
  };

  programs.walker = {
    enable = true;
    runAsService = true;
    # config = {
    #
    # };
  };

  # programs.waybar = {
  #   enable = true;
  #   systemd = {
  #     enable = true;
  #   };
  #   settings = import ./waybar.nix;
  #   style = builtins.readFile ./waybar.css;
  # };

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    pkgs.iniparser
    pkgs.hyprpolkitagent
    pkgs.hyprshot
    pkgs.fftw
  ];

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/home/${username}/Pictures/wallpaper/WhiteGlint.jpg"
        ];
        wallpaper = [
          "eDP-1, /home/${username}/Pictures/wallpaper/WhiteGlint.jpg"
          "DP-2, /home/${username}/Pictures/wallpaper/WhiteGlint.jpg"
        ];
      };
    };
  };
}
