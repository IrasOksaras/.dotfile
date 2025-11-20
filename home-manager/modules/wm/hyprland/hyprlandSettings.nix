{
  "env" = [
    "HYPRCURSOR_THEME, rose-pine-hyprcursor"
    "HYPRCURSOR_SIZE, 24"
  ];
  # "$mainMod" = "ALT_L";
  "$mainMod" = "SUPER_L";
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
  animation = [ 
    "windows, 1, 3, default"
  ];
  gesture = [
    "4, horizontal, workspace"
  ];
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
}
