cask "mac-cjkv-input-switcher" do
  version "0.1.8"
  sha256 "d1b0ac560de2accddaec73e30370e66b62f93008ff71b4ded814731365e3975f"

  url "https://github.com/tinyrack-net/mac-input-switcher/releases/download/v0.1.8/MacCJKVInputSwitcher-0.1.8.dmg"
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
