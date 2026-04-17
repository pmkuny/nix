{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./hardware-configuration.nix
  ];

  # Bootloader for Desktop
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Specific settings for NixOS Desktop
  networking.hostName = "desktop";

  system.stateVersion = "25.11";
}
