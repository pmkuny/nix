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
    
    local = if builtins.pathExists ./local.nix then (import ./local.nix inputs) else { };
  in
  {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

    darwinConfigurations = {
      "mbp" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ 
          ./modules/os/mac/default.nix
          ./hosts/mbp/default.nix
        ];
        specialArgs = { inherit inputs; hostname = "mbp"; username = "patch"; };
      };

      "macmini" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/os/mac/default.nix
          ./hosts/macmini/default.nix
        ];
        specialArgs = { inherit inputs; hostname = "macmini"; username = "patch"; };
      };
    } // (local.darwinConfigurations or { });

    nixosConfigurations = {
      "tpx1" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./modules/os/linux/default.nix
          ./hosts/tpx1/default.nix 
        ];
        specialArgs = { inherit inputs; };
      };

      "desktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/os/linux/default.nix
          ./hosts/desktop/default.nix
#	/etc/nixos/configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    } // (local.nixosConfigurations or { });
  };
}
