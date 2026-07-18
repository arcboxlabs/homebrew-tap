# Homebrew Tap for ArcBox Labs

Official [Homebrew](https://brew.sh) tap for ArcBox Labs software. [ArcBox](https://arcbox.dev) is available directly from Homebrew.

## Install

```bash
brew install --cask arcbox
```

Then open ArcBox from your Applications folder to complete setup.

### Latest release from ArcBox Labs

To install the latest stable release directly from this tap:

```bash
brew install --cask arcboxlabs/tap/arcbox@latest
```

`arcbox` and `arcbox@latest` install the same app and cannot coexist. Uninstall
the current cask before switching between them.

## Upgrade

ArcBox includes automatic updates via Sparkle. To upgrade manually:

```bash
# Official Homebrew cask
brew upgrade --cask --greedy-auto-updates arcbox

# Latest release from this tap
brew upgrade --cask --greedy-auto-updates arcboxlabs/tap/arcbox@latest
```

## Uninstall

```bash
brew uninstall --cask arcbox
```

To also remove all data (`~/.arcbox`):

```bash
brew zap arcbox
```

## Migrating from install.sh

If you previously installed ArcBox via `curl | sh`:

```bash
# Stop old daemon
launchctl bootout gui/$(id -u)/com.arcboxlabs.desktop.daemon 2>/dev/null
launchctl bootout gui/$(id -u)/dev.arcbox.daemon 2>/dev/null

# Remove old plist and binaries
rm -f ~/Library/LaunchAgents/com.arcboxlabs.desktop.daemon.plist
rm -f ~/Library/LaunchAgents/dev.arcbox.daemon.plist
rm -f /usr/local/bin/abctl /usr/local/bin/arcbox-daemon

# Install via Homebrew
brew install --cask arcbox
```

Your data (`~/.arcbox`) is preserved — containers, images, and VM data are unaffected.

## Release automation

Product release workflows bump casks via the composite action at
[`.github/actions/bump-cask`](.github/actions/bump-cask). Callers mint a
write-scoped App token, compute SHA-256 of their DMG(s), and invoke:

```yaml
- uses: arcboxlabs/homebrew-tap/.github/actions/bump-cask@6ae026934e8dd30533bbbd73a3be6b7958fe2062
  with:
    token: ${{ steps.tap-token.outputs.token }}
    cask: arcbox@latest      # or linkcode
    version: "1.2.3"        # no leading v
    arm_sha256: ${{ steps.shas.outputs.arm }}
    intel_sha256: ${{ steps.shas.outputs.intel }}  # omit for arm-only casks
```
