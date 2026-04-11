{ inputs, ... }:

{
  imports = [
    ../mac/configuration.nix
    ../mac/homebrew.nix
    ../mac/home-manager.nix
    ../mac/system.nix
  ];
}