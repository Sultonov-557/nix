{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        snippet.enable = true;

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];

        mapping = {
          "<C-p>" = "mapping.select_prev_item()";
          "<C-n>" = "mapping.select_next_item()";
          "<C-y>" = "mapping.confirm({ select = true })";
          "<C-Space>" = "mapping.complete()";
          "<CR>" = "mapping.confirm({ select = true })";
        };
      };
    };

    luasnip.enable = true;
  };
}
