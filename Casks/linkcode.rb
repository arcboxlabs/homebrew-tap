cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "9821475f3591763ca9688bd860584fad7bb6c7d7e0a7681521f7b7a892b47eec",
         intel: "5805e54c1ba3379b0d74f26e4a308e211a09510b2a9cbba388c57336540e9213"

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
