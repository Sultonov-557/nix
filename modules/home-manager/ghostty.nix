{ pkgs, lib, ... }@inputs:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    clearDefaultKeybinds = true;

    settings = {
      keybind = [
        "copy=copy_to_clipboard"
        "paste=paste_from_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
      ];
    };
  };
}
