{inputs, pkgs, ...}: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
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
    viAlias = true;
    dependencies = {
      tree-sitter = {
        enable = true;
        package = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
    extraPackages = with pkgs; [
      deno
    ];
    extraConfigLua = builtins.readFile ./init.lua;
  };
}
