cask "arcbox" do
  arch arm: "arm64"

  version "1.17.0"
  sha256 arm:   "eca6adbd0c9e01c57ecebafca37a95da8f58dbca9ceda6d11bd8c039a295fc7d"

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
  binary "#{appdir}/ArcBox.app/Contents/MacOS/xbin/docker"
  binary "#{appdir}/ArcBox.app/Contents/MacOS/xbin/docker-buildx"
  binary "#{appdir}/ArcBox.app/Contents/MacOS/xbin/docker-compose"
  binary "#{appdir}/ArcBox.app/Contents/MacOS/xbin/docker-credential-osxkeychain"

  bash_completion "#{appdir}/ArcBox.app/Contents/Resources/completions/bash/docker"
  zsh_completion "#{appdir}/ArcBox.app/Contents/Resources/completions/zsh/_docker"
  fish_completion "#{appdir}/ArcBox.app/Contents/Resources/completions/fish/docker.fish"

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
