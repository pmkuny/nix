{ config, lib, ... }:

{
  programs.firefox = {
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "browser.bookmarks.showMobileBookmarks" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.selectedEngine" = "DuckDuckGo";
        "privacy.donottrackheader.enabled" = true;
        "dom.security.https_only_mode" = true;
        "mousewhee.with_control.action" = 3; 
        "mousewheel.with_cmd.action" = 3;
      };
    };
  };
}
