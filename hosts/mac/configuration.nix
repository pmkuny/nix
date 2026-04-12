{ pkgs, ... }: {
  environment.systemPackages = [ 
    pkgs.git 
    pkgs.vim 
    pkgs.tree
    ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.zsh.enable = true;

  system.stateVersion = 6;  # for macOS 26

  system.primaryUser = "patch";

  users.users.patch.home = "/Users/patch";


  # Determinate Nix will manage nix itself, instead of Nix Darwin
  nix.enable = false;
  homebrew.enable = true;
}
