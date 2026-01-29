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
    #   greetd = {
    #     enable = true;
    #     restart = true;
    #     # useTextGreeter = true;
    #     settings = {
    #       default_session = {
    #         command = "${pkgs.tuigreet}/bin/tuigreet --user-menu --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red:' --time --cmd niri-session";
    #         user = "greeter";
    #       };
    #     };
    #   };
  };
}
