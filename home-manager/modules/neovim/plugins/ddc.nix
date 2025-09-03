{pkgs, spkgs, ...}: let

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
      sha256 = "lnp6Hbht2uCz8cUVlQRxadUeb9Fg1lP+8oZdrTNOegQ=";
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
      sha256 = "YVGeHs6OgkqD3GMs2IuVXnOJoqcXSNP0eetX6AnqfBY=";
    };
  };
  ddc-ui-native = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-ui-native";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-ui-native";
      rev = "master";
      sha256 = "fWJDl/MdW3Ce99sqs60Cp6OghnGfsQFmIkOTDkAT9yw=";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = [
      spkgs.vimPlugins.denops-vim
      ddc-vim
      ddc-source-lsp
      ddc-source-around
      ddc-source-file
      ddc-filter-converter_remove_overlap
      ddc-filter-matcher_head
      ddc-filter-sorter_rank
      ddc-ui-native
    ];

    extraConfigLua = ''
      -- vim.fn["ddc#custom#patch_global"]('ui', 'pum'j
      -- vim.fn["ddc#custom#patch_global"]('sources', {'lsp', 'around', 'file'})
      -- vim.fn["ddc#custom#patch_global"]('sourceOptions', {
      --   _ = {
      --     matchers = {'matcher_head'},
      --     sorters = {'sorter_rank'},
      --     converters = {'converter_remove_overlap'}
      --   },
      --   around = {
      --     mark = {'around'}
      --   },
      -- })
      --
      -- vim.fn["ddc#enable"]()
    '';

    extraConfigVim = ''
      call ddc#custom#patch_global('sources', [
        \ 'around',
        \ 'lsp',
        \ 'file'
        \ ])

      call ddc#custom#patch_global('sourceOptions', {
        \ '_': {
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank'],
        \   'converters': ['converter_remove_overlap'],
        \ },
        \ 'around': {'mark': 'around'},
        \ 'lsp': {
        \   'mark': 'lsp',
        \   'matchers': ['matcher_head'],
        \   'forceCompletionPattern': '\.|:|->|"\w+/*'
        \ },
        \ 'file': {
        \   'mark': 'file',
        \   'isVolatile': v:true,
        \   'forceCompletionPattern': '\S/\S*'
        \ }})

      call ddc#custom#patch_global('ui', 'native')

      call ddc#enable()
    '';

    keymaps = [
      {
        action = ''
         pumvisible() ? '<C-n>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' : ddc#map#manual_complete()
        '';
        key = "<TAB>";
        mode = [ "i" ];
        options = {
          silent = true;
          noremap = true;
          expr = true;
        };
      }
      {
        action = "pumvisible() ? '<C-p>' : '<C-h>'";
        key = "<S-Tab>";
        mode = [ "i" ];
        options = {
          silent = true;
          noremap = true;
          expr = true;
        };
      }
    #   {
    #     action = "<cmd>call pum#confirm()<CR>";
    #     key = "C-y";
    #     mode = [ "i" ];
    #     options = {
    #       noremap = true;
    #       silent = true;
    #     };
    #   }
    ];
  };
}
