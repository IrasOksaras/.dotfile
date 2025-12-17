{pkgs, spkgs, ...}: let

  ddc-vim = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc.vim";
      tag = "v10.0.0";
      sha256 = "gxXtrSu6056BfuegSeNeaiACJxqLqVZ9uSnjl9t+vD0=";
    };
  };
  ddc-source-lsp = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-source-lsp";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-source-lsp";
      rev = "master";
      sha256 = "L81ttrA1tXB2RPwVyfjtphnJAIYZAC3eHc7PKfAkFQY=";
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
      sha256 = "UndfTc+awrlzJUziPEv5FFwwDjQTSqOVZXheQ/CERpg=";
    };
  };
  ddc-filter-converter_remove_overlap = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-filter-converter_remove_overlap";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "ddc-filter-converter_remove_overlap";
      rev = "master";
      sha256 = "dSob16PMRWIn0Qy1C3DCJmR+im+aqBSCR5/P1ZrhODA=";
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
      sha256 = "8zoRsX7ZNCNkokku0TW0LNkjXmBL8UCu8h3EAe4KQ+g=";
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
  ddc-ui-pum = pkgs.vimUtils.buildVimPlugin {
    name = "ddc-ui-pum";
    src = pkgs.fetchFromGitHub { 
      owner = "Shougo";
      repo = "ddc-ui-pum";
      rev = "master";
      sha256 = "kQ1fK65V0NtObqBy/FhcfACUGeI5Pk4t3Kw0BPpxChw=";
    };
  };
  pum-vim = pkgs.vimUtils.buildVimPlugin {
    name = "pum-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Shougo";
      repo = "pum.vim";
      tag = "2.0";
      sha256 = "bovYwcTjWXkvscc2p55Cb1pDEOHJPliYz1hsn0fhhiw=";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.denops-vim
      ddc-vim
      ddc-source-lsp
      ddc-source-around
      ddc-source-file
      ddc-filter-converter_remove_overlap
      ddc-filter-matcher_head
      ddc-filter-sorter_rank
      ddc-ui-native
      ddc-ui-pum
      pum-vim
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
        around = {
          mark = 'around'
        },
        lsp = {
          mark = 'lsp',
          matchers = {'matcher_head'},
          forceCompletionPattern = {'\\.|:|->|\"\\w+/*'}
        },
        file = {
          mark = 'file',
          isVolatile = 'v:true',
          forceCompletionPattern = {'\\S/\\S*'}
        }
      })

      vim.fn["ddc#enable"]()
    '';

    extraConfigVim = ''
      " call ddc#custom#patch_global('sources', [
      "   \ 'around',
      "   \ 'lsp',
      "   \ 'file'
      "   \ ])
      "
      " call ddc#custom#patch_global('sourceOptions', {
      "   \ '_': {
      "   \   'matchers': ['matcher_head'],
      "   \   'sorters': ['sorter_rank'],
      "   \   'converters': ['converter_remove_overlap'],
      "   \ },
      "   \ 'around': {'mark': 'around'},
      "   \ 'lsp': {
      "   \   'mark': 'lsp',
      "   \   'matchers': ['matcher_head'],
      "   \   'forceCompletionPattern': '\.|:|->|"\w+/*'
      "   \ },
      "   \ 'file': {
      "   \   'mark': 'file',
      "   \   'isVolatile': v:true,
      "   \   'forceCompletionPattern': '\S/\S*'
      "   \ }})
      "
      " call ddc#custom#patch_global('ui', 'pum')
      "
      " call ddc#enable()
      "
      " inoremap <silent><expr> <TAB>
      "   \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      "   \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      "   \ '<TAB>' : ddc#map#manual_complete()
      " inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
      inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
      inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
      inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
      inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
    '';

    keymaps = [
      # {
      #   action = ''
      #     function() return vim.fn['pum#visible']() and '<Cmd>call pum#map#insert_relative(+1)<CR>' or (vim.fn.col('.') <= 1 or vim.fn.getline('.'):sub(vim.fn.col('.') - 1, vim.fn.col('.') - 1):match('%s')) and '<TAB>' or vim.fn['ddc#map#manual_complete']() end
      #   '';
      #   key = "<TAB>";
      #   mode = [ "i" ];
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     expr = true;
      #   };
      # }
      # {
      #   action = "pumvisible() ? '<C-p>' : '<C-h>'";
      #   key = "<S-Tab>";
      #   mode = [ "i" ];
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     expr = true;
      #   };
      # }
      # {
      #   action = "<cmd>call pum#confirm()<CR>";
      #   key = "C-y";
      #   mode = [ "i" ];
      #   options = {
      #     noremap = true;
      #     silent = true;
      #   };
      # }
    ];
  };
}
