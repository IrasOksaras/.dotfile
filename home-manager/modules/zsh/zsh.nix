{config, pkgs, ...}: {

  programs = {
    zsh = {
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
        lg = "lazygit";
      };

      initContent = ''
        # shellの言語を英語に
        export LANG=en_US.UTF-8
        export LC_ALL=en_US.UTF-8

        bindkey -v
        bindkey -M viins "jk" vi-cmd-mode

        # Enable Powerlevel10k instant prompt
        if [[ -r "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
        
        # Load Powerlevel10k config
        [[ -f ${config.home.homeDirectory}/.p10k.zsh ]] && source ${config.home.homeDirectory}/.p10k.zsh
      '';
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };

  home.file = {
    ".p10k.zsh".source = ./p10k.zsh;
  };
}
