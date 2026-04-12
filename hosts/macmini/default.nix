{ inputs, ... }:

{
  imports = [
    ../../modules/os/mac/configuration.nix
    ../../modules/os/mac/homebrew.nix
    ../../modules/os/mac/home-manager.nix
    ../../modules/os/mac/system.nix
  ];
}