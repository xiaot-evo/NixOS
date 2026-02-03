{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      # {
      #   command = [ "${lib.getExe inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default}" ];
      # }
      { command = [ "${pkgs.fcitx5}/usr/bin/fcitx5 -d" ]; }
    ];
    environment = {
      NIXOS_OZONE_WL = "1";
    };
    input = {
      # 输入时禁用触摸板
      # Disable touchpad while typing
      touchpad = {
        dwt = true;
        natural-scroll = true;
      };
    };
    outputs = {
      "eDP-1" = {
        scale = 1.0;
      };
    };
    layout = {
      gaps = 8;
      background-color = "transparent";
    };
    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    # ...
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
        "Mod+O".action = show-hotkey-overlay;
        "Mod+T".action.spawn = "ghostty";
        "Mod+Q".action = close-window;
        "Mod+Shift+E".action.quit.skip-confirmation = true;

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;

        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+L".action = move-column-right;
        "Mod+Ctrl+K".action = move-column-to-workspace-up;
        "Mod+Ctrl+J".action = move-column-to-workspace-down;

        "Mod+Page_Down".action = focus-workspace-down;
        "Mod+Page_Up".action = focus-workspace-up;
        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;
        "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
        "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
        "Mod+Ctrl+U".action = move-column-to-workspace-down;
        "Mod+Ctrl+I".action = move-column-to-workspace-up;

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+ctrl+1".action.move-column-to-workspace = 1;
        "Mod+ctrl+2".action.move-column-to-workspace = 2;
        "Mod+ctrl+3".action.move-column-to-workspace = 3;
        "Mod+ctrl+4".action.move-column-to-workspace = 4;
        "Mod+ctrl+5".action.move-column-to-workspace = 5;
        "Mod+ctrl+6".action.move-column-to-workspace = 6;
        "Mod+ctrl+7".action.move-column-to-workspace = 7;
        "Mod+ctrl+8".action.move-column-to-workspace = 8;
        "Mod+ctrl+9".action.move-column-to-workspace = 9;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+C".action = center-column;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        # Finer height adjustments when in column with other windows.
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+Tab".action = focus-window-down-or-column-right;
        "Mod+Shift+Tab".action = focus-window-up-or-column-left;

        "Mod+Alt+V".action = switch-focus-between-floating-and-tiling;
        "Mod+Shift+V".action = toggle-window-floating;

        "Print".action.screenshot = {
          show-pointer = false;
        };
        "Ctrl+Print".action.screenshot-screen = {
          show-pointer = false;
        };
        "Alt+Print".action.screenshot-window = {
        };

        ## noctalia-shell
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
    window-rules = [
      {
        # 为特定程序设置全屏启动和透明度.
        matches = [
          { app-id = "zen"; }
          { app-id = "code"; }
        ];
        open-maximized = true;
        opacity = 0.95;
      }
      {
        matches = [ { is-active = false; } ];
        opacity = 0.9;
      }
      {
        # 窗口默认高度宽度.
        # default-column-width.proportion = 0.66;
        # default-window-height.proportion = 1.0;
        # 关闭窗口背景.
        draw-border-with-background = false;
        # 窗口圆角设置.
        geometry-corner-radius =
          let
            r = 15.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };

        # Clips window contents to the rounded corner boundaries.
        clip-to-geometry = true;
      }
    ];
    # xwayland-satekkite 使niri支持xwayland程序.
    xwayland-satellite = {
      enable = true;
      path = "${lib.getExe pkgs.xwayland-satellite}";
    };
    debug = {
    };
  };
}
