{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.patch = {
      imports = [
        ../../home/patch
        ../../home/firefox.nix
        ../../home/obsidian.nix
      ];

      home = {
        username = "patch";
        homeDirectory = "/Users/patch";
        stateVersion = "25.11";
      };
    };
  };
}
