{pkgs, ...}: let
  ddc-vim = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc.vim";
      tag = "v9.5.0";
      sha256 = "V0XVfP9Yy96epBpHjC4COCHNcrWatXM72I8pkwYjOWA=";
    };
  };
  denops-helloworld-vim = pkgs.vimUtils.buildVimPlugin {
    name = "denops-helloworld-vim";
    src = pkgs.fetchFromGitHub {
      owner = "vim-denops";
      repo = "denops-helloworld.vim";
      tag = "v2.0.0";
      sha256 = "nbeSKGRNZ/XV8B6CQc5wE6rn8GPFOVDVM8vxKCSrVHM=";
    };
  };
in {
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.denops-vim
    denops-helloworld-vim
    ddc-vim
  ];
}
