{ hostname, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  imports = [ ];

  networking.hostName = hostname;

}