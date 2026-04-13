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

    # CachyOS / Standalone Home Manager Configuration
    homeConfigurations."desktop" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./hosts/desktop/default.nix
        ./modules/home/patch
        ./modules/home/firefox.nix
        ./modules/home/obsidian.nix
        ./modules/packages.nix
        {
          home.username = "patch";
          home.homeDirectory = "/home/patch";
          home.stateVersion = "25.11";
          programs.home-manager.enable = true; nixpkgs.config.allowUnfree = true;
        }
      ];
    };
  };
}
