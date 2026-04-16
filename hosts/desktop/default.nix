{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Specific settings for NixOS Desktop
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
}
