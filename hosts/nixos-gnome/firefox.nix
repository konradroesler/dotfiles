{ lib, config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;

      # Check about:policies#documentation for options
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: 'always' or 'newtab'
        DisplayMenuBar = "default-off"; # alternatives: 'always', 'never' or 'default-on'
        SearchBar = "unified"; # alternatives: 'separate'
          
        # Check about:support for extensions/add-on ID strings
        # Valid string for installation mode are 'allowed', 'blocked',
        # 'force_installed' and 'normal_installed'
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all add ons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
