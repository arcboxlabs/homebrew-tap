cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.15.1"
  sha256 arm:   "fe1a283c80177c74fcd0b0124e7f64ec3b381f9062e9faf1e0cb6073cb61f7e4",
         intel: "f5bfe1058753846307871720d1d9efbe5704680f2459249c7dc5f86a0628496f"

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
