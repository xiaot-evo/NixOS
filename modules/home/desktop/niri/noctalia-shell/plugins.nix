{
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
    };
  };
}
