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
  ddc-source-lsp = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-source-lsp";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-source-lsp";
      rev = "master";
      sha256 = "CVFPcY0NzGJXDsBLQtFUhJ6LSidkKRvc9vFtXb+SeHA=";
    };
  };
  ddc-source-around = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-source-around";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-source-around";
      rev = "master";
      sha256 = "pxokusyjhlChP707KuD1ESmPcKPehHfkG9b+026+KCg=";
    };
  };
  ddc-source-file = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-source-file";
    src = pkgs.fetchFromGitHub {
      owner = "LumaKernel";
      repo = "ddc-source-file";
      rev = "master";
      sha256 = "jd7dChYLKa0bflVsdZie42XIGFsFrQ9G5cv2IQW88ic=";
    };
  };
  ddc-filter-converter_remove_overlap = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-filter-converter_remove_overlap";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-filter-converter_remove_overlap";
      rev = "master";
      sha256 = "e8BS0Q0N4lwvzXZoFneK7O4pFNRbYX0Ybwj6+FIwUIk=";
    };
  };
  ddc-filter-matcher_head = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-filter-matcher_head";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-filter-matcher_head";
      rev = "master";
      sha256 = "4dgZ2onmWZgNcMpaCnwUTORRh8N3rwxAoG3FfkDNDfY=";
    };
  };
  ddc-filter-sorter_rank = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-filter-sorter_rank";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-filter-sorter_rank";
      rev = "master";
      sha256 = "CFkfhRmF17lo8+sxZb80UnA79Hzc8Qvl5tQeYE8TC+w=";
    };
  };
  pum-vim = pkgs.vimUtils.buildVimPlugin {
    name = "pum-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "pum.vim";
      rev = "master";
      sha256 = "zr7ne+Gh3WvNdOEzmz28ZZdcV50whSD3ZGyzCeXAlgs=";
    };
  };
  ddc-ui-pum = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-ui-pum";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-ui-pum";
      rev = "master";
      sha256 = "5T+QAVF4H5Tp1asG4IsfbLI+grmOAVT7yDoHVdcfQG4=";
    };
  };
  ddc-ui-native = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-ui-native";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-ui-native";
      rev = "master";
      sha256 = "vW+W888Wrq0Jez+aghErDYHZFZ4xHjXjspwB9Kjlm5g=";
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
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.denops-vim
      denops-helloworld-vim
      ddc-vim
      ddc-source-lsp
      ddc-source-around
      ddc-source-file
      ddc-filter-converter_remove_overlap
      ddc-filter-matcher_head
      ddc-filter-sorter_rank
      pum-vim
      ddc-ui-pum
      ddc-ui-native
    ];
    extraConfigLua = ''
      vim.fn["ddc#custom#patch_global"]('ui', 'pum')
      vim.fn["ddc#custom#patch_global"]('sources', {'lsp', 'around', 'file'})
      vim.fn["ddc#custom#patch_global"]('sourceOptions', {
        _ = {
          matchers = {'matcher_head'},
          sorters = {'sorter_rank'},
          converters = {'converter_remove_overlap'}
        },
      })

      vim.fn["ddc#enable"]()
    '';
    keymaps = [
      {
        action = "<cmd>call pum#map#insert_relative(+1)<CR>";
        key = "C-n";
        mode = [ "i" ];
        options = {
        };
      }
      {
        action = "<cmd>call pum#map#insert_relative(-1)<CR>";
        key = "C-n";
        mode = [ "i" ];
        options = {
        };
      }
      {
        action = "<cmd>call pum#confirm()<CR>";
        key = "C-y";
        mode = [ "i" ];
        options = {
        };
      }
    ];
  };
}
