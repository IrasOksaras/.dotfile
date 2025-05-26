{config, pkgs, ...}:

{
  home = rec {
    username = "Iras";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "sudo" ];
    };
    
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    shellAliases = {
    };

    initContent = ''
      # shellの言語を英語に
      export LANG=C

      # Enable Powerlevel10k instant prompt
      if [[ -r "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      
      # Load Powerlevel10k config
      [[ -f ${config.home.homeDirectory}/.p10k.zsh ]] && source ${config.home.homeDirectory}/.p10k.zsh
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      deno
      nil
      nixd
    ];
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  programs.git = {
    enable = true;
    userName = "IrasOksaras";
    userEmail = "g024c1054@g.neec.ac.jp";
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      editor = "nvim";
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.wezterm = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
  };

  programs.ncspot = {
    enable = true;
  };

  home.packages = with pkgs; [
    gns3-gui
    gns3-server
    ranger
    screen
    spotify
    slack
    terraform
    ansible
    drawio
    tor-browser
    parsec-bin
    calcurse
    morgen
  ];
  
  # p10k.zshファイルを管理
  home.file = {
    ".p10k.zsh".source = ./p10k.zsh;
    
    ".tor\ project/Tor/torrc".source = ./torrc;

    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
