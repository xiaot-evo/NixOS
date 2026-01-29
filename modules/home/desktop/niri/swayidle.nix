{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  # 锁屏命令
  # lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
  lock = "${
    lib.getExe inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  } ipc call lockScreen lock";

  # 显示器控制函数（基于窗口管理器）
  # 选择适合您WM的配置：

  # 对于 Sway
  # display = status: "${pkgs.sway}/bin/swaymsg output * dpms ${status}";

  # 对于 Hyprland（取消注释并使用）
  # display = status: "hyprctl dispatch dpms ${status}";

  # 对于 Niri（取消注释并使用）
  display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";

  # 通用方法（如果有wlr-roots）
  # display = status: "${pkgs.wlr-randr}/bin/wlr-randr --output eDP-1 --power ${status}";
in
{
  services.swayidle = {
    enable = true;

    timeouts = [
      {
        timeout = 180; # 3分钟
        command = "${pkgs.libnotify}/bin/notify-send '15秒后锁屏' -t 5000";
      }
      {
        timeout = 195; # 锁屏
        command = lock;
      }
      {
        timeout = 300; # 5分钟
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 600; # 10分钟
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      before-sleep = "${display "off"}; ${lock}";
      after-resume = display "on";
      lock = "${display "off"}; ${lock}";
      unlock = display "on";
    };

    # 可选：添加额外参数
    extraArgs = [ "-w" ]; # 等待 Wayland 显示器
  };
}
