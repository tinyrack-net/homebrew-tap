cask "mac-cjkv-input-switcher" do
  version "0.3.0"
  sha256 "65230c33dc6ce071c171d5888139d61e028efaa910a79eddbecf27c6af2a235b"

  url "https://github.com/tinyrack-net/mac-cjkv-input-switcher/releases/download/v0.3.0/MacCJKVInputSwitcher-0.3.0.dmg"
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
