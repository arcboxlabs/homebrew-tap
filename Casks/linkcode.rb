cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "ba74abecbfe0c802b6a254911e2ceedbc72c7e4ce60e17ff74580612fa86dd6b",
         intel: "e3e7f2d94326952d9892c9adb32a35d604548304b99ee97e9b5240aaa2ee7e73"

  url "https://releases.linkcode.ai/desktop/LinkCode-#{version}-#{arch}.dmg",
      verified: "releases.linkcode.ai/desktop/"
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
