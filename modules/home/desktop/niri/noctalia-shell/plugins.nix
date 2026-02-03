{ pkgs, ... }:
{
  home.packages = with pkgs; [ gpu-screen-recorder ];
  programs.noctalia-shell = {

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        # catwalk = {
        #   enabled = true;
        #   sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        # };
        screen-recorder = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 1;
    };
    # this may also be a string or a path to a JSON file.

    pluginSettings = {
      # catwalk = {
      #   minimumThreshold = 25;
      #   hideBackground = true;
      # };
      # this may also be a string or a path to a JSON file.
      screen-recorder = {
        hideInactive = false;
        directory = "~/Videos/recordings/";
        filenamePattern = "recording_yyyyMMdd_HHmmss";
        frameRate = "60";
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        copyToClipboard = true;
        audioSource = "default_output";
        videoSource = "portal";
        resolution = "original";
      };
    };
  };
}
