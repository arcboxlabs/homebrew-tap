cask "arcbox@latest" do
  version "1.39.2"
  sha256 "39409277c635e06ee85d931fa4739d1e0920cb59b95eedee3f3f748e752bd7dc"

  url "https://release.arcboxcdn.com/desktop/v#{version}/ArcBox-#{version}-arm64.dmg",
      verified: "release.arcboxcdn.com/desktop/"
  name "ArcBox Latest"
  desc "Runtime for containers, Linux virtual machines, and AI agent sandboxes"
  homepage "https://arcbox.dev/"

  livecheck do
    url "https://release.arcboxcdn.com/desktop/appcast/stable.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  conflicts_with cask: "arcbox"
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "ArcBox.app"
  binary "#{appdir}/ArcBox.app/Contents/MacOS/bin/abctl"

  uninstall launchctl: "com.arcboxlabs.desktop.daemon",
            quit:      "com.arcboxlabs.desktop"

  zap trash: [
    "~/.arcbox",
    "~/Library/Application Support/com.arcboxlabs.desktop",
    "~/Library/Caches/com.arcboxlabs.desktop",
    "~/Library/HTTPStorages/com.arcboxlabs.desktop",
    "~/Library/LaunchAgents/com.arcboxlabs.desktop.daemon.plist",
    "~/Library/Logs/arcbox",
    "~/Library/Preferences/com.arcboxlabs.desktop.plist",
    "~/Library/Saved Application State/com.arcboxlabs.desktop.savedState",
  ]
end
