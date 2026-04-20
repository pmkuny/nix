{ ... }: {
  imports = [
    ../packages.nix
    ./git.nix
    ./zsh.nix
    ./ghostty.nix
  ];

  programs.home-manager.enable = true;
}
