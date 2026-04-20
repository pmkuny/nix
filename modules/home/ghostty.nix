{ pkgs, lib, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  programs.ghostty = {
    enable = true;
    
    # On Darwin, we use the Homebrew cask for the app bundle to get better 
    # macOS integration, but we still want Home Manager to manage the config.
    package = if isDarwin then null else pkgs.ghostty;

    # These options require the Nix package to be present to extract files.
    installVimSyntax = !isDarwin;
    enableZshIntegration = true; # This usually just adds to shell init, so it's safe.
    
    settings = {
      theme = "dark:iTerm2 Solarized Dark,light:iTerm2 Solarized Light";
      font-size = 16;
      cursor-style = "block";
    };
  };
}
