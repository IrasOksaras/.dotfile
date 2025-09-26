{
  bar.launcher = {
    autoDetectIcon = true;
  };
  scalingPriority =  "hyprland";
  theme = {
    bar = {
      menus = {
        menu = {
          notifications = {
            scrollbar.color = "#4fd6be";
            pager = {
              label = "#636da6";
              button = "#4fd6be";
              background = "#222436";
            };
            switch = {
              puck = "#636da6";
              disabled = "#636da6";
              enabled = "#4fd6be";
            };
            clear = "#4fd6be";
            switch_divider = "#444a73";
            border = "#2f324d";
            card = "#24283b";
            background = "#1e2030";
            no_notifications_label = "#444a73";
            label = "#4fd6be";
          };
          
          power = {
            buttons = {
              sleep = {
                icon = "#222436";
                text = "#86e1fc";
                icon_background = "#86e1fc";
                background = "#24283b";
              };
              logout = {
                icon = "#222436";
                text = "#c3e88d";
                icon_background = "#c3e88d";
                background = "#24283b";
              };
              restart = {
                icon = "#222436";
                text = "#ffc777";
                icon_background = "#ffc777";
                background = "#24283b";
              };
              shutdown = {
                icon = "#222436";
                text = "#ff757f";
                icon_background = "#ff757f";
                background = "#24283b";
              };
            };
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#2a283e";
          };
          
          dashboard = {
            monitors = {
              disk = {
                label = "#ff757f";
                bar = "#ff757f";
                icon = "#ff757f";
              };
              gpu = {
                label = "#c3e88d";
                bar = "#c3e88d";
                icon = "#c3e88d";
              };
              ram = {
                label = "#ffc777";
                bar = "#ffc777";
                icon = "#ffc777";
              };
              cpu = {
                label = "#ff757f";
                bar = "#ff757f";
                icon = "#ff757f";
              };
              bar_background = "#444a73";
            };
            
            directories = {
              right = {
                bottom.color = "#c099ff";
                middle.color = "#c099ff";
                top.color = "#4fd6be";
              };
              left = {
                bottom.color = "#ff757f";
                middle.color = "#ffc777";
                top.color = "#ff757f";
              };
            };
            
            controls = {
              input = {
                text = "#222436";
                background = "#ff757f";
              };
              volume = {
                text = "#222436";
                background = "#ff757f";
              };
              notifications = {
                text = "#222436";
                background = "#ffc777";
              };
              bluetooth = {
                text = "#222436";
                background = "#86e1fc";
              };
              wifi = {
                text = "#222436";
                background = "#c099ff";
              };
              disabled = "#444a73";
            };
            
            shortcuts = {
              recording = "#c3e88d";
              text = "#222436";
              background = "#c099ff";
            };
            
            powermenu = {
              confirmation = {
                button_text = "#222436";
                deny = "#ff757f";
                confirm = "#c3e88d";
                body = "#c8d3f5";
                label = "#c099ff";
                border = "#444a73";
                background = "#222436";
                card = "#24283b";
              };
              sleep = "#86e1fc";
              logout = "#c3e88d";
              restart = "#ffc777";
              shutdown = "#ff757f";
            };
            
            profile.name = "#ff757f";
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#24283b";
          };
          
          clock = {
            weather = {
              hourly = {
                temperature = "#fca7ea";
                icon = "#fca7ea";
                time = "#fca7ea";
              };
              thermometer = {
                extremelycold = "#86e1fc";
                cold = "#82aaff";
                moderate = "#c099ff";
                hot = "#ffc777";
                extremelyhot = "#fca7ea";
              };
              stats = "#fca7ea";
              status = "#4fd6be";
              temperature = "#c8d3f5";
              icon = "#fca7ea";
            };
            calendar = {
              contextdays = "#444a73";
              days = "#c8d3f5";
              currentday = "#fca7ea";
              paginator = "#fca7ea";
              weekdays = "#fca7ea";
              yearmonth = "#4fd6be";
            };
            time = {
              timeperiod = "#4fd6be";
              time = "#fca7ea";
            };
            text = "#c8d3f5";
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#24283b";
          };
          
          battery = {
            slider = {
              puck = "#636da6";
              backgroundhover = "#444a73";
              background = "#636da6";
              primary = "#ffc777";
            };
            icons = {
              active = "#ffc777";
              passive = "#636da6";
            };
            listitems = {
              active = "#ffc777";
              passive = "#c8d3f5";
            };
            text = "#c8d3f5";
            label.color = "#ffc777";
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#24283b";
          };
          
          systray = {
            dropdownmenu = {
              divider = "#24283b";
              text = "#c8d3f5";
              background = "#222436";
            };
          };
          
          bluetooth = {
            iconbutton = {
              active = "#86e1fc";
              passive = "#c8d3f5";
            };
            icons = {
              active = "#86e1fc";
              passive = "#636da6";
            };
            listitems = {
              active = "#86e1fc";
              passive = "#c8d3f5";
            };
            switch = {
              puck = "#636da6";
              disabled = "#636da6";
              enabled = "#86e1fc";
            };
            switch_divider = "#444a73";
            status = "#636da6";
            text = "#c8d3f5";
            label.color = "#86e1fc";
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#24283b";
            scroller.color = "#86e1fc";
          };
          
          network = {
            iconbuttons = {
              active = "#c099ff";
              passive = "#c8d3f5";
            };
            icons = {
              active = "#c099ff";
              passive = "#636da6";
            };
            listitems = {
              active = "#c099ff";
              passive = "#c8d3f5";
            };
            switch = {
              enabled = "#c099ff";
              disabled = "#636da6";
              puck = "#636da6";
            };
            status.color = "#636da6";
            text = "#c8d3f5";
            label.color = "#c099ff";
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#24283b";
            scroller.color = "#c099ff";
          };
          
          volume = {
            input_slider = {
              puck = "#444a73";
              backgroundhover = "#444a73";
              background = "#636da6";
              primary = "#ff757f";
            };
            audio_slider = {
              puck = "#444a73";
              backgroundhover = "#444a73";
              background = "#636da6";
              primary = "#ff757f";
            };
            icons = {
              active = "#ff757f";
              passive = "#636da6";
            };
            iconbutton = {
              active = "#ff757f";
              passive = "#c8d3f5";
            };
            listitems = {
              active = "#ff757f";
              passive = "#c8d3f5";
            };
            text = "#c8d3f5";
            label.color = "#ff757f";
            border.color = "#2f324d";
            background.color = "#1e2030";
            card.color = "#24283b";
          };
          
          media = {
            slider = {
              puck = "#636da6";
              backgroundhover = "#444a73";
              background = "#636da6";
              primary = "#ff757f";
            };
            buttons = {
              text = "#222436";
              background = "#c099ff";
              enabled = "#4fd6be";
              inactive = "#444a73";
            };
            border.color = "#2f324d";
            card.color = "#24283b";
            background.color = "#1e2030";
            album = "#ff757f";
            artist = "#4fd6be";
            song = "#c099ff";
            timestamp = "#c8d3f5";
          };
        };
        
        tooltip = {
          text = "#c8d3f5";
          background = "#222436";
        };
        
        dropdownmenu = {
          divider = "#24283b";
          text = "#c8d3f5";
          background = "#222436";
        };
        
        slider = {
          puck = "#636da6";
          backgroundhover = "#444a73";
          background = "#636da6";
          primary = "#c099ff";
        };
        
        progressbar = {
          background = "#444a73";
          foreground = "#c099ff";
        };
        
        iconbuttons = {
          active = "#c099ff";
          passive = "#c8d3f5";
        };
        
        buttons = {
          text = "#222436";
          disabled = "#636da6";
          active = "#ff757f";
          default = "#c099ff";
        };
        
        check_radio_button = {
          active = "#c099ff";
          background = "#3b4261";
        };
        
        switch = {
          puck = "#636da6";
          disabled = "#636da6";
          enabled = "#c099ff";
        };
        
        icons = {
          active = "#c099ff";
          passive = "#444a73";
        };
        
        listitems = {
          active = "#c099ff";
          passive = "#c8d3f5";
        };
        
        popover = {
          border = "#222436";
          background = "#222436";
          text = "#c099ff";
        };
        
        label = "#c099ff";
        feinttext = "#444a73";
        dimtext = "#444a73";
        text = "#c8d3f5";
        border.color = "#444a73";
        cards = "#24283b";
        background = "#222436";
      };
      
      buttons = {
        modules = {
          power = {
            icon_background = "#ff757f";
            icon = "#181825";
            background = "#272a3d";
            border = "#ff757f";
          };
          weather = {
            icon_background = "#c099ff";
            icon = "#c099ff";
            text = "#c099ff";
            background = "#272a3d";
            border = "#c099ff";
          };
          updates = {
            icon_background = "#ff966c";
            icon = "#ff966c";
            text = "#ff966c";
            background = "#272a3d";
            border = "#ff966c";
          };
          kbLayout = {
            icon_background = "#86e1fc";
            icon = "#86e1fc";
            text = "#86e1fc";
            background = "#272a3d";
            border = "#86e1fc";
          };
          netstat = {
            icon_background = "#c3e88d";
            icon = "#c3e88d";
            text = "#c3e88d";
            background = "#272a3d";
            border = "#c3e88d";
          };
          storage = {
            icon_background = "#ff757f";
            icon = "#ff757f";
            text = "#ff757f";
            background = "#272a3d";
            border = "#ff757f";
          };
          cpu = {
            icon_background = "#ff757f";
            icon = "#ff757f";
            text = "#ff757f";
            background = "#272a3d";
            border = "#ff757f";
            hover = "#45475a";
          };
          cpuTemp = {
            icon_background = "#fab387";
            icon = "#fab387";
            text = "#fab387";
            border = "#fab387";
          };
          ram = {
            icon_background = "#ffc777";
            icon = "#ffc777";
            text = "#ffc777";
            background = "#272a3d";
            border = "#ffc777";
          };
          submap = {
            background = "#272a3d";
            text = "#4fd6be";
            border = "#4fd6be";
            icon = "#4fd6be";
            icon_background = "#4fd6be";
          };
          hyprsunset = {
            icon = "#ffc777";
            background = "#272a3d";
            icon_background = "#ffc777";
            text = "#ffc777";
            border = "#ffc777";
          };
          hypridle = {
            icon = "#0db8d7";
            background = "#272a3d";
            icon_background = "#0db8d7";
            text = "#0db8d7";
            border = "#0db8d7";
          };
          cava = {
            text = "#4fd6be";
            background = "#272a3d";
            icon_background = "#4fd6be";
            icon = "#4fd6be";
            border = "#4fd6be";
          };
          microphone = {
            border = "#c3e88d";
            background = "#272a3d";
            text = "#c3e88d";
            icon = "#c3e88d";
            icon_background = "#272a3d";
          };
          worldclock = {
            text = "#fca7ea";
            background = "#272a3d";
            icon_background = "#fca7ea";
            icon = "#fca7ea";
            border = "#fca7ea";
          };
        };
        
        notifications = {
          total = "#4fd6be";
          icon_background = "#4fd6be";
          icon = "#4fd6be";
          background = "#272a3d";
          border = "#4fd6be";
          hover = "#504945";
        };
        
        clock = {
          icon_background = "#fca7ea";
          icon = "#fca7ea";
          text = "#fca7ea";
          background = "#272a3d";
          border = "#fca7ea";
          hover = "#504945";
        };
        
        battery = {
          icon_background = "#ffc777";
          icon = "#ffc777";
          text = "#ffc777";
          background = "#272a3d";
          border = "#ffc777";
          hover = "#504945";
        };
        
        systray = {
          background = "#272a3d";
          border = "#444a73";
          customIcon = "#c8d3f5";
          hover = "#504945";
        };
        
        bluetooth = {
          icon_background = "#86e1fc";
          icon = "#86e1fc";
          text = "#86e1fc";
          background = "#272a3d";
          border = "#86e1fc";
          hover = "#504945";
        };
        
        network = {
          icon_background = "#c099ff";
          icon = "#c099ff";
          text = "#c099ff";
          background = "#272a3d";
          border = "#c099ff";
          hover = "#504945";
        };
        
        volume = {
          icon_background = "#ff757f";
          icon = "#ff757f";
          text = "#ff757f";
          background = "#272a3d";
          border = "#ff757f";
          hover = "#504945";
          output_icon = "#11111b";
          output_text = "#eba0ac";
          input_icon = "#11111b";
          input_text = "#eba0ac";
          separator = "#45475a";
        };
        
        media = {
          icon_background = "#c099ff";
          icon = "#c099ff";
          text = "#c099ff";
          background = "#272a3d";
          border = "#c099ff";
          hover = "#504945";
        };
        
        windowtitle = {
          icon_background = "#ff757f";
          icon = "#ff757f";
          text = "#ff757f";
          background = "#272a3d";
          border = "#ff757f";
          hover = "#504945";
        };
        
        workspaces = {
          numbered_active_underline_color = "#c678dd";
          numbered_active_highlighted_text_color = "#181825";
          numbered_active_text_color = "#24283b";
          active = "#ff757f";
          occupied = "#ff757f";
          available = "#86e1fc";
          hover = "#ff757f";
          background = "#272a3d";
          border = "#ff757f";
        };
        
        dashboard = {
          icon = "#272a3d";
          background = "#ffc777";
          border = "#ffc777";
          hover = "#504945";
        };
        
        icon = "#242438";
        text = "#c099ff";
        hover = "#444a73";
        icon_background = "#c099ff";
        background = "#272a3d";
        style = "default";
        borderColor = "#c099ff";
      };
      
      background = "#222436";
      border.color = "#c099ff";
    };
    
    osd = {
      label = "#c099ff";
      icon = "#222436";
      bar_overflow_color = "#ff757f";
      bar_empty_color = "#444a73";
      bar_color = "#c099ff";
      icon_container = "#c099ff";
      bar_container = "#1e2030";
      border.color = "#8ff0a4";
    };
    
    notification = {
      close_button = {
        label = "#222436";
        background = "#41a5b5";
      };
      labelicon = "#41a5b5";
      text = "#c8d3f5";
      time = "#9aa5ce";
      border = "#2f324d";
      label = "#41a5b5";
      actions = {
        text = "#24283b";
        background = "#41a5b5";
      };
      background = "#222436";
    };
  };
}
