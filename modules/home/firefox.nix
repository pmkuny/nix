{ config, lib, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://example.com";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.selectedEngine" = "DuckDuckGo";
        "privacy.donottrackheader.enabled" = true;
        "dom.security.https_only_mode" = true;
      };
      extensions = [
        # Add shared extensions here if needed
      ];
    };
  };
}
