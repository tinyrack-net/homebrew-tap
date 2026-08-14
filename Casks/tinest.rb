cask "tinest" do
  version "0.9.0"
  sha256 "d51c9c9d0267f2a6725c1dfd15f3ba65e193dfbfb298a9440313b0613b041ffc"

  url "https://github.com/tinyrack-net/tinest/releases/download/v0.9.0/Tinest-macos-arm64.zip"
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
