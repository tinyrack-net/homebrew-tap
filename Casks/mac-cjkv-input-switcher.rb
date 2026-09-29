cask "mac-cjkv-input-switcher" do
  version "0.2.1"
  sha256 "edb01c47fa026addec8c0d338743a32ebee3d8cecd5c045e006e82979bc4719a"

  url "https://github.com/tinyrack-net/mac-cjkv-input-switcher/releases/download/v0.2.1/MacCJKVInputSwitcher-0.2.1.dmg"
  name "Mac CJKV Input Switcher"
  desc "Menu bar input source switcher for macOS"
  homepage "https://github.com/tinyrack-net/mac-cjkv-input-switcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  app "MacCJKVInputSwitcher.app"
  zap trash: [
    "~/Library/LaunchAgents/com.winetree.MacCJKVInputSwitcher.plist",
    "~/Library/Logs/MacCJKVInputSwitcher.log",
    "~/Library/Preferences/com.winetree.MacCJKVInputSwitcher.plist",
  ]
end
