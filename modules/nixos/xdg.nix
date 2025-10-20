{ ... }:

{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # Set Neovim as the default for plain text
  xdg.mime.defaultApplications."text/plain" = "nvim.desktop";
}
