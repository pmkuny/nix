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
        ../../modules/home/firefox
        ../../modules/home/obsidian
      ];

      home = {
        username = "patch";
        homeDirectory = "/Users/patch";
        stateVersion = "24.05";
      };
    };
  };
}