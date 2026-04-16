{ config, pkgs, lib, ... }:

{
  # NixOS System-level Gaming Configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    gamescope-wsi
    protonup-qt
    lutris
    heroic
    wine
    winetricks
    steam-run
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.sessionVariables = {
    RADV_PERFTEST = "aco";
    MANGOHUD = "1";
  };
}