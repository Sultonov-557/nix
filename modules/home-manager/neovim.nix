{ pkgs, lib, ... }:
{
  xdg.configFile."nvim" = {
    source = ../config/neovim;
    recursive = true;
  };

  home.packages = with pkgs; [
    psmisc
    gcc
    lazygit
    lazydocker
    tree-sitter
  ];

  home.activation.installBunGlobals = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.bun}/bin/bun install -g drizzle-kit
  '';

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

}
