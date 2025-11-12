# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ inputs, config, lib, pkgs, spkgs, username, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    inputs.xremap.nixosModules.default
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          # ControllerMode = "le";
          Experimental = true;
          KernelExperimental = true;
        };
      };
    };
  };

  networking.hostName = "ThinkBook-E14-G7"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager = {
    enable = true;  # Easiest to use and most distros use this by default.
    wifi = {
      # backend = "iwd";
      powersave = true;
    };
  };

  # services.connman = {
  #   enable = true;
  #   wifi = {
  #     backend = "iwd";
  #   };
  # };

  # networking.wireless.iwd = {
  #   enable = true;
  #   settings = {
  #     Network = {
  #       EnableIPv6 = true;
  #     };
  #     Scan = {
  #       DisablePeriodicScan = true;
  #     };
  #     Settings = {
  #       # AutoConnect = true;
  #     };
  #   };
  # };

  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  services.udisks2 = {
    enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  services.upower = {
    enable = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "ja_JP.UTF-8/UTF-8" ];
  };

  services.xremap = {
    userName = "${username}";
    serviceMode = "system";
    config = {
      modmap = [
        {
          name = "CapsLock is dead";
          remap = {
            CapsLock = "Ctrl_L";
          };
        }
        # {
        #   name = "Ctrl_L is SUPER";
        #   remap = {
        #     Ctrl_L = "Super_R";
        #   };
        # }
      ];
    };
  };

  security.polkit = {
    enable = true;
  };

  # 指紋認証
  # systemd.services.fprintd = {
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig.type = "simple";
  # };
  # services.fprintd = {
  #   enable = true;
  #   # tod = {
  #   #   enable = true;
  #   #   driver = pkgs.libfprint-2-tod1-goodix;
  #   # };
  # };
  
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      EntryNodes = "hashy10G";
    };
  };

  programs = {
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };

  services.gns3-server = {
    enable = true;
    package = spkgs.gns3-server;
    ubridge.enable = true;
    vpcs.enable = true;
    dynamips = {
      enable = true;
      package = spkgs.dynamips;
    };
    settings = {
      serverConfig = {
        host = "localhost";
        port = 3080;
        # projects_path = "/home/${username}/GNS3/projects";
        # configs_path = "home/${username}/GNS3/configs";
        # images_path = "home/${username}/GNS3/images";
        # symbols_path = "home/${username}/GNS3/symbols";
        # appliances_path = "home${username}/GNS3/applications";
      };
    };
  };

  # フォント設定
  fonts = {
    packages = [
      pkgs.noto-fonts-cjk-serif
      pkgs.noto-fonts-cjk-sans
      pkgs.twemoji-color-font
      pkgs.nerd-fonts.noto
      pkgs.hackgen-nf-font
      pkgs.jetbrains-mono
      pkgs.minecraftia
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Twemoji Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Twemoji Clolor Emoji"];
        monospace = ["JetBrainMono Nerd Font" "Twemoji Color Emoji"];
        emoji = ["Twemoji Color Emoji"];
      };
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "jp106";
  #   useXkbConfig = true; # use xkb.options in tty.
  };

  services = {
    displayManager.sddm.enable = true;
    # desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "jp";
      xkb.model = "jp106";
    };
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    createHome = true;
    uid = 1000;
    extraGroups = [
      "dialout"
      "docker"
      "kvm"
      "libvirtd"
      "lp"
      "networkmanager"
      "wheel"
      "audio"
      "wireshark"
    ];
    packages = [
      pkgs.ciscoPacketTracer8
      # pkgs.discord
      pkgs.remmina
      # pkgs.zoom-us
    ];
  };

  environment.systemPackages = [
    # pkgs.rnnoise-plugin
    # pkgs.wayland-protocols
    pkgs.libimobiledevice
    pkgs.ifuse
    pkgs.vbam
    pkgs.aria2
    pkgs.bluetuith
    pkgs.busybox
    pkgs.docker-compose
    pkgs.htop
    pkgs.intel-gpu-tools
    pkgs.kdePackages.print-manager
    pkgs.nur.repos.ataraxiasjel.waydroid-script
    pkgs.nyx
    pkgs.tree
    pkgs.virt-manager
    pkgs.wayland
    pkgs.wget
    pkgs.wl-clipboard-rs
  ];

  users.groups.wireshark = {
    gid = 500;
  };

  programs = {
    zsh.enable = true;
    git.enable = true;
    firefox.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };

  services.llama-cpp = {
    enable = true;
    model = "/models/qwen2.5-coder-1.5b-instruct-q4_k_m.gguf";
    extraFlags = [
      "--n-gpu-layers"
      "99"
      "--jinja"
    ];
    port = 8081;
    package = spkgs.llama-cpp.override { vulkanSupport = true; };
  };

  virtualisation = {
    virtualbox.host = {
      enable = true;
      package = spkgs.virtualbox;
      enableExtensionPack = true;
      enableKvm = true;
      addNetworkInterface = false;
    };
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd.enable = true;
    waydroid = {
      enable = true;
      package = pkgs.waydroid; 
    };
  };
  users.extraGroups.vboxusers.members = ["${username}"];

  # tailscale（VPN）を有効化

  services.tailscale.enable = true;

  networking.firewall = {
    enable = true;
    # tailscaleの仮想NICを信頼する
    # `<Tailscaleのホスト名>:<ポート番号>`のアクセスが可能になる
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [config.services.tailscale.port];
    checkReversePath = "loose";
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # sound config
  services.pulseaudio.enable = false;
  hardware.alsa.enablePersistence = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    package = pkgs.pipewire.override { bluezSupport = true; };
    extraConfig = {
      pipewire = {
        adfust-sample-rate = {
          "context.properties" = {
            "default.clock.rate" = 96000;
            #"default.allowed-rates" = [ 96000 88200 48000 44100 ];
            "default.allowed-rates" = [ 96000 ];
            #"default.clock.quantum" = 4096;
          };
        };
      };
    };
    alsa = {
      enable = true;
      support32Bit = true;
    };
    # jack.enable = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  xdg = {
    # terminal-exec = {
    #   enable = true;
    #   settings = {
    #     default = [
    #       "${pkgs.wezterm}/share/applications/org.wezfurlong.wezterm.desktop"
    #     ];
    #   };
    # };
    portal = {
      enable = true;
    };
  };

  # printerSetting
  services = {
    printing = {
      enable = true;
      drivers = [
        pkgs.epson-escpr2
        pkgs.epson-escpr
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # programs.dconf.enable = true;

  environment.sessionVariables = {
  #   # Waylandを優先
  #   MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";  # Electronアプリのためのオゾンバックエンド
  #   
  #   # IMEの設定
    # GTK_IM_MODULE = "wayland";  # または "ibus"
    # QT_IM_MODULE = "wayland";   # または "ibus"
    # xwayland用
    XMODIFIERS = "@im=fcitx"; # または "@im=ibus"
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .

  # power management
  powerManagement.powertop.enable = true;
  services = {
    # tlpと競合する為無効化
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 0;
      };
    };
  };

  system.stateVersion = "25.11"; # Did you read the comment?

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}

