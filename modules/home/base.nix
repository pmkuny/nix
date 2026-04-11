{ pkgs, ...}: {
    
    
    programs.zsh = {
        enable = true;
    
        shellAliases = {
        ll = "ls -al";
        };
   };

    programs.git.enable = true;
    programs.home-manager.enable = true;
}
    


