{ inputs, ... }:

{
  imports = [
    ../linux/default.nix
    ./hardware-configuration.nix
  ];
}
