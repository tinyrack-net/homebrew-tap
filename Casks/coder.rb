cask "coder" do
  version "0.5.0"
  sha256 "658df6ff04b1b31099d05997a20326963e76e3cf9399ab90bb5e3b358fd07e1e"

  url "https://github.com/tinyrack-net/coder/releases/download/v0.5.0/Coder-macos-arm64.zip"
  name "Coder"
  desc "Local-first AI coding agent with an always-on daemon"
  homepage "https://github.com/tinyrack-net/coder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Coder.app"

  zap trash: [
    "~/Library/Application Support/Coder",
    "~/Library/Caches/net.tinyrack.coder",
    "~/Library/Preferences/net.tinyrack.coder.plist",
    "~/Library/Saved Application State/net.tinyrack.coder.savedState",
  ]
end
