{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
    ./settings.nix
    ./plugins.nix
  ];

  # systemd.user.services.noctalia-shell.Service.Environment = lib.mkAfter [
  #   "QT_QPA_PLATFORMTHEME=qt6ct"
  #   "QT_QPA_PLATFORM=wayland;xcb"
  #   "QT_AUTO_SCREEN_SCALE_FACTOR=1"
  #   "QS_ICON_THEME=Papirus"
  # ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    # use stylix to set colors
    # colors = {
    # };
  };
}
