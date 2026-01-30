{
  pkgs,
  config,
  lib,
  ...
}:
{
  # services.displayManager.ly = {
  #   enable = true;
  #   package = pkgs.ly;
  #   # settings = {

  #   # };
  # };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${lib.getExe pkgs.tuigreet} \
          --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
          --time \
          --time-format '%Y-%m-%d %H:%M' \
          --asterisks \
          --remember \
          --remember-session
        '';
      };
    };
  };
}
