{ ... }:

{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    #termguicolors = true;
    ignorecase = true;
    smartcase = true;

    undofile = true;
    swapfile = false;
    backup = false;
    autoread = true;

    cursorline = true;
    signcolumn = "yes";
    hlsearch = true;
    incsearch = true;

    scrolloff = 8;
    sidescrolloff = 8;

    completeopt = "menu,menuone,noselect";
  };
}
