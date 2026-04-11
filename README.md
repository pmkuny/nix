# nix

Personal Nix configuration for NixOS and macOS hosts.

## Overview

This repository is a Nix flake that defines system configurations for multiple machines. It includes:

- NixOS hosts under `hosts/linux` and `hosts/desktop`
- macOS / nix-darwin hosts under `hosts/mac`, `hosts/mbp`, and `hosts/macmini`
- Shared home-manager and package configuration under `modules`

## Repository structure

- `flake.nix`
  - Root flake that defines inputs and outputs for each machine.
- `hosts/`
  - `desktop/` - Linux desktop configuration
  - `linux/` - Base Linux host configuration
  - `mac/` - Shared macOS modules for nix-darwin
  - `mbp/` - macOS MacBook Pro configuration
  - `macmini/` - macOS Mac Mini configuration
  - `tpx1/` - Linux laptop configuration
- `modules/`
  - `home-manager.nix` - home-manager modules and shared options
  - `packages.nix` - package definitions and package-related helpers
  - `home/` - user-level home modules
    - `base.nix` - base home config
    - `patch/` - patch-specific user config (shell, vim, git, etc.)

## Flake outputs

Defined outputs in `flake.nix`:

- `darwinConfigurations.mbp`
- `darwinConfigurations.macmini`
- `nixosConfigurations.desktop`
- `nixosConfigurations.tpx1`

## Usage

### Inspect available outputs

```sh
nix flake show .
```

### NixOS

On a NixOS machine, build or switch the configuration for `desktop` or `tpx1`:

```sh
sudo nixos-rebuild switch --flake .#desktop
```

Or:

```sh
sudo nixos-rebuild switch --flake .#tpx1
```

### macOS / nix-darwin

On a darwin host, use `darwin-rebuild`:

```sh
darwin-rebuild switch --flake .#mbp
```

Or:

```sh
darwin-rebuild switch --flake .#macmini
```

## Development

- Add machine-specific configuration in `hosts/<machine>/default.nix`.
- Add shared home-manager settings in `modules/home/*`.
- Keep secrets and credentials out of this repository.

## Notes

- `modules/home/patch/default.nix` contains user-specific settings for `patch`.
- `modules/home/base.nix` includes common shell and package defaults.
- `hosts/mac` contains shared macOS configuration and brew/home-manager modules.

## License

This repository is personal configuration and is not accompanied by a specific open-source license in the repository.
