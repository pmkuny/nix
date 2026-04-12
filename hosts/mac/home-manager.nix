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
        ../../modules/home/patch
        ../../modules/home/firefox.nix
        ../../modules/home/obsidian.nix
      ];

      home = {
        username = "patch";
        homeDirectory = "/Users/patch";
        stateVersion = "25.11";
      };
    };
  };
}
