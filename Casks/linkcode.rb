cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "9cabb06c3ada6082d67c9f8369cbc1f45604de7e53bbc1abfa9c449552b4c5a1",
         intel: "5c52f02fbd1ee92bb18d39869e59c339f8949617a5f25a813ba7307f28d6cf33"

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
