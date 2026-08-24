cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.26.0"
  sha256 arm:   "93bc291a10831fec326770735fe3bc7ef86277ef0d4b88e5bbdf417d44be9988",
         intel: "407cb7a3ac4ec9f264bb76974c2d1e2cde5fc4e9717d8359fb0df90cda672b5c"

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
