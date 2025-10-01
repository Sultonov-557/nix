{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    # Fuzzy finding
    telescope = {
      enable = true;
      extensions.ui-select.enable = true;
    };

    # Git integration
    gitsigns.enable = true;

    # Shows keybindings
    which-key.enable = true;

    # Commenting
    comment.enable = true;
  };
}
