{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  niri-flake.cache.enable = true;
  programs.niri = {
    enable = true;
  };
  environment.defaultPackages = with pkgs; [ nautilus ];
  security.polkit.enable = true;
  services = {
    # power-profiles-daemon.enable = true;
    tuned.enable = true;
    upower.enable = true;
  };
}
