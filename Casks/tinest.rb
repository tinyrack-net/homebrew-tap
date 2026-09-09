cask "tinest" do
  version "0.12.0"
  sha256 "2047b8228fbcb7456006b00d13f887f137e9b1eb580099b9ad03379f58debebd"

  url "https://github.com/tinyrack-net/tinest/releases/download/v0.12.0/Tinest-macos-arm64.zip"
  name "Tinest"
  desc "Local-first AI coding agent with an always-on daemon"
  homepage "https://github.com/tinyrack-net/tinest"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Tinest.app"

  zap trash: [
    "~/Library/Application Support/Tinest",
    "~/Library/Caches/net.tinyrack.tinest",
    "~/Library/Preferences/net.tinyrack.tinest.plist",
    "~/Library/Saved Application State/net.tinyrack.tinest.savedState",
  ]
end
