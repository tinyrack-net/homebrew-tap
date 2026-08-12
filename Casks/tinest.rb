cask "tinest" do
  version "0.8.2"
  sha256 "254e0c85f3aaebc89c20f95c3ba604bd2a39e4ad73f246d1d469e00f1a1ba9b4"

  url "https://github.com/tinyrack-net/tinest/releases/download/v0.8.2/Tinest-macos-arm64.zip"
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
