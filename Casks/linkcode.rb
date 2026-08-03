cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.20.0"
  sha256 arm:   "d32306e658e9ff23db13bacec6ba1e000a8eac039403a7ffa539d67ab2dc0ae0",
         intel: "dbbcf7ea46dcd3542e1ae61872423048ccb974ec0fd9bf45498a814e60db07f9"

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
