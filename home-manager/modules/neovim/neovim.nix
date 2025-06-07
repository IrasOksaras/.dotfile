{inputs, pkgs, ...}: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins.nix
  ];

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   withNodeJs = false;
  #   withPython3 = false;
  #   withRuby = false;
  #   extraPackages = with pkgs; [
  #     deno
  #     nil
  #     nixd
  #   ];
  #   plugins = [
  #     pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  #   ];
  #   extraLuaConfig = builtins.readFile ./init.lua;
  # };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
    # dependencies = {
    #   tree-sitter = {
    #     enable = true;
    #     package = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
    #   };
    # };
    extraPackages =  [
      pkgs.deno
      pkgs.nixd
    ];
    extraConfigLua = builtins.readFile ./init.lua;
  };
}
