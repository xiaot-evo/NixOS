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
  home.packages = with pkgs; [
    app2unit
  ];

  systemd.user.services.noctalia-shell.Service.Environment = lib.mkAfter [
    "NIXOS_OZONE_WL=1"
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    # use stylix to set colors
    # colors = {
    # };
  };
}
