{ config, pkgs, ... }: {

    # Enable Touch ID for sudo authentication
    security.pam.services.sudo_local.touchIdAuth = true;

    system.defaults = {
        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
        WindowManager.EnableStandardClickToShowDesktop = false;

        controlcenter = {
            BatteryShowPercentage = true;
        };

        dock = {
            autohide = true;
            orientation = "left";
            magnification = true;
            tilesize = 36;
        };

        menuExtraClock.Show24Hour = true;

    };
}