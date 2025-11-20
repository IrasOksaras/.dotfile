[
  {
    layer = "bottom";
    psition = "top";
    height = 30;
    margin-top = 4;
    margin-left = 4;
    margin-right = 4;
    output = [ "eDP-1" "HDMI-A-1"];
    modules-left = [ "hyprland/workspaces" "niri/workspaces" "niri/window" ];
    modules-center = [ "clock" ];
    modules-right = [ "network" "custom/padding" "pulseaudio" "custom/padding" "battery" ];

    battery = {
      format = "{icon}  {capacity}%";
      # format-alt = "{capacity}% {icon}";
      format-icons = [ "" "" "" "" "" "" "" "" ];
    };

    clock = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %d. %b  %H:%M}";
      tooltip = false;
    };

    "network" = {
      "format" = "{ipaddr}/{cidr}";
      "family" = "ipv4";
      "on-click" = "nmgui";
    };

    "pulseaudio" = {
      "format" = "{icon}  {volume}%";
      "format-muted" = "";
      "format-icons" = {
        "default" = [ "" "" ];
      };
      "on-click" = "pavucontrol";
    };

    "niri/workspaces" = {
      "format" = "{icon}";
      "format-icons" = {
        "browser" = "󰈹";
      };
    };
    "niri/window" = {
      "format" = "{title}:{app_id}";
    };

    "hyprland/workspaces" = {
      "format" = "{}";
    };

    "custom/padding" = {
      "format" = "|";
    };
  }
]
