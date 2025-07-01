{pkgs, ...}: let
  fall-vim = pkgs.vimUtils.buildVimPlugin {
    name = "fall-vim";
    src = pkgs.fetchFromGitHub {
      owner = "vim-fall";
      repo = "fall.vim";
      rev = "main";
      sha256 = "";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = [
      fall-vim
    ];
  };
}
