{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Float and center some dialogs
      "float,title:^(Open File)$"
      "float,title:^(Select a File)$"
      "float,title:^(Open Folder)$"
      "float,title:^(Save As)$"
      "float,title:^(Save File)$"
      "float,title:^(Authentication)$"
      "float,title:^(branchdialog)$"
      "float,title:Picture in Picture"
      "pin,title:Picture in picture"
      "float,title:Picture-in-Picture"
      "pin,title:Picture-in-picture"

      # Set opacity for some applications
      "opacity 0.8,class:^(kitty)$"
      "opacity 0.9,class:^(rofi)$"

    ];
  };
}
