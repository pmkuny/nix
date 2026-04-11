{ ... }: {
  homebrew = {
    enable = true;
    brews = [
  "starship"
  ];
    casks = [
  "alt-tab"
  "anaconda"
  "discord"
  "element"
  "eqmac"
  "firefox"
  "font-hack-nerd-font"
  "google-chrome"
  "iterm2"
  "jordanbaird-ice"
  "kiro"
  "kiro-cli"
  "linearmouse"
  "macmediakeyforwarder"
  "microsoft-auto-update"
  "microsoft-teams"
  "microsoft-word"
  "mullvad-vpn"
  "music-presence"
  "notunes"
  "nvidia-geforce-now"
  "obsidian"
  "onedrive"
  "raycast"
  "stats"
  "steam"
  "stremio"
  "tailscale-app"
  "tidal"
  "visual-studio-code"
  "vlc"
 ];

  onActivation = {
    autoUpdate = false;
    upgrade = false;
    cleanup = "uninstall";
  };
 };
}
