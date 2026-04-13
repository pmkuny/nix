# Nix Configuration Rules

## Safety
- **NEVER** execute any form of `nix` rebuilding commands. This includes commands like 'darwin-rebuild' 'nixos-rebuild'
- **NEVER** execute any form of `home-manager` commands. This includes commands like 'home-manager switch' 'home-manager build' 'home-manager install'
- **NEVER** store plaintext secrets, or allow secrets to be worked with in the git commit tree. No git actions should be allowed locally if there are identified secrets.
- **DO NOT** run `git commit` without explicit user instruction in the form of user: "run git commit explicitly"
- Any command that modifies the filesystem outside of $user/code requires explicit user instruction.


## Code Quality
- **Formatting**: Use `nix fmt` to format Nix files before committing.
- **Linting**: Run `nix flake check` to ensure all configurations evaluate correctly.

## Host Architecture
- **tpx1**: Full NixOS machine. 
- **mbp / macmini**: macOS machines managed via nix-darwin.
- **desktop**: CachyOS (Arch-based) managed via standalone Home Manager.

## Deployment Workflows
- Information only. You should not run these commands directly, the user will (see ##Safety)
- **macOS (mbp/macmini)**: Use `darwin-rebuild switch --flake .#<host>`.
- **NixOS (tpx1)**: Use `sudo nixos-rebuild switch --flake .#tpx1`.
- **CachyOS (desktop)**: Always use standalone Home Manager commands: `home-manager switch --flake .#desktop`.

## Configuration Principles
- **User Identity**: The 'patch' user is managed across three layers: System Account (NixOS), Home Manager Integration, and User Identity (Personal Identity + Base Environment).
- **Nix-First Approach**: Prioritize Nixpkgs for all CLI and GUI applications across all systems. Use Homebrew on macOS only as a fallback for applications not available in Nixpkgs or those requiring specific macOS integration (Casks).
- **Standalone Targets**: Do not attempt to manage system services (kernel, bootloader) on 'desktop' as it is a standalone Home Manager target.
- **Obsidian**: Managed via `programs.obsidian`. All global settings should be under `defaultSettings.app` for inheritance across vaults.
- **Firefox**: Extension installation is managed via Enterprise Policies, but "Allow in Private Windows" must be toggled manually in `about:addons`.

## Secret Management
- **No Plaintext Secrets**: Never commit tokens, passwords, or private keys to the repository.
- **Tooling**: Use `sops-nix` for managing secrets across NixOS, macOS, and Home Manager.
- **Key Material**: Use host SSH keys for system secrets. For user secrets, use an Age key stored in a Bitwarden Secure Note.
