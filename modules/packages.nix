{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.gemini-cli
    pkgs.ollama
    pkgs.zellij
    pkgs.wireguard-tools
  ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
    pkgs.firefox
    pkgs.google-chrome
    pkgs.vscode
    pkgs.vlc
    pkgs.discord
    pkgs.obsidian
    pkgs.element-desktop
    pkgs.tailscale
  ];
}
