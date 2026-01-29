{
  description = "XiaoT_Evo's NixOS Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs";
    # nixpkgs.url =
    #   "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    daeuniverse.url = "github:daeuniverse/flake.nix";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowBroken = true;
        };
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop-acer
            inputs.niri.nixosModules.niri
            inputs.daeuniverse.nixosModules.dae
            inputs.daeuniverse.nixosModules.daed
          ];
        };
      };
      homeConfigurations = {
        "xiaot_evo" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./hosts/laptop-acer/users/xiaot_evo.nix
            inputs.niri.homeModules.niri
            inputs.niri.homeModules.stylix
            inputs.stylix.homeModules.stylix
          ];
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
