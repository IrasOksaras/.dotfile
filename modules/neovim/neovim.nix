{pkgs, ...}: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      deno
      nil
      nixd
    ];
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
