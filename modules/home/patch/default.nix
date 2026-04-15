{ config, pkgs, ... }: 


#let
#  zellijeval = ''
#    if [[ -z "$ZELLIJ" ]]; then
#        if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
#            zellij attach -c
#        else
#            zellij
#        fi
#
#        if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
#            exit
#        fi
#    fi
#  '';
#in
{

    imports = [
      ../base.nix
      ../obsidian.nix
      ./vim.nix
    ];


    programs.git.settings = {
      user.name = "Patrick Kuny";
      user.email = "31052319+pmkuny@users.noreply.github.com";
    };

    programs.jujutsu.enable = true;

    programs.jujutsu.settings = {
      user.name = "Patrick Kuny";
      user.email = "31052319+pmkuny@users.noreply.github.com";
      ui.editor = "vim";
    };


    programs.zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        initContent = ''
            bindkey -e
            bindkey -v
        '';

        shellAliases = {
        vi = "vim";
        k = "kubectl";
        tf = "terraform";
        pl = "pulumi";
        };
    };
}
