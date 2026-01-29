{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    extraPackages = with pkgs; [
      nixd
      nixfmt
      package-version-server
    ];
    userSettings = {
      # theme = {
      #   mode = "system";
      #   dark = "One Dark";
      #   light = "One Light";
      # };
      helix_mode = true;
      # vim_mode = true;
      # proxy = "http://127.0.0.1:7899";
      lsp = {
        nixd = {
          initialization_options = {
            formatting = {
              command = [ "nixfmt" ];
            };
            # formatting = { command = [ "alejandra" "quite" "--" ]; };
          };
        };
      };
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
      };
    };
  };
}
