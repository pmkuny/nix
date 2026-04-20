{ inputs, username, userHomeConfig ? ../../home/${username}, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${username} = {
      imports = [
        userHomeConfig
        ../../home/firefox.nix
        ../../home/obsidian.nix
      ];

      home = {
        username = username;
        homeDirectory = "/Users/${username}";
        stateVersion = "25.11";
      };
    };
  };
}
