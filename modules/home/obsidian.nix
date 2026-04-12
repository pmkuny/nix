{ config, lib, ... }:

{
  programs.obsidian = {
    cli.enable = true;

    enable = true;
    plugins = [
      "dataview"
      "calendar"
      "kanban"
    ];
    settings = {
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
        settings = {
          # Vault-specific settings can go here
        };
      };
    };
  };
}