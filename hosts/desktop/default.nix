{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./gaming.nix
  ];

  # Bootloader for Desktop
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Specific settings for NixOS Desktop
  networking.hostName = "desktop";

  services.displayManager.gdm.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;
  services.dbus.enable = true;
  environment.systemPackages = with pkgs; [
	polkit_gnome
  ];

  nixpkgs.config.allowUnfree = true;


  system.stateVersion = "25.11";
}
