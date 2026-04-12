# Nix Configuration Rules

## Host Architecture
- **tpx1**: Full NixOS machine. 
- **mbp / macmini**: macOS machines managed via nix-darwin.
- **desktop**: CachyOS (Arch-based) managed via standalone Home Manager.

## Deployment Workflows
- **macOS (mbp/macmini)**: Use `darwin-rebuild switch --flake .#<host>`.
- **NixOS (tpx1)**: Use `sudo nixos-rebuild switch --flake .#tpx1`.
- **CachyOS (desktop)**: Always use standalone Home Manager commands: `home-manager switch --flake .#desktop`.

## Configuration Principles
- **User Identity**: The 'patch' user is managed across three layers: System Account (NixOS), Home Manager Integration, and User Identity (Personal Identity + Base Environment).
- **Standalone Targets**: Do not attempt to manage system services (kernel, bootloader) on 'desktop' as it is a standalone Home Manager target.
- **Obsidian**: Managed via `programs.obsidian`. All global settings should be under `defaultSettings.app` for inheritance across vaults.
- **Firefox**: Extension installation is managed via Enterprise Policies, but "Allow in Private Windows" must be toggled manually in `about:addons`.
