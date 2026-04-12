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
      ];

      home = {
        username = "patch";
        homeDirectory = "/Users/patch";
        stateVersion = "25.11";
      };
    };
  };
}
