{ inputs, ... }:

{
  imports = [
    ../../modules/os/linux/default.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "tpx1";
}
