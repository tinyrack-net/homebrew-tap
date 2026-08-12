cask "tinest" do
  version "0.7.0"
  sha256 "3857e196666caeef2f82559a77079ce02a73aa0a9dd403c8ee3afc4061eab89d"

  url "https://github.com/tinyrack-net/coder/releases/download/v0.7.0/Tinest-macos-arm64.zip"
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
