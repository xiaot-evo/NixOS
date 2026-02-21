# AGENTS.md - Guidelines for AI Coding Agents

This is a NixOS configuration repository using Nix Flakes architecture for system and user (Home Manager) configurations.

## Build/Deploy Commands

### System Configuration
```bash
sudo nixos-rebuild switch --flake .#nixos    # Apply system config
nixos-rebuild build --flake .#nixos          # Dry-run build
sudo nixos-rebuild test --flake .#nixos      # Test temporarily
```

### Home Manager
```bash
home-manager switch --flake .#xiaot_evo      # Apply user config
home-manager build --flake .#xiaot_evo       # Dry-run build
```

### Flake Operations
```bash
nix flake update                             # Update all inputs
nix flake update nixpkgs                     # Update specific input
nix flake check                              # Check for errors
nix eval .#nixosConfigurations.nixos.config.networking.hostName
```

### Linting and Formatting
```bash
nixfmt *.nix **/*.nix                        # Format Nix files
nixfmt --check *.nix **/*.nix                # Check formatting
statix check .                               # Static analysis
deadnix .                                    # Find dead code
```

## Directory Structure

```
├── flake.nix              # Main flake configuration
├── hosts/                 # Host-specific configurations
│   └── laptop-acer/       # Acer laptop: default.nix, hardware.nix, nvidia.nix, users/
├── modules/               # Reusable modules
│   ├── home/              # Home Manager: desktop/, programs/
│   ├── system/            # System-level: desktop/, programs/, stylix.nix
│   └── stylix/            # Theme configuration
└── overlays/              # Nix package overlays
```

## Code Style Guidelines

### Function Arguments Pattern

```nix
{ ... }:                    # Minimal
{ pkgs, ... }:              # With pkgs
{ config, lib, pkgs, inputs, ... }:  # Multiple deps (alphabetical order)
```

### Imports and Attribute Sets

```nix
{
  imports = [
    ./module1.nix
    ../../relative/path.nix
  ];
  
  attribute1 = value1;
  nested = {
    key = "value";
  };
}
```

### Lists and Package Lists

```nix
extraGroups = [ "wheel" "networkmanager" ];    # Short list

home.packages = with pkgs; [                   # Long list with sections
  ## cmd
  fastfetch
  ## gui
  firefox
];

programs.helix.extraPackages = with pkgs; [
  nixd
  nixfmt
];
```

### Strings

```nix
time.timeZone = "Asia/Shanghai";
interactiveShellInit = ''
  set fish_greeting
'';
"Mod+Space".action.spawn = "${pkgs.fuzzel}/bin/fuzzel";
```

### Comments

```nix
# Single line comments
services.pipewire.enable = true;  # Inline comment

# Disabled sections are commented out
# networking.firewall = {
#   enable = true;
# };
```

### Conditional Patterns

```nix
lib.mkIf config.services.xserver.enable { ... }  # Conditional
lib.mkForce "bgrt"                                # Override
```

### Let Bindings

```nix
binds = let
  noctalia = cmd: [ "noctalia-shell" "ipc" "call" ] ++ (pkgs.lib.splitString " " cmd);
in {
  "Mod+Space".action.spawn = noctalia "launcher toggle";
};
```

## Naming Conventions

- **Files**: `default.nix` for entry points, descriptive names for specific configs
- **Attributes**: `camelCase`
- **Usernames**: lowercase with underscores (`xiaot_evo`)
- **Hostnames**: lowercase (`nixos`)

## Module Organization

```
modules/home/programs/helix/
├── default.nix      # Imports submodules
├── helix.nix        # Main config
├── settings.nix     # Settings
└── languages.nix    # Language-specific config
```

```nix
# default.nix pattern
{
  imports = [ ./helix.nix ./settings.nix ./languages.nix ];
}
```

## Key Flake Inputs

- `nixpkgs`: NixOS package repository (nixos-unstable)
- `home-manager`: User environment management
- `stylix`: Unified theming system
- `niri`: Wayland compositor
- `noctalia`: Noctalia shell

## System vs User Configuration

- **System-level** (`modules/system/`): Services, hardware, system packages, network
- **User-level** (`modules/home/`): User programs, dotfiles, desktop configuration

## Important Notes

- Run `nixfmt` on modified files before committing
- Keep `stateVersion` unchanged unless you understand the implications
- Use `lib.mkForce` sparingly - prefer natural configuration
- Chinese locale (`zh_CN.UTF-8`) by default
