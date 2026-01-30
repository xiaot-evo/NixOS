{ config, pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "hx";
    NIXOS_OZONE_WL = "1";
  };

  # 追加到会话 PATH（桌面会话/GUI）
  # home.sessionPath = [
  #   "/home/xiaot/bin"
  # ];
}