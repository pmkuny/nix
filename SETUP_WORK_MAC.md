# Configuring a New Work Mac Host

Follow these steps to configure a new "work mac" host using this repository. This setup leverages the `local.nix` mechanism to allow for machine-specific configuration without modifying the core tracked files.

## 1. Identify Your Environment
First, determine the current machine's hostname and your macOS username.

```bash
# Get your machine's hostname
scutil --get LocalHostName

# Get your current username
whoami
```

## 2. Create Your Local Configuration
The `flake.nix` is configured to import an optional `local.nix` file. This is the intended place to define new machines that aren't yet part of the shared repository.

Copy the provided example to get started:

```bash
cp local.nix.example local.nix
```

## 3. Customize `local.nix`
Edit `local.nix` and replace the placeholders with your actual values.

- **Hostname Key**: Change `"HOSTNAME"` to the hostname you found in Step 1.
- **System Architecture**: Ensure `system` is set to `"aarch64-darwin"` (for Apple Silicon) or `"x86_64-darwin"` (for Intel).
- **SpecialArgs**:
  - Set `hostname` to your machine's hostname.
  - Set `username` to your macOS username.
  - Set `userHomeConfig` to `./modules/home/patch` (or your own custom module if you've created one).

## 4. Optional: Customize `hosts/work-mac.nix`
The `local.nix` example points to `./hosts/work-mac.nix`. You can modify this file to include any work-specific software or configuration overrides that should apply to this host:

```nix
# hosts/work-mac.nix
{ hostname, ... }: {
  networking.hostName = hostname;

  # Example: Add work-specific homebrew packages or system settings
  # homebrew.casks = [ "zoom" "slack" ];
}
```

## 5. Apply the Configuration
Once your files are ready, run the rebuild command. Replace `<hostname>` with the key you used in `local.nix`.

```bash
# This command will build and activate your configuration
darwin-rebuild switch --flake .#<hostname>
```

## Summary of Files to Modify

| File | Purpose |
| :--- | :--- |
| `local.nix` | Entry point for your host; defines how the flake sees your machine. |
| `hosts/work-mac.nix` | Shared host-level configuration for work machines. |
| `modules/home/patch/default.nix` | (Optional) If you use this as your `userHomeConfig`, you may want to update the git/jj user details. |

## Post-Installation
After a successful build, you can verify your configuration:
- Run `nix flake check` to ensure everything evaluates correctly.
- Run `nix fmt` to keep your new files following the project style.
