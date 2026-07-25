cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "14cea9172a59b9de06c0e8dd91f36cff1b660e4d82b8f05bccc669ff6f8afce6",
         intel: "ed901d17addab82647ba587e872e3fbd6dbd50943fa1a5c0bbd6a65fe6e0aa20"

  url "https://releases.linkcode.ai/desktop/LinkCode-#{version}-#{arch}.dmg"
  name "LinkCode"
  desc "Desktop client for AI coding agents"
  homepage "https://linkcode.ai/"

  livecheck do
    url "https://releases.linkcode.ai/desktop/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "LinkCode.app"

  uninstall quit: "com.arcboxlabs.linkcode.desktop"

  zap trash: [
    "~/.linkcode",
    "~/Library/Application Support/LinkCode",
    "~/Library/Logs/LinkCode",
    "~/Library/Preferences/com.arcboxlabs.linkcode.desktop.plist",
    "~/Library/Saved Application State/com.arcboxlabs.linkcode.desktop.savedState",
  ]
end
