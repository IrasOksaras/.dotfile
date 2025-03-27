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
    enableAutosuggestions = true;
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
    ];
    
    initExtra = ''
      # Enable Powerlevel10k instant prompt
      if [[ -r "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      
      # Load Powerlevel10k config
      [[ -f ${config.home.homeDirectory}/.p10k.zsh ]] && source ${config.home.homeDirectory}/.p10k.zsh
    '';
  };

  programs.wezterm = {
    enable = true;
  };

  home.packages = with pkgs; [
    pkgs.gns3-gui
    pkgs.gns3-server
    pkgs.deno
    pkgs.nodejs_23
    pkgs.terraform
    pkgs.ansible
  ];
  
  # p10k.zshファイルを管理
  home.file.".p10k.zsh".source = ./p10k.zsh;
}
