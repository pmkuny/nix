{ pkgs, config, ...}: {
    imports = [
        ../packages.nix
    ];

    programs.zsh = {
        enable = true;
    
        shellAliases = {
        ll = "ls -al";
        };
   };

    programs.git.enable = true;
    programs.home-manager.enable = true;

    # Prepare for sops-nix (requires sops-nix to be added to flake inputs)
    # sops = {
    #   age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    #   defaultSopsFile = ../../secrets/secrets.yaml;
    #   secrets.example_api_key = {};
    # };

    home.packages = with pkgs; [
        bitwarden-cli
        age
        sops
    ];
}
    
