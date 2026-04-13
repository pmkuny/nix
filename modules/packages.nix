{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.firefox
    pkgs.google-chrome
    pkgs.gemini-cli
    pkgs.vscode
    pkgs.vlc
    pkgs.discord
    pkgs.obsidian
    pkgs.element-desktop
    pkgs.tailscale
    pkgs.wireguard-tools
    pkgs.zellij
  ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
    pkgs.steam
  ];
}
