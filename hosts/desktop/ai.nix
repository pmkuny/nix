{ config, pkgs, lib, ... }:

{
    # Enable locally-run AI. Optional
    options.localai.enable = lib.mkEnableOption "Locally-run AI";

    config = lib.mkIf config.localai.enable {
        services.ollama = {
            enable = true;
            host = "0.0.0.0";
            port = 11434;
            openFirewall = true;
        };
    };
}
