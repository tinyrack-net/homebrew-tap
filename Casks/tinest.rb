cask "tinest" do
  version "0.11.0"
  sha256 "e1882f56f77593c841462b2a6b7d98d86ad094b9f1085654e207ee754418add2"

  url "https://github.com/tinyrack-net/tinest/releases/download/v0.11.0/Tinest-macos-arm64.zip"
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
