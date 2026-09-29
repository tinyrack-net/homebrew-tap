cask "mac-cjkv-input-switcher" do
  version "0.1.11"
  sha256 "a01f3e2308fee026c2a48d151c359939e9373c7b53b637bce03706657d746783"

  url "https://github.com/tinyrack-net/mac-cjkv-input-switcher/releases/download/v0.1.11/MacCJKVInputSwitcher-0.1.11.dmg"
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
