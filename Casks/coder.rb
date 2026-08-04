cask "coder" do
  version "0.1.0"
  sha256 "2566563866ea5832689f81a2d6e4c42b384aaa948f98c09fef5512a301f05227"

  url "https://github.com/tinyrack-net/coder/releases/download/v0.1.0/Coder-macos-arm64.zip"
  name "Coder"
  desc "Local-first AI coding agent with an always-on daemon"
  homepage "https://github.com/tinyrack-net/coder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Coder.app"

  zap trash: [
    "~/Library/Application Support/Coder",
    "~/Library/Caches/net.tinyrack.coder",
    "~/Library/Preferences/net.tinyrack.coder.plist",
    "~/Library/Saved Application State/net.tinyrack.coder.savedState",
  ]
end
