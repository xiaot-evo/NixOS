{ pkgs, inputs, config, system, ... }: {
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];
  programs.zen-browser.enable = true;
  programs.zen-browser.policies = let
    mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
      install_url =
        "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
      installation_mode = "force_installed";
    });
  in {
    ExtensionSettings = mkExtensionSettings {
      "uBlock0@raymondhill.net" = "ublock-origin";
      "firefox@tampermonkey.net" = "tampermonkey";
      "{5efceaa7-f3a2-4e59-a54b-85319448e305}" = "immersive-translate";
      "addon@darkreader.org" = "darkreader";
    };
  };

  xdg.mimeApps = let
    value = let
      zen-browser = inputs.zen-browser.packages.${system}.beta; # or twilight
    in zen-browser.meta.desktopFileName;

    associations = builtins.listToAttrs (map (name: { inherit name value; }) [
      "application/x-extension-shtml"
      "application/x-extension-xhtml"
      "application/x-extension-html"
      "application/x-extension-xht"
      "application/x-extension-htm"
      "x-scheme-handler/unknown"
      "x-scheme-handler/mailto"
      "x-scheme-handler/chrome"
      "x-scheme-handler/about"
      "x-scheme-handler/https"
      "x-scheme-handler/http"
      "application/xhtml+xml"
      "application/json"
      "text/plain"
      "text/html"
    ]);
  in {
    associations.added = associations;
    defaultApplications = associations;
  };

}
