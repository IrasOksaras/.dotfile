{inputs, username, pkgs, ...}: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = null;
    portalPackage = null;
    settings = {
      "$mainMod" = "SUPER_L";
      "exec-once" = "fcitx5 -d --replace";
      general = {
        resize_on_border = true;
        gaps_out = 5;
        # float_gaps = 5;
        snap = {
          enabled = true;
        };
      };
      bind = [
        "$mainMod, T, exec, wezterm"
        "$mainMod, F, exec, pkill walker || walker"
        "$mainMod, Q, killactive"
      ];
      bindr = [
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
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
        rounding = 5;
      };
      debug = {
        disable_scale_checks = true;
      };
    };
  };

  programs.walker = {
    enable = true;
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = "/home/${username}/Pictures/wallpaper/wall_anime2_8K.png";
        wallpaper = "eDP-1, /home/${username}/Pictures/wallpaper/wall_anime2_8K.png";
      };
    };
  };
}
