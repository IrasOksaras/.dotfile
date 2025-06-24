[
  {
    layer = "bottom";
    psition = "top";
    height = 30;
    margin-top = 4;
    margin-left = 4;
    margin-right = 4;
    output = [ "eDP-1" ];
    modules-left = [ "custom/smallspacer" "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [ "mediumspacer" "battery" "largespacer" ];

    "custom/smallspacer" = {
      format = " ";
      interval = "once";
      tooltip = false;
    };

    "custom/mediumspacer" = {
      format = "  ";
      interval = "once";
      tooltip = false;
    };

    "custom/largespacer" = {
      format = "   ";
      interval = "once";
      tooltip = false;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        default = "";
        active = "";
      };
    };

    "hyprland/window" = {
      format = "<span weight='bold' >{class}</span>";
      max-length = 120;
      icon = false;
    };

    battery = {
      format = "{capacity}% {icon}";
      format-icons = [ "" "" "" "" "" ];
    };

    clock = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %d. %b  %H:%M}";
    };
  }
]
