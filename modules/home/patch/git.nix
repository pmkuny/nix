{ config, pkgs, ...}:

{

    programs.git = {
        enable = true;
        settings = {
            user.name = "Patrick Kuny";
            user.email = "31052319+pmkuny@users.noreply.github.com";
        };
        ignores = [
        "/secrets/**"
        "!/secrets/**/*.enc"
        ];
    };

    programs.jujutsu.enable = true;

    programs.jujutsu.settings = {
      user.name = "Patrick Kuny";
      user.email = "31052319+pmkuny@users.noreply.github.com";
      ui.editor = "nvim";
    };


}



