{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      # Better window navigation
      {
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
      }

      # Resize with arrows
      {
        key = "<C-Up>";
        action = ":resize -2<CR>";
      }
      {
        key = "<C-Down>";
        action = ":resize +2<CR>";
      }
      {
        key = "<C-Left>";
        action = ":res -2<CR>";
      }
      {
        key = "<C-Right>";
        action = ":res +2<CR>";
      }

      # File explorer
      {
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
      }

      # Telescope
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
      }

      # LSP
      {
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      }
      {
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      }
      {
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
      }
      {
        key = "gi";
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
      }
      {
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
      }
      {
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      }
      {
        key = "<leader>rn";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      }

      # Diagnostics
      {
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      }
      {
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      }
      {
        key = "<leader>d";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      }
    ];
  };
}
