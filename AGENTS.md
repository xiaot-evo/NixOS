# AGENTS.md - NixOS Configuration Repository Guidelines

This document provides guidelines for agentic coding agents operating in this NixOS configuration repository.

## Build Commands

### Apply System Configuration
```bash
sudo nh os switch
```

### Apply Home Manager Configuration
```bash
nh home switch
```

### Update Flake Dependencies
```bash
nix flake update
```

### Update Specific Flake Input
```bash
nix flake lock --update-input nixpkgs
nix flake lock --update-input home-manager
```

### Test Configuration Without Applying
```bash
sudo nh os boot
```

### Build VM for Testing
```bash
sudo nh os build-vm
./result/bin/nixos-vm
```

### Check Available Generations
```bash
sudo nh os info
```

### Rollback to Previous Generation
```bash
sudo nh os rollback
```

### Check Configuration Validity
```bash
nix-instantiate --parse ./flake.nix
nix eval --raw .#nixos.config.system.stateVersion
```

## Code Style Guidelines

### File Organization

- **Host-specific config**: `hosts/<hostname>/` directory
- **Reusable modules**: `modules/` directory with `system/` and `home/` subdirectories
- **Module files**: Use `default.nix` for module imports, named files for specific functionality
- **Imports**: Use relative paths (e.g., `../../modules/system`)

### Nix Module Structure

```nix
{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # Import dependencies first
  ];

  # Option declarations in logical groups with blank lines between
  option1 = value1;

  option2 = {
    key = "value";
  };
}
```

### Naming Conventions

- **Variables**: camelCase (e.g., `homeDirectory`, `bootLoader`)
- **Attribute sets**: camelCase keys (e.g., `hardware.display`)
- **File names**: kebab-case (e.g., `nvidia.nix`, `displaymanager.nix`)
- **Host names**: kebab-case (e.g., `laptop-acer`)
- **Module directories**: kebab-case (e.g., `modules/home/desktop/niri/`)

### Imports and Dependencies

- List imports at the top of files
- Group related imports together with blank lines between groups
- Use relative paths for local modules: `./` for same directory, `../` for parent, `../../` for grandparent
- Import flake inputs through `specialArgs` in `flake.nix`

### Option Formatting

- Align `=` signs for readability in large attribute sets
- Use proper indentation (2 spaces)
- Group related options together
- Add blank lines between logical sections

```nix
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    plymouth.enable = true;
  };
```

### Commenting

- Use `#` for comments (Nix standard)
- Add comments for non-obvious configurations
- Include TODO comments for future work (e.g., `# TODO 重构目录结构`)
- Keep comments concise and in English or Chinese (match existing file)

### Types and Type Safety

- Use appropriate Nix types (`string`, `int`, `bool`, `list`, `attrsets`)
- Use `lib.mkEnableOption` for boolean options
- Use `lib.mkIf` for conditional configuration
- Use `lib.concatMap` or `lib.flatten` for list operations

### Error Handling

- Use `lib.asserts` for validation when needed
- Check for `null` values before use
- Use `lib.optional` or `lib.optionals` for conditional list items
- Use `lib.mkMerge` to combine multiple configurations

### Package References

- Reference packages via `pkgs.<name>` (e.g., `pkgs.hplip`)
- Use `linuxPackages_latest` for latest kernel support
- Enable `allowUnfree` and `allowBroken` in `pkgs` config for unfree/broken packages

## Repository Structure

```
.
├── flake.nix                    # Main flake configuration
├── hosts/                       # Host-specific configurations
│   └── laptop-acer/
│       ├── default.nix          # Main host config
│       ├── hardware.nix         # Auto-generated hardware config
│       ├── nvidia.nix           # NVIDIA GPU config
│       └── users/
│           └── xiaot_evo.nix    # User config
├── modules/                     # Reusable modules
│   ├── system/                  # System-level modules
│   │   ├── default.nix
│   │   ├── desktop/
│   │   │   └── niri/            # Niri WM config
│   │   ├── programs/            # Program configs
│   │   ├── displaymanager.nix
│   │   ├── fonts.nix
│   │   └── stylix.nix
│   └── home/                    # Home Manager modules
│       ├── default.nix
│       ├── desktop/niri/
│       ├── programs/
│       └── stylix.nix
└── overlays/                    # Nix package overlays
```

## Common Patterns

### Desktop Environment Setup
Import desktop module in `modules/system/default.nix`:
```nix
imports = [
  ./desktop/niri  # or ./desktop/gnome
];
```

### Program Configuration
Add program module to `modules/system/programs/default.nix`:
```nix
{
  imports = [
    ./programname.nix
  ];
}
```

### Conditional Configuration
```nix
lib.mkIf config.hardware.bluetooth.enable {
  # config here
}
```

### Merging Multiple Configs
```nix
lib.mkMerge [
  config1
  config2
]
```

## Important Notes

- This is a personal NixOS configuration for an Acer laptop with NVIDIA GPU
- Uses `nixos-unstable` channel
- Includes Niri Wayland compositor, Stylix theming, and PipeWire audio
- Timezone: Asia/Shanghai, Locale: zh_CN.UTF-8
- State version: 26.05

## Testing Changes

1. Always run `sudo nh os boot` first to check for errors
2. Test with VM before applying to real system (`sudo nh os build-vm`)
3. Check available generations with `sudo nh os info`
4. Rollback if needed with `sudo nh os rollback`
5. Keep backups of working configurations
6. Document significant changes in commit messages
