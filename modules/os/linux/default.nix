{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # Enable Flakes and the new 'nix' command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NetworkManager
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Thunderbolt
  services.hardware.bolt.enable = true;

  # Mac Keybinds
  services.keyd = {
    enable = true;
  };
  

  # Enable sound with pipewire.
  services.pipewire.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # NixOS user definition
  users.users.patch = {
    isNormalUser = true;
    description = "patch";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password"; # Change this immediately after login
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.patch = {
      imports = [
        ../../home/patch
        ../../packages.nix
      ];
      home = {
        username = "patch";
        homeDirectory = "/home/patch";
        stateVersion = "25.11";
      };
    };
  };
}
