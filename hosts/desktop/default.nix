{ config, pkgs, ... }:

{
  # Specific settings for CachyOS Desktop
  home.packages = with pkgs; [
    # Any desktop-specific tools you want
    steam
  ];

    networking.hostName = "desktop";

}
