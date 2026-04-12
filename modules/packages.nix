{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.firefox
    pkgs.google-chrome
    pkgs.gemini-cli
    pkgs.vscode
    pkgs.vlc
    pkgs.steam
    pkgs.discord
    pkgs.obsidian
    pkgs.element-desktop
    pkgs.tailscale
    pkgs.wireguard-tools
  ];
}
