{ config, lib, ... }:

{
  programs.obsidian = {
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
    };
  };
}