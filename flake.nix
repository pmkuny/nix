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

  outputs = inputs@{ nix-darwin, nixpkgs, home-manager, ... }: 
  let
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in
  {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        ./hosts/mbp/default.nix 
        {
          nixpkgs.config.allowUnfree = true;
          nix.settings.experimental-features = "nix-command flakes";
        }
      ];
      specialArgs = { inherit inputs; };
    };

    darwinConfigurations."macmini" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        ./hosts/macmini/default.nix 
        {
          nixpkgs.config.allowUnfree = true;
          nix.settings.experimental-features = "nix-command flakes";
        }
      ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations."tpx1" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/tpx1/default.nix ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations."desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/desktop/default.nix
        ./hosts/desktop/gaming.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.patch = {
            imports = [ ./modules/home/patch ./modules/home/firefox.nix ./modules/home/obsidian.nix ];
            home.stateVersion = "25.11";
          };
          nixpkgs.config.allowUnfree = true;
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
