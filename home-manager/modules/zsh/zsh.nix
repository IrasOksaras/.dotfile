{config, pkgs, ...}: {

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
        highlighters = [ "pattern" "brackets" ];
        styles = {
          bracket-level-1 = "fg=blue,bold";
          bracket-level-2 = "fg=red,bold";
          bracket-level-3 = "fg=yellow,bold";
          bracket-level-4 = "fg=magenta,bold";
        };
        patterns = {
          "rm -rf *" = "fg=white,bold,bg=red";
        };
      };
      
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
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
        {
          name = "zsh-bench";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "zsh-bench";
            rev = "master";
            sha256 = "ZoALQoTaKhmEEdGne4obZ+qiUmloCbnjY/VL0q1c6Ok=";
          };
        }
      ];

      shellAliases = {
        kc = "kubectl";
        tf = "terraform";
      };

      initContent = ''
        # shellの言語を英語に
        export LANG=en_US.UTF-8
        export LC_ALL=en_US.UTF-8

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
