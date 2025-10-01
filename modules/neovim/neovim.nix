{ pkgs, ... }:

{
  imports = [
    ./config/editor.nix
    ./config/ui.nix
    ./config/keymaps.nix
    ./config/plugins.nix
    ./config/lsp.nix
    ./config/completion.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
