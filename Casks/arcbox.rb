cask "arcbox" do
  arch arm: "arm64"

  version "1.18.0"
  sha256 arm:   "04d70773f4c179237a1475a21ec1bcee64e037410b93215399626cb02619de98"

  url "https://release.arcboxcdn.com/desktop/v#{version}/ArcBox-#{version}-#{arch}.dmg"
  name "ArcBox"
  desc "High-performance container and VM runtime"
  homepage "https://arcbox.dev"

  livecheck do
    url "https://release.arcboxcdn.com/desktop/appcast/stable.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "ArcBox.app"
  binary "#{appdir}/ArcBox.app/Contents/MacOS/bin/abctl"

  postflight do
    system_command "#{appdir}/ArcBox.app/Contents/MacOS/bin/abctl",
                   args: ["_internal", "brew-postflight"]
  end

  uninstall script: {
    executable:   "#{appdir}/ArcBox.app/Contents/MacOS/bin/abctl",
    args:         ["_internal", "brew-uninstall"],
  }

  zap trash: [
        "~/.arcbox",
        "~/Library/Logs/arcbox",
        "~/Library/LaunchAgents/com.arcboxlabs.desktop.daemon.plist",
        "~/Library/Preferences/com.arcboxlabs.desktop.plist",
        "~/Library/Saved Application State/com.arcboxlabs.desktop.savedState",
      ]

  caveats <<~EOS
    Open the ArcBox app to finish setup.
  EOS
end
