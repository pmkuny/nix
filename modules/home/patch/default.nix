{ config, pkgs, ... }: {

    imports = [
      ../base.nix
      ../patch/vim.nix
    ];


  # USER IDENTITY (overrides base defaults)
         programs.git.settings = {
                user.name = "Patrick Kuny";
                user.email = "31052319+pmkuny@users.noreply.github.com";
            };

# set up shell
    programs.zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        initContent = ''
            eval "$(starship init zsh)"
        '';
         
            shellAliases = {
            vi = "vim";
            k = "kubectl";
            tf = "terraform";
            pl = "pulumi";
        };
    };
    
    programs.vim = {
        enable = true;
        defaultEditor = true;
    };
        
    
}
