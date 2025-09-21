{ pkgs, ... }@inputs:

{
  imports = [
    ./core
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      gcc
      nodejs
      python3
      ripgrep
      fd
    ];
  };

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        viAlias = false;
        vimAlias = true;

        statusline.lualine.enable = true;
        telescope.enable = true;
        mini.fuzzy.enable = true;
        filetree.neo-tree.enable = true;
        terminal.toggleterm.enable = true;
        formatter.conform-nvim.enable = true;
        tabline.nvimBufferline.enable = true;
                                
        lsp.enable = true;
        lsp.formatOnSave = true;
        languages = {
          enableTreesitter = true;

          nix={                             
           enable = true;
           format.enable=true;
          format.package = pkgs.nixfmt-rfc-style;
          };
          ts.enable = true;
        };
      };
    };
  };
}
