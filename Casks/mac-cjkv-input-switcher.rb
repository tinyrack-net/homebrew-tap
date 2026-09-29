cask "mac-cjkv-input-switcher" do
  version "0.2.0"
  sha256 "933a2d0eaeda6f87034903a03f117d7d05e164054d68430a8f96ceda3808ec99"

  url "https://github.com/tinyrack-net/mac-cjkv-input-switcher/releases/download/v0.2.0/MacCJKVInputSwitcher-0.2.0.dmg"
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
