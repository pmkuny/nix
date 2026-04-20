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
- **desktop**: Full NixOS machine.

## Deployment Workflows
- Information only. You should not run these commands directly, the user will (see ##Safety)
- **macOS (mbp/macmini)**: Use `darwin-rebuild switch --flake .#<host>`.
- **NixOS (tpx1)**: Use `sudo nixos-rebuild switch --flake .#tpx1`.
- **NixOS (desktop)**: Use `sudo nixos-rebuild switch --flake .#desktop`.

## Configuration Principles
- **User Identity**: The system supports flexible user identities via `username` and `userHomeConfig` specialArgs. While 'patch' is the primary user, the configuration is parameterized to support other usernames, especially for work environments.
- **Local Configuration**: Use `local.nix` (untracked) for machine-specific configurations or those containing sensitive information that shouldn't be in the main flake. A `local.nix.example` is provided as a template.
- **Work Mac Setup**: A dedicated guide for setting up work-specific macOS hosts is available in `SETUP_WORK_MAC.md`.
- **Nix-First Approach**: Prioritize Nixpkgs for all CLI and GUI applications across all systems. Use Homebrew on macOS only as a fallback for applications not available in Nixpkgs or those requiring specific macOS integration (Casks).
- **Obsidian**: Managed via `programs.obsidian`. Behavioral settings are global via `defaultSettings.app`, but appearance, themes, and `sync.json` are managed per-vault via `home.file` to ensure reliable filesystem symlinking and direct control over specific JSON files.
- **Firefox**: Extension installation is managed via Enterprise Policies, but "Allow in Private Windows" must be toggled manually in `about:addons`.

## Secret Management
- **No Plaintext Secrets**: Never commit tokens, passwords, or private keys to the repository.
- **Tooling**: Use `sops-nix` for managing secrets across NixOS, macOS, and Home Manager.
- **Key Material**: Use host SSH keys for system secrets. For user secrets, use an Age key stored in a Bitwarden Secure Note.
