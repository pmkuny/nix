{ config, lib, ... }:

{
  programs.obsidian = {
    cli.enable = true;

    enable = true;
    defaultSettings.app = {
      "spellcheck" = true;
      "vimMode" = true;
      "showLineNumber" = true;
      "readableLineLength" = true;
      "newFileLocation" = "00 - Atomic";
      "propertiesInDocument" = "source";
      "livePreview" = true;
    };
    vaults = {
      self = {
        enable = true;
        target = config.home.homeDirectory + "/Self";

      };
    };
  };
}
