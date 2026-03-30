# Homebrew Tap for ArcBox

Official [Homebrew](https://brew.sh) tap for [ArcBox](https://arcbox.dev), a high-performance container and VM runtime for macOS.

## Install

```bash
brew install --cask arcboxlabs/tap/arcbox
```

Then open ArcBox from your Applications folder to complete setup.

## Upgrade

ArcBox includes automatic updates via Sparkle. To upgrade manually:

```bash
brew upgrade --cask arcbox
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
brew install --cask arcboxlabs/tap/arcbox
```

Your data (`~/.arcbox`) is preserved — containers, images, and VM data are unaffected.
