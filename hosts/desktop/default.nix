{ config, pkgs, ... }:

{
  # Specific settings for NixOS Desktop
  networking.hostName = "desktop";
  
  # Note: You will need to add your hardware-configuration.nix and bootloader settings here.
}
