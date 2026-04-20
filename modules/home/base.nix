{ ... }: {
  imports = [
    ../packages.nix
    ./git.nix
    ./zsh.nix
    ./ghostty.nix
    ./neovim.nix
  ];

  programs.home-manager.enable = true;
}
