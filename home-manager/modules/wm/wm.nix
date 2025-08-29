{inputs, username, pkgs, ...}: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null; portalPackage = null;
    plugins = [
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];
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
        "systemctl --user start hyprpolkitagent"
      ];
      plugin = {
        overview = {
          "autoDrag" = true;
          "reverseSwipe" = true;
        };
      };
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
        ", PRINT, exec, hyprshot -m output"
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
        "eDP-1, 1920x1200@60, 0x0, 1.1"
        "HDMI-A-1, 3840x2160@60, -436x-1440, 1.5"
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
    runAsService = true;
    config = {

    };
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
          "/home/${username}/Pictures/wallpaper/wall_anime2_8K.png"
          "/home/${username}/Pictures/wallpaper/01.jpg"
          "/home/${username}/Pictures/wallpaper/b-181.jpg"
          "/home/${username}/Pictures/wallpaper/b-253.jpg"
          "/home/${username}/Pictures/wallpaper/b-285.jpg"
          "/home/${username}/Pictures/wallpaper/b-743.jpg"
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
