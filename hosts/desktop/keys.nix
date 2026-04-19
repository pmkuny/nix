{ config, pkgs, lib, ... }:

{
  services.keyd = {
  enable = true;

  keyboards = {
    default = {
      ids = [ "*" ];

      settings = {
        # Keep Cmd as real Super so GNOME detects it
        main = {
          leftmeta = "leftmeta";
          rightmeta = "rightmeta";
        };

        # Cmd layer: translate Cmd+X → Ctrl+X
        meta = {
          a = "C-a";
          c = "C-c";
          v = "C-v";
          x = "C-x";
          z = "C-z";
          n = "C-n";
          t = "C-t";
          w = "C-w";
          f = "C-f";
          r = "C-r";
          s = "C-s";
          p = "C-p";
          q = "C-q";
        };

        # Detect terminal apps (match WM_CLASS)
        terminals = {
          "gnome-terminal-server" = "";
          "Gnome-terminal" = "";
          "Alacritty" = "";
          "org.wezfurlong.wezterm" = "";
        };

        # Disable Cmd→Ctrl mapping inside terminals
        "terminals:meta" = {
          a = "a";
          c = "c";
          v = "v";
          x = "x";
          z = "z";
          n = "n";
          t = "t";
          w = "w";
          f = "f";
          r = "r";
          s = "s";
          p = "p";
          q = "q";
          tab = "tab";
        };
      };
    };
  };
};
}

