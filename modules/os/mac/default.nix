{ inputs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin"; # Assuming all macs are aarch64-darwin

  imports = [
    ./configuration.nix
    ./homebrew.nix
    ./home-manager.nix
    ./system.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
}