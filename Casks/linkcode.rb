cask "linkcode" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "d7215fc203283b009469ad260f6f73d9d042340f17832b3d35859593bcdca5ed",
         intel: "6cea394448643bc7da20b5d7bb324ccf931871b5e3908f0fa64d617c2b69ee2b"

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
