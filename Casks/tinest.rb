cask "tinest" do
  version "0.10.0"
  sha256 "c865eb2f7b37ee1d0b4f2d3910352f61e608af78e0abf31a4b18e07a55343e36"

  url "https://github.com/tinyrack-net/tinest/releases/download/v0.10.0/Tinest-macos-arm64.zip"
  name "Tinest"
  desc "Local-first AI coding agent with an always-on daemon"
  homepage "https://github.com/tinyrack-net/coder"

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
