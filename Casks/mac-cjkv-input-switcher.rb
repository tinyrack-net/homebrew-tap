cask "mac-cjkv-input-switcher" do
  version "0.1.10"
  sha256 "9a18ec285f1d2177531381dc92ff39a2f5ca5d9078f971061cf5f1732b823de7"

  url "https://github.com/tinyrack-net/mac-input-switcher/releases/download/v0.1.10/MacCJKVInputSwitcher-0.1.10.dmg"
  name "Mac CJKV Input Switcher"
  desc "Menu bar input source switcher for macOS"
  homepage "https://github.com/tinyrack-net/mac-input-switcher"

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
