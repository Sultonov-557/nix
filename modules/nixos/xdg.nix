{ ... }:

{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # Set Zen Browser as the default browser
  xdg.mime.defaultApplications."text/html" = "zen-browser.desktop";
  xdg.mime.defaultApplications."x-scheme-handler/http" = "zen-browser.desktop";
  xdg.mime.defaultApplications."x-scheme-handler/https" = "zen-browser.desktop";
  xdg.mime.defaultApplications."x-scheme-handler/about" = "zen-browser.desktop";
  xdg.mime.defaultApplications."x-scheme-handler/unknown" = "zen-browser.desktop";

  # Set Neovim as the default for plain text
  xdg.mime.defaultApplications."text/plain" = "nvim.desktop";
}
