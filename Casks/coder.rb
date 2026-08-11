cask "coder" do
  version "0.4.1"
  sha256 "cd28f77ed9a0659a27a48730d6a0d74d6256bcecf54a5d56c4b4f5def87f23eb"

  url "https://github.com/tinyrack-net/coder/releases/download/v0.4.1/Coder-macos-arm64.zip"
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
