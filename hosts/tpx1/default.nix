{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "tpx1";

  system.stateVersion = "24.05";
}
