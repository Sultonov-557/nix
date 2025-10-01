{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
          rust-analyzer.enable = true;
          pyright.enable = true;
          tsserver.enable = true;
          html.enable = true;
          cssls.enable = true;
        };
      };
    };

    extraConfigLua = ''
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    '';
  };
}
