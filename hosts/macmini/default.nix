{ inputs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ../../modules/os/mac/configuration.nix
    ../../modules/os/mac/homebrew.nix
    ../../modules/os/mac/home-manager.nix
    ../../modules/os/mac/system.nix
  ];

  networking.hostName = "macmini";
  
}