cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.25.2"
  sha256 arm:   "819703f7c4ec57e0f01bb8ceed05a0f924053652be009c5a8b2db58264300959",
         intel: "0198d386fd199d00e5daea179e5c215c2f998af2c229202e51037cc5d47bf661"

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
