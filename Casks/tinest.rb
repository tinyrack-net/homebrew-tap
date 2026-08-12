cask "tinest" do
  version "0.8.1"
  sha256 "4347076e0f05f0772146bca7abefe31c021385b92e3b253bb829eaee072afc2c"

  url "https://github.com/tinyrack-net/tinest/releases/download/v0.8.1/Tinest-macos-arm64.zip"
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
