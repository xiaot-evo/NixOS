{
  imports = [ ./stylix.nix ];
  stylix = {
    targets.niri.enable = true;
    targets.ghostty.enable = true;
    targets.gtk.enable = true;
    targets.qt.enable = true;
    targets.yazi.enable = true;
    targets.zen-browser = {
      enable = true;
      profileNames = [ "Default Profile" ];
    };
    targets.fish.enable = true;
    targets.starship.enable = true;
    # targets.vscode = {
    #   colors.enable = false;
    # };
  };
}
