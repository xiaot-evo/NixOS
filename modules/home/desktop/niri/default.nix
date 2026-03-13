{ pkgs, ... }:
{
  imports = [
    ./niri
    # ./noctalia-shell
    ./dms-shell
    ./fcitx5.nix
  ];
}
