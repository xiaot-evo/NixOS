{ pkgs, ... }:
{
  imports = [
    ./nh.nix
    ./stylix
    ./helix
    ./vscode
    ./ghostty.nix
    ./zen-browser.nix
    ./fish.nix
    ./starship.nix
    ./direnv.nix

  ];
  home.packages = with pkgs; [
    ## cmd
    fastfetch
    devenv
    yazi
    android-tools

    ## gui
    bilibili
    resources
    splayer
    spotify
    # hmcl
    prismlauncher
    qq
    wechat
    telegram-desktop
    readest
    wpsoffice-cn
    obs-studio
  ];
}
