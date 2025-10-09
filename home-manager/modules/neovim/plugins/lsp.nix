{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = false;
      servers = {
        nixd = {
          enable = true;
        };
        bashls = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        pylsp = {
          enable = true;
        };
        html = {
          enable = true;
        };
        cssls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
          extraOptions = {
            settings = {
              javascript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayParameterNameHints = "all";
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayVariableTypeHints = true;
                };
              };
            };
          };
        };

        terraformls = {
          enable = true;
        };
      };
    };
  };
}
