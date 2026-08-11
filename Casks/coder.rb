cask "coder" do
  version "0.6.0"
  sha256 "8772661bacbdefafb36cbf14eb90f7aa53df28b40adf653f127bbdbef572e0ce"

  url "https://github.com/tinyrack-net/coder/releases/download/v0.6.0/Coder-macos-arm64.zip"
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
