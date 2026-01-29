{ pkgs, ... }:
{
  services = {
    desktopManager.gnome = {
      enable = true;
    };
  };
  environment.gnome.excludePackages = (
    with pkgs;
    [
      epiphany # web browser
      gnome-console
      gnome-tour
      gnome-system-monitor
    ]
  );
  environment.systemPackages =
    (with pkgs; [
      gnome-tweaks
      adw-gtk3
    ])
    ++ (with pkgs.gnomeExtensions; [
      user-themes
      appindicator
      blur-my-shell
      dash-to-dock
      dash2dock-lite
      dash-to-panel
      arc-menu
      vitals
      gtk4-desktop-icons-ng-ding
      coverflow-alt-tab
      desktop-cube
      lock-keys
      caffeine
      clipboard-indicator
      rounded-window-corners-reborn
      bluetooth-quick-connect
    ]);
}
