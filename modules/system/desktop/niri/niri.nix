{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  niri-flake.cache.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false; # Disable niri-flake's default polkit agent to avoid conflicts
  programs.niri = {
    enable = true;
  };
  services = {
    accounts-daemon.enable = true;
    # power-profiles-daemon.enable = true;
    tuned.enable = true;
    upower.enable = true;
  };
}
