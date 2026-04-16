{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "tpx1";
}
