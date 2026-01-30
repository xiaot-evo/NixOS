{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    # defaultEditor = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt
      # go
      gopls
      delve
    ];
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
          language-servers = [ "nixd" ];
        }
        {
          name = "go";
          # scope = "source.go";
          # injection-regex = "gp";
          # file-types = [ "go" ];
          # roots = [ "go.mod" ];
          auto-format = true;
          # formatter = {
          #   command = "${pkgs.go}/bin/gofmt";
          # };
          # comment-tokens = "//";
          language-servers = [ "gopls" ];
        }
      ];
      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };
        gopls = {
          command = "${pkgs.gopls}/bin/gopls";
          config.gofumpt = true;
        };
      };
      debugger = [
        {
          name = "go";
          transport = "tcp";
          command = "${pkgs.delve}/bin/dlv";
        }
      ];
    };
  };
}
