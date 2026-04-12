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
      ];

      home = {
        username = "patch";
        homeDirectory = "/home/patch";
        stateVersion = "24.05";
      };
    };
  };

  system.stateVersion = "24.05";
}
