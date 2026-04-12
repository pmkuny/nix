{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.patch = {
      imports = [
        ../../modules/home/patch
        ../../modules/packages
        ../../modules/home/firefox
        ../../modules/home/obsidian
      ];

      home = {
        username = "patch";
        homeDirectory = "/home/patch";
        stateVersion = "25.11";
      };
    };
  };

  system.stateVersion = "24.05";
}
