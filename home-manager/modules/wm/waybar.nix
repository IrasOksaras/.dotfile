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
    modules-right = [ "battery" ];

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
      format = "{icon}";
      # format-alt = "{capacity}% {icon}";
      format-icons = [ "" "" "" "" "" "" "" "" ];
    };

    clock = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %d. %b  %H:%M}";
      tooltip = false;
    };
  }
]
