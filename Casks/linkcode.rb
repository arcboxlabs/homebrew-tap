cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.19.0"
  sha256 arm:   "95a58a71124fdc15ede6ab8c8b4ccea21f21743bee1f1974577fbb3c010bd2b0",
         intel: "f7c099bddc5edb6a0625a4f6cd2b9b29ed744e779bd5b02f5e1c189d0131aa0a"

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
