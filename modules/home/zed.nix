{ config, lib, ... }:

{
  programs.zed-editor = {
      enable = true;
      userSettings = {
        buffer_font_size = 16;
        buffer_font_family = "JetBrains Nerd Font Mono";
        base_keymap = "VSCode";
        vim_mode = true;
        ui_font_size = 16;
        theme = {
          mode = "system";
          light = "One Light";
          dark = "One Dark";
        };
      };
  };
}
