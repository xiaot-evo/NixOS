{ pkgs, config, ... }:
{
  programs.niri.settings = {
    binds =
      let
        noctalia =
          cmd:
          [
            "noctalia-shell"
            "ipc"
            "call"
          ]
          ++ (pkgs.lib.splitString " " cmd);
      in
      with config.lib.niri.actions;
      {
        ## Noctalia-shell
        # Core Noctalia binds
        "Mod+Space".action.spawn = noctalia "launcher toggle";
        "Mod+S".action.spawn = noctalia "controlCenter toggle";
        # "Mod+Comma".action.spawn = noctalia "settings toggle";

        # Audio controls
        "XF86AudioRaiseVolume".action.spawn = noctalia "volume increase";
        "XF86AudioLowerVolume".action.spawn = noctalia "volume decrease";
        "XF86AudioMute".action.spawn = noctalia "volume muteOutput";

        # Brightness controls
        "XF86MonBrightnessUp".action.spawn = noctalia "brightness increase";
        "XF86MonBrightnessDown".action.spawn = noctalia "brightness decrease";

        # Utility shortcuts
        "Mod+V".action.spawn = noctalia "launcher clipboard";
        # "Mod+C".action.spawn = noctalia "launcher calculator";
        "Mod+Shift+L".action.spawn = noctalia "lockScreen lock";
      };
    layer-rules = [
      {
        matches = [ { namespace = "^noctalia-overview*"; } ];
        place-within-backdrop = true;
      }
    ];
  };
}
