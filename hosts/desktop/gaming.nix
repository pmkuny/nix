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
    steam
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

  # Drive Settings
    fileSystems."/mnt/games/SSD1" = {
      device = "/dev/disk/by-uuid/960a7fde-833a-4406-8f12-0fb3e82419a3";
      fsType = "ext4";
      options = [ "nofail" "x-systemd.automount" ];
    };

    fileSystems."/mnt/games/HDD1" = {
      device = "/dev/disk/by-uuid/6e90ee87-c7c2-4f27-993d-940311a3815a";
      fsType = "ext4";
      options = [ "nofail" "x-systemd.automount" ];
    };

    fileSystems."/mnt/games/NVME1" = {
      device = "/dev/disk/by-uuid/23d8e320-408a-482c-9868-2987b5b75023";
      fsType = "ext4";
      options = [ "nofail" "x-systemd.automount" ];
    };

    fileSystems."/mnt/games/NVME2" = {
      device = "/dev/disk/by-uuid/490027bf-54eb-4e51-9ccf-7847eedda1da";
      fsType = "ext4";
      options = [ "nofail" "x-systemd.automount" ];
    };

}
