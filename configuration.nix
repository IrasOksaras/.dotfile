# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.xremap.nixosModules.default
  ];
  # ++ (with.inputs.nixos-hardware.nixosModules; [
  #   common-cpu-intel-meteor-lake
  #   common-gpu-intel-meteor-lake
  #   common-ssd
  # ]);

  # nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  networking.hostName = "ThinkBook-E14-G7"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = [pkgs.fcitx5-mozc];
    };
  };

  services.xremap = {
    userName = "Iras";
    serviceMode = "system";
    config = {
      modmap = [
        {
          name = "CapsLock is dead";
          remap = {
            CapsLock = "Ctrl_L";
          };
        }
      ];
    };
  };

  # フォント設定
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      twemoji-color-font
      nerd-fonts.noto
      hackgen-nf-font
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
    desktopManager.plasma6.enable = true;
    # xserver = {
    #   enable = true;
    #   xkb.layout = "jp";
    # };
  };

  environment.variables = {
    TERMINAL = "${pkgs.wezterm}/bin/wezterm";
  };
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.Iras = {
    isNormalUser = true;
    shell = pkgs.zsh;
    createHome = true;
    uid = 1000;
    extraGroups = [ "wheel" "libvirtd" "kvm" "wireshark" "ubridges" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      ocs-url
      discord
      zoom-us
      remmina
      ciscoPacketTracer8
    ];
  };

  environment.systemPackages = with pkgs; [
    wayland
    wl-clipboard-rs
    ubridge
    busybox
    dynamips
    qemu
    docker-compose
    virt-manager
    # wayland-protocols
    tree
    wget
    aria2
    htop
    rnnoise-plugin
    nur.repos.ataraxiasjel.waydroid-script
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

  virtualisation = {
    virtualbox.host = {
      enable = true;
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
    waydroid.enable = true;
  };
  users.extraGroups.vboxusers.members = ["Iras"];

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
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # sound config
  services.pulseaudio.enable = false;
  hardware.alsa.enablePersistence = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
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
    jack.enable = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # programs.dconf.enable = true;

  # environment.sessionVariables = {
  #   # Waylandを優先
  #   MOZ_ENABLE_WAYLAND = "1";
  #   NIXOS_OZONE_WL = "1";  # Electronアプリのためのオゾンバックエンド
  #   
  #   # IMEの設定
  #   GTK_IM_MODULE = "fcitx";  # または "ibus"
  #   QT_IM_MODULE = "fcitx";   # または "ibus"
  #   XMODIFIERS = "@im=fcitx"; # または "@im=ibus"
  #   SDL_IM_MODULE = "fcitx";  # または "ibus"
  # };

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
    # 競合する為無効化
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 0;
      };
    };
  };

  # system.stateVersion = "24.11"; # Did you read the comment?

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

