{inputs, username, pkgs, ...}: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null; portalPackage = null;
    settings = {
      "env" = [
        "HYPRCURSOR_THEME, rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE, 24"
      ];
      "$mainMod" = "ALT_L";
      # "windowrule" = "pseudo, fcitx";
      "exec-once" = [
        "fcitx5-remote -r"
        "fcitx5 -d --replace"
        "hyprpanel"
      ];
      general = {
        resize_on_border = true;
        gaps_out = 5;
        # float_gaps = 5;
        snap = {
          enabled = true;
        };
      };
      xwayland = {
        force_zero_scaling = true;
      };
      bind = [
        "$mainMod, T, exec, wezterm"
        "$mainMod, F, exec, pkill walker || walker"
        "$mainMod, Q, killactive"
      ];
      bindr = [
      ];
      bindm = [
        "$mainMod, TAB, movewindow"
        "$mainMod, Control_L, resizewindow"
      ];
      bindc = [
        "$mainMod, mouse:272, togglefloating"
        "$mainMod, mouse:273, fullscreen"
      ];
      input = {
        touchpad = {
          natural_scroll = true;
        };
        kb_layout = "jp";
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 4;
      };
      monitor = [
        "eDP-1, 1920x1200@60, auto, 1.1"
      ];
      decoration = {
        rounding = 10;
      };
      debug = {
        disable_scale_checks = true;
      };
    };
  };

  programs.walker = {
    enable = true;
  };

  # programs.waybar = {
  #   enable = true;
  #   systemd = {
  #     enable = true;
  #   };
  #   settings = import ./waybar.nix;
  #   style = builtins.readFile ./waybar.css;
  # };

  home.packages = [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.hyprpanel.packages.${pkgs.system}.default
    pkgs.iniparser
    pkgs.fftw
  ];

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/home/${username}/Pictures/wallpaper/wall_anime2_8K.png"
          "/home/${username}/Pictures/wallpaper/01.jpg"
          "/home/${username}/Pictures/wallpaper/b-181.jpg"
          "/home/${username}/Pictures/wallpaper/b-253.jpg"
          "/home/${username}/Pictures/wallpaper/b-285.jpg"
          "/home/${username}/Pictures/wallpaper/b-743.jpg"
        ];
        wallpaper = "eDP-1, /home/${username}/Pictures/wallpaper/01.jpg";
      };
    };
  };
}
