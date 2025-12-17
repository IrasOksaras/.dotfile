{inputs, username, pkgs, ...}: let
  inherit (inputs.niri-scratchpad-flake.packages.${pkgs.system}) niri-scratchpad;
in {
  imports = [
    inputs.walker.homeManagerModules.default
    # inputs.elephant.homeManagerModules.default
  ];

  programs.niriswitcher = {
    enable = true;
    settings = {
      keys = {
        modifier = "Super";
        switch = {
          next = "Tab";
          prev = "Shift+Tab";
        };
      };
      center_on_focus = true;
      appearance = {
        system_theme = "dark";
        icon_size = 64;
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
  # programs.elephant = {
  #   config = {
  #     providers = {
  #       desktopapplications = {
  #         launch_prefix = "app2unit --";
  #       };
  #     };
  #   };
  # };

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = import ./waybar.nix;
    style = builtins.readFile ./waybar.css;
  };

  services.swaync = {
    enable = true;
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  home.packages = [
    pkgs.polkit_gnome
    pkgs.nautilus
    niri-scratchpad
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  xdg.configFile = {
    "niriConfig" = {
      source = ./config.kdl;
      target = "niri/config.kdl";
    };
  };

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
          "HDMI-A-1, /home/${username}/Pictures/wallpaper/WhiteGlint.jpg"
        ];
      };
    };
  };
}
