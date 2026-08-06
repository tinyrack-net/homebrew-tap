cask "coder" do
  version "0.2.0"
  sha256 "3257670becd3ddd55e4bc7d81c389b4ad268235a84289eba36dd3560205c44fc"

  url "https://github.com/tinyrack-net/coder/releases/download/v0.2.0/Coder-macos-arm64.zip"
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
