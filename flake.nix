{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nix-darwin, nixpkgs, home-manager, ... }: {
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      modules = [
        ./hosts/mbp/default.nix
      ];
    
    specialArgs = { inherit inputs; };
    };

    darwinConfigurations."macmini" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      modules = [
        ./hosts/macmini/default.nix
      ];
    
    specialArgs = { inherit inputs; };
    };

    nixosConfigurations."desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/desktop/default.nix
      ];

      specialArgs = { inherit inputs; };
    };

    nixosConfigurations."tpx1" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/tpx1/default.nix
      ];

      specialArgs = { inherit inputs; };
    };
  };
}
