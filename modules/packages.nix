{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.gemini-cli
    pkgs.ollama
    pkgs.wireguard-tools
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.tmux
  ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
    pkgs.google-chrome
    pkgs.vscode
    pkgs.vlc
    pkgs.discord
    pkgs.element-desktop
    pkgs.tailscale
  ];
}
