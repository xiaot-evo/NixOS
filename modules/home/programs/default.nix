{ pkgs, ... }:
{
  imports = [
    ./nh.nix
    ./helix
    ./ghostty.nix
    ./kdeconnect.nix
    ./zed-editor
    ./zen-browser.nix
    ./fish.nix
    ./starship.nix
    ./direnv.nix
    ./distrobox.nix

    ## AI
    ./opencode.nix
  ];
  home.packages = with pkgs; [
    ## extra
    bibata-cursors
    tela-circle-icon-theme
    libadwaita
    adw-gtk3
    qt6Packages.qt6ct

    ## cmd
    fastfetch
    devenv
    yazi
    android-tools

    ## gui
    bilibili
    resources
    splayer
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
