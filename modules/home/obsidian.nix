{ config, lib, pkgs, ... }:

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
        target = "Self";
        settings = {
          appearance = {
            "theme" = "system";
            "cssTheme" = "Solarized";
          };
          "corePlugins" = [
            "file-explorer"
            "global-search"
            "switcher"
            "graph"
            "bases"
            "command-palette"
            "properties"
            "tag-pane" 
            "templates"
            "backlink"
            "canvas"
            "sync" 
          ];
          themes = [{
            pkg = pkgs.runCommand "Solarized" {
              src = pkgs.fetchFromGitHub {
                owner = "harmtemolder";
                repo = "obsidian-solarized";
                rev = "master";
                sha256 = "sha256-E80sdh5cNGrgYP5rjVU2W4bWBDmZ3K9VEIdx7u5ITo4=";
              };
            } ''
              mkdir -p $out
              cp $src/theme.css $out/
              echo '{"id":"Solarized","name":"Solarized","version":"1.0.1","minAppVersion":"0.15.0"}' > $out/manifest.json
            '';
          }];
        };
      };
    };
  };

  # Manually manage sync.json as the obsidian module doesn't handle it directly
  home.file."${config.home.homeDirectory}/Self/.obsidian/sync.json".text = builtins.toJSON {
    "id" = "Self"; # Replace with your Remote Vault ID
    "connection" = "cloud";
  };
}